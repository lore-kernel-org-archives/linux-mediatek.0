Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3DEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 11:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jn/iVXXN2eOqpbmPNz9Am7fIqyo1qxnZ2gCBdAEKE8Y=; b=T/O1mKidQUNfiCHCTCA5F2CldM
	Dduq7F4ge7S2hH7h2BCzp8qDoVZ3ayHS1fsEkPy/sA/N+ZIOVUYWaZwEN8DbJDeHB9pKVubJOcZwV
	kxX6XI2XeW7kQx79z4gTVLlqTocbP5/69NJPAhqigP3HG2M0neCUbkCgB6MX3SloYHZInydWqyWdm
	vgo4F8QDcJBTC6+yf8AuTVB+AJHUQ8O4rzN4KHKyCikQ3cvGF4iueMXa8DstnZwccn/7f68gbDoZI
	cfwhYIAcn7RQTm4mJIfMMx1XIKJTs39AM9cOd4hkxZ33qWZ0Q0iivr8IyDdKqFhWKQ5W9XfE89F39
	RInF9nsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogPJ9-0020dP-6t; Thu, 06 Oct 2022 11:44:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogPIe-0020JN-F2; Thu, 06 Oct 2022 11:44:28 +0000
X-UUID: 71e298f3d65149e5913c72c6c4abc1bc-20221006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Jn/iVXXN2eOqpbmPNz9Am7fIqyo1qxnZ2gCBdAEKE8Y=;
	b=MXOFP3X3ny3X3vjtJivhYpp3t+OqiStAIaSP7JL6upd7dgfRwoWSSOUBwPntZs3wF/k8XSDTaPE5TX8vxhWuC/eHXzv2ryvYlxDrjDOLOuuNN8A0NxdeOQ5/Tw0wwNme/zVm72Jgyf7RVh5DyRG++ddpLW6fR8hO6cJ4z0PGiUk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:c4c69bb4-bc77-4f98-9d42-eded5824cb3d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:6877b9b8-daef-48a8-8c50-40026d6a74c2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 71e298f3d65149e5913c72c6c4abc1bc-20221006
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1745345113; Thu, 06 Oct 2022 04:44:14 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 6 Oct 2022 19:43:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 6 Oct 2022 19:43:30 +0800
Message-ID: <d8addc83702f41e1afb2ded341da0fd797539ffc.camel@mediatek.com>
Subject: Re: [PATCH 8/8] soc: mtk-svs: mt8192: fix bank data
From: Roger Lu <roger.lu@mediatek.com>
To: <matthias.bgg@kernel.org>, <jia-wei.chang@mediatek.com>
CC: <nfraprado@collabora.com>, <khilman@baylibre.com>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<angelogioacchino.delregno@collabora.com>, Matthias Brugger
	<matthias.bgg@gmail.com>
Date: Thu, 6 Oct 2022 19:43:30 +0800
In-Reply-To: <20220928155519.31977-9-matthias.bgg@kernel.org>
References: <20220928155519.31977-1-matthias.bgg@kernel.org>
	 <20220928155519.31977-9-matthias.bgg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_044424_550801_556D29E2 
X-CRM114-Status: GOOD (  16.20  )
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

Hi Matthias Sir,

This addition is for indicating vmax value is increased by dvt_fixed.
Please keep this information to make it be seen. Many thanks.

Sincerely,
Roger Lu.

On Wed, 2022-09-28 at 17:55 +0200, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Values vmax and dvt_fixed are not changed at runtime, set them as needed
> in the svs_banks struct.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> ---
> 
>  drivers/soc/mediatek/mt8192-svs.h     | 4 ++--
>  drivers/soc/mediatek/mtk-svs-mt8192.c | 2 --
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mt8192-svs.h b/drivers/soc/mediatek/mt8192-
> svs.h
> index 6571ebcb2c0f..bf8c6030428f 100644
> --- a/drivers/soc/mediatek/mt8192-svs.h
> +++ b/drivers/soc/mediatek/mt8192-svs.h
> @@ -16,7 +16,7 @@ static struct svs_bank svs_mt8192_banks[] = {
>  		.turn_freq_base		= 688000000,
>  		.volt_step		= 6250,
>  		.volt_base		= 400000,
> -		.vmax			= 0x60,
> +		.vmax			= 0x61,
>  		.vmin			= 0x1a,
>  		.age_config		= 0x555555,
>  		.dc_config		= 0x1,
> @@ -41,7 +41,7 @@ static struct svs_bank svs_mt8192_banks[] = {
>  		.turn_freq_base		= 688000000,
>  		.volt_step		= 6250,
>  		.volt_base		= 400000,
> -		.vmax			= 0x60,
> +		.vmax			= 0x66,
>  		.vmin			= 0x1a,
>  		.age_config		= 0x555555,
>  		.dc_config		= 0x1,
> diff --git a/drivers/soc/mediatek/mtk-svs-mt8192.c b/drivers/soc/mediatek/mtk-
> svs-mt8192.c
> index 838a94834741..183acf2829f0 100644
> --- a/drivers/soc/mediatek/mtk-svs-mt8192.c
> +++ b/drivers/soc/mediatek/mtk-svs-mt8192.c
> @@ -40,8 +40,6 @@ bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
>  			svsb->dcbdet = (svsp->efuse[17] >> 16) & GENMASK(7, 0);
>  			svsb->dcmdet = (svsp->efuse[17] >> 24) & GENMASK(7, 0);
>  		}
> -
> -		svsb->vmax += svsb->dvt_fixed;
>  	}
>  
>  	ret = svs_thermal_efuse_get_data(svsp);


