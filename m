Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCF8C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 03:20:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 794BD2312E
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 03:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 794BD2312E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Je2S1wzWu46RFopvyW4rdM4VtpaN7Q8ULuyf7h6N3L8=; b=IK9oETstXDUWKVU1VzMQ8bYxN
	8O4k+qE1LEpr1OYwQAXD807Z9oZTA+voJvKi1TFkyDYcyUOAk4brrMe3infa7p6plPyc84gnmU08t
	OEtGcx3SBEzLic4+We7NOGoM5qm9oBeNKmSCEnps1Swkt1vC/KNLTQNrOlAAbNBeSZ630WyxpL2en
	M2qNtmlXBM3G/MUAaKaeOyBBgQPaTWdsjwDdqfATjXJDYGqTmXA1ghFuZPmZ8xRviGkwtPG8v7+dk
	gKfAzfpF3nOnL5P2r33PaD1AEmSnWbs83pjQfqibP4SVIsSNcPWSyz1MRnu/KEphyODjErWy26qYu
	oeGTJ12sA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzWi8-00066H-4P; Wed, 13 Jan 2021 03:20:40 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzWi2-00064b-P9; Wed, 13 Jan 2021 03:20:35 +0000
Received: by mail-oi1-f179.google.com with SMTP id 9so685338oiq.3;
 Tue, 12 Jan 2021 19:20:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8dk16yY6ROEx2ZBdQQaewADnm6C4MWl8oKfBEbYvqAc=;
 b=FlDVWUBCvYfwoA+RtJ71Zk6g34jX4Q4dB1W0WO6LUmLrRYqseAdjU74d0eNsjJA5xl
 /iaGpUeF3NTotUG7MWMgVo/TxBu9Z8tmZsbnBptSeW2OYDZTioiT50yYSTkYuh9CRsPw
 AnhnTBYZuT8GNYbzxEUXj9+Fwms/Ryb3Wy2ICvD3AFrZyFohhwOvAHC9XVSYei8jhvNd
 duyL+LUyqcGtGI7WJ70hT6Qe2xbVkH4wyy0SyJaOFJeoLMFCy9ildyPoKBsUivI9ryVe
 4mDWPQWY2+1q6hCwBHHgMBcy7d1HBrNZeJDdg0fQMrF0yED2vRc4WDrmrXtfLns9IOrd
 74gA==
X-Gm-Message-State: AOAM533inzUJZIxYAvG4x0yb8pQn7in/wXh3j5iwCvA4wuO+/78yJdJT
 ouoSyFZGlvCGqNosEh5L8Q==
X-Google-Smtp-Source: ABdhPJyO/aeAqrUrw1G7s5ZPVCcMwNt0fZfQ160zpREu2UZ+0rRFizUvDDwYAZGu/mPgjfV5aMpFZw==
X-Received: by 2002:aca:f15:: with SMTP id 21mr112652oip.109.1610508033749;
 Tue, 12 Jan 2021 19:20:33 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v207sm163066oif.58.2021.01.12.19.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 19:20:32 -0800 (PST)
Received: (nullmailer pid 1464648 invoked by uid 1000);
 Wed, 13 Jan 2021 03:20:31 -0000
Date: Tue, 12 Jan 2021 21:20:31 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: mt8183: Add krane-sku0 board.
Message-ID: <20210113032031.GA1460993@robh.at.kernel.org>
References: <20210107052206.2599844-1-hsinyi@chromium.org>
 <20210107052206.2599844-2-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107052206.2599844-2-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_222035_023517_1A0DD65E 
X-CRM114-Status: GOOD (  16.09  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 07, 2021 at 01:22:06PM +0800, Hsin-Yi Wang wrote:
> Similar to krane-sku176 but using a different panel source.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> Change:
> v2: move compatible to board dts
> ---
>  .../devicetree/bindings/arm/mediatek.yaml     |  1 +
>  arch/arm64/boot/dts/mediatek/Makefile         |  1 +
>  .../dts/mediatek/mt8183-kukui-krane-sku0.dts  | 23 +++++++++++++++++++
>  3 files changed, 25 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 53f0d4e3ea982..3276f7a2ce672 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -120,6 +120,7 @@ properties:
>            - const: mediatek,mt8183
>        - description: Google Krane (Lenovo IdeaPad Duet, 10e,...)
>          items:
> +          - const: google,krane-sku0
>            - const: google,krane-sku176
>            - const: google,krane
>            - const: mediatek,mt8183

This says you must have all 4 compatible strings in the order listed. 
That doesn't match your dts. I assume you want the first 2 under an 
'enum' so there's 3 strings with the first one being sku0 or sku176?

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
