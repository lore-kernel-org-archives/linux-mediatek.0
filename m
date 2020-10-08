Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469F9C04EBE
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 10:22:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3D992076B
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 10:22:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q30VZ5MI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmFr6sTX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3D992076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DK4dNhNK1+m4vzvDXeKx1QFRMhuzNAZDHYRgSybFunk=; b=Q30VZ5MIhJxBdTsSETy/akThb
	KcWp0daO+iqMBBFUcHkcZHN30BKt5luxjWoYtTkrPMdHPGL7kLziioyL79A5+H7r3Mfmp41htvKPs
	7hqUzr4WONX602gxVhhXb+EcDQDUSoLmXHEdw95cv1IpVregDaDrt79Cs40q1Jlo8rPsOQFYaac1h
	hrCqI86UP6WSSFNdAnxo8G2QK7T0URK9Vl2CYj24d/v35bcjwZHK+MLdzE0hFMVMEhsjgOhge5ZrO
	gY/5FGrxGW9u+evUfdsp8t7Q9J4s+Otw0nDmhNBQ85lCEKBlfeJc6JByVMxXJ8bY1iTZOCuQAGQsS
	VB/X27w1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQT42-0001Gb-9z; Thu, 08 Oct 2020 10:22:22 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQT3s-0001Ae-6N; Thu, 08 Oct 2020 10:22:15 +0000
Received: by mail-wm1-x344.google.com with SMTP id p15so5861065wmi.4;
 Thu, 08 Oct 2020 03:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PGW5oeVZP/af2ziIlDNjpISwVNl6zTO7hR84R4sef4A=;
 b=MmFr6sTXWoJzXvrOwKpcT2k/GYvT3wrE/fomOahor0+EAWArTSYwvimTF3XUMfA2zI
 FJW7rh5fVQlXDol26auNgnLGAPTN7qK+pVhj+5DJmUofWoNmZAymhNwYERrQHN2j3wFl
 taYzRyt2M0XjA/6p50XfxH6uDUzxaJ90GQ2X4MpNh2ssNp9urX1iYh0Zhi1MpCHViEfd
 vCy09aqfImu5995d/YzQVrKuj7zQ0HKBpXq5H1heTyYuMp9xc5mjBqYw6DhM/PV0k5l1
 fwIsMMSkExytqn8EUMVE4NzpCOhisXh7eq7qF6qFh0nj4SeymUiedq+LbrbXT42lQbXi
 Qovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PGW5oeVZP/af2ziIlDNjpISwVNl6zTO7hR84R4sef4A=;
 b=BEo7a6GT6UEAqyqv7bzgFXuKnsEHnTxf0l+BOmT5W5KdCkex0jBMXr/WNWqQVyAl6G
 m3N7Ga6Qt4WoKGMIXYchEgTG+YPnRySeVWl2qoruYArt755OAc8CBbJ//msWH2AkqhSk
 brlXcCcGTi7IkJukPVjSNyb1CBOgbU7X4UIjRez1ulJHqHHS1d+YpX4EgIt+Vz5XgYBV
 IMm2RqAYnlY8YoG4MdpsHsg/5gZ6gRiLe7ZCMsSdC9imlJgPbrpCiwbbN/fyPTuu/2Ul
 N4/9LMKpztu8L9U5Y894j5npdM/d22ftXGvkj8n9dseTTNP08WAFw5WWFGu59lkQHEBO
 kmAA==
X-Gm-Message-State: AOAM530T5fPhKMlFpCz9guOU7lMhhAoAOJZhLwWstyCqG9IHk57qsTNi
 fUE6gLF2Ncx5sO4/OVZu0+jBFy8pM2PZpg==
X-Google-Smtp-Source: ABdhPJwJ9O53cRL/S7vAOal3u/j4HrAchxskcr1nML0xtsTghpu7glfptBACuBJg+YKca+jELfQ5Sg==
X-Received: by 2002:a1c:2394:: with SMTP id j142mr7652808wmj.3.1602152530099; 
 Thu, 08 Oct 2020 03:22:10 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id s11sm2022055wrm.56.2020.10.08.03.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 03:22:09 -0700 (PDT)
Subject: Re: [PATCH 4/4] soc: mediatek: mmsys: Use an array for setting the
 routing registers
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20201006193320.405529-1-enric.balletbo@collabora.com>
 <20201006193320.405529-5-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <474b10a5-123b-d3cb-e846-1d504ad3e8fd@gmail.com>
