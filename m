Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82159C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 13:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n4KARr6YPUHl+O8qC8FgsqIa795ag7U4WQlOrYTHW5Y=; b=c0ltN1UMhEHGlp
	CJ05AhfluhFFjElie4j7IdppfTnTiJxlGvng6daJY+lT6IvauTNDbp12Fdq5QIEAuzLu8sjGDCwGT
	gRgv7tvyczijJ9YYvY3D0Io8rRD3qOydBw82QhlX9wbuvjoWftuApw39R5ARk6qH9Y/IRPNksvNt6
	ndc3r+dQK1VYAVIyGamYWS8jKyqULnzyOCoWmrz1xAJ5bUsS9YQV4DgDSLFNs4qKxFoWlYxQ3SWa8
	ROyCjwf4eprX3cElwrY/9s05KmgaPb+4MO18MhQCm3hJYuM35M0oQpSKvJbpUq7H1tJMhBaK3nW5m
	KP6GMvHtuLs6lTAsGJsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkQum-00BQIU-5G; Fri, 29 Apr 2022 13:44:08 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkQub-00BQFS-64; Fri, 29 Apr 2022 13:43:58 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 bi24-20020a05600c3d9800b00393ff664705so4778320wmb.4; 
 Fri, 29 Apr 2022 06:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9SlylRvL62c7qQ0d0U09m8gj6wRuIZ4uikE6ZzCgN4s=;
 b=BwVtRPzCEpgLI6VmOgXz/NXKyEBrJx9Ro+lZVO+Mau+UOdV36jcm8vhmeyfNr9t+vg
 mYG4zfYRgfBP0L0x9m5YVeCd/PNwiwYJUKALD1HkikZi1RGbr3BY1rR7AOwMpvYkCOqn
 7DC75t3w+u83ocQ5qPFZpBqB7mGJppKkIy9qE3TiJc6MJN47fxBOipQk0mzOi5N9hPHx
 azauKMptEneUJagpdAfGPVPzVL3egBRmEAUy+LywOUMZMezOFkqv2gd5O10gjJwUouKX
 M7FHGEb4QkDJv/wdCWfyvw2+vhajUsnDV0i7srobR4NW2Z17+S9sHIqjtMRSk4Bjmebw
 3W8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9SlylRvL62c7qQ0d0U09m8gj6wRuIZ4uikE6ZzCgN4s=;
 b=a8aEKNIFyzKHYCBs+JfmQrUnad86Ez1kPZNMLV6N79yj/jVSwXSdMmhVeoTiTHGxvQ
 M8hbV7Sc68cP5BmRoj217r6wuudtNqYnVIikFYSvTNBeLy2H18UWJw+RQ6lno4kc9Ip3
 P0rM/u3LCov3k7sp2ZezdNiUz9YyMj1slnwI1YWXG8qsf2Aw6YsSrCffh1ZExAawKKhu
 A1B+yXsRQ8QgU5/yUFTLVoBuv+zPnfFKMtpPmHXgio+R3rtJSDGIG9qPcnW8mxtj07wx
 ps8i879zLRpBMZwT3U5XZyKDka0cWCPRRlGV5oIP6Kb2u6mNaQBNqy7L7h7LlkkH69u1
 t0pg==
X-Gm-Message-State: AOAM530F8jLQX8hgRtdbb40mNjJHfkKVqLzFy53mCoNQD9eP/2qriemL
 Oin2BhstdNY5jeLCMOTk3fY=
X-Google-Smtp-Source: ABdhPJzHeQO20kA01fexo3yVJoC+v4x5EY+4oshVaGSoBUk3P1V+LEh6mKJWcgW7mdwV0uo3Hk3P5Q==
X-Received: by 2002:a05:600c:220e:b0:394:2695:ce9b with SMTP id
 z14-20020a05600c220e00b003942695ce9bmr193877wml.64.1651239835033; 
 Fri, 29 Apr 2022 06:43:55 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net.
 [188.85.180.35]) by smtp.gmail.com with ESMTPSA id
 j19-20020adfb313000000b0020aed8ece65sm2600793wrd.32.2022.04.29.06.43.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 06:43:54 -0700 (PDT)
Message-ID: <36cddba0-ea3f-8993-7ffc-303a198043de@gmail.com>
Date: Fri, 29 Apr 2022 15:43:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/1] dt-bindings: rtc: mediatek: add mt6358 and mt6366
 compatible
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yuchen Huang <yuchen.huang@mediatek.com>
References: <20220428092726.25814-1-allen-kh.cheng@mediatek.com>
 <20220428092726.25814-2-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220428092726.25814-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_064357_276735_B2CC0BC0 
X-CRM114-Status: GOOD (  15.40  )
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



On 28/04/2022 11:27, Allen-KH Cheng wrote:
> Add mt6358 and mt6366 compatible in devicetree-binding document for
> MediaTek PMIC based RTC. mt6358 and mt6366 use same compatible data
> to store RTC_WRTGR address offset.
> 
> mt6358-rts should be used as fallback for mt6366-rtc.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Yuchen Huang <yuchen.huang@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/rtc/rtc-mt6397.txt | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt b/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
> index 55a0c8874c03..7212076a8f1b 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
> +++ b/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
> @@ -14,6 +14,8 @@ For MediaTek PMIC wrapper bus bindings, see:
>   Required properties:
>   - compatible: Should be one of follows
>          "mediatek,mt6323-rtc": for MT6323 PMIC
> +       "mediatek,mt6358-rtc": for MT6358 PMIC
> +       "mediatek,mt6366-rtc", "mediatek,mt6358-rtc": for MT6366 PMIC
>          "mediatek,mt6397-rtc": for MT6397 PMIC
>   
>   Example:

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
