Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4BFC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 20:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LqwrYnPoyoRSilPLU/RGIw8FoJLKncd1EdcPg4IJbPU=; b=aQq0OIzzf1H11Y
	JdAlbU+lWLZCs9h392SX7BSSLP5h1MB4Z5oP4xLuhMNMYZl2eWtidXxj2jJVbI1oa+caQFmZ4ayZM
	XKbMZh3XjNWJplp2zwtpD2uI5p17qCzK5AQa4PkPH2FvUKjiZkZv7TkRm6wByyHb7easEU831Siq1
	DrDuIzxy7lGr8xfdX586I+klaPjaMcqt5s6zhvaXiKly0gpgH2Yfuf6BYJxv4EH37p3SJRrG7N0/u
	r4liV0Ss4MXI5KbIomFeCOdQrEJA0VyKT9iISO/GNgujWQeF54yRXq2HiZ5kN3ZTU0c4Dttjf/9DN
	tQZOgqIgflQh0a5ihbTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnQcM-008Crn-1r; Sat, 07 May 2022 20:01:30 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnQcJ-008CqK-9j
 for linux-mediatek@lists.infradead.org; Sat, 07 May 2022 20:01:28 +0000
Received: by mail-ej1-x634.google.com with SMTP id i27so20030970ejd.9
 for <linux-mediatek@lists.infradead.org>; Sat, 07 May 2022 13:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2iRIY5KwU5TFEDicwkCr/QLfBwiyrI+iHIWZ5gHruS4=;
 b=snHCBvCKpyR55jcalFhSWCYn1fBYbOZqyssEwgmfTHkkwGtiqSSuzRBMQtTmB4lVCY
 f43veq6EW+xFy2KClHF7KvUHJoMiPbP8T8V3wqmhlrsyND3+J96/g545JdUozBddYfil
 TjBgnQsI7yC+OOpXUPfC92tiNjQgKYUubGRq6tDW1gROV2RVuuv4lxpFe9mIoHTNUwBJ
 Yb7sMZxiYkPe5Nq0UeORK5OEKupCkWXRoen9EcUzqty7HMM91eUPETw+M3AVHT702Mbq
 1WZqHFhXNPVMvvM7CjBR+OeARz5aAzLRchmyeOZLLzrcLo2678YSl28Wbm7VCx+PTBei
 zxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2iRIY5KwU5TFEDicwkCr/QLfBwiyrI+iHIWZ5gHruS4=;
 b=il+Zbh62lYvPQmHIhXUNCh/xDIwRW/Kp2PPmFXWSOnygOL/MTtKBSiTjIQwfhsxAq+
 +nIUUlsew+oOxjc/PkocvwTH4fKLNTNVwtaqTXBQF6pg4rXfSmG1gbFj9cJn7aCeVcJk
 2+mPrWCdhA4Oa6Pydz2++iJ9nXjzJhMyh8kZTjOBr0FvFAVEdeU4nzGHk5has+Uobs6N
 55Xate6ASl0qTRsPYk3g96P8MmRoZ1XNgFkd8INLXP8w1sWSbXDdd13p7Gil0PNwgJwg
 dkww4aPqj6q+UwxFzEJ7Ryf2S8eENr7oSNjaD88XnIBsxLUwX3eGuPFs9a0VoHAyZxXQ
 p/7w==
X-Gm-Message-State: AOAM532kKMH4QwpQPlC/8XSsNQ06X48C7AL8vRA6UjaCios1ImLc7t6i
 nofByw08GHtMIL8iMFMgcwBLfw==
X-Google-Smtp-Source: ABdhPJzrbT27gssfCk2kFgbjdT1R48ywS6K9Stnziba55N4u3lcIT2GtJxAdDh00AoGTrjRkP0Tflg==
X-Received: by 2002:a17:907:3f86:b0:6db:b745:f761 with SMTP id
 hr6-20020a1709073f8600b006dbb745f761mr8283334ejc.610.1651953685073; 
 Sat, 07 May 2022 13:01:25 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 en9-20020a056402528900b00425ff691a32sm3753134edb.0.2022.05.07.13.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 13:01:24 -0700 (PDT)
Message-ID: <06157623-4b9c-6f26-e963-432c75cfc9e5@linaro.org>
Date: Sat, 7 May 2022 22:01:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 5/6] dt-bindings: net: dsa: make reset optional and add
 rgmii-mode to mt7531
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220507170440.64005-1-linux@fw-web.de>
 <20220507170440.64005-6-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220507170440.64005-6-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_130127_366715_33F755CB 
X-CRM114-Status: GOOD (  16.22  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Greg Ungerer <gerg@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org,
 Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 07/05/2022 19:04, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Make reset optional as driver already supports it, 

I do not see the connection between hardware needing or not needing a
reset GPIO and a driver supporting it or not... What does it mean?

> allow port 5 as
> cpu-port 

How do you allow it here?

> and phy-mode rgmii for mt7531 cpu-port.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml          | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index a7696d1b4a8c..d02faed41b2a 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -55,6 +55,7 @@ description: |
>      On mt7531:
>        - "1000base-x"
>        - "2500base-x"
> +      - "rgmii"
>        - "sgmii"


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
