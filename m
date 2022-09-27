Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D12C07E9D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 07:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rk7eez5gu7Mxo/ZAdoW1dtp+oG1rsnOuA8m1wARVdBE=; b=MCq/mMSR6Hx0bosneUM4TrD3xp
	wCpcjrYRYgufWWIsinPumygvnon+MVZm2SyJm2UAswBZin3HEgchglAvFt5yUpC9lCshmkF7G7eug
	kvEABDxA8i8HSLD+1/gn4WyU9w8o2GbGxsHKOfbbMPj7LcPD5hGN24wp/84/HrwvjjdGFeYSoiA/h
	RttLp+sxvouJfh4D4yTaeRnOg2T/iAWagK/9mPTEgR/eIQrOdZEhtyGZs4V4EauTQoRBr8B9lxbK1
	yRq4UHlX7BoRb7A8INdufwI8dd9cqQ+P1O9qyfXR9zzlPI//DQQvsCdLo8UszEkNSse3ucX6VdNC0
	RK+u8TZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od4uG-008kw5-EG; Tue, 27 Sep 2022 07:21:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od4u1-008kpS-A3; Tue, 27 Sep 2022 07:21:17 +0000
X-UUID: 408f82a61c744ad0b60eb6ecdb355219-20220927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=rk7eez5gu7Mxo/ZAdoW1dtp+oG1rsnOuA8m1wARVdBE=;
	b=NUQUaqPLEHr59AWRkRDSQ3jIQmJpOlsWCfWHdIeBTqeKK/BviBasudlEFf0XsQpcKlgJL9mxGMOy/pdsd+jkY0QCu5/Z7swh4ZUUrMVyi1JU25aNNSuyqyNTqJdOTBpFwTKEKzoO+LtmEVym4ekpa+dhGDPjv4YBX5O41jnChME=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:5b2ca91e-0b82-4b6d-b749-7cb38739b953,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:45f65ae4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 408f82a61c744ad0b60eb6ecdb355219-20220927
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <liangxu.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 743263834; Tue, 27 Sep 2022 00:21:09 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Sep 2022 15:20:34 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 27 Sep 2022 15:20:33 +0800
Message-ID: <aa8e3a73db99d98cea2b496b95e7629ea9db0ef1.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dp: Add compatible for
 MediaTek MT8188
From: liangxu.xu <liangxu.xu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<xinlei.lee@mediatek.com>
Date: Tue, 27 Sep 2022 15:20:34 +0800
In-Reply-To: <20220926215440.GA2888681-robh@kernel.org>
References: <20220923013953.5043-1-liangxu.xu@mediatek.com>
	 <f6e669dd-f2cf-6e3f-18bb-25b21e5eab0c@linaro.org>
	 <2afb5b7f761c7931eaf93f2f8a0fd268a39e1b02.camel@mediatek.com>
	 <20220926215440.GA2888681-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_002113_455064_9D4DD7E7 
X-CRM114-Status: GOOD (  22.42  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2022-09-26 at 16:54 -0500, Rob Herring wrote:
> On Mon, Sep 26, 2022 at 10:52:04AM +0800, liangxu.xu wrote:
> > On Fri, 2022-09-23 at 13:16 +0200, Krzysztof Kozlowski wrote:
> > > On 23/09/2022 03:39, liangxu.xu@mediatek.com wrote:
> > > > From: liangxu xu <liangxu.xu@mediatek.com>
> > > > 
> > > > Add dt-binding documentation of dp for MediaTek MT8188 SoC.
> > > > 
> > > > Signed-off-by: liangxu xu <liangxu.xu@mediatek.com>
> > > > ---
> > > 
> > > Where is the DTS? Where are driver changes?
> > > 
> > > Best regards,
> > > Krzysztof
> > > 
> > 
> > Hi Krzysztof:
> > 
> > If you want to see the synchronous changes of dts and binding
> > files,
> > then I will attach this binding file changes when sending dts
> > later.
> > 
> > The driver change of mt8188 reuses that of mt8195. The driver link
> > is
> > as follows:
> > 
> > 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/mediatek/mtk_dp.c?id=48f4230642ee32a97ddf4be492838ce96089f040__;!!CTRNKA9wMg0ARbw!zWA5kU-1QLhCsHN3BeMSN_gCpc5yrXC0qHv9Qxdqs0o510rEVJNZRrulCCCERJIA-SA$
> >  
> 
> So the 8188 block is backwards compatible with the 8195 block? 
> That's good, but not what your schema says because you have not
> defined 
> a fallback compatible for the driver to use.
> 
> Rob

Hi Rob:

Yes, please ignore this patch. According to krzysztof's suggestion, I
will re-send a patch of mt8188 multiplexing mt8195 compatiable after
the mt8188 dts file exists.

Best Regards
LiangXu


