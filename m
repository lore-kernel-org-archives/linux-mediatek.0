Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8ADC32774
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 02:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=170kvgtp+PuxY3dCeidNg7sb0rnWVpuKLSPJmcle+pA=; b=0CqgXc99IGmifpPz1TNdmzQ3ki
	QA/5ndeF7mrJSDnl2OPvlc1T8HMgDbuv+yl0nlwnnTAzs9UnutmHrXR8cenpab386p+oS2oBeRUf6
	D/gAXreb5jxQ53VvZyXyk7XNs4Bvwmzk4LzDDbCkzOxXsK3R7Gj2bFftaf8y3Xyo4A6j34ll03MQJ
	Uxt09jtK182gR7l/pLYD5hNV/RcK3Lkq3dqublBwIbyAdhX1654h0k+2VUKK6MPVb/35u43I91doe
	RV4sXXEPKA7W+YyaRY/1prekgW/fXyRVHMvzHT0a7C5RcNESmGJTthz9/WA3CML6l+8P0cTLq10ok
	Z9xiAmIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQgaf-00A5Qd-I7; Wed, 24 Aug 2022 02:58:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQgaS-00A5MY-Ip; Wed, 24 Aug 2022 02:57:49 +0000
X-UUID: ec3e87626a1049b4a6522db1f2e0ea6d-20220823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=170kvgtp+PuxY3dCeidNg7sb0rnWVpuKLSPJmcle+pA=;
	b=Taa89SeLQSulChF66A/7Md95Aw76+ZWzk1DNliE6tIEMmEWUHfcsFqJ7b0mxVpnXOw6UP3gIV7tFHaMYf3O37qA2ihNJO0XUreB2Q9Kz1RUyNX8yfwP0d3kdAOIjrwunPWmyNhJjp7AzX/5yFuOj8RpvcbAurh2k4ZkJXy+WbRo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:0d5e73e4-adb7-41d8-ba79-a87cf1ef9b68,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:660b9ac9-6b09-4f60-bf82-12f039f5d530,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ec3e87626a1049b4a6522db1f2e0ea6d-20220823
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <zheng-yan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 850513528; Tue, 23 Aug 2022 19:57:39 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 24 Aug 2022 10:07:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 24 Aug 2022 10:07:00 +0800
Message-ID: <055d433d0b076af2e27e89c8576d39d2e4adc237.camel@mediatek.com>
Subject: Re: [PATCH 3/3] arm64: dts: Modify gamma compatible for mt8195
From: zheng-yan.chen <zheng-yan.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 24 Aug 2022 10:06:58 +0800
In-Reply-To: <39f63588-bc88-a716-bc66-7f93c4aabc56@linaro.org>
References: <20220822091945.21343-1-zheng-yan.chen@mediatek.com>
	 <20220822091945.21343-4-zheng-yan.chen@mediatek.com>
	 <39f63588-bc88-a716-bc66-7f93c4aabc56@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_195748_634729_536C9E1E 
X-CRM114-Status: GOOD (  18.13  )
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

On Tue, 2022-08-23 at 11:40 +0300, Krzysztof Kozlowski wrote:
> On 22/08/2022 12:19, zheng-yan.chen wrote:
> > Modify gamma compatible for mt8195.
> > 
> > Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> > 
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index a50ebb5d145f..8504d01b103a 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -2021,8 +2021,8 @@
> >  			mediatek,gce-client-reg = <&gce0
> > SUBSYS_1c00XXXX 0x5000 0x1000>;
> >  		};
> >  
> > -		gamma0: gamma@1c006000 {
> > -			compatible = "mediatek,mt8195-disp-gamma",
> > "mediatek,mt8183-disp-gamma";
> > +		gamma0: disp_gamma@1c006000 {
> 
> No, really, no.
> 
> Not explained in commit msg, violates naming convention, violates
> coding
> style, not related to the patch at all.
> 
> Best regards,
> Krzysztof

Sorry about that, I will change this "disp_gamma" back to "gamma".


Best Regards,
Zheng-Yan Chen


