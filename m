Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA00C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 03:24:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23B5720700
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 03:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23B5720700
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hjr0ZwCfuvOtg6oMSnOD1WDEf++Fko863oLHu2DnUFU=; b=G1xpC1SkFtXWBKuyohQzR7f/G
	74gZ0F46AgBEoGVEVwDRgvx0TEr1KmOonRBe2eSLCAk9/Wvjr3sbH7XpH60lkQvKMFES5EYBP1hrn
	jqK++p6Iy7KpKDVABG8kTMFU5ZHBZWy5u91lCT6Bilb+DMu1HnFWZN70sr8Zok4qMVSdJnXZHY+5M
	DXtWXwr2fyOx475IMc4vlPlBjB1AM2PtCXhl/rLSo+UPXzaNfaUTPKXkhDNuYmxMr3eWsUu/V1mrF
	krCd12tK9iWqOjidEbdKQTmO3Z+cq1z84mzwSyT0h2HYUCfPUlq/tABDb7tdHP94d7aU6pqwX/+D4
	cu1h5Z0/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpNQU-00082E-6G; Wed, 16 Dec 2020 03:24:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpNQN-000818-Kb; Wed, 16 Dec 2020 03:24:27 +0000
X-UUID: b4419d0ed501430d8f5852a1c8ef06d4-20201215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=IfRl0dkrWmGs552oR509pYEf+cV5Pv30Kj/jNbHmajw=; 
 b=bYL7jj4OL/Hy/eq10Z0Qt5SpYZ5KGs9xA9Li5LSrM1AtvMvOnIrg7QCShNgvabFIai7GdY3nE5gxiyndppmETOxGt0RHRA0CtuZ11Bdyed8sj8t+1GR7PUJe7dNiGbTveb0AxGvjZXC7ySuxMbpfkTfAYqnuTp11f5vMq28EBfs=;
X-UUID: b4419d0ed501430d8f5852a1c8ef06d4-20201215
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1995512309; Tue, 15 Dec 2020 19:24:17 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Dec 2020 19:24:15 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 11:24:15 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Dec 2020 11:24:14 +0800
Message-ID: <1608089054.12432.1.camel@mtksdaap41>
Subject: Re: [PATCH v3 5/8] regulator: mt6359: Add support for MT6359 regulator
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Wed, 16 Dec 2020 11:24:14 +0800
In-Reply-To: <20201215115602.GA4738@sirena.org.uk>
References: <1606103290-15034-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1606103290-15034-6-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20201124170732.GI4933@sirena.org.uk> <1608024188.29527.2.camel@mtksdaap41>
 <20201215115602.GA4738@sirena.org.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_222424_426406_DDB3989C 
X-CRM114-Status: GOOD (  16.96  )
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
Cc: devicetree@vger.kernel.org, Wen Su <wen.su@mediatek.com>,
 srv_heupstream@mediatek.com, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,
On Tue, 2020-12-15 at 11:56 +0000, Mark Brown wrote:
> On Tue, Dec 15, 2020 at 05:23:08PM +0800, Hsin-hsiung Wang wrote:
> > On Tue, 2020-11-24 at 17:07 +0000, Mark Brown wrote:
> 
> > > This looks like it could just be regmap_get_voltage_sel_regmap()?
> > > Otherwise the driver looks good.
> 
> > Thanks for the review.
> > MT6359 regulator has sel_reg and status_reg, so we use
> > mt6359_get_linear_voltage_sel for status_reg instead of
> > regmap_get_voltage_sel_regmap() which uses sel_reg.
> 
> Is the selector register not readable?  In general the rule is that the
> get should be reporting what was configured, the actual status should be
> reported separately if it can be read separately.  We don't currently
> have a mechanism for doing that with voltage but one could be added.

Thanks for your comments. The select register is readable, and I will
update it in next patch.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
