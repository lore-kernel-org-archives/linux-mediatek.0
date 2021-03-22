Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC82C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 08:54:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D19361931
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 08:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D19361931
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SKp6ZddkocdIW4DjhiuMU2+XiPgQfrJTLa4fcHwwuC8=; b=EdB7cTqUpjHk3hFN2kaRhwUay
	VgUKtQDUHzBq4VQGDowg2fdZu/MlLJLE9+ItuvF5Fg5LSJ+8bBmEZX6hgi/4WvR6TqE0H0uVi8nC5
	L2EVPM8W395KW5KXtsPVukA/MuHQdiyiVQrCIraXBvsV3uQeDHd50adXEaq+pC2BT+9MG08j/pdOa
	luQcxZiawGaiJ/OUfX/Ex3hhZKrDMwiTrXEt1XkrtUvCCbjS2A2kRjatdlV3Db2GOl7lFvKmPptUx
	okdGZ/wARumWmViJmvtKGSitLZMQi822NyItvCtm1nZ29rZPOImkZewJHRT2Gwq8J2EVgCKaVH0Dv
	51/GhURpw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOGKa-00BCev-HN; Mon, 22 Mar 2021 08:54:36 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOGKV-00BCeF-Bq; Mon, 22 Mar 2021 08:54:33 +0000
Received: by mail-lf1-x12b.google.com with SMTP id o10so19972498lfb.9;
 Mon, 22 Mar 2021 01:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AIJXqSZ5zt8gv47j0NQUG8EXZyVECUtsZ+x0h0P65ao=;
 b=ta7MBBiE/qUyUJE7jspyyUViw+CCcxKRPPdFPeMzIpbpqNsJ2bjzk+Q0+xz5Kc0etM
 2Q5Ka2JTFUfM8hydry+zjhZrDyWF09dKQ1haYngnKGdw250Ak5vr5J8mwdxP7aXcQIRx
 oR3Q/0uWz0yONuG2blXN9G9FYRU7aXumSUaIAtXdvYwOU60jFe4YCni1WjWsMWTfpdK/
 vMuT8NZYptppq2i9uCPef+axhsIXmEKcrx/Rn8373Wbcg3PC2HOpF8N/znAy6FaguF2h
 2YA7wOO9DT022R5W1hlEXg8DzDLlOGgMHBRhq1WNRnjkbqSOf8uwoK0rOvpsAAp21VhQ
 c37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=AIJXqSZ5zt8gv47j0NQUG8EXZyVECUtsZ+x0h0P65ao=;
 b=LFgm/WciWl6YY6nM/FwsBujRtjSEGTVrMrz/Cp7MA957G3kBXwfLd6d74bbd1pLYcc
 xSm6EN/Xl2xtnny5K9HFsD8lwkg4ai3chHFLdqWBgVBV9YTsdXM9y9XTCucmmWPRV37z
 /1txmPU/Y1lUz2Tmug/ogVRtDZxqbhuXBjbUDjSYuqn6yioIUEDeSdGBxtlc4yp4ls1b
 cMrlBP6yBx8jmbc/IebDrmwOO22tCXWWONpUUrS2wPH1S8X0gnDiFythaL0yITyRdSz6
 ihhrEkrM9Tqg67/800jf7R7NS3uKy9IuhCPiNIWaiFtYpF7EjenSU6nTEHpEOphTUMYc
 zAJg==
X-Gm-Message-State: AOAM530+eO1scCzQHPll0x/qqqTKUQQJ9/g6W/guPICpDKCUdkPRWfiS
 HSkvJ44Z+HCxsBRR9wmv0gA=
X-Google-Smtp-Source: ABdhPJxrDY7mwUos4IEbQFk1RZIScP8k8HR4cpBJ7iKUklgyJNZ7zTbSCe9TmX11GGO811SaFrg1Cw==
X-Received: by 2002:ac2:4826:: with SMTP id 6mr8493824lft.629.1616403269242;
 Mon, 22 Mar 2021 01:54:29 -0700 (PDT)
Received: from [192.168.1.100] ([178.176.79.3])
 by smtp.gmail.com with ESMTPSA id h24sm1865264ljg.77.2021.03.22.01.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 01:54:28 -0700 (PDT)
Subject: Re: [PATCH 06/13] usb: xhci-mtk: support ip-sleep wakeup for MT8183
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
References: <1616382832-28450-1-git-send-email-chunfeng.yun@mediatek.com>
 <1616382832-28450-6-git-send-email-chunfeng.yun@mediatek.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <0e660a28-d66f-a23e-3fad-8fa37b6df1b1@gmail.com>
Date: Mon, 22 Mar 2021 11:54:22 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1616382832-28450-6-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_085432_237608_3F90A88A 
X-CRM114-Status: GOOD (  18.82  )
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

Hello!

On 22.03.2021 6:13, Chunfeng Yun wrote:

> Add support ip-sleep wakeup for MT8183, it's similar to MT8173,
              ^ for

> and it's also a specific one, but not follow IPM rule.

    Following?

> Due to the index 2 already used by many DTS, it's better to keep
> it unchanged for backward compatible, treat specific ones without

    Compatibility.

> following IPM rule as revision 1.x, meanwhile reserve 3~10 for
> later revision that follows the IPM rule.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   drivers/usb/host/xhci-mtk.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 09f2ddbfe8b9..8ba1f914cb75 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -57,12 +57,19 @@
>   #define CTRL_U2_FORCE_PLL_STB	BIT(28)
>   
>   /* usb remote wakeup registers in syscon */
> +
>   /* mt8173 etc */
>   #define PERI_WK_CTRL1	0x4
>   #define WC1_IS_C(x)	(((x) & 0xf) << 26)  /* cycle debounce */
>   #define WC1_IS_EN	BIT(25)
>   #define WC1_IS_P	BIT(6)  /* polarity for ip sleep */
>   
> +/* mt8183 */
> +#define PERI_WK_CTRL0	0x0
> +#define WC0_IS_C(x)	(((x) & 0xf) << 28)  /* cycle debounce */
> +#define WC0_IS_P	BIT(12)	/* polarity */
> +#define WC0_IS_EN	BIT(6)
> +
>   /* mt2712 etc */
>   #define PERI_SSUSB_SPM_CTRL	0x0
>   #define SSC_IP_SLEEP_EN	BIT(4)
> @@ -71,6 +78,7 @@
>   enum ssusb_uwk_vers {
>   	SSUSB_UWK_V1 = 1,
>   	SSUSB_UWK_V2,
> +	SSUSB_UWK_V11 = 11,	/* specific revision 1.1 */

    SSUSB_UWK_V1_1, maybe?

[...]

MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
