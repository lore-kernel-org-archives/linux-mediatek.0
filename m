Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259ABC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 15:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DYRTkLQkt5QsUQFkBhyOTw4ineCXo6DjjJscrJFSgc=; b=441GPCtuywB9wfescDXowHW0ea
	lkRQ0f2ZrdzhPTOqlssKQfNhRSQCOEQC3wTDoNJoKP8pJTbneVZTaBdQAhi5T11MQiMeoyZOH/NJn
	9gzDc4AUppKFgIdzTwAUUmC315aEO1RgC0AmM2idqCUCQNEkhMYRMr3KrQWW9Ak/lcUC9yyuN/gKM
	X9TTWulMZnjCnhu4xjRe/Wx/iyprR0yg2J4aG++IB+tBk1nIqYL4v3lawnK5iEx6/Z7jt/2TYBh0l
	2+/EIxT1TsBV9BErTpWKUO+p9s8uidzAfz0Wh6jPDcY5nyqgIRptkP3KIiPUIG12Pahb/H6sxcCn0
	c6leDf8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrPe-000Js7-VV; Wed, 23 Nov 2022 15:11:47 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrP1-000JjD-Mu; Wed, 23 Nov 2022 15:11:10 +0000
Received: by mail-wr1-x433.google.com with SMTP id i12so25971710wrb.0;
        Wed, 23 Nov 2022 07:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+DYRTkLQkt5QsUQFkBhyOTw4ineCXo6DjjJscrJFSgc=;
        b=a6cyw71kovfdAiAgG/Pmn3Is0bFtobdtqmKQZVwHwZei0zj4buzNah86/6bkSx8hZN
         CcaVd5gUchTpWqD2YKnTiQoRcyvmf48JeMS46LSu7Q9BrUL4fczKCaj3MHplZnuYQfEa
         z2J3Z3PZGMWNB9Sgol4pLp6h+7qPsTOhfvCZ9GSE1l9u1+7ZGSRbax6FkyThJTth5Q7o
         b9vbjKpu+RepLZhj09l38CIfBMzC69vK7zfGD73f6RfnUPNiyiz7PJiu73xSVq7UUGS4
         x8W9YjKne9o/WZqFiKiwWGkvJ1pbw2uSbyKO2wQApRTUA60nrnolf1LTh/CBx4x0XOXv
         9bZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+DYRTkLQkt5QsUQFkBhyOTw4ineCXo6DjjJscrJFSgc=;
        b=QOgB0D3qMHeGdtg82XObORQNrhuPrgyYZPNIoCTUAVRBZOIkQanCYre+BVndJgZ+WI
         ovHD67lHt4t3nglNYCM9e5PY/txJEBndmhqL0n8ZsFkgzpFAz/ZJQHI8WLLXocKjwqXk
         6FdleKAMmxoxAQWgtrs0K8aI57sjb9EwZ0vcAtEgtF1Q9c4+15UK8ygMTLTrRVrf+9i1
         E0LUTVSJKIDsaU8f6J89Db1sLUc1umVMXFWMVGcWTwp4urO9BdPc+6bz6S5GnzFhIsCs
         tqLIJwuBLl6p4m2ON5wT7CQIR4iLWHYOtyB48KOwhZ2XLEPd8TNM4xSjEBqzhgreBSkM
         Sleg==
X-Gm-Message-State: ANoB5plC9fNDOeqDHWQOdTnREDd95VlfHx6Hh0OWT1T70aZA2ImN6Aoe
	HESUZJ89T6SxBUEMl65dE9k=
X-Google-Smtp-Source: AA0mqf6QDXovSwze3tv0ycv0Haj3/XbQr1CmC7ICTzDgFzPaqSinUcDrrNIj+ryOtRqBrdJZ7F3JgQ==
X-Received: by 2002:adf:dfd0:0:b0:22e:32d9:e1b1 with SMTP id q16-20020adfdfd0000000b0022e32d9e1b1mr16994282wrn.631.1669216263997;
        Wed, 23 Nov 2022 07:11:03 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id e18-20020adfdbd2000000b0022da3977ec5sm16850807wrj.113.2022.11.23.07.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 07:11:02 -0800 (PST)
Message-ID: <802ae971-0790-9ad3-821a-7faa36bd9035@gmail.com>
Date: Wed, 23 Nov 2022 16:11:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/5] dt-bindings: usb: mtu3: add compatible for mt8186
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org
References: <20221123135531.23221-1-allen-kh.cheng@mediatek.com>
 <20221123135531.23221-2-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221123135531.23221-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_071107_796564_B7209FF3 
X-CRM114-Status: GOOD (  13.19  )
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



On 23/11/2022 14:55, Allen-KH Cheng wrote:
> Add a new compatible for mt8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> index 80750b0f458a..7168110e2f9d 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> @@ -24,6 +24,7 @@ properties:
>             - mediatek,mt2712-mtu3
>             - mediatek,mt8173-mtu3
>             - mediatek,mt8183-mtu3
> +          - mediatek,mt8186-mtu3
>             - mediatek,mt8188-mtu3
>             - mediatek,mt8192-mtu3
>             - mediatek,mt8195-mtu3

