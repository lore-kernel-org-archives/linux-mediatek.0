Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A403ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 04:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8XSr7TlTnh60b4oLOGBXsUmL/yWTMg9D9NJFxQgOA8=; b=0HzHCVljNIvQyWKYwPjHQ/UE2t
	09O1zGxoMETCQ219j9nMijMoL8wHeOZ/O/aHCrCbChvZ9eBL16hWM0TQgiVi1KfoWqQSB2DnpSedX
	+1Mz/9VtypTKymiutHRoWyXZvFV/FwYlparsBUpsPFJCakbds2syDuIr9KEudN196FMYOJGigjwli
	ngUy07YP8gmyyp9MYd7opFeEI/P+BVMfaPju5TBw3bd8zc0BV4zHm18CLic8A/k9CeqSGuufMCJ+5
	hudji9NBrsnGkTBayYENesiGtP49ZDwtfzPX2muiXQNaPotD7/zr8XlqTZIGCrTZb3+e1zpfHyXz3
	5SiTSOGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWVJL-00C388-6r; Fri, 09 Sep 2022 04:08:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWVJI-00C31X-Dq; Fri, 09 Sep 2022 04:08:09 +0000
X-UUID: 98e69418185f4dd88a0a5cdd470cc804-20220908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=O8XSr7TlTnh60b4oLOGBXsUmL/yWTMg9D9NJFxQgOA8=;
	b=um76aH5AiDtTx98jNeC9+yXNL4CbY57mlkZH8dXVfN0jlND+XJkmWJ7IBkPRHzLUUyS+UTS41tXGleXG7JoMs4MtH8hlfU2qBrKiw1RyfSTAnkiAhi7xTy5G1DijmZuZCbbeNxjSvXBYbdh63eWTMzqo/CwYLFww3PuU+x4uJx0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:ad8b5c50-386e-48ba-ab0b-58e859b84dcf,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:7c76d9f5-6e85-48d9-afd8-0504bbfe04cb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 98e69418185f4dd88a0a5cdd470cc804-20220908
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1536877250; Thu, 08 Sep 2022 21:08:04 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 9 Sep 2022 11:07:26 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 9 Sep 2022 11:07:26 +0800
Message-ID: <113219ac80cceaa4a39434e4370db821e26a5275.camel@mediatek.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: phy: mediatek,tphy: add property to
 set pre-emphasis
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Kishon Vijay Abraham I <kishon@ti.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>, Eddie Hung
	<eddie.hung@mediatek.com>
Date: Fri, 9 Sep 2022 11:07:25 +0800
In-Reply-To: <82576790-9fb0-ee1b-2308-fbe292068bd9@linaro.org>
References: <20220829080830.5378-1-chunfeng.yun@mediatek.com>
	 <20220829080830.5378-2-chunfeng.yun@mediatek.com>
	 <d1f49935-b465-7495-d345-f35bf4dea9f9@linaro.org>
	 <d30353e4dbb785c3ce31ef54b791bfe3d23df904.camel@mediatek.com>
	 <82576790-9fb0-ee1b-2308-fbe292068bd9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_210808_505427_7F56203F 
X-CRM114-Status: GOOD (  14.04  )
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

On Wed, 2022-08-31 at 09:02 +0300, Krzysztof Kozlowski wrote:
> On 31/08/2022 06:14, Chunfeng Yun wrote:
> > > These bindings are expected to be
> > > usable/applicable on several devices, so units, not register
> > > values
> > > which can change between devices, are the proper and reliable way
> > > to
> > > describe a feature.
> > 
> > I prefer to use exact level values, but not the inexact values with
> > units (e.g. -percent, -microvolt).
> 
> What stops you from using exact values - bp?
See reply for the first series, thanks

> 
> Best regards,
> Krzysztof


