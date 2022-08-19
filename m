Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E54BC32771
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 09:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPx28nuo9RcwR75sB21q6ymmTD71bLmGxP0/PKNXITQ=; b=porLiLt5SpFl3VbuNlJzb8aPhh
	lcmI8Bh80ZBArsBhn5EEi+SKqgRZYFXV7elYtxxSnc+Lo7j3+pbYpSHLdDkUDi9/Y+eFzBuaNM5N+
	gfFq6UtD9+4o6rfmG1V44G2oq76u+DPHUAnQyjhpkGxYpCeCbNrGkF8cMGUNzMQtj3zjU0uNpezDv
	F65AU1eapChyW2xjpN5mBoNfmMugU0lItFB9cvt7tZRukrhPY3Nlqw/0UoZdRK/7l2WZHSFALiGjO
	6Ucg6GP5Al6mgHYbMn9HusktJMrgGw+tvEwdM/3zUmCDdk3NC1fia31R5Wf7LilvmA3af6PtAwkLx
	nOffg04w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOyfO-005FjJ-Tq; Fri, 19 Aug 2022 09:51:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOyfM-005Ff0-A0; Fri, 19 Aug 2022 09:51:49 +0000
X-UUID: fb5fdb90068a47a5bc5a2adb20b47862-20220819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=WPx28nuo9RcwR75sB21q6ymmTD71bLmGxP0/PKNXITQ=;
	b=FU30adMy92dNfqEU4l6hLja0mdw0Qv2TpXsDEegxTnKlcAnoKOQ14GeSn7FDIxzFgvSrlJgiuDeYU6cv+8A8T5T58hiCtzZPTIp8yxnKuCWgl5kzHv1kY1FVSqRWoa0BJzknPyBTfbn1pxEDqtxoSeQDCO7zn9zA5Aww/UBfNmI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:8d8c7ddc-b444-47fa-935c-33fb48f079e4,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:6a3434c9-6b09-4f60-bf82-12f039f5d530,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: fb5fdb90068a47a5bc5a2adb20b47862-20220819
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1383697600; Fri, 19 Aug 2022 02:51:41 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 19 Aug 2022 17:21:05 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Aug 2022 17:21:05 +0800
Message-ID: <b36cfc74fa9f1aed5f7fe60dd810c5fcf4073b65.camel@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: cpufreq: add mt8188 cpufreq hw
 dt-bindings
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hector Yuan <hector.yuan@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>
Date: Fri, 19 Aug 2022 17:21:05 +0800
In-Reply-To: <106e443a-e765-51fe-b556-e4e7e2aa771c@linaro.org>
References: <20220805091211.2791-1-jia-wei.chang@mediatek.com>
	 <20220805091211.2791-2-jia-wei.chang@mediatek.com>
	 <106e443a-e765-51fe-b556-e4e7e2aa771c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_025148_410705_A3A9353E 
X-CRM114-Status: GOOD (  19.01  )
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

On Fri, 2022-08-05 at 11:18 +0200, Krzysztof Kozlowski wrote:
> On 05/08/2022 11:12, jia-wei.chang wrote:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > Add mt8188 cpufreq hw compatible in dt-bindings.
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > ---
> >  .../devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml      | 4
> > +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-
> > mediatek-hw.yaml
> > b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-
> > hw.yaml
> > index 9cd42a64b13e..b56d36224612 100644
> > --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-
> > hw.yaml
> > +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-
> > hw.yaml
> > @@ -16,7 +16,9 @@ description:
> >  
> >  properties:
> >    compatible:
> > -    const: mediatek,cpufreq-hw
> > +    enum:
> > +      - mediatek,cpufreq-hw
> 
> Can you add a comment mentioning for which SoCs this is? Someone
> added a
> generic compatible covering all MediaTek cpufreq-hw (all!) and now
> you
> say it does not cover all?
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

I realized it is possible to make MT8188 completely reuse the
compatibles "mediatek,cpufreq-hw" and platform driver as well.

This series for MT8188 mediatek-cpufreq-hw is no longer required to be
reviewed.

Thanks for your help.



