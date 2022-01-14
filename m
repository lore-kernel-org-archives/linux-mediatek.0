Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE11AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 10:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBzy9bKxUug490KlOjVmKcfLbM+4ZUK1mFD/y5Lymys=; b=DJKXISXhG6LPW0
	nzxkpqOce4Q6PGCeq3fRepqna8BIWGeVBGWcbV9gHtwH6KCcB/vfLQHaJMnV0cxFKDJw0QQEw04EE
	bVzGVqgNdysHNmOtHyImGMur/00hwN0wXfy0zEQG9xzihKEdSgxFnjolkoVKNlckBvboBg79Lffus
	dVLRAGJp15ZjEA2ul4remUhZ8EjdVVe7hTflG/OZrSCSm4y2SVOnqoyv07NWKb9PIWiWqp7jPqVX0
	mi5iehuyKM1M/apKIk0Iqy0ZkxLj3WWGEnXHHiSqTsFSSC+TcW+0DLYi/v2GRaq/I817pDT9KOHeH
	tbvy55CtimoKicW1sR7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9PIi-00EVjX-Gd; Mon, 17 Jan 2022 10:31:48 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9PIO-00EVeJ-Qg; Mon, 17 Jan 2022 10:31:30 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso23199821wmc.3; 
 Mon, 17 Jan 2022 02:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=drzE6YehBAfCGTYeantFOUyrCID0+zzbF12IY9CFxQU=;
 b=UsHAOnftmCpjQS/OuNWUiYgvd7+GGI/3R5IkZpLRWZ8K7UCklqlJCeUomcEY44dnbt
 NMgY/zUrPvahx3gssaevse2KppcEe+b19m1UfgYZh/tIcFztpd4mo6147HLRcx2kzZMW
 C6fCjG6wzM3apbi+ayP2pvhlbcBZfS96FDE62pBoJX6vexu2r0QRlRauqzZ2sUqOLOSj
 50IEoNuO7SHvH1hvgb96hjPjZITzaCX+g/D7f03uBs4WXoZeAwZouFNZP5ravrW6ojvx
 hBQusJHloYz1q5Bk3bpVhZ31CYE4WivdbvW+h39rsWKKxkwBxMRXQKRGVnK1klcGoeBi
 b5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=drzE6YehBAfCGTYeantFOUyrCID0+zzbF12IY9CFxQU=;
 b=GrG5FN0X/Cow8wgnREGWCrsk7uZMT7aDFoZfa/eOfrYZdjVbjlGJ0MFZHoUSClGSCQ
 LJlviIeMq/KTnWhdxgUcE3ga9DC//rlxQ/HfEtiSRnM7Ici/OFI5Y26SmPCfXalUoGpu
 zAPbkKYaGugtDMYDZ1hHddAZYwyowbPCyuxZfcJvtdQFc8sFtCdVf9TyuF27IRkPxVxq
 rXIC4DWxDFpgvt2OH18NBl9P4yPW5pGPdSXVYhdySJLvqWtAth1F+ubExq5Al8Y3dW8z
 XwfD/YjdlP1Uf10Ts7Ep48qsczdNuj7Ip745yc/7Slpz64dDBzgDjDIfcmqclak0RzQ2
 DuTA==
X-Gm-Message-State: AOAM530EeNRU4k3DS2qlFkNmPlu69qEZ+S3T9jnzRTauQdMTn8QZZN2n
 KG2PJ+TeAhxKEvG+6iWnrP0=
X-Google-Smtp-Source: ABdhPJzPgzWevB3vn/b9crfzsgD7xhyUdvEZ8B8T4+GHOzdrlM6GpVQRKNrcl/xex+H0dhGUZ3EGfg==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr19798499wrb.545.1642415486661; 
 Mon, 17 Jan 2022 02:31:26 -0800 (PST)
Received: from [192.168.0.14] ([37.223.145.74])
 by smtp.gmail.com with ESMTPSA id b15sm9890257wrr.50.2022.01.17.02.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 02:31:26 -0800 (PST)
Message-ID: <9949a1f7-1ed5-a137-c7b9-2ef8d8e1caf8@gmail.com>
Date: Fri, 14 Jan 2022 16:46:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220107104633.7500-1-johnson.wang@mediatek.com>
 <20220107104633.7500-2-johnson.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 1/2] soc: mediatek: pwrap: add pwrap driver for MT8186
 SoC
In-Reply-To: <20220107104633.7500-2-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_023128_972908_0883A327 
X-CRM114-Status: GOOD (  16.70  )
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



On 07/01/2022 11:46, Johnson Wang wrote:
> MT8186 are highly integrated SoC and use PMIC_MT6366 for
> power management. This patch adds pwrap master driver to
> access PMIC_MT6366.
> 

It seems this new arbiter is significantly different from the version 1. Please 
explain that in the commit message.

> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 72 ++++++++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 952bc554f443..78866ebf7f04 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -30,6 +30,7 @@
>   #define PWRAP_GET_WACS_REQ(x)		(((x) >> 19) & 0x00000001)
>   #define PWRAP_STATE_SYNC_IDLE0		BIT(20)
>   #define PWRAP_STATE_INIT_DONE0		BIT(21)
> +#define PWRAP_STATE_INIT_DONE0_V2	BIT(22)

That's a strange name, does it come from the datasheet description?

>   #define PWRAP_STATE_INIT_DONE1		BIT(15)
>   
>   /* macro for WACS FSM */
> @@ -77,6 +78,8 @@
>   #define PWRAP_CAP_INT1_EN	BIT(3)
>   #define PWRAP_CAP_WDT_SRC1	BIT(4)
>   #define PWRAP_CAP_ARB		BIT(5)
> +#define PWRAP_CAP_MONITOR_V2	BIT(6)

Not used capability, please delete.


Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
