Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A390C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 16:04:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B77561BF9
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 16:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B77561BF9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=di3Kp52yf1rZnjo8EhajGj7XinTPfj7/mMiyU7tFgUk=; b=K95jIUw6PNlqdn
	SoLgG4k3NnuSWW3nY9A2g/kOc5fKhxRq1QOf3j7fzC2EkwaTYgJ9RGW27Mfl6gIlNAK0P8yhDui14
	GtneiRQ3FXv7rP/za7OSVS+ypl5aq9tXVNkIZBY6HawWXcuATsPIaWiwLFNv84mtMqsBAoLMqBziY
	WxbmmPkrRkB0u4qsTQKpcqs2DimgkK4hw3flG4DL9U44nSj5P0y2OEXSxycG0MUGdHqhfKB08vTX6
	4plT8RWqlrVI32kHFr0AZdK4WFekXS3jvIijfBXvAROjxpM4BtTYFZnqQjAaLH9M8FpQkAAmx8rAm
	soTKqlk2cw7A78CydIuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnNQJ-005cxo-Mv; Wed, 17 Nov 2021 16:04:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnN2F-005R2e-P6; Wed, 17 Nov 2021 15:39:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso5147532wms.2; 
 Wed, 17 Nov 2021 07:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AuJQYHplLClloH34kEvglpfeOlJKdLUFL/faIlnURqs=;
 b=QFpzzjG2UpBSWHUyfseU0Y3i3+rS/0FUnXv8ZUH+iNTzAW9gISyuCz9WmHgP1QenyM
 hEsUZ5IIvWEwr89kK3BSurRix+yYdgF7rsilPtO43ZaXJPw9kq95OK5LGfq8JTm8FgDh
 6URuV8ZQweV7PTpPCCOjZszm82Z6BtQTapxpRKwim2Z/zD6+6WDJbnsItmVLAX+/gZ9v
 1sSIG9ax/YBAI0UR1Xn425LsSNOo9GhO508FkdnCTsm8bt7ODoGXFSUDEwgHwjJgw1jE
 vdG94jXeSmyPNdxqEMr28+7w/5xUjSYwCrpmVMfDIt6jLelpUSCJRr+LecdN78R993s7
 vT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AuJQYHplLClloH34kEvglpfeOlJKdLUFL/faIlnURqs=;
 b=VA4hqS271xGDJZL5xaiqo9ZMv/pUWKerfW/kqzA79Us9AquEKgi7RNRUjtvc0mOUSz
 /sL1TmFtrjvfow6UH3sQl01FZje8zfHCAQWj0VukKRYeOhI+BV64eHQCjFHXH7Bn3L0h
 gWtb6WqV5bryL+T+VfMn2i4WBREaYBMk0PB0bPU11gj8wc/B5wGNFnJlIVGQcvc3J0AP
 1+HQShN8PPRv8UolzBT7/t4Pu23UsLBKaE9lR7cnGv1S9+f/J19TjnHS4+oExpO06v51
 pgrYthTEIZ6jRmKo4qpzq8052Px2tJT6Gm9NYzWqjxc+yMsgmj0iCyh8aO923WfqYQSL
 mmAw==
X-Gm-Message-State: AOAM530qmhnV9nIzVKJN06TovxJ+vwOI4P3Det/1UTPtjoaV2Z9sLHSI
 vnbvnAHgO2bf9/acSTeA79E=
X-Google-Smtp-Source: ABdhPJxt436RYGl1PlAoi3XeorePlbRfnavbllNp8/73UeAo6VoKeGKr4Dm912w/JIxVDxO3qD/40g==
X-Received: by 2002:a1c:19c5:: with SMTP id 188mr651161wmz.145.1637163581900; 
 Wed, 17 Nov 2021 07:39:41 -0800 (PST)
Received: from [192.168.0.18] (static-160-219-86-188.ipcom.comunitel.net.
 [188.86.219.160])
 by smtp.gmail.com with ESMTPSA id c4sm220035wrr.37.2021.11.17.07.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 07:39:41 -0800 (PST)
