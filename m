Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6C1C19F28
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Aug 2022 11:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SasbzoC2Ds5PFkGibtZDjGZyrgO09YD9RDB7LIzRHI=; b=opUsJH1lthyImuSn26RcYIs+R+
	Eu6vEQr/qCvJoAxygR1EgA7c01Yv33E0QRgh6zusjtby3iR8/2VgojjTbxDx3Wzo0YNukEMXFZ9pl
	XWLDSuiX2D1IC7MEbyDJh61HXisDMj04MA5cQF7FTWyRWwDl+9hIPwSF3HuudaA+Bo5eMX7MNDm6p
	6KKq9mNl2H6JIVH0Ozclgr8OLst/HoOzY80v+yjVihAYyeeZIYJ8pbguRMJih0u3VlpZkCsD8wHFE
	0w9tUUWwyiB3zF5PqHb6FwMiWCTf5G2K0Gb9IuogYHcEc70VSzRcH3tufMyJcM1ZSpIwc/4KZXyDz
	3HEm9mbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJCO8-005GAB-RY; Wed, 03 Aug 2022 11:18:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJCO4-005G4p-4R; Wed, 03 Aug 2022 11:18:06 +0000
X-UUID: 382a0e8f94644109a699b987aa014c2d-20220803
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ebcc3ee0-eadf-4edc-ad1e-0ce5b80b7188,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:251020d1-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 382a0e8f94644109a699b987aa014c2d-20220803
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1242296762; Wed, 03 Aug 2022 04:17:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 3 Aug 2022 19:07:47 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 3 Aug 2022 19:07:47 +0800
Message-ID: <238915dffb733adc5126a1605de0b2878be6ca6e.camel@mediatek.com>
Subject: Re: [PATCH] arm64: Fix comment typo
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
CC: Chinwen Chang =?UTF-8?Q?=28=E5=BC=B5=E9=8C=A6=E6=96=87=29?=
	<chinwen.chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Date: Wed, 3 Aug 2022 19:07:47 +0800
In-Reply-To: <20220721030531.21234-1-Kuan-Ying.Lee@mediatek.com>
References: <20220721030531.21234-1-Kuan-Ying.Lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_041804_257605_3E4D7C1F 
X-CRM114-Status: GOOD (  14.39  )
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

On Thu, 2022-07-21 at 11:05 +0800, Kuan-Ying Lee wrote:

Kindly ping.

> Replace wrong 'FIQ EL1h' comment with 'FIQ EL1t'.
> 
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> ---
>  arch/arm64/kernel/entry.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index 254fe31c03a0..2d73b3e793b2 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -502,7 +502,7 @@ tsk	.req	x28		// current
> thread_info
>  SYM_CODE_START(vectors)
>  	kernel_ventry	1, t, 64, sync		// Synchronous EL1t
>  	kernel_ventry	1, t, 64, irq		// IRQ EL1t
> -	kernel_ventry	1, t, 64, fiq		// FIQ EL1h
> +	kernel_ventry	1, t, 64, fiq		// FIQ EL1t
>  	kernel_ventry	1, t, 64, error		// Error EL1t
>  
>  	kernel_ventry	1, h, 64, sync		// Synchronous EL1h
> -- 
> 2.18.0
> 


