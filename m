Return-Path: <SRS0=Y6KA=6G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F418EC38A30
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 05:39:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE7462072D
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 05:39:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HC2SD7Md"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE7462072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XuBPmgoMIuiIqsNVe8/Ts0pQJNKKobK+Fao3ZMiDrYI=; b=HC2SD7MdHhhXXh
	ebdqAOl7I0aUoKvLuYrNe0hSZgCFjTu8xFxWSp36+/KfEI5W+ANbL9MUFt8VA3/PFNrtV8pZVsTYe
	EsiuJWTg+Ktyu0xHl3mQeGGTOo8f83fJ3a5AKCz72hMi7wUqzPTuSTKC4WCIyFF+juTVX9vgNjCZ6
	7ixQhz1b8fl+STIiZn1itvj+jWa6xWeh4a8l78DCHBAbrOlATXweRpKwNNmrhmcxETwkEzzQaXDf3
	MIviwwDNwji+0UG+FY9D4/jzhhsRO+Vsc2DNhXC/D0WAzX4iXOMtnPwhNQ5fDCSl9SEPI2o+tEu4y
	tOOkqfwduqMJAJDR00tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jR86Y-0000Ew-Mt; Wed, 22 Apr 2020 05:39:26 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR86P-00006t-Kr; Wed, 22 Apr 2020 05:39:18 +0000
IronPort-SDR: IA/KZU1k/hs0f5+beMoQGx4UEv0rGgnKa0WLdxPloA+sWKy9OvM0PiL5EgwXpATuMSADg/n2hK
 E8F9yvMOubqA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 22:39:13 -0700
IronPort-SDR: AboEqZaXGpccJr0IPJJXmM82rMMNExbbsE3I1ZPkQSgGlgX+c/9qqnQGFz1kAYZ34LJHYfJEeA
 INzyAyN1iVBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,412,1580803200"; d="scan'208";a="245882690"
Received: from dtzimme-mobl.amr.corp.intel.com ([10.251.145.143])
 by fmsmga007.fm.intel.com with ESMTP; 21 Apr 2020 22:39:13 -0700
Message-ID: <d20cc18d0fa10b52437e0ac29ea98792e0a3d45d.camel@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC:: don't use snd_soc_rtdcom_lookup()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Tue, 21 Apr 2020 22:39:13 -0700
In-Reply-To: <87d080unyx.wl-kuninori.morimoto.gx@renesas.com>
References: <87d080unyx.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_223917_693858_F2BE0EE3 
X-CRM114-Status: GOOD (  13.34  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 YueHaibing <yuehaibing@huawei.com>, Eason Yen <eason.yen@mediatek.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fontana <rfontana@redhat.com>, linux-mediatek@lists.infradead.org,
 Shunli Wang <shunli.wang@mediatek.com>, Allison Randal <allison@lohutok.net>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-04-22 at 13:46 +0900, Kuninori Morimoto wrote:
> Hi Mark
> Cc related engineer
> 
> These patches are tring to not to use snd_soc_rtdcom_lookup()
> function
> on each drivers as much as possible,  because we might have same name
> component under multi component situation.
> It can't find correct component in such case.
> 
> I tried to add new feature on each drivers to not to use it,
> but I can't test.
> Thus, these patches should get Acked-by or Tested-by from each
> drivers
> user/maintenor. Please test these.
> 
> After these patches, Intel / SOF drivers are still using
> snd_soc_rtdcom_lookup(). Because it is very complex, I couldn't try
> not to use it.
> If possible, each drivers should try to not use it,
> and it should be removed from ASoC.
Morimoti-san,

For my education, I understand the concept of multi-cpu/codec
components, but when or who would need multiple platform components?
This would help me able to remove the snd_soc_rtdcom_lookup() call in
SOF.

Thanks,
Ranjani


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