Message-ID: <138878d2-e346-931b-69ee-54277fa5647b@gmail.com>
Date: Wed, 17 Nov 2021 16:39:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/3] usb: xhci-mtk: add support ip-sleep wakeup for mt8195
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20211102060049.1843-1-chunfeng.yun@mediatek.com>
 <20211102060049.1843-2-chunfeng.yun@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211102060049.1843-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_073943_893684_AA8FF9B7 
X-CRM114-Status: GOOD (  17.48  )
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



On 02/11/2021 07:00, Chunfeng Yun wrote:
> Add support ip-sleep wakeup for mt8195, it's a specific revision for
> each USB controller, and not following IPM rule.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/usb/host/xhci-mtk.c | 37 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index c53f6f276d5c..63f4b6984667 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -95,6 +95,19 @@
>   #define WC0_SSUSB0_CDEN		BIT(6)
>   #define WC0_IS_SPM_EN		BIT(1)
>   
> +/* mt8195 */
> +#define PERI_WK_CTRL0_8195	0x04
> +#define WC0_IS_P_95		BIT(30)	/* polarity */
> +#define WC0_IS_C_95(x)		((u32)(((x) & 0x7) << 27))
> +#define WC0_IS_EN_P3_95		BIT(26)
> +#define WC0_IS_EN_P2_95		BIT(25)
> +#define WC0_IS_EN_P1_95		BIT(24)
> +
> +#define PERI_WK_CTRL1_8195	0x20
> +#define WC1_IS_C_95(x)		((u32)(((x) & 0xf) << 28))
> +#define WC1_IS_P_95		BIT(12)
> +#define WC1_IS_EN_P0_95		BIT(6)
> +
>   /* mt2712 etc */
>   #define PERI_SSUSB_SPM_CTRL	0x0
>   #define SSC_IP_SLEEP_EN	BIT(4)
> @@ -105,6 +118,10 @@ enum ssusb_uwk_vers {
>   	SSUSB_UWK_V2,
>   	SSUSB_UWK_V1_1 = 101,	/* specific revision 1.01 */
>   	SSUSB_UWK_V1_2,		/* specific revision 1.2 */
> +	SSUSB_UWK_V1_3,		/* mt8195 IP0 */
> +	SSUSB_UWK_V1_4,		/* mt8195 IP1 */
> +	SSUSB_UWK_V1_5,		/* mt8195 IP2 */
> +	SSUSB_UWK_V1_6,		/* mt8195 IP3 */
>   };
>   
>   /*
> @@ -307,6 +324,26 @@ static void usb_wakeup_ip_sleep_set(struct xhci_hcd_mtk *mtk, bool enable)
>   		msk = WC0_SSUSB0_CDEN | WC0_IS_SPM_EN;
>   		val = enable ? msk : 0;
>   		break;
> +	case SSUSB_UWK_V1_3:
> +		reg = mtk->uwk_reg_base + PERI_WK_CTRL1_8195;
> +		msk = WC1_IS_EN_P0_95 | WC1_IS_C_95(0xf) | WC1_IS_P_95;
> +		val = enable ? (WC1_IS_EN_P0_95 | WC1_IS_C_95(0x1)) : 0;
> +		break;
> +	case SSUSB_UWK_V1_4:
> +		reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8195;
> +		msk = WC0_IS_EN_P1_95 | WC0_IS_C_95(0x7) | WC0_IS_P_95;
> +		val = enable ? (WC0_IS_EN_P1_95 | WC0_IS_C_95(0x1)) : 0;
> +		break;
> +	case SSUSB_UWK_V1_5:
> +		reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8195;
> +		msk = WC0_IS_EN_P2_95 | WC0_IS_C_95(0x7) | WC0_IS_P_95;
> +		val = enable ? (WC0_IS_EN_P2_95 | WC0_IS_C_95(0x1)) : 0;
> +		break;
> +	case SSUSB_UWK_V1_6:
> +		reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8195;
> +		msk = WC0_IS_EN_P3_95 | WC0_IS_C_95(0x7) | WC0_IS_P_95;
> +		val = enable ? (WC0_IS_EN_P3_95 | WC0_IS_C_95(0x1)) : 0;
> +		break;
>   	case SSUSB_UWK_V2:
>   		reg = mtk->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
>   		msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
