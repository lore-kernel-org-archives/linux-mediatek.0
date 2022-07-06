Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAF6C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 04:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2VPXxk4csXftYSt6T2nmbq4vfgCmtsLCcOdfSAPTHgc=; b=GjC9lDNjsTc37LMrKq2+5iCz7k
	tOGBTG+tIPwtZxshilCVnrXNpovgQiqYE8nadOkgnXkYj+OJKEdul1JzvUyxMvOVcg+9bCL6tTwdy
	otWnO0WQ5FexCJjm2MYQqOIPgSdLCofYTOt19emFSL47iGHAhqyilZ5p3mIkZj1TG5JDFZiCyO82C
	Jn5OdCxISyDdrGEVb6czZPFZjNEK0vVs4sruERTZVRSptxujGf4n3J5AAD1ZJDT+7gEHx/Z139s86
	RF5hiJWtemkrjVbCogc9HhZRTWFL4yoTiO4OiopqRV+ZYMfsBUbzUMOecScqH59jP1xb3euREzY7S
	ab/KnqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8wED-005eOH-EK; Wed, 06 Jul 2022 04:01:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8wE3-005eGB-3n; Wed, 06 Jul 2022 04:01:20 +0000
X-UUID: 466637dba0df410a8d45e99b49c40f13-20220705
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:b5283560-3280-4d80-a262-b66937e2a64e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:be208663-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 466637dba0df410a8d45e99b49c40f13-20220705
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1017827264; Tue, 05 Jul 2022 21:01:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 6 Jul 2022 12:00:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 6 Jul 2022 12:00:28 +0800
Message-ID: <098f43e5033c42e9dd44d61d4a505f6870a7a8b0.camel@mediatek.com>
Subject: Re: [PATCH v1 04/16] arm64: dts: mt8195: Disable watchdog external
 reset signal
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong
 Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, "Weiyi
 Lu" <weiyi.lu@mediatek.com>
CC: <iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Fengquan Chen
	<fengquan.chen@mediatek.com>
Date: Wed, 6 Jul 2022 12:00:28 +0800
In-Reply-To: <e01fad71-0d7b-e0a8-7ee5-5a64792ed579@collabora.com>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
	 <20220704100028.19932-5-tinghan.shen@mediatek.com>
	 <e01fad71-0d7b-e0a8-7ee5-5a64792ed579@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_210119_212419_3B585C80 
X-CRM114-Status: GOOD (  13.72  )
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

On Mon, 2022-07-04 at 12:30 +0200, AngeloGioacchino Del Regno wrote:
> Il 04/07/22 12:00, Tinghan Shen ha scritto:
> > Disable external output reset signal in first round of watchdog reset
> > to reserve wdt reset reason for debugging watchdog issue.
> 
> If my understanding of the commit decription is right, then we can clarify
> that with something like: "[...] for debugging eventual watchdog issues".
> 
> Otherwise, if this implies that disable-extrst is needed to avoid losing
> the reset reason stored in the WDT, you could say something like:
> 
> "Disable external output reset signal in the first round of watchdog reset
> to avoid losing the reset reason stored in the watchdog registers"
> 
> After which:
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

Ok, I'll update it in next version.

Thanks,
TingHan


