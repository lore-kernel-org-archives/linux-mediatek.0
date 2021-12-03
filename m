Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B18BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 13:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p73IWyZrn4ejdVV1XQVbtto4ra0BPr+iM2UQD4RLDPg=; b=ufrEZpFpeT5Jct
	CLSM1Rv70brm7sR+RQ6dZO6CcW3y+x0Y1fIVjvTvl8DXIDZEftouIl3EjF97a7qHe6yIp3tXvFY7q
	U6o5yfsTaWa1XI3ZsA381bVdgnBKNvBCYQm9T6m8OLEaRwK8b9ttv2Qz0ZkYJp40PxPhvWAmaWr24
	euGLjwgJRpqMLpytFZY22oOaEwztn1Y+UP/p69zpSNSNn2nTgZGMJR67txbv+WerKbzfnkmpxSp+9
	utHz0I+9TKVjybS3PVJIaPbNmSZtQjbSS9hZI8LjLvIBgget0bxG85QrF5E96y/kSsZy+MYyQ28OY
	qEZ3pdRQ/hx0BVYTMipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt8rM-00G1VG-1k; Fri, 03 Dec 2021 13:44:20 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt8qs-00G1NT-CO
 for linux-mediatek@lists.infradead.org; Fri, 03 Dec 2021 13:43:51 +0000
Received: by mail-ed1-x530.google.com with SMTP id t5so11955448edd.0
 for <linux-mediatek@lists.infradead.org>; Fri, 03 Dec 2021 05:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=caqYbeB05zXLjGSVGUuCqdI7HQ2llCrRlhq6cVUWiV0=;
 b=Ygqjtiv4kbuWrWiNOsYjnB0ekFqH7NOzoufn67zHKL7N9FW69D0gKais/bI+zxeFF9
 4ahlcOaV35sfw4iwxmvyY5FLR5MMEPmms2RWsMPDd8TMtYLkAIP1wDpMsoF2VylH1eQg
 ZrqJBTF8yfExwx9kJaT8P9KyuHqRku+Smpuns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=caqYbeB05zXLjGSVGUuCqdI7HQ2llCrRlhq6cVUWiV0=;
 b=ZOGOfo5eyfdkvDQJd62uV61kAZBxLmq0zYodFR7UdzFpT/cNm4tGfqO65yMfnEQ0g0
 ZnagkoT5hsyeQ85LLfnNVmOlXwH+3OVJefVHDByNqePmemuX/Kjy+Ozvk13vjWCZvNtj
 vWKtwX03+UkAVdUPDtvv9GmpCbqtxbstbwftiWvxcsCioGyWlvlumr2u35R/7MWZbyzT
 1pNGL054A0HkKzomX2feMIpcE5voSBusePy/jJvwhV7adbu1bRCA9rfP5OhozqojGDn3
 AYMKPIf+46xFh8G6hXIOPvJbzBod8qPQMo93u9bKDIwM61anM5lz3XDvcQAV9RNwqFds
 OBJw==
X-Gm-Message-State: AOAM532pM4ZXaN8HcHdzvoWG6sG2FQT145ha6g7sHdN0P17dwsn1IOJY
 6g0px+D4XCmrurlOR4FXdkzqPw==
X-Google-Smtp-Source: ABdhPJyCdv61zjdeT962tknIyH1upj+6b4k5awfM5eC95e/jSTjCO3VCvZ+1wiRUefnxexjNqJ3mAg==
X-Received: by 2002:a05:6402:350e:: with SMTP id
 b14mr27416602edd.313.1638539023238; 
 Fri, 03 Dec 2021 05:43:43 -0800 (PST)
Received: from gmail.com ([100.104.168.197])
 by smtp.gmail.com with ESMTPSA id e26sm2041942edr.82.2021.12.03.05.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 05:43:43 -0800 (PST)
Date: Fri, 3 Dec 2021 14:43:25 +0100
From: Ricardo Ribalda <ribalda@chromium.org>
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, xia.jiang@mediatek.com,
 maoguang.meng@mediatek.com, srv_heupstream@mediatek.com,
 irui.wang@mediatek.com
Subject: Re: [PATCH V6, 1/5] dt-bindings: mediatek: Add mediatek,
 mt8195-jpgenc compatible
Message-ID: <Yaoe/Tk1wMyFoB1s@gmail.com>
References: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
 <1638501230-13417-2-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1638501230-13417-2-git-send-email-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_054350_459891_C3B7A457 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

kyrie.wu wrote:

> Add mediatek, mt8195-jpgenc compatible to binding document
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> ---
> V6: no change

Hi Kyrie

Your patch does not seem to apply on top of linus or linus/next.

In linus/next they still have the .txt file:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt?id=7afeac307a9561e3a93682c1e7eb22f918aa1187

What are you using?

Thanks


> ---
>  Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> index fcd9b82..e93ccf5 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> @@ -18,6 +18,9 @@ properties:
>        - enum:
>            - mediatek,mt2701-jpgenc
>            - mediatek,mt8183-jpgenc
> +          - mediatek,mt8195-jpgenc
> +          - mediatek,mt8195-jpgenc0
> +          - mediatek,mt8195-jpgenc1
>        - const: mediatek,mtk-jpgenc
>    reg:
>      maxItems: 1
> -- 
> 2.6.4
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
