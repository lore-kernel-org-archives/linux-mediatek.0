Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2074FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 07:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjz0BF+9B4gqq1syqX2R/7TBp+GJ1w3SMZ2/DTSXuqM=; b=hOoGy84avERZJ4
	8zIQ+1pSbCBOJrQ/E7pcSP+Bh6lvUqmX2P2JVWN0rty3asQ7LO8jf/jsdozIsQXF5r4WzliAv/f/D
	swbWdL6ZpqG+xyEjj4nRFEYDh4IGnybPEunAiWlsRCvwCn/5kUJMW5jw8rrX162bhUT1hQaMh6wiM
	3u1K9Pvqt0D/ksRDy2ZqFb++/pypdHNl8XfSq2TSVAoXJIYXEow6+1lo5rEETBvJsxQfZhA22IsT7
	5uzSVg1saDbneTjWcsQSTGl5fXTx+dTfWZWE4c88rjgUQzDQoq1hxwsmg/6ykN/PEcFXeRYJ+JtHA
	mkeL3gy4FhFbdoy7fuLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGyBn-009DPS-Di; Mon, 07 Feb 2022 07:11:55 +0000
Received: from mailgw01.mediatek.com ([66.171.122.165])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGyBc-009DOk-2N; Mon, 07 Feb 2022 07:11:45 +0000
X-UUID: c100c31084284fa19f562eb00929d87a-20220207
X-UUID: c100c31084284fa19f562eb00929d87a-20220207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 787511666; Mon, 07 Feb 2022 00:11:36 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Feb 2022 23:04:53 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 7 Feb 2022 15:04:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Feb 2022 15:04:51 +0800
Message-ID: <777a3344a7edc654548f435cc21dd9d628fe69ea.camel@mediatek.com>
Subject: Re: [PATCH 1/4] mfd: Add support for the MediaTek MT6366 PMIC
From: Johnson Wang <johnson.wang@mediatek.com>
To: <lee.jones@linaro.org>, <robh+dt@kernel.org>, <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 7 Feb 2022 15:04:52 +0800
In-Reply-To: <20220106065407.16036-2-johnson.wang@mediatek.com>
References: <20220106065407.16036-1-johnson.wang@mediatek.com>
 <20220106065407.16036-2-johnson.wang@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_231144_443996_D8330B01 
X-CRM114-Status: GOOD (  19.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Lee,
This patch intends to add MT6366 PMIC support and 
there are some modifications in mfd subsystem.

Could you give us some suggestion for this patch?

Thanks for your support!

BRs,
Johnson Wang 

On Thu, 2022-01-06 at 14:54 +0800, Johnson Wang wrote:
> This adds support for the MediaTek MT6366 PMIC. This is a
> multifunction device with the following sub modules:
> 
> - Regulator
> - RTC
> - Codec
> - Interrupt
> 
> It is interfaced to the host controller using SPI interface
> by a proprietary hardware called PMIC wrapper or pwrap.
> MT6366 MFD is a child device of the pwrap.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>  drivers/mfd/mt6358-irq.c             | 1 +
>  include/linux/mfd/mt6358/registers.h | 7 +++++++
>  include/linux/mfd/mt6397/core.h      | 1 +
>  3 files changed, 9 insertions(+)
> 
> diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
> index 83f3ffbdbb4c..ea5e452510eb 100644
> --- a/drivers/mfd/mt6358-irq.c
> +++ b/drivers/mfd/mt6358-irq.c
> @@ -212,6 +212,7 @@ int mt6358_irq_init(struct mt6397_chip *chip)
>  
>  	switch (chip->chip_id) {
>  	case MT6358_CHIP_ID:
> +	case MT6366_CHIP_ID:
>  		chip->irq_data = &mt6358_irqd;
>  		break;
>  
> diff --git a/include/linux/mfd/mt6358/registers.h
> b/include/linux/mfd/mt6358/registers.h
> index 201139b12140..3d33517f178c 100644
> --- a/include/linux/mfd/mt6358/registers.h
> +++ b/include/linux/mfd/mt6358/registers.h
> @@ -94,6 +94,10 @@
>  #define MT6358_BUCK_VCORE_CON0                0x1488
>  #define MT6358_BUCK_VCORE_DBG0                0x149e
>  #define MT6358_BUCK_VCORE_DBG1                0x14a0
> +#define MT6358_BUCK_VCORE_SSHUB_CON0          0x14a4
> +#define MT6358_BUCK_VCORE_SSHUB_CON1          0x14a6
> +#define
> MT6358_BUCK_VCORE_SSHUB_ELR0          MT6358_BUCK_VCORE_SSHUB_CON1
> +#define MT6358_BUCK_VCORE_SSHUB_DBG1          MT6358_BUCK_VCORE_DBG1
>  #define MT6358_BUCK_VCORE_ELR0                0x14aa
>  #define MT6358_BUCK_VGPU_CON0                 0x1508
>  #define MT6358_BUCK_VGPU_DBG0                 0x151e
> @@ -169,6 +173,9 @@
>  #define MT6358_LDO_VSRAM_OTHERS_CON0          0x1ba6
>  #define MT6358_LDO_VSRAM_OTHERS_DBG0          0x1bc0
>  #define MT6358_LDO_VSRAM_OTHERS_DBG1          0x1bc2
> +#define MT6358_LDO_VSRAM_OTHERS_SSHUB_CON0    0x1bc4
> +#define MT6358_LDO_VSRAM_OTHERS_SSHUB_CON1    0x1bc6
> +#define
> MT6358_LDO_VSRAM_OTHERS_SSHUB_DBG1    MT6358_LDO_VSRAM_OTHERS_DBG1
>  #define MT6358_LDO_VSRAM_GPU_CON0             0x1bc8
>  #define MT6358_LDO_VSRAM_GPU_DBG0             0x1be2
>  #define MT6358_LDO_VSRAM_GPU_DBG1             0x1be4
> diff --git a/include/linux/mfd/mt6397/core.h
> b/include/linux/mfd/mt6397/core.h
> index 56f210eebc54..1cf78726503b 100644
> --- a/include/linux/mfd/mt6397/core.h
> +++ b/include/linux/mfd/mt6397/core.h
> @@ -14,6 +14,7 @@ enum chip_id {
>  	MT6323_CHIP_ID = 0x23,
>  	MT6358_CHIP_ID = 0x58,
>  	MT6359_CHIP_ID = 0x59,
> +	MT6366_CHIP_ID = 0x66,
>  	MT6391_CHIP_ID = 0x91,
>  	MT6397_CHIP_ID = 0x97,
>  };


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
