Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32DBC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 12:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCYrvoWsOxgzyLtw5kynOM8JulGKIjkO96LtzI0JuvU=; b=f94kMys2PtJLXdmS9JmFzGTvLl
	wO2gNTdN2NSvhYU8JF5BwcRg9Hji+ZCm7Oc1wPwakRiqinN62DhX+VBGteaOpRQJtvvHqDzCDh/rR
	jq9WtMyDd6Z1Tc92MAUOFupVQ8QXc6dB+Qd44EDn5n3772KyTooVby/G1nE8H4/8HwT7fmbU+I92c
	5+6bw1dBEDcTQMK/+pIrgL4+u4O5+YIBy/Zhu18z3VOsG1OY+iikoEdeFLbXf8V9THc9lfem1JYz+
	lBnJryZT1QPFFhBP/GkUSHwC+LQF3clvV8SDmSSg0f2woZs46gwiQ/MfvRjwiNPzWrPTb8jDzvsbn
	uW4lWorQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofhBi-009e8X-Nx; Tue, 04 Oct 2022 12:38:18 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofhBX-009e6P-PI; Tue, 04 Oct 2022 12:38:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 06B0B66022A9;
	Tue,  4 Oct 2022 13:38:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664887085;
	bh=5x9yLkue2W3jRxXgF0gPfjI2e+qXfSGyi8ojRWrUU8s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bZPXHDcNzwpEc/sCsMhKAg1zLxlf5oF4zjArz11kcx+KosiDap2YAD/3O3dI+PIIU
	 fTGC68dFoUQvIRBZWe/sGRACbSNke+OknD3T+VERboXfSiHAcSLr9pcKgunMLrP4Ei
	 8sfeu9FxoRCsQlTulHz7Mhg5zBJLQhzPummHmD8qSdAUcW5w68CDD0zbIM72LZxX1K
	 LOw9P7Bd90oA3/2H7163Kw8KN+ZLvZ6ye2Qq0vifTpouZSaOPKfHBtaJh9jHFVOhrv
	 IdYCI04CW3+/3MEVo1WoqxS35bou2JKez5S3RVZs6JtbscQdj2jso+RRjVg6vGRO9Y
	 YkAVtvVyZY4KA==
Message-ID: <42ab09ef-427d-f2dd-c480-f3e11f4aaa79@collabora.com>
Date: Tue, 4 Oct 2022 14:38:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v1 5/6] soc: mediatek: mutex: Add mtk_mutex_set_mod
 support to set MOD1
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
References: <20221004093319.5069-1-moudy.ho@mediatek.com>
 <20221004093319.5069-6-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221004093319.5069-6-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_053807_984385_664BA0F2 
X-CRM114-Status: GOOD (  18.28  )
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

Il 04/10/22 11:33, Moudy Ho ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add mtk_mutex_set_mod support to set MOD1
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-mutex.c | 27 +++++++++++++++++++--------
>   1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index c1a33d52038e..5dcbd61fe42c 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -23,6 +23,7 @@
>   #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
>   #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 * (n))
>   #define DISP_REG_MUTEX_MOD(mutex_mod_reg, n)	(mutex_mod_reg + 0x20 * (n))
> +#define DISP_REG_MUTEX_MOD1(mutex_mod_reg, n)	((mutex_mod_reg) + 0x20 * (n) + 0x4)
>   #define DISP_REG_MUTEX_SOF(mutex_sof_reg, n)	(mutex_sof_reg + 0x20 * (n))
>   #define DISP_REG_MUTEX_MOD2(n)			(0x34 + 0x20 * (n))
>   
> @@ -750,14 +751,24 @@ int mtk_mutex_write_mod(struct mtk_mutex *mutex,
>   		return -EINVAL;
>   	}
>   
> -	offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
> -				    mutex->id);
> -	reg = readl_relaxed(mtx->regs + offset);
> -
> -	if (clear)
> -		reg &= ~BIT(mtx->data->mutex_table_mod[idx]);
> -	else
> -		reg |= BIT(mtx->data->mutex_table_mod[idx]);
> +	if (mtx->data->mutex_table_mod[idx] < 32) {

What if we do...

	u8 id_offset = 0;

	/*
	 * Some SoCs may have multiple MUTEX_MOD registers as more than 32 mods
	 * are present, hence requiring multiple 32-bits registers.
	 *
	 * The mutex_table_mod fully represents that by defining the number of
	 * the mod sequentially, later used as a bit number, which can be more
	 * than 0..31.
	 *
	 * In order to retain compatibility with older SoCs, we perform R/W on
	 * the single 32 bits registers, but this requires us to translate the
	 * mutex ID bit accordingly.
	 */
	if (mtx->data->mutex_table_mod[idx] < 32) {
		reg_offset = DISP_REG_MUTEX_MOD0(mtx->data->mutex_mod_reg,
						 mutex->id);
	} else {
		reg_offset = DISP_REG_MUTEX_MOD1(mtx->data->mutex_mod_reg,
						 mutex->id);
		id_offset = 32;
	}

	reg = readl_relaxed(mtx->regs + offset);
	if (clear)
		reg &= ~BIT(mtx->data->mutex_table_mod[idx] - id_offset);
	else
		reg |= BIT(mtx->data->mutex_table_mod[idx] - id_offset);

	writel_relaxed(reg, mtx->regs + offset);

...like this, we give good documentation and also keep the code "short" :-)

Regards,
Angelo


> +		offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
> +					    mutex->id);
> +		reg = readl_relaxed(mtx->regs + offset);
> +		if (clear)
> +			reg &= ~BIT(mtx->data->mutex_table_mod[idx]);
> +		else
> +			reg |= BIT(mtx->data->mutex_table_mod[idx]);
> +
> +	} else {
> +		offset = DISP_REG_MUTEX_MOD1(mtx->data->mutex_mod_reg,
> +					     mutex->id);
> +		reg = readl_relaxed(mtx->regs + offset);
> +		if (clear)
> +			reg &= ~BIT(mtx->data->mutex_table_mod[idx] - 32);
> +		else
> +			reg |= BIT(mtx->data->mutex_table_mod[idx] - 32);
> +	}
>   
>   	writel_relaxed(reg, mtx->regs + offset);
>   



