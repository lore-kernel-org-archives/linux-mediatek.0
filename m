Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3F5C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 12:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79YorgzPlkyHS7AGltmRP6s1tJsMD2dF3WZszJ70igk=; b=a39hupAJYCLigv
	7SQSG73NK162uXnb2Ko7q02kJFHHJTKw1EyuXHtIhBuv80NwV3HelzeuCM6NwfSTOUx804iT9FrOe
	knz5diERjffn0vKmQJrSykgIJ0BCnyMiz7RyXLhvMpS+/omBYzgwogK/YLEKXSaqOU5w4/To25G+k
	29VAqnY8cbDR+vvWJGyKrtBJK+pjfChmsRfb6l4/UfRm+0gUmC2uxZTg6zaMcknvkqxXFJRzkZc+A
	pSJKpSDCL1HGW7gr/QwZ50O/kz926qYFheZpuYrty1HF6kek9qgCssTTGxtxg5pXfcLy6KDlfW/ck
	dMclvxkySoPHj94XL4zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYoTV-008XmY-IJ; Mon, 28 Mar 2022 12:27:57 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYoTI-008XjU-W6; Mon, 28 Mar 2022 12:27:46 +0000
Received: by mail-wr1-x436.google.com with SMTP id h4so20121491wrc.13;
 Mon, 28 Mar 2022 05:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JbGAok762R8eBf1hqPVfuq1fu8O4b6lICrVhcAOXnnY=;
 b=eDh8olkgVMK3UTpO18awHgIc3Ed1jsfRMZAreLXkhBIlEA7DeVZ1QaLXRVgqazyhZG
 Y6kvkvxAUwxy8MKoK65O2iq8YCwLPmqQ+3l5aOa3tWqqdnxJMSxGg7IGW65JFrEycRlR
 es6W82+/BH70jMdcVTDB/o778CCgAQvrwY1jEFzkPry8R0yfOl0n9lgD717vx/XyluUB
 nNFbpYcQS01CHq0N5yK3ivzIodKMnvg1qxWeSt+865nFs/tES+bXuTGtT/fqcF42IXnV
 FZNgTEakz22bqP1JaQFIPFL4D+l/1CEZbON+UfbNprd1gMoMmdmJTtvPtfYc+Nli8a7u
 v39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JbGAok762R8eBf1hqPVfuq1fu8O4b6lICrVhcAOXnnY=;
 b=A+Wv4xenzVCP/04FfbwVacyvuVB7jEB5yazecwjgqJUjjJ3/9UIkuz2rg7yXIH6Mkh
 Y5VQn7MWbqvRAkV8EtyZkugBpauQGU1KT9HQ/rnumJBmnDItKAtgbxPnbtqmjw1LddEh
 pLIiNOQIa5eLwPI5S/taZfAHrvKvOH9SpblgyIpquWXQ9mORSXEfqlySirIKpBhTnTvh
 3jnwYiTzZI3rrPziuQzORoyCReUx4sJGmjnbaJvRjUp6/Ol+CGyGwqaZjyG/HRX2Ria1
 ZyAlVmZW8g+JDEO9bLeVBG1C1FkjFBJfPzk6IgeeeQIfW2Ls5LhR6H98NWEBC6gjuzZt
 GGBg==
X-Gm-Message-State: AOAM532/CY+HWKGHHX0ERxttwBdsJfG238wxR6DJsKPBCMBVsaN9YbBQ
 S8HLxqXQ4heGulUocAPk6Wg=
X-Google-Smtp-Source: ABdhPJyJhWj9ZIEO6fsrHVxsB2RCiBoanzZrq0bKdtFkggensDubXGrxlX1xOnXys9deFbRpSsu4Rw==
X-Received: by 2002:adf:eec1:0:b0:1e3:1e0a:72f0 with SMTP id
 a1-20020adfeec1000000b001e31e0a72f0mr23809347wrp.524.1648470463325; 
 Mon, 28 Mar 2022 05:27:43 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c3b0d00b0038cda9f92fasm10725613wms.0.2022.03.28.05.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 05:27:42 -0700 (PDT)
Message-ID: <a48706db-cdc9-2a1d-0abb-08dd961c17e9@gmail.com>
Date: Mon, 28 Mar 2022 14:27:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 1/3] dt-bindings: arm: mediatek: Add mt8195 pericfg
 compatible
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Linus Walleij
 <linus.walleij@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org,
 wenst@chromium.org, chunfeng.yun@mediatek.com
References: <20220216113131.13145-1-tinghan.shen@mediatek.com>
 <20220216113131.13145-2-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220216113131.13145-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_052745_066041_F72536CB 
X-CRM114-Status: GOOD (  12.93  )
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



On 16/02/2022 12:31, Tinghan Shen wrote:
> Add mt8195 pericfg compatible to binding document.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml       | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
> index 8723dfe34bab..611f666f359d 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
> @@ -26,6 +26,7 @@ properties:
>                 - mediatek,mt8135-pericfg
>                 - mediatek,mt8173-pericfg
>                 - mediatek,mt8183-pericfg
> +              - mediatek,mt8195-pericfg
>                 - mediatek,mt8516-pericfg
>             - const: syscon
>         - items:

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
