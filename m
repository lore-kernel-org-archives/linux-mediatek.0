Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2250AC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 09:32:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFDF9610C7
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 09:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFDF9610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IIgrIBSM7lsDMlsribeIkh/Nvd3G7lP9wa7SLU9NxLE=; b=qRKAHh07QuA0tu5SrgNh2et1J
	W+qeEBpBJvQThQ1NCn4mp468kQPbyqWNDOtOdi/Br1vIsiHk473bK3BlgGP+LD6oS6UtuZVTi8Q1d
	sXGew68aUZ/3xIhF1+i48nI3hL0vE9JB6giSiCE8F4w2BwWQdSoMIBpfEqLoM4f6Zp410RtVcpamY
	D1M0jHKjSOE9XhtfS5YEJBUcZdjaH98i8HpqkndWSMS99lDT3k2+4ECEvDCa1B/GdAHpWJdfwNOAc
	zBwVPHGbfiTUbpR0daQ8DBAe5KX325C97iBpy6PTs//weNia5NDkQ+cJwPKKofdAuyS+QDPpcwb6E
	DDeHvkm2g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRtgp-0093w5-W3; Thu, 01 Apr 2021 09:32:36 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRtgk-0093tw-1z; Thu, 01 Apr 2021 09:32:34 +0000
Received: by mail-wr1-x431.google.com with SMTP id j7so1133581wrd.1;
 Thu, 01 Apr 2021 02:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m7OrC6vj4Ru9A4xIjIuXg2uQCm2nhCLjuUpyEt8tkp4=;
 b=doV/YsPMjbZWumawG16LSTXvaXbvbIqQJK+85kUXXkHAqlMAZVew+GoeoiCXhoOmKf
 Wf0mAtYzU4Hd+RfB7y3yWvTvV6tKv/loIBWkpybrAz8acGW7g9XeULyIVtXWkMvcPHaS
 0gg1yLhXMCoP/YDMI2rzRqzpFHVsL5KTSQT4EYYoa7F0CHUkQsbvLUibPXIbz9+ABzBb
 Y/UPM+OeR6eJbHwglanaIz6WeaKJuk8rvBXbSiBXDBZMfTjFw+Cr3vzvKJY7adgj+T17
 5nGyl5G2Qddu698VpYLhBVb1HyQPtrSJuTEHLjVsDsOnPEKq/4C8xFJ4QyxIQdbAUt5M
 zoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m7OrC6vj4Ru9A4xIjIuXg2uQCm2nhCLjuUpyEt8tkp4=;
 b=rZ6J+YEogZMF6l24P0fucv1iHyxokBKDiQ4Rn6KPvPSfogIIUJyuk4sy2apJQMBYQY
 fpbb6MQ9rFTXeP0rfwvEi4PXsYng7KDIgVKDXnySLf+zH3+08igLGlULgHEhkifaptHM
 biOe2dF/xWcp7n1JM6rnvwCxO9W2fOXmv0rbRfoknga2Aqkz7PEOGL7EfLJcXuY51bjH
 FTGHU/4zPDJ/TlL6u56zV5SJ/HmJOPnvs1k+B9HA68E79RyDd7Ysv75Qm0Dib1x/YkHS
 LQz0hg92vemw36il/KHjoDu5fRmF4m+YWZRxM5WAqW1/ZZ4J4I2CB1fz+iCkQ8idwHTR
 oqeA==
X-Gm-Message-State: AOAM531P43689pDymBx4Xg8kzMSy3udpdElSGxZQyoDdBoJl/v0ERku6
 0cTSB61sxhOmn6uKaTATiruUndPZ5rIRUw==
X-Google-Smtp-Source: ABdhPJxHaKLGzIFoJky4dcK5r6tLtS/ecHY7Cyikt6QgG4Ix4m0ncb/XjwK//QYxBmD90AOX4tGT3Q==
X-Received: by 2002:a5d:56c9:: with SMTP id m9mr8280936wrw.422.1617269549475; 
 Thu, 01 Apr 2021 02:32:29 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id u17sm8760176wrw.51.2021.04.01.02.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 02:32:29 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: arm64: dts: mediatek: Add mt8183-pumpkin
 board
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>
Cc: mkorpershoek@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20210217205945.830006-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <86a6d071-007d-5a20-bd59-ba09054b9fc1@gmail.com>
Date: Thu, 1 Apr 2021 11:32:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210217205945.830006-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_103231_492386_A7B161E3 
X-CRM114-Status: GOOD (  15.23  )
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



On 17/02/2021 21:59, Fabien Parent wrote:
> Add binding documentation for the MT8183 Pumpkin board.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Whole series applied to v5.12-next/dts64

Thanks!

> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 53f0d4e3ea98..8f5a625cfb3d 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -123,6 +123,10 @@ properties:
>            - const: google,krane-sku176
>            - const: google,krane
>            - const: mediatek,mt8183
> +      - items:
> +          - enum:
> +              - mediatek,mt8183-pumpkin
> +          - const: mediatek,mt8183
>  
>  additionalProperties: true
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