Date: Thu, 8 Oct 2020 12:22:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201006193320.405529-5-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_062212_331547_B7BCF039 
X-CRM114-Status: GOOD (  30.87  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: chunkuang.hu@kernel.org, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, CK Hu <ck.hu@mediatek.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Enric and CK,

On 06/10/2020 21:33, Enric Balletbo i Serra wrote:
> From: CK Hu <ck.hu@mediatek.com>
> 
> Actually, setting the registers for routing, use multiple 'if-else' for different
> routes, but this code would be more and more complicated while we
> support more and more SoCs. Change that and use a table per SoC so the
> code will be more portable and clear.
> 

I'd like to have some clarifications on this patch. Now we use one big if-else 
structure to decide which value and address we need. As this values work for a 
large set of SoCs I suppose the hardware block is the same.

When we add new HW like mt8183, mt8192 or mt6779 we will need different values. 
But my question is, if the HW between theses new platforms will be different 
(read values change for every SoC). Or will it be the same HW block for all 
these SoCs so that we could add three new functions ddp_mout_en, ddp_sout_sel 
and ddp_sel_in.

Why I'm asking? Because right now it seems like double the work we have to do 
for every SoC. We will need to define the components in the DRM driver and then 
we need to add the values for the routing.

More comments below.

> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
>   drivers/soc/mediatek/mtk-mmsys.c | 393 +++++++++++++++++--------------
>   1 file changed, 210 insertions(+), 183 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index da2de8f6969e..f00d6d08c9c5 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -42,39 +42,61 @@
>   #define RDMA0_SOUT_DSI1				0x1
>   #define RDMA0_SOUT_DSI2				0x4
>   #define RDMA0_SOUT_DSI3				0x5
> +#define RDMA0_SOUT_MASK				0x7
>   #define RDMA1_SOUT_DPI0				0x2
>   #define RDMA1_SOUT_DPI1				0x3
>   #define RDMA1_SOUT_DSI1				0x1
>   #define RDMA1_SOUT_DSI2				0x4
>   #define RDMA1_SOUT_DSI3				0x5
> +#define RDMA1_SOUT_MASK				0x7
>   #define RDMA2_SOUT_DPI0				0x2
>   #define RDMA2_SOUT_DPI1				0x3
>   #define RDMA2_SOUT_DSI1				0x1
>   #define RDMA2_SOUT_DSI2				0x4
>   #define RDMA2_SOUT_DSI3				0x5
> +#define RDMA2_SOUT_MASK				0x7
>   #define DPI0_SEL_IN_RDMA1			0x1
>   #define DPI0_SEL_IN_RDMA2			0x3
> +#define DPI0_SEL_IN_MASK			0x3
>   #define DPI1_SEL_IN_RDMA1			(0x1 << 8)
>   #define DPI1_SEL_IN_RDMA2			(0x3 << 8)
> +#define DPI1_SEL_IN_MASK			(0x3 << 8)
>   #define DSI0_SEL_IN_RDMA1			0x1
>   #define DSI0_SEL_IN_RDMA2			0x4
> +#define DSI0_SEL_IN_MASK			0x7
>   #define DSI1_SEL_IN_RDMA1			0x1
>   #define DSI1_SEL_IN_RDMA2			0x4
> +#define DSI1_SEL_IN_MASK			0x7
>   #define DSI2_SEL_IN_RDMA1			(0x1 << 16)
>   #define DSI2_SEL_IN_RDMA2			(0x4 << 16)
> +#define DSI2_SEL_IN_MASK			(0x7 << 16)
>   #define DSI3_SEL_IN_RDMA1			(0x1 << 16)
>   #define DSI3_SEL_IN_RDMA2			(0x4 << 16)
> +#define DSI3_SEL_IN_MASK			(0x7 << 16)
>   #define COLOR1_SEL_IN_OVL1			0x1
>   
>   #define OVL_MOUT_EN_RDMA			0x1
>   #define BLS_TO_DSI_RDMA1_TO_DPI1		0x8
>   #define BLS_TO_DPI_RDMA1_TO_DSI			0x2
> +#define BLS_RDMA1_DSI_DPI_MASK			0xf
>   #define DSI_SEL_IN_BLS				0x0
>   #define DPI_SEL_IN_BLS				0x0
> +#define DPI_SEL_IN_MASK				0x1
>   #define DSI_SEL_IN_RDMA				0x1
> +#define DSI_SEL_IN_MASK				0x1
> +
> +struct mtk_mmsys_routes {
> +	u32 from_comp;
> +	u32 to_comp;
> +	u32 addr;
> +	u32 mask;

We didn't need the mask up to now, if needed in the future, we should add it 
when needed. This will make the code cleaner for now.

> +	u32 val;
> +};
>   
>   struct mtk_mmsys_driver_data {
>   	const char *clk_driver;
> +	const struct mtk_mmsys_routes *routes;
> +	const unsigned int num_routes;
>   };
>   
>   static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
> @@ -93,10 +115,6 @@ static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
>   	.clk_driver = "clk-mt6797-mm",
>   };
>   
> -static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
> -	.clk_driver = "clk-mt8173-mm",
> -};
> -
>   static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8183-mm",
>   };
> @@ -106,180 +124,192 @@ struct mtk_mmsys {
>   	const struct mtk_mmsys_driver_data *data;
>   };
>   
> -static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
> -					  enum mtk_ddp_comp_id next,
> -					  unsigned int *addr)
> -{
> -	unsigned int value;
> -
> -	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> -		*addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
> -		value = OVL0_MOUT_EN_COLOR0;
> -	} else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
> -		*addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
> -		value = OVL_MOUT_EN_RDMA;
> -	} else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
> -		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> -		value = OD_MOUT_EN_RDMA0;
> -	} else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
> -		*addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
> -		value = UFOE_MOUT_EN_DSI0;
> -	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> -		*addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
> -		value = OVL1_MOUT_EN_COLOR1;
> -	} else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
> -		*addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
> -		value = GAMMA_MOUT_EN_RDMA1;
> -	} else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
> -		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
> -		value = OD1_MOUT_EN_RDMA1;
> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> -		value = RDMA0_SOUT_DPI0;
> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> -		value = RDMA0_SOUT_DPI1;
> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> -		value = RDMA0_SOUT_DSI1;
> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> -		value = RDMA0_SOUT_DSI2;
> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
> -		value = RDMA0_SOUT_DSI3;
> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> -		value = RDMA1_SOUT_DSI1;
> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> -		value = RDMA1_SOUT_DSI2;
> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> -		value = RDMA1_SOUT_DSI3;
> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> -		value = RDMA1_SOUT_DPI0;
> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
> -		value = RDMA1_SOUT_DPI1;
> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> -		value = RDMA2_SOUT_DPI0;
> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> -		value = RDMA2_SOUT_DPI1;
> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> -		value = RDMA2_SOUT_DSI1;
> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> -		value = RDMA2_SOUT_DSI2;
> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> -		value = RDMA2_SOUT_DSI3;
> -	} else {
> -		value = 0;
> -	}
> -
> -	return value;
> -}
> -
> -static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
> -					 enum mtk_ddp_comp_id next,
> -					 unsigned int *addr)
> -{
> -	unsigned int value;
> -
> -	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
> -		*addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
> -		value = COLOR0_SEL_IN_OVL0;
> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> -		value = DPI0_SEL_IN_RDMA1;
> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> -		value = DPI1_SEL_IN_RDMA1;
> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> -		value = DSI0_SEL_IN_RDMA1;
> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
> -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> -		value = DSI1_SEL_IN_RDMA1;
> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> -		value = DSI2_SEL_IN_RDMA1;
> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
> -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> -		value = DSI3_SEL_IN_RDMA1;
> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> -		value = DPI0_SEL_IN_RDMA2;
> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
> -		value = DPI1_SEL_IN_RDMA2;
> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> -		value = DSI0_SEL_IN_RDMA2;
> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
> -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
> -		value = DSI1_SEL_IN_RDMA2;
> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> -		value = DSI2_SEL_IN_RDMA2;
> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> -		value = DSI3_SEL_IN_RDMA2;
> -	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
> -		*addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
> -		value = COLOR1_SEL_IN_OVL1;
> -	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> -		*addr = DISP_REG_CONFIG_DSI_SEL;
> -		value = DSI_SEL_IN_BLS;
> -	} else {
> -		value = 0;
> +static const struct mtk_mmsys_routes mt8173_mmsys_routing_table[] = {
> +	{
> +		DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
> +		DISP_REG_CONFIG_OUT_SEL,
> +		BLS_RDMA1_DSI_DPI_MASK, BLS_TO_DSI_RDMA1_TO_DPI1
> +	}, {
> +		DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
> +		DISP_REG_CONFIG_DSI_SEL,
> +		DSI_SEL_IN_MASK, DSI_SEL_IN_BLS
> +	}, {
> +		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
> +		DISP_REG_CONFIG_OUT_SEL,
> +		BLS_RDMA1_DSI_DPI_MASK, BLS_TO_DPI_RDMA1_TO_DSI
> +	}, {
> +		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
> +		DISP_REG_CONFIG_DSI_SEL,
> +		DSI_SEL_IN_MASK, DSI_SEL_IN_RDMA
> +	}, {
> +		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
> +		DISP_REG_CONFIG_DPI_SEL,
> +		DPI_SEL_IN_MASK, DPI_SEL_IN_BLS

I wonder if we could make the data structure easier to read by grouping actions 
for the same component tuple together.

> +	}, {
> +		DDP_COMPONENT_GAMMA, DDP_COMPONENT_RDMA1,
> +		DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN,
> +		GAMMA_MOUT_EN_RDMA1, GAMMA_MOUT_EN_RDMA1
> +	}, {
> +		DDP_COMPONENT_OD0, DDP_COMPONENT_RDMA0,
> +		DISP_REG_CONFIG_DISP_OD_MOUT_EN,
> +		OD_MOUT_EN_RDMA0, OD_MOUT_EN_RDMA0
> +	}, {
> +		DDP_COMPONENT_OD1, DDP_COMPONENT_RDMA1,
> +		DISP_REG_CONFIG_DISP_OD_MOUT_EN,
> +		OD1_MOUT_EN_RDMA1, OD1_MOUT_EN_RDMA1
> +	}, {
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
> +		DISP_REG_CONFIG_DISP_OVL0_MOUT_EN,
> +		OVL0_MOUT_EN_COLOR0, OVL0_MOUT_EN_COLOR0
> +	}, {
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
> +		DISP_REG_CONFIG_DISP_COLOR0_SEL_IN,
> +		COLOR0_SEL_IN_OVL0, COLOR0_SEL_IN_OVL0
> +	}, {
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +		DISP_REG_CONFIG_DISP_OVL_MOUT_EN,
> +		OVL_MOUT_EN_RDMA, OVL_MOUT_EN_RDMA
> +	}, {
> +		DDP_COMPONENT_OVL1, DDP_COMPONENT_COLOR1,
> +		DISP_REG_CONFIG_DISP_OVL1_MOUT_EN,
> +		OVL1_MOUT_EN_COLOR1, OVL1_MOUT_EN_COLOR1
> +	}, {
> +		DDP_COMPONENT_OVL1, DDP_COMPONENT_COLOR1,
> +		DISP_REG_CONFIG_DISP_COLOR1_SEL_IN,
> +		COLOR1_SEL_IN_OVL1, COLOR1_SEL_IN_OVL1
> +	}, {
> +		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI0,
> +		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN,
> +		RDMA0_SOUT_MASK, RDMA0_SOUT_DPI0
> +	}, {
> +		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI1,
> +		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN,
> +		RDMA0_SOUT_MASK, RDMA0_SOUT_DPI1
> +	}, {
> +		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI1,
> +		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN,
> +		RDMA0_SOUT_MASK, RDMA0_SOUT_DSI1
> +	}, {
> +		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI2,
> +		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN,
> +		RDMA0_SOUT_MASK, RDMA0_SOUT_DSI2
> +	}, {
> +		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI3,
> +		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN,
> +		RDMA0_SOUT_MASK, RDMA0_SOUT_DSI3
> +	}, {
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> +		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN,
> +		RDMA1_SOUT_MASK, RDMA1_SOUT_DPI0
> +	}, {
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> +		DISP_REG_CONFIG_DPI_SEL_IN,
> +		DPI0_SEL_IN_MASK, DPI0_SEL_IN_RDMA1
> +	}, {
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI1,
> +		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN,
> +		RDMA1_SOUT_MASK, RDMA1_SOUT_DPI1
> +	}, {
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI1,
> +		DISP_REG_CONFIG_DPI_SEL_IN,
> +		DPI1_SEL_IN_MASK, DPI1_SEL_IN_RDMA1
> +	}, {
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI0,
> +		DISP_REG_CONFIG_DSIE_SEL_IN,
> +		DSI0_SEL_IN_MASK, DSI0_SEL_IN_RDMA1
> +	}, {
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI1,
> +		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN,
> +		RDMA1_SOUT_MASK, RDMA1_SOUT_DSI1
> +	}, {
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI1,
> +		DISP_REG_CONFIG_DSIO_SEL_IN,
> +		DSI1_SEL_IN_MASK, DSI1_SEL_IN_RDMA1
> +	}, {
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI2,
> +		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN,
> +		RDMA1_SOUT_MASK, RDMA1_SOUT_DSI2
> +	}, {
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI2,
> +		DISP_REG_CONFIG_DSIE_SEL_IN,
> +		DSI2_SEL_IN_MASK, DSI2_SEL_IN_RDMA1
> +	}, {
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI3,
> +		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN,
> +		RDMA1_SOUT_MASK, RDMA1_SOUT_DSI3
> +	}, {
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI3,
> +		DISP_REG_CONFIG_DSIO_SEL_IN,
> +		DSI3_SEL_IN_MASK, DSI3_SEL_IN_RDMA1
> +	}, {
> +		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI0,
> +		DISP_REG_CONFIG_DISP_RDMA2_SOUT,
> +		RDMA2_SOUT_MASK, RDMA2_SOUT_DPI0
> +	}, {
> +		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI0,
> +		DISP_REG_CONFIG_DPI_SEL_IN,
> +		DPI0_SEL_IN_MASK, DPI0_SEL_IN_RDMA2
> +	}, {
> +		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI1,
> +		DISP_REG_CONFIG_DISP_RDMA2_SOUT,
> +		RDMA2_SOUT_MASK, RDMA2_SOUT_DPI1
> +	}, {
> +		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI1,
> +		DISP_REG_CONFIG_DPI_SEL_IN,
> +		DPI1_SEL_IN_MASK, DPI1_SEL_IN_RDMA2
> +	}, {
> +		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI0,
> +		DISP_REG_CONFIG_DSIE_SEL_IN,
> +		DSI0_SEL_IN_MASK, DSI0_SEL_IN_RDMA2
> +	}, {
> +		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI1,
> +		DISP_REG_CONFIG_DISP_RDMA2_SOUT,
> +		RDMA2_SOUT_MASK, RDMA2_SOUT_DSI1
> +	}, {
> +		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI1,
> +		DISP_REG_CONFIG_DSIO_SEL_IN,
> +		DSI1_SEL_IN_MASK, DSI1_SEL_IN_RDMA2
> +	}, {
> +		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI2,
> +		DISP_REG_CONFIG_DISP_RDMA2_SOUT,
> +		RDMA2_SOUT_MASK, RDMA2_SOUT_DSI2
> +	}, {
> +		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI2,
> +		DISP_REG_CONFIG_DSIE_SEL_IN,
> +		DSI2_SEL_IN_MASK, DSI2_SEL_IN_RDMA2
> +	}, {
> +		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
> +		DISP_REG_CONFIG_DISP_RDMA2_SOUT,
> +		RDMA2_SOUT_MASK, RDMA2_SOUT_DSI3
> +	}, {
> +		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
> +		DISP_REG_CONFIG_DSIO_SEL_IN,
> +		DSI3_SEL_IN_MASK, DSI3_SEL_IN_RDMA2
>   	}
> +};
>   
> -	return value;
> -}
> -
> -static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
> -				   enum mtk_ddp_comp_id cur,
> -				   enum mtk_ddp_comp_id next)
> -{
> -	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> -		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
> -			       config_regs + DISP_REG_CONFIG_OUT_SEL);
> -	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> -		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
> -			       config_regs + DISP_REG_CONFIG_OUT_SEL);
> -		writel_relaxed(DSI_SEL_IN_RDMA,
> -			       config_regs + DISP_REG_CONFIG_DSI_SEL);
> -		writel_relaxed(DPI_SEL_IN_BLS,
> -			       config_regs + DISP_REG_CONFIG_DPI_SEL);
> -	}
> -}
> +static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
> +	.clk_driver = "clk-mt8173-mm",
> +	.routes = mt8173_mmsys_routing_table,
> +	.num_routes = ARRAY_SIZE(mt8173_mmsys_routing_table),
> +};
>   
>   void mtk_mmsys_ddp_connect(struct device *dev,
>   			   enum mtk_ddp_comp_id cur,
>   			   enum mtk_ddp_comp_id next)
>   {
>   	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> -	unsigned int addr, value, reg;
> -
> -	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
> -	if (value) {
> -		reg = readl_relaxed(mmsys->regs + addr) | value;
> -		writel_relaxed(reg, mmsys->regs + addr);
> -	}
> -
> -	mtk_mmsys_ddp_sout_sel(mmsys->regs, cur, next);
> -
> -	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
> -	if (value) {
> -		reg = readl_relaxed(mmsys->regs + addr) | value;
> -		writel_relaxed(reg, mmsys->regs + addr);
> -	}

What I don't like of this new approach is the fact, that we loose information 
about the different grouping we had up to now, mout_en, sout_sel and sel_in.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
