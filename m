Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5E0C77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znt0aWAGbZ2cEMuIGsMFVmr5B4zvykH1K8cbHmpYw3c=; b=NQwe8J/cC+4nDLoFXFlXTBDw/7
	iM68WdD2dKxaJxj5vtoPEXcx5ZP4HJMgZJ8kvdjCL+CEcIZrb5Yb6oZh+0NFT8/PkHin/RzQTTENR
	di9UF5ytba/+W4oCtrGcreUW9eCXyDBrHfpmTsteL8MAWf9s58+k/qnw7tUrRjJNoPxAFfPt3zryU
	4lwefLZWF48CLbeB+qqXhR3z+4sloi4e9t4ec8DXLnVg4tG7KQEbTQEkKIge3YK3xilR9wyzDX6jx
	K8RqoNqmmvzH5TnjxMa9pqwx1tDgZJ1SXu85mYJk8bZ47xZvbldD89AKOyJi32pgCICs9X9aFgw9e
	CDxE5G5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsxE-005Wzc-25;
	Thu, 13 Apr 2023 09:09:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsxC-005WvC-2b;
	Thu, 13 Apr 2023 09:09:20 +0000
Received: by mail-wr1-x435.google.com with SMTP id l18so13418767wrb.9;
        Thu, 13 Apr 2023 02:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681376951; x=1683968951;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=znt0aWAGbZ2cEMuIGsMFVmr5B4zvykH1K8cbHmpYw3c=;
        b=oT2GSp5inUWHvaFcb5vzUMQY5IyfZpf8HJPlNqPRh86GaPAqAqjVsvyj7iXjYcBf9H
         vuYf4FYZHdECKA/D5frVJFIJ7ZsbOcMTzwyjh8ohd9Gu9cCEgZLmFMynfTjYpytniGux
         JnOhmh9kGDEMJYlJrcT4WbP1Is/apfmclUTqn0f0O/5f/F++ituguozUBvBoWq8rg+qK
         dRcWgY4iJ88jGCwNdfzZoGQgCzkr+fV5iayBfjREwAH9HKYSb6j/fX0xOiGsw2w159CB
         zXILUPMdcpENefj0fabn0vzb8gLlLRchXQi6Q5g5mKEaWQIBnnnBmm8Lr4QdJE6qTYDn
         oKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681376951; x=1683968951;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=znt0aWAGbZ2cEMuIGsMFVmr5B4zvykH1K8cbHmpYw3c=;
        b=Mp/PGGYRvzIrhzNTekbdJ+IzrvmNfYO48kRl4DEpZkwr+rgFyVXIsaUPwRQnAj7EuB
         LdE/LP/dxJ6JKsh2XAd/OlJNAI7qDvnGsPisWzRmAeEj9trGVjepoIHJhNjTvbZVZk/o
         REg65+c5B3e+2DzAOVdVYVcfRyTluHkPCMfB9Lu4xVhK5s+PDNFJ/Ee2kEJrCNmUOV8d
         /iZ42eiGIvRvXk/aXXQspdU35tw9Q+NQGpijlg70iL7PZZomZLXiDVY175vEBxFe3OvW
         IC/U5zO1DZUIqeaDi3M8lNyc5HijdAOI+3ACWbaGuFKaet7tP967dQZZVAzcQOupJbqB
         HIfg==
X-Gm-Message-State: AAQBX9cMAc1NyVSG3k+3AJMVRAungPvrwZ4Ldv5kInuiduPEXFYEJNIH
	7A84FAglnPh/4gj0DyNIwHg=
X-Google-Smtp-Source: AKy350a9Jsb9eHUuXMFUQ8nkCXFBCQ0OfR4SBVZ0IW9wf1SOpkikmocwd4Zx2WVKOnXSNJgkEI21/w==
X-Received: by 2002:adf:ebd2:0:b0:2cf:e710:a4b9 with SMTP id v18-20020adfebd2000000b002cfe710a4b9mr982347wrn.32.1681376950951;
        Thu, 13 Apr 2023 02:09:10 -0700 (PDT)
