Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41EC1C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 16:42:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3CA7233EA
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 16:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3CA7233EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u83GtZOkT1ldfyOPtuIrWDQwHrXN0aV2nInqql2io94=; b=F5bez4vmhz+3mttD94jZADZ9E
	MLqlB449nX9rNuJ1Mz+ls0iilxZsW3xEyHqextq1GU1VuzX1Pk/j9E4jzuu0kpm9k4dp2n186QpZX
	2kvqBb+6QAXkgmwP4tDN3JXYU6eE6tW0XGnuuulJIHp1hJq5eTjm7GDWMRs1Vp1lHdkJazTAaNetU
	hhc4PzWNybX0Ywdpe1ypFraUQRQOcOA7FuSK2mXUq75zXo6kpRmu4NCsk4G2cLT29WkvJaDbm/j/F
	8rIS9vyH6lbIj0AF61J1jW5tumGVOBzp1ARF2KkiLfF9LTcIjNMc466t2NBzXUiYfSpm3yukEPQAy
	7yvP2lo3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpZsG-0002t7-K1; Wed, 16 Dec 2020 16:42:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpZsD-0002sb-KR; Wed, 16 Dec 2020 16:41:59 +0000
X-UUID: a3cc2e846fb340c999a4661c2b24e091-20201216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=M3a0taycmyg1jgLPbQn6npDTj0hr19EY8/ZJ5kyDMwk=; 
 b=p2BOi7Vjm5OyLV+RX7MEdi+0ttc3BPQhZJR2Qxpwyw9ar0xfsqUGZPu4nxh6IKsGZsPB3lGDsik8BUnKNrnWDEsQeS/nTysFwvyxvB+Ek2HZEtiXayy6fdeLUmpxhZZOyrD8/IQtt2XEZhlFqv6nIrxBI3cSTxAgWvLKtLdiQ8M=;
X-UUID: a3cc2e846fb340c999a4661c2b24e091-20201216
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1866156411; Wed, 16 Dec 2020 08:41:50 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 08:41:48 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Dec 2020 00:41:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Dec 2020 00:41:45 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <catalin.marinas@arm.com>
Subject: Re: [PATCH] arm64: Kconfig: Add SYS_SUPPORTS_APM_EMULATION
Date: Thu, 17 Dec 2020 00:41:47 +0800
Message-ID: <20201216164147.9854-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201216155820.GH2511@gaia>
References: <20201216155820.GH2511@gaia>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_114157_881282_21895087 
X-CRM114-Status: GOOD (  25.12  )
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
Cc: mark.rutland@arm.com, lecopzer.chen@mediatek.com, yj.chiang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Catalin,

Thanks for your reply.

so there is two points
1. out-of-tree function can't be approved
    I totally agree with this :) so we may have a driver upstream in the future.
2. APM not make sense on arm64
Could you please let me konw the reason why APM on ARM64 doesn't make sense?


thanks!
BRs,
Lecopzer


> On Wed, Nov 25, 2020 at 07:41:30PM +0800, Lecopzer Chen wrote:
> > >> In order to select CONFIG_APM_EMULATION, make SYS_SUPPORTS_APM_EMULATION
> > >> default is y if ACPI isn't configured.
> > >
> > >I'm a bit confused why this should be enabled for !ACPI. Which DT
> > >platforms need this, and how do they use it? Why should this only be
> > >enabled for kernels without ACPI support, and not for kernels that
> > >support both ACPI and DT?
> > 
> > In our internal patch has no !ACPI here,
> > the reason I add here is that in kernel document[1] it mention:
> > > No, sorry, you cannot have both ACPI and APM enabled and running at once.
> > Thus, I try to limit the scope for who don't use the ACPI because I'm not sure
> > they could exist at the same time or not.
> > 
> > But I think it should be fine without !ACPI if APM and APCI
> > config won't conflict with each other.
> > 
> > So if it's better to remove !ACPI I'll send v2 for this.
> > 
> > BTW, The platform is for our internal kernel drivers, they utilize APM interface,
> > /dev/apm_bios to do their works in arm64.
> 
> Sorry, I don't think the APM interface makes sense on an arm64 kernel
> (and it's also used by an out of tree driver).
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
