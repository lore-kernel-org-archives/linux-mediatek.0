Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D5CC07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 16:05:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3252B61374
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 16:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3252B61374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8ufgxoQKD9Uae3NNx2vl1tjKCLdEEjwOLsEUz0c9j5k=; b=VJTE373dFsncLcyUl9fTF+0Vrn
	XtFeB3vNffFSEJUYiuPTrkFN4siqf2vO8JVn8JfOBhr1DknNuvYYBaMujKvn1u+UqAwS1LZPLm+6L
	fB9tPdsRfSkUKHqA5dp6r82W8tYkmLs5vAIpmzNx+buHGcVUJBdoFKsD6Om+knUUryUvN0XI42G54
	/TYZtH8s0uvZ5444MyGTeFBQpM+VMv8ChPoVPy+fRtTRhw5zsB3R4UkYvMB3CWDgEu7DsBT2iS0w4
	hl9injy4nvmzTeBOJEVqtj/XNVn5Ti3sc/UG7aArDSERYQRB6kJpegeckJQ2wdJPIq7xXN1bGdSsK
	rlnLJ3Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3hNa-00E27N-43; Wed, 14 Jul 2021 16:04:58 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3hNX-00E26q-NJ; Wed, 14 Jul 2021 16:04:57 +0000
Received: by mail-wr1-x42b.google.com with SMTP id a13so3837990wrf.10;
 Wed, 14 Jul 2021 09:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KeoHpRgYUTJ0S5+Hv5ew+oefqraw0KaZeuZmCofRk54=;
 b=txAceZx/B7qal36RxAdz+Glxy+07f7XoLNjmkEaANwvBt+VapKxDrHktJcgt7JWJ3Q
 YDPjTdw2zh+eqz3WUcwST1A6+1mHeN3wC6AYIRolotq29Rfe14eY/wg9rlPGkIcxNi77
 +xvLLBqpFZPjs0zdh1A3Q9DmtJzchgVOHQMpifFzqXqq+UFbKrmZEPuQA5hbVnWYm3I4
 du7uw5iwRC8MczfazKNG0T7fLgXWiXi/P+sxWer6i9qL8hiGNTjJMJYE3raI8/IqvQnE
 j2KSUy/OJAYewZx2BlrCFWJHe9WjDI1HS22TLhCPDmjv8B9X1xR46cTdTkTYruFUhEAo
 0uMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KeoHpRgYUTJ0S5+Hv5ew+oefqraw0KaZeuZmCofRk54=;
 b=ZnPxho7/20yQ+ZYstt38b+8nyyK6Bjg6+1rWOp0NBkdT1Y+yIJs7hC61EwykbjPke5
 fc7s4l9CeMEjySC2ab88ZMWLfbY7u4OPBnzy0UJVUZJWPC97rF91x8gWrYr0CwaR/sXd
 PTly5llevPBEvj5WR/STDVxwyHVctLCOWjodIND5QCl5lm2O5ZzsERxUs9kjPPJqJhRT
 mGAo/3mxJd4JBURsGhHAcFoaIdMqWFWcRpkBzEjhDHpg9q2CExuk5XDRqr0c2xmlWW3n
 /gb0Vs7HazK9FIa73rd5Dj8vjZHxatZAebRSz2sm3EkqvER9YJPHHReZ4ghHEZmOSLdc
 ggXw==
X-Gm-Message-State: AOAM531GoZmduUiIZ//3DWSN7zej6a1pbxR2hQ5qpLPbQ1K2+dkZRgiO
 /snLf9y3ckoFlGweYcD+cgE=
X-Google-Smtp-Source: ABdhPJyl8djWloOoHKBbA9OsBIuhFO8YaWtV729KyXlkdLVyqBsQ4pgctjCZ4I7Q3T/YB2CHUdxqNA==
X-Received: by 2002:adf:ee4f:: with SMTP id w15mr14233461wro.311.1626278692971; 
 Wed, 14 Jul 2021 09:04:52 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id r9sm2315778wmq.25.2021.07.14.09.04.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 09:04:51 -0700 (PDT)
Subject: Re: [PATCH v2 6/9] soc: mediatek: add mtk-mutex support for mt8195
 vdosys0
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>, chunkuang.hu@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fshao@google.com,
 nancy.lin@mediatek.com, singo.chang@mediatek.com
References: <20210710113819.5170-1-jason-jh.lin@mediatek.com>
 <20210710113819.5170-7-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <aa0a598d-574f-427a-b9b9-a24364202779@gmail.com>