Received: from [192.168.0.32] ([37.222.243.26])
        by smtp.gmail.com with ESMTPSA id m14-20020a056000008e00b002c71b4d476asm812342wrx.106.2023.04.13.02.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 02:09:09 -0700 (PDT)
Message-ID: <015f4c60-ed77-9e1f-8a6b-cda6e4f6ac93@gmail.com>
Date: Thu, 13 Apr 2023 11:09:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] drm/mediatek: dsi: Add dsi cmdq_ctl to send panel
 initial code
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jitao.shi@mediatek.com,
 shuijing.li@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1681366162-4949-1-git-send-email-xinlei.lee@mediatek.com>
 <1681366162-4949-4-git-send-email-xinlei.lee@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1681366162-4949-4-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_020918_863714_068A5168 
X-CRM114-Status: GOOD (  17.90  )
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



On 13/04/2023 08:09, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> For mt8188, add dsi cmdq reg control to send long packets to panel initialization.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 500a3054282d..cbfe5df4647c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -86,6 +86,7 @@
>   
>   #define DSI_CMDQ_SIZE		0x60
>   #define CMDQ_SIZE			0x3f
> +#define CMDQ_SIZE_SEL			BIT(15)
>   
>   #define DSI_HSTX_CKL_WC		0x64
>   
> @@ -178,6 +179,7 @@ struct mtk_dsi_driver_data {
>   	const u32 reg_cmdq_off;
>   	bool has_shadow_ctl;
>   	bool has_size_ctl;
> +	bool cmdq_long_packet_ctl;
>   };
>   
>   struct mtk_dsi {
> @@ -965,6 +967,11 @@ static u32 mtk_dsi_recv_cnt(u8 type, u8 *read_data)
>   	return 0;
>   }
>   
> +static void mtk_dsi_cmd_packet_ctl(struct mtk_dsi *dsi)
> +{
> +	mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE_SEL, CMDQ_SIZE_SEL);
> +}
> +
>   static void mtk_dsi_cmdq(struct mtk_dsi *dsi, const struct mipi_dsi_msg *msg)
>   {
>   	const char *tx_buf = msg->tx_buf;
> @@ -996,6 +1003,8 @@ static void mtk_dsi_cmdq(struct mtk_dsi *dsi, const struct mipi_dsi_msg *msg)
>   
>   	mtk_dsi_mask(dsi, reg_cmdq_off, cmdq_mask, reg_val);
>   	mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE, cmdq_size);
> +	if (dsi->driver_data->cmdq_long_packet_ctl)
> +		mtk_dsi_cmd_packet_ctl(dsi);

Why don't you put the onliner
mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE_SEL, CMDQ_SIZE_SEL);
directly here. Please help me understand why adding another indirection is 
usefull here.

Best regards,
Matthias

>   }
>   
>   static ssize_t mtk_dsi_host_send_cmd(struct mtk_dsi *dsi,
> @@ -1200,18 +1209,21 @@ static const struct mtk_dsi_driver_data mt8183_dsi_driver_data = {
>   	.reg_cmdq_off = 0x200,
>   	.has_shadow_ctl = true,
>   	.has_size_ctl = true,
> +	.cmdq_long_packet_ctl = false,
>   };
>   
>   static const struct mtk_dsi_driver_data mt8186_dsi_driver_data = {
>   	.reg_cmdq_off = 0xd00,
>   	.has_shadow_ctl = true,
>   	.has_size_ctl = true,
> +	.cmdq_long_packet_ctl = false,
>   };
>   
>   static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
>   	.reg_cmdq_off = 0xd00,
>   	.has_shadow_ctl = true,
>   	.has_size_ctl = true,
> +	.cmdq_long_packet_ctl = true,
>   };
>   
>   static const struct of_device_id mtk_dsi_of_match[] = {

