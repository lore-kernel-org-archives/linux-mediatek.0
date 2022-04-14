Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55B9C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 02:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqUpCuitQtk/bkqwnuoexWUZSCZGzqTPCHDxKJ0/LfA=; b=Lao8kPl5j6eTxT
	hmA39rnQWsYFpeI/BqUygW4RHYcLT6+TqoL8zIIoiqZoXKuSP/gkXGF7/R19iobD/SrZMBgdTllbI
	+MnafBX80ZsXc1bXDX77ttYdgCTpXBoEtdFLvEs2vLkTQ+cdxXVtHR/bb3qJf331ur2yV5lIrxECg
	i1KX7eitu49nZt7+q2FglbDzvw33kFVHMLULHA/ucG6n6D2J6Di5SPn/9TdO9qE8lQf2vjwHIiKf2
	a3PAfry3WNlh7nTGbAIV3ljorNUjrENadjEWacQkIes9SyRr1GpP0vZ/f4sA/UUVtr5oyMwROK+FV
	MPp2e2y0LTlFOwCDxCBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nepRi-003UHH-5g; Thu, 14 Apr 2022 02:42:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nepRW-003UF9-Tv; Thu, 14 Apr 2022 02:42:48 +0000
X-UUID: bcef963baab048d5b8319b7340d18ec8-20220413
X-UUID: bcef963baab048d5b8319b7340d18ec8-20220413
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 708397468; Wed, 13 Apr 2022 19:42:33 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 19:32:31 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 14 Apr 2022 10:32:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Apr 2022 10:32:29 +0800
Message-ID: <12c630946ce9d7b8c80143615496238759323981.camel@mediatek.com>
Subject: Re: [PATCH V2 13/15] cpufreq: mediatek: Link CCI device to CPU
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Kevin Hilman <khilman@baylibre.com>, <rafael@kernel.org>,
 <viresh.kumar@linaro.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 14 Apr 2022 10:32:29 +0800
In-Reply-To: <7hlew83blk.fsf@baylibre.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-14-rex-bc.chen@mediatek.com>
 <7hfsmn5m9f.fsf@baylibre.com>
 <bc6dd020a1cc3f00f5be2bf2929046b9116bbeef.camel@mediatek.com>
 <7hwnfv4hfr.fsf@baylibre.com>
 <f00e3df2e270e5edc160f8ff1bd8c52a49bf71d5.camel@mediatek.com>
 <7h5yne3zlx.fsf@baylibre.com>
 <98957e61b040b6c5b6a6b39e6eb661e07e510277.camel@mediatek.com>
 <7hlew83blk.fsf@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_194247_015734_1A05AC84 
X-CRM114-Status: GOOD (  31.17  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2022-04-13 at 14:41 -0700, Kevin Hilman wrote:
> Rex-BC Chen <rex-bc.chen@mediatek.com> writes:
> 
> [...]
> 
> > From the Chanwoo's devfreq passive govonor series, it's impossible
> > to
> > let cci devreq probed done before cpufreq because the passive
> > govonor
> > will search for cpufreq node and use it.
> > 
> > Ref: function: cpufreq_passive_register_notifier()
> > 
> > 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/commit/?h=devfreq-testing&id=b670978ddc43eb0c60735c3af6e4a370603ab673__;!!CTRNKA9wMg0ARbw!z58Lc1p9REo88oHn-NkxroN_fBd0TsHYmhscNZwnWwT71ecRkTeqZ6vFl5l7HpkTdM6t$
> >  
> 
> Well this is a problem, because CCI depends on CPUfreq, but CPUfreq
> depends on CCI, so one of them has to load and then wait for the
> other.
> 
> > After I discuss with Angelo and Jia-wei, we think we are keeping
> > the
> > function in target_index and if the cci is not ready we will use
> > the
> > voltage which is set by bootloader to prevent high freqeuncy low
> > voltage crash. And then we can keep seting the target frequency.
> > 
> 
>  > We assume the setting of bootloader is correct and we can do this.
> 
> I'm still not crazy about this because you're lying to the CPUfreq
> framework.  It's requesting one OPP, but you're not setting that,
> you're
> just keeping the bootloader frequency.
> 
> In my earlier reply, I gave two other options for handling this.
> 
> 1) set a (temporary) constraint on the voltage regulator so that it
> cannot change.
> 
> or more clean, IMO:
> 
> 2) set a CPUfreq policy that restricts available OPPs to ones that
> will
> not break CCI.
> 
> Either of these solutions allow you to load the CPUfreq driver early,
> and then wait for the CCI driver to be ready before removing the
> restrictions.

Hello Kevin,

I think I do not describe this clearly.
The proposal is:

In cpufreq probe:
we record the voltage value which is set by bootloader.

In mtk_cpufreq_set_target():
We do NOT directly return 0.
Instead, we will find the voltage of target cpufreq and use the value
max(booting voltage, target cpufreq voltage)

mtk_cpufreq_set_target() {
	/* NOT return 0 if !is_ccifreq_ready */
	....
	vproc = get voltage of target cpufreq from opp.

	if (ccifreq_supported && !is_ccifreq_ready)
		vproc = max(vproc, vproc_on_boot)

	//setting voltage and target frequency
	....
}

> 
> > For the SoCs that including ci hardware (8183 and 8186), we think
> > it's
> > not ok if we don't probe cci correctly.
> > If we failed to get cci node, I think we sould return -ENODEV and
> > the
> > probe of cpufreq failed.
> > 
> > What do you think the solution?
> 
> I think it would be better if CPUfreq probes sucessfully, but
> restricts
> the OPPs available until CCI is ready.  If CCI fails to probe/load,
> you
> still have a working CPUfreq driver, it just has a restricted set of
> OPPs.
> 
> Kevin

If we can use the solution.
I think it will be ok for this situation.

Thanks!

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
