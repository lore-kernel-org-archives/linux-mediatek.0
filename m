Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB19C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 09:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5GfRAC++Nq+Hk+gymVcoIAzoxXXUtPeA5H5zIT8yG0=; b=Rb92UXjxm9nY0t
	RR/JKlrVKBXFhRIepDejNPYqjDySqvwGqmU4TXy2g30v65mGr+BD7LKWlMRZQ+yJYUhFQ1n3/khjy
	KwXw1Ss1r3+1+ptQz9QZRKtk/0i+X4AkL94gf8GjYWNPshPxpA9DXKHpRDcl4kDUnlCn4BArPrSNY
	bKRAYPI0OUMiTo9XukabasCnGXRqBVC/Yw/Z2Jf//U1aPS7Zs2fg94ceUW9OvPbA+G/3X+0FYnyW0
	ImnLEuqlQYpSbBxMAVK5/VIOilml+CG5HglMKBJA8ocWb+wWVYYFARWC4QNCPKXg5OH/D6HubsEwA
	IxCQpQU7mUaz9TCOnwpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmBcJ-00A28j-IM; Wed, 04 May 2022 09:48:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmBOm-009uk3-CD; Wed, 04 May 2022 09:34:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2CAAF1F4473A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651656858;
 bh=VSz/LLsmEm1Js0cfKn+Hmm9ubakkhyVvI6T42wiqQyk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PlOwHCc+CFruh7L8UWYeg6XK6tzGsIY3A2394VHvH8aGKIVw+zd8ST1yVt4m+INrb
 1s2k2q32Gv5bC+41o+SmWhFiphpzbJ5yQeajgxwHooH6zkckIfkifHf+w5AiGDMPl0
 kvWZ/JneQLrziWClXJmWNeiaRwTHVMxFAl979XZzVmor5c1E3dIP3XMqRbhxJnys5D
 jU3dtS3ImUuZ+T3SUIxjalgdj5OGQqtW0p6BlQSIsAkxPaIYRuZllU0A9Bm9ffb1ks
 ewmt7ax2IyoGLZzG1KddFzEgFs3BA1Quzi3aVXfLG6uDsHnxXTEDEXzqTVeIKzBMRW
 jM+1TX3J5eQ+A==
Message-ID: <3bd77be6-82ea-8c24-242a-0ee486ce888c@collabora.com>
Date: Wed, 4 May 2022 11:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] soc: mediatek: devapc: Add support for MT8186
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: neal.liu@mediatek.com, runyang.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220429065429.7957-1-rex-bc.chen@mediatek.com>
 <20220429065429.7957-3-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220429065429.7957-3-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_023420_617230_AFF5DD7E 
X-CRM114-Status: GOOD (  14.51  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 29/04/22 08:54, Rex-BC Chen ha scritto:
> Add devapc data and compatible to support MT8186 devapc.
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-devapc.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
> index 7c65ad3d1f8a..762e0e4d967d 100644
> --- a/drivers/soc/mediatek/mtk-devapc.c
> +++ b/drivers/soc/mediatek/mtk-devapc.c
> @@ -227,10 +227,25 @@ static const struct mtk_devapc_data devapc_mt6779 = {
>   	.vio_shift_con_offset = 0xF20,
>   };
>   
> +static const struct mtk_devapc_data devapc_mt8186 = {
> +	.vio_idx_num = 519,
> +	.vio_mask_offset = 0x0,
> +	.vio_sta_offset = 0x400,
> +	.vio_dbg0_offset = 0x900,
> +	.vio_dbg1_offset = 0x904,
> +	.apc_con_offset = 0xF00,
> +	.vio_shift_sta_offset = 0xF10,
> +	.vio_shift_sel_offset = 0xF14,
> +	.vio_shift_con_offset = 0xF20,
> +};

Hello Rex,
since the register layout is common across a lot of MediaTek SoCs and basically
only the vio_idx_num wildly varies between them, can you separate this parameter
from the mtk_devapc_data struct?

I propose the following:

struct mtk_devapc_regs {
	/* reg offset */
	u32 vio_mask_offset;
	u32 ... etc
};

struct mtk_devapc_data {
	u32 vio_idx_num;
	const struct mtk_devapc_regs *regs;
};

static const struct mtk_devapc_regs devapc_regs_mt6779 = {
	.vio_mask_offset = 0x0,
	.vio...etc
};

static const struct mtk_devapc_data devapc_mt6779 = {
	.vio_idx_num = 511,
	.regs = devapc_regs_mt6779,
};

static const struct mtk_devapc_data devapc_mt8186 = {
	.vio_idx_num = 519,
	.regs = devapc_regs_mt6779,
};

Regards,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
