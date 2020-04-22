Return-Path: <SRS0=Y6KA=6G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F764C55185
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 22:40:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E59D12076E
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 22:40:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j+4LpRHm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E59D12076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hePqUu3zQwNemNp78SvtqAXIxN3zgyzVSTK+lOKXIOk=; b=j+4LpRHmGAuv9z
	Uo4HSD5be4XKnuRoOpjeYY9BQff1QVyS9NI5LTU1mP9D3rStbp9WSIMRCsDRlzPOdD+BzSDGG3rxD
	WTyk1XdwcVi2iWmL5I8r/Inor4cVkQC12zxqXYvv67KyXi8oF8q1ePpLvGAbTA5anG+irqLGQW2mN
	GwMPU+iFFkEqJ5UO4g3pVoxQ6X1JM9WmtFq3CPkoJDQmHWjmYH+ytb9d+QbW387dQvnBHGN0/s4BP
	bTntzfnJJ00FxbzVCc4bsaYBBJpp12aNm5BP2ISC5IVHhcI1GdDhpunls3KzNhig1Typ1wcivzpsi
	8vbUhiTVBZiB2H/r0EaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRO2Y-0001ob-Os; Wed, 22 Apr 2020 22:40:22 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRO2C-0007Ft-JD; Wed, 22 Apr 2020 22:40:02 +0000
IronPort-SDR: sqt4DfN40zhB/M6/VPep/W9PpPGyh943ChbjR/bY+XAjudXSbOZLbcX7pl3i5+V9cGX2rDBFb5
 qDAGmtKe/xmQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 15:39:59 -0700
IronPort-SDR: 6KcZIDgHNFgXHvJepoRz7a8Ga3rtEvz1kejbSOwv81iDWhL8X5tYRaWuuUl3/EIag2LyP9KljY
 0u7xm/wuIs/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,304,1583222400"; d="scan'208";a="292088532"
Received: from aacostaz-mobl.amr.corp.intel.com ([10.255.74.8])
 by orsmga008.jf.intel.com with ESMTP; 22 Apr 2020 15:39:59 -0700
Message-ID: <ebe305743178c4548b779f25e6400863094ef5a9.camel@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC:: don't use snd_soc_rtdcom_lookup()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 22 Apr 2020 15:39:58 -0700
In-Reply-To: <874ktbuq4j.wl-kuninori.morimoto.gx@renesas.com>
References: <87d080unyx.wl-kuninori.morimoto.gx@renesas.com>
 <d20cc18d0fa10b52437e0ac29ea98792e0a3d45d.camel@linux.intel.com>
 <874ktbuq4j.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_154000_714890_D25FEA24 
X-CRM114-Status: GOOD (  20.28  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fontana <rfontana@redhat.com>, Shunli Wang <shunli.wang@mediatek.com>,
 YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Stephen Boyd <swboyd@chromium.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Eason Yen <eason.yen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Takashi Iwai <tiwai@suse.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Colin Ian King <colin.king@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-04-23 at 07:12 +0900, Kuninori Morimoto wrote:
> Hi
> 
> Hi Ranjani
> 
> > > These patches are tring to not to use snd_soc_rtdcom_lookup()
> > > function
> > > on each drivers as much as possible,  because we might have same
> > > name
> > > component under multi component situation.
> > > It can't find correct component in such case.
> > > 
> > > I tried to add new feature on each drivers to not to use it,
> > > but I can't test.
> > > Thus, these patches should get Acked-by or Tested-by from each
> > > drivers
> > > user/maintenor. Please test these.
> > > 
> > > After these patches, Intel / SOF drivers are still using
> > > snd_soc_rtdcom_lookup(). Because it is very complex, I couldn't
> > > try
> > > not to use it.
> > > If possible, each drivers should try to not use it,
> > > and it should be removed from ASoC.
> > 
> > Morimoti-san,
> > 
> > For my education, I understand the concept of multi-cpu/codec
> > components, but when or who would need multiple platform
> > components?
> > This would help me able to remove the snd_soc_rtdcom_lookup() call
> > in
> > SOF.
> 
> I don't know concrete system.
> But it is "possible" today.
> And, we don't know the future system,
> having flexibility is good idea, I think.
> 
> I'm thinking removing lookup function is nice idea,
> but don't feel pressure to it.
> "Now you know it" is very enough for me.
I am having a hard time visualizing a scenario where we would have more
than one platform component. And even if we did, I'd think that the
driver registering these components would make sure to not duplicate
the driver names. Of course, we dont really check if thats really the
case. 
Do you think it makes sense to add that check when registering a
component? If we do that, then keeping snd_soc_rtdcom_lookup() might
not be such a bad idea. 

Thanks,
Ranjani


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