Date: Wed, 14 Jul 2021 18:04:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210710113819.5170-7-jason-jh.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_090455_835660_615DDAE7 
X-CRM114-Status: GOOD (  15.55  )
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



On 10/07/2021 13:38, jason-jh.lin wrote:
> Add mtk-mutex support for mt8195 vdosys0.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c | 107 +++++++++++++++++++++++++++++--
>  1 file changed, 102 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 2e4bcc300576..d74eb3f97f1d 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -17,6 +17,9 @@
>  #define MT8183_MUTEX0_MOD0			0x30
>  #define MT8183_MUTEX0_SOF0			0x2c
>  
> +#define MT8195_DISP_MUTEX0_MOD0			0x30
> +#define MT8195_DISP_MUTEX0_SOF			0x2c
> +
>  #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
>  #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
>  #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 * (n))
> @@ -67,6 +70,36 @@
>  #define MT8173_MUTEX_MOD_DISP_PWM1		24
>  #define MT8173_MUTEX_MOD_DISP_OD		25
>  
> +#define MT8195_MUTEX_MOD_DISP_OVL0		0
> +#define MT8195_MUTEX_MOD_DISP_WDMA0		1
> +#define MT8195_MUTEX_MOD_DISP_RDMA0		2
> +#define MT8195_MUTEX_MOD_DISP_COLOR0		3
> +#define MT8195_MUTEX_MOD_DISP_CCORR0		4
> +#define MT8195_MUTEX_MOD_DISP_AAL0		5
> +#define MT8195_MUTEX_MOD_DISP_GAMMA0		6
> +#define MT8195_MUTEX_MOD_DISP_DITHER0		7
> +#define MT8195_MUTEX_MOD_DISP_DSI0		8
> +#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0	9
> +#define MT8195_MUTEX_MOD_DISP_OVL1		10
> +#define MT8195_MUTEX_MOD_DISP_WDMA1		11
> +#define MT8195_MUTEX_MOD_DISP_RDMA1		12
> +#define MT8195_MUTEX_MOD_DISP_COLOR1		13
> +#define MT8195_MUTEX_MOD_DISP_CCORR1		14
> +#define MT8195_MUTEX_MOD_DISP_AAL1		15
> +#define MT8195_MUTEX_MOD_DISP_GAMMA1		16
> +#define MT8195_MUTEX_MOD_DISP_DITHER1		17
> +#define MT8195_MUTEX_MOD_DISP_DSI1		18
> +#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE1	19
> +#define MT8195_MUTEX_MOD_DISP_VPP_MERGE		20
> +#define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
> +#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY0	22
> +#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY1	23
> +#define MT8195_MUTEX_MOD_DISP_VDO1_DL_RELAY2	24
> +#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY3	25
> +#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY4	26
> +#define MT8195_MUTEX_MOD_DISP_PWM0		27
> +#define MT8195_MUTEX_MOD_DISP_PWM1		28
> +
>  #define MT2712_MUTEX_MOD_DISP_PWM2		10
>  #define MT2712_MUTEX_MOD_DISP_OVL0		11
>  #define MT2712_MUTEX_MOD_DISP_OVL1		12
> @@ -101,11 +134,36 @@
>  #define MT2712_MUTEX_SOF_DSI3			6
>  #define MT8167_MUTEX_SOF_DPI0			2
>  #define MT8167_MUTEX_SOF_DPI1			3
> +
>  #define MT8183_MUTEX_SOF_DSI0			1
>  #define MT8183_MUTEX_SOF_DPI0			2
>  
> -#define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
> -#define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
> +#define MT8183_MUTEX_EOF_CONVERT(sof)	((sof) << 6)
> +#define MT8183_MUTEX_EOF_DSI0 \
> +	MT8183_MUTEX_EOF_CONVERT(MT8183_MUTEX_SOF_DSI0)
> +#define MT8183_MUTEX_EOF_DPI0 \
> +	MT8183_MUTEX_EOF_CONVERT(MT8183_MUTEX_SOF_DPI0)

Not needed here, please drop.

> +
> +#define MT8195_MUTEX_SOF_DSI0			1
> +#define MT8195_MUTEX_SOF_DSI1			2
> +#define MT8195_MUTEX_SOF_DP_INTF0		3
> +#define MT8195_MUTEX_SOF_DP_INTF1		4
> +#define MT8195_MUTEX_SOF_DPI0			6 /* for HDMI_TX */
> +#define MT8195_MUTEX_SOF_DPI1			5 /* for digital video out */
> +
> +#define MT8195_MUTEX_EOF_CONVERT(sof)	((sof) << 7)

Same here.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
