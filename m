Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FCDC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 11:45:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 598EB64E8F
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 11:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 598EB64E8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dUOtyDfsWxmYkLBPBcsz/Yzq9CRM+aXJD1b3q33vaOQ=; b=tvGipCZyGz1pv5J5CipOTNFIJ
	eXZ5BxFMJce6HJIJ0SkNjZgzU+xyoXPcnSVvJiF+9pznHc5LfSLBekSeBXOhMEtnHZGvh7Uyyf/4G
	aFs+Y3QdD8Ci8nWRD3/x+eX6iXf3uRILYMgoqz0AIbG6DhNERASoW+vuEEcAES4RcmqZNUNFyym3E
	FxA+J3/aP28DLqeqtqLtlMv87BOI7gbGRwy1ftsisG+R4+AF5XEFRtXjXJtd/T85tCYIWC0lvUYBc
	z0rUkeMqRPqDvtYVxNG+nYOQu0WXrnVo5Wyk4bKw8vZe6KZ7hdxAkt+CxAIE6+5wl7hM7oq31JdWW
	8Lxs78Stg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6Xe1-0002CY-VM; Mon, 01 Feb 2021 11:45:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6Xe0-0002Bm-6w; Mon, 01 Feb 2021 11:45:25 +0000
Received: by mail-wm1-x333.google.com with SMTP id u14so12358603wml.4;
 Mon, 01 Feb 2021 03:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LTeob63vsmUobXodqAiG8SpUrpS7C8Uwp52f74LCJJg=;
 b=jUu/9QXaLfBlcx+CWhhnlNjanILpEbvu51VrRb8r/IgseXxg8nfWo26Yk4VZzUQSG+
 zNzBW5aT9qBfENRRyTBCHjCbpQv2xoD9emBMD6Z6LB32epHyhZd3v08a1ahO2fIc7Z5I
 cw2yW52UbhU+GzghNd4kGEl8xqbbwWZ8HCyADMlKFz0w+oETTs3gRllw6NQkCBqmnkKg
 2zXyu/gMoAONlCFSdI55iIZGfFlkpEZbVxejaJ/QaUb2EcZ1BkyKcdzOku9k22KYBFmm
 SprXDDg2yD+5d6tYTevrAoeROYTyKKmFueSJy6HsZ9O0meDge5nDOqOFgSqwmJnC7qHD
 eciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LTeob63vsmUobXodqAiG8SpUrpS7C8Uwp52f74LCJJg=;
 b=NR/IZARt1atoWGJdZk0AeRtESu4c6sunnMEbV4V0UHfN2I6u6sXPwYx2KMvsbvNWiN
 grbWh4B8jN5cknUA41up9mld0FyRf7xrehHrZ1sT2D67MPkzsyUni9c+RFUPE0bWa3dH
 wicW4gdD6hEvOkk3DuWmgm9oAMlbRHFlA7dw/OG9P1ag0wEWhVf99kuelZl7OYN7q5va
 4ZwCr2gNDxvDnKLmS0TvbFTF6bySGP3nPe1kBzj9AIgsbz3z3qSG8bm3ElUPagKC35gu
 7mMkpUCguKh5PmnofVKyHE+kLBTEYLd0iW8mYYlCuiDoM6aTIFQ84XfX2lABeTGsWOeU
 CG8A==
X-Gm-Message-State: AOAM532l8abxW7ORWuZqilBXyDKy3QKgQ6WhUDJZG/mkHaeKzYKHwRWH
 nt8RaBK85m5ut7+946X8ii0=
X-Google-Smtp-Source: ABdhPJw6h2jWNnS4CMbNkwoBh5AfdOqqkEXCADAuVE+E1t5Yd3scYb5jIl9WCOkFDGBgnEYEW6K80w==
X-Received: by 2002:a1c:c904:: with SMTP id f4mr14939397wmb.14.1612179921358; 
 Mon, 01 Feb 2021 03:45:21 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id b18sm26360198wrm.57.2021.02.01.03.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 03:45:20 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: evb: Add domain supply for
 mfg
To: Hsin-Yi Wang <hsinyi@chromium.org>
References: <20210201093049.87285-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <7c76c776-5bd5-d35f-1003-8b1741555ac4@gmail.com>
Date: Mon, 1 Feb 2021 12:45:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210201093049.87285-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_064524_293811_95D3F4C7 
X-CRM114-Status: GOOD (  15.82  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 01/02/2021 10:30, Hsin-Yi Wang wrote:
> Add domain supply node for mt8183-evb
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Queued in v5.12-tmp/dts64

Thanks

> ---
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> index 3249c959f76fc..edff1e03e6fee 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> @@ -352,6 +352,10 @@ pins_pwm {
>  	};
>  };
>  
> +&mfg {
> +	domain-supply = <&mt6358_vgpu_reg>;
> +};
> +
>  &spi0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&spi_pins_0>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
