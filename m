Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C234C38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 06:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4d4OABhk3db1wBMRWNegWhxHRdnBMljaS9nufvBF9VM=; b=HX6BnxwekaJir7Ew6QLwlGfL85
	rm31v9SpOJ/nESp2BpY4WlkV/F+fq1EMA8FstnBwMMLy0KACj382piJK8+hYVUQ3BoIwYZtIPbldC
	4M8X571Y2UvwthJWXXs+ZfRUI61y+S18GpTpXL9G0cDrhCPXg4WJdVgwRlP2lAgSidY7v0iBpnc3Z
	ooK5oCyA1jLqdSKEGsz5srWQr+qemNZzERnx6mo4+d6E1oyvdWxVmBQD2pFp98qNZ5FJVKgEQbKsy
	rRhDWTlyuHOzYnAOC6R5Do25BB/svHSqS7nuMEUHYMoTrc/J79t65Hymy/5Cj33WRh/QLbOaVz3dY
	JDO0Qo4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omrGW-00HLFi-L0; Mon, 24 Oct 2022 06:48:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omrGT-00HLEm-E6; Mon, 24 Oct 2022 06:48:50 +0000
X-UUID: 95587a6e45e8407db7e9964c3be98758-20221023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=4d4OABhk3db1wBMRWNegWhxHRdnBMljaS9nufvBF9VM=;
	b=oTaOsrBZLxm3vaSkx/d71Z7fXU1K+yUYzjSVK/NadMfTBn15QTr0ycWC6Ozdsx7nbFGCQ6Rph3qcoPIECE9AW+YWO13ohbebXb5mXYc9TZ2+Re1yfU9DU1sVqPfu2N+DiYKqvim9ex1EfB2k1duWmJ4T42LIiv9R+L3w5l9/xHE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:548ec933-26fd-4a98-8db4-0413fb702843,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:2676e26c-89d3-4bfa-baad-dc632a24bca3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 95587a6e45e8407db7e9964c3be98758-20221023
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 516971843; Sun, 23 Oct 2022 23:48:42 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 24 Oct 2022 14:18:06 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 24 Oct 2022 14:18:06 +0800
Message-ID: <da9f8b90-e4d1-5893-f656-1bb0221ea7f7@mediatek.com>
Date: Mon, 24 Oct 2022 14:18:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8195-demo: fix the memory size
 of node secmon
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Fabien Parent <fparent@baylibre.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Miles Chen <miles.chen@mediatek.com>, Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	<linux-usb@vger.kernel.org>, <stable@vger.kernel.org>, Matthias Brugger
	<mbrugger@suse.com>
References: <20220922091648.2821-1-macpaul.lin@mediatek.com>
 <20220929084714.15143-1-macpaul.lin@mediatek.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20220929084714.15143-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_234849_511186_7D67B523 
X-CRM114-Status: GOOD (  26.29  )
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

On 9/29/22 16:47, Macpaul Lin wrote:
> The size of device tree node secmon (bl31_secmon_reserved) was
> incorrect. It should be increased to 2MiB (0x200000).
> 
> The origin setting will cause some abnormal behavior due to
> trusted-firmware-a and related firmware didn't load correctly.
> The incorrect behavior may vary because of different software stacks.
> For example, it will cause build error in some Yocto project because
> it will check if there was enough memory to load trusted-firmware-a
> to the reserved memory.
> 
> When mt8195-demo.dts sent to the upstream, at that time the size of
> BL31 was small. Because supported functions and modules in BL31 are
> basic sets when the board was under early development stage.
> 
> Now BL31 includes more firmwares of coprocessors and maturer functions
> so the size has grown bigger in real applications. According to the value
> reported by customers, we think reserved 2MiB for BL31 might be enough
> for maybe the following 2 or 3 years.

Dear Matthias, sorry for a gentle reminder. MediaTek hope this simple 
fix could be applied to 6.1-rc and be picked-up to current stable tree 
after v5.19. Thanks a lot.

> Cc: stable@vger.kernel.org      # v5.19
> Fixes: 6147314aeedc ("arm64: dts: mediatek: Add device-tree for MT8195 Demo board")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---
> Changes for v2
>   - Add more information about the size difference for BL31 in commit message.
>     Thanks for Miles's review.
> 
>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> index 4fbd99eb496a..dec85d254838 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> @@ -56,10 +56,10 @@
>   		#size-cells = <2>;
>   		ranges;
>   
> -		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
> +		/* 2 MiB reserved for ARM Trusted Firmware (BL31) */
>   		bl31_secmon_reserved: secmon@54600000 {
>   			no-map;
> -			reg = <0 0x54600000 0x0 0x30000>;
> +			reg = <0 0x54600000 0x0 0x200000>;
>   		};
>   
>   		/* 12 MiB reserved for OP-TEE (BL32)

Regards,
Macpaul Lin

