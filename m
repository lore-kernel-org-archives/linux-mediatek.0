Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E979C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 09:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSeJUyFSeok6ngFkYCaH8KpME5/ESKjKnL4imI8pLTw=; b=i3t1TS+VZS4rThYstR4NhPMiKs
	4l3BnWxWWWe4PElf9M7I8Ja7sykQYVV81/MiH2q8m+iSUXH2p/N5HHZnJb0iurqhpBBZIBr5ikqXN
	GUQhLcgBfI61TeUUNUXqT6p3CR4wLd7J6onszjwPLqlOppsgeUDG28EiNRMoVrL4UmOX/JOGOnvQn
	TSe/6wNESKZ3SUnT5rr5naAeyHbi9eUhfvf2YQwAze1TMf40jWmshEhkG0UoNPZYt4VnaY6Fp4Z97
	vJV/m8pDnOZn/Z1o7GMs8JqpPw5jjChgCQ7sqfBaDKgMiP95Wyr/L4ifGfvVWBQQ4BYnamV9KM2I6
	c7E4aYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5fv-00HU8c-Hl; Wed, 19 Oct 2022 09:47:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5fi-00HU79-UB; Wed, 19 Oct 2022 09:47:37 +0000
X-UUID: c9b72087f6c647348f8ffd4ae6c461cc-20221019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=cSeJUyFSeok6ngFkYCaH8KpME5/ESKjKnL4imI8pLTw=;
	b=PDKa1XaV8UieJrHHR+UTXbQfm/hVyCdohgzFGftdl4QG0iB/Y+peIH+ElM7++SmmjGgqaa2bjTvii+OiGLmDKspaOy2zeu//65yP/sNEhMvotYiVzEjrM6BVXnFakiFjQueBqRm+go/nQPtHXo/j0WFDkpv1aFFmRm5EiICoFEU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:2c45a25f-e834-46b2-9ce7-2f57295d19cd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:21374aa3-73e4-48dd-a911-57b5d5484f14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c9b72087f6c647348f8ffd4ae6c461cc-20221019
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1279108905; Wed, 19 Oct 2022 02:47:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 19 Oct 2022 16:56:50 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 19 Oct 2022 16:56:49 +0800
Message-ID: <e710546052b93ee2e77b1aeae3f7e4631e884f9f.camel@mediatek.com>
Subject: Re: [PATCH v1 3/3] arm64: dts: mt8195: Add venc node
From: Irui Wang <irui.wang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 19 Oct 2022 16:56:49 +0800
In-Reply-To: <01ef8a2d-091f-5428-2cb8-41ba3e137a06@collabora.com>
References: <20221017070858.13902-1-tinghan.shen@mediatek.com>
	 <20221017070858.13902-4-tinghan.shen@mediatek.com>
	 <01ef8a2d-091f-5428-2cb8-41ba3e137a06@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_024735_004747_1AC33299 
X-CRM114-Status: GOOD (  19.67  )
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

On Wed, 2022-10-19 at 10:51 +0200, AngeloGioacchino Del Regno wrote:
> Il 17/10/22 09:08, Tinghan Shen ha scritto:
> > Add venc node for mt8195 SoC.
> > 
> > Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 24
> > ++++++++++++++++++++++++
> >   1 file changed, 24 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index 903e92d6156f..7cf2f7ef4ec6 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -2163,6 +2163,30 @@
> >   			power-domains = <&spm
> > MT8195_POWER_DOMAIN_VENC>;
> >   		};
> >   
> > +		venc: venc@1a020000 {
> 
> As Krzysztof also said, this is video-codec@1a020000.
> 
> Also, there's one more thing... MT8195 has two video encoder cores,
> but this
> node is only for the first one. There's a second instance at
> 0x1b020000: please
> add it.
Dear Angelo,

The second video encoder core 0x1b020000 is not ready in driver, there
is only one core 0x1a020000 used, so we don't need add it in current
patch now.

Thanks
Best Regards
> 
> Regards,
> Angelo
> 


