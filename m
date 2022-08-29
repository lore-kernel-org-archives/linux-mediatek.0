Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C6EECAAA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 17:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aP8hdsX7w+lAko8aJQsw+FTPWreKWJ2EVj6LyJvUNh0=; b=TFzpD40gXr6cO6lfVamtHCUylw
	4Q/Y11ao6Pxwtntc2ATOEdgsBv1CVS/m6JWqEKQi3/882TAYSoFiIfnvrPZ+hbTQAj7PItucSv48K
	RFP4BRLetEqVAgtrchcAahJkNazYgjoJZRrpB1mzRlYepZOnmVPQVUNJkzynK+dr0aPUp64G63hG/
	fVsFTq7NkpgN24epgUCH2UrObuF/cn7B4HfrTTHYXh9lQBCPpiL6qiYi4tSUQN0DEQpAJwisqE412
	FuXAZX4G2VsJkxdKFGLlNFuTGCHjHVnYkN3yg1ajLpRRJexel0KhWpNutoTyXnwJulcL9D/nt02T5
	y80bgBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSiqd-00C63h-Nc; Mon, 29 Aug 2022 17:46:55 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSiqS-00C60e-BX
	for linux-mediatek@lists.infradead.org; Mon, 29 Aug 2022 17:46:45 +0000
Received: by mail-pg1-x52e.google.com with SMTP id q63so8325425pga.9
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Aug 2022 10:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=aP8hdsX7w+lAko8aJQsw+FTPWreKWJ2EVj6LyJvUNh0=;
        b=VwYCcxEf5UykaTaEGbwdLPWk3ws3rUXSTUcxdbBe8d2AqIPcT7lgI7CaGsFQdvNMtB
         jKhpVlfEJ+nJsizNCDaP63n5XPBS0w9V7BMGkPAdAjj0DmzwAb516anjc2665EqDnZQi
         UksP91Twx00G3j5ZThFpWYEcPTr02IX+keje+1Ry63LiK6qREy5wMeY2IOUZcvVMxfkP
         dLUqPy7/RzlcKR1KZUlN8DipmtWLN2zOJumJhpWFg5Hg4AHKNl4MZuvrW+GDFxgiI8Nd
         +Sm0lxCV6DpFzKSMoGs/P/t2FpEB7C7/emCoZSX9S9yce8Jk6eG2aCedJI8MSHbh0bSg
         cU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=aP8hdsX7w+lAko8aJQsw+FTPWreKWJ2EVj6LyJvUNh0=;
        b=t5zqsmUTQQYHNz2dzZc377V9ZSYhsz7M9XOqSbJh0ISw/3rXHMbm6KVFGAymaW/qnn
         pSaeOw3gMul3tfY7QDuWuAMstwlGvlM4343JrkJbZzucp19iTO1GWTDRuElJRBRSOk2D
         OpmhPZTmp4/OAMLmraKFZIal2FLeSR2bfnJd3WMTEvL2fueYGlH60iBLhsdBWbarHaVc
         cdq2OBYzcDbJtxVHi3q/fg3w1EO9vh3XmmIaf0HxTIFLAVZbkTnL4nZce9DWBt2aVZMD
         jU24sm8jvM6xw4+BFhMtrlwO9Lf/MXCDDitg2eWG9hoVUvydN4TVDBlxKQE9fffVwdSL
         8cDg==
X-Gm-Message-State: ACgBeo2eXrJ5LDm1fD1Zsluje535B41FqM0qfNn1Vek9irR80ZRyhCV1
	puX9cLkZ1h1vpXJINztsj1BUaA==
X-Google-Smtp-Source: AA6agR5zgWfQgTrxIOf8Ia3na5HyhsYLWrqsHU9Njtdw1MGbp9RefMUARzblYmeTR6HLM/kev46Weg==
X-Received: by 2002:a63:91c1:0:b0:42b:50f8:774c with SMTP id l184-20020a6391c1000000b0042b50f8774cmr14896896pge.496.1661795202958;
        Mon, 29 Aug 2022 10:46:42 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x9-20020a170902a38900b0016f154c8910sm5644434pla.204.2022.08.29.10.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 10:46:42 -0700 (PDT)
Date: Mon, 29 Aug 2022 11:46:38 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Prashant Malani <pmalani@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	weishunc@google.com
Subject: Re: [PATCH v2 3/9] remoteproc: mediatek: Add SCP core 1 register
 definitions
Message-ID: <20220829174638.GB2264818@p14s>
References: <20220608083553.8697-1-tinghan.shen@mediatek.com>
 <20220608083553.8697-4-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608083553.8697-4-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_104644_467870_05DBD09E 
X-CRM114-Status: GOOD (  14.48  )
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

On Wed, Jun 08, 2022 at 04:35:47PM +0800, Tinghan Shen wrote:
> Add MT8195 SCP core 1 related register definitions.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  drivers/remoteproc/mtk_common.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 73e8adf00de3..5582f4207fbf 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -47,6 +47,7 @@
>  #define MT8192_SCP2SPM_IPC_CLR		0x4094
>  #define MT8192_GIPC_IN_SET		0x4098
>  #define MT8192_HOST_IPC_INT_BIT		BIT(0)
> +#define MT8195_CORE1_HOST_IPC_INT_BIT	BIT(4)
>  
>  #define MT8192_CORE0_SW_RSTN_CLR	0x10000
>  #define MT8192_CORE0_SW_RSTN_SET	0x10004
> @@ -60,6 +61,26 @@
>  
>  #define MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS		GENMASK(7, 4)
>  
> +#define MT8195_CPU1_SRAM_PD			0x1084
> +#define MT8195_SSHUB2APMCU_IPC_SET		0x4088
> +#define MT8195_SSHUB2APMCU_IPC_CLR		0x408C
> +#define MT8195_CORE1_SW_RSTN_CLR		0x20000
> +#define MT8195_CORE1_SW_RSTN_SET		0x20004
> +#define MT8195_CORE1_MEM_ATT_PREDEF		0x20008
> +#define MT8195_CORE1_WDT_IRQ			0x20030
> +#define MT8195_CORE1_WDT_CFG			0x20034
> +
> +#define MT8195_SEC_CTRL				0x85000
> +#define MT8195_CORE_OFFSET_ENABLE_D		BIT(13)
> +#define MT8195_CORE_OFFSET_ENABLE_I		BIT(12)
> +#define MT8195_L2TCM_OFFSET_RANGE_0_LOW		0x850b0
> +#define MT8195_L2TCM_OFFSET_RANGE_0_HIGH	0x850b4
> +#define MT8195_L2TCM_OFFSET			0x850d0
> +#define SCP_SRAM_REMAP_LOW			0
> +#define SCP_SRAM_REMAP_HIGH			1
> +#define SCP_SRAM_REMAP_OFFSET			2
> +#define SCP_SRAM_REMAP_SIZE			3
> +
>  #define SCP_FW_VER_LEN			32
>  #define SCP_SHARE_BUFFER_SIZE		288

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  
> -- 
> 2.18.0
> 

