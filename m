Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A95C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 08:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKBUjvAaO51aRLSwsNxpmv6Zrpst/YuU45js8U+LIKU=; b=m/fH/Lhu6qBTQM
	wXf3KwRGP2ZRqBIjZ+l3q5uC1KjIIUFK9s+BUsALS5Gz0QRTJfr9pCB2v4x/ZfRXcL105ZvLoMLh9
	xXSqeId7dzH0mkymEuX02T9l720mSZJFKM4vEDWFvqKvc1rRybL016pHM2rkNFXhzR2vkwipdKU2G
	R7dhIaT+SRjBlPGGZ9NSwJPr96gXt4C2eeuTFeB1hIhwBwVwJp7Fe28MfOo3i4PFrvhTrGmuyF2pO
	B1t8T3sZ5qQOOXjNEE8I1Z3D2o5kxXyuzQlAPQLGpVPySnnzQ0kNaRbjk5NJjO5x7TadlF6FwVvV6
	kNyv/jcS+HGjIQZhO8Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njd3z-000Xbb-RX; Wed, 27 Apr 2022 08:30:19 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njd3n-000XYU-88
 for linux-mediatek@lists.infradead.org; Wed, 27 Apr 2022 08:30:10 +0000
Received: by mail-wr1-x42d.google.com with SMTP id t6so1420431wra.4
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Apr 2022 01:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=uuaqiUZLOsChqlXyKbpm6wvW7kQefLGVgCUO7BzQrzA=;
 b=e5BYU67ug0RadbCRKN+ByG3Mx0c2NoLtQ27jnqQ3gxBbZh913frGGgHnKGk7v5oH6K
 pGkmO+e9+W7xi6wl4R+z2t8uKEHXLkD+dNj9d7NmPdYbb/tFCPN6fbpMnqEtyQ3He1Sy
 2gLFvQgpW+Em0GIytTYd8cEfDYpX/3YClCO4XJW1AE4xatip0UMmrxYSYhxrWEP+nxe4
 YeUGf5dKDMN+FONVR0dWDI5xkfUPSjwgkvZiAxl3JSeuJ4/WGA4Vtzr6G4ahFWEZt+JG
 jShnercZP0dGNOSe1sZw+EPlKbLB8a1wfbRSWNquhhO4fe6i1wv0NEV8Fsg8U8V9TYGR
 i/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=uuaqiUZLOsChqlXyKbpm6wvW7kQefLGVgCUO7BzQrzA=;
 b=NYRy3k6rLFt0sxFFDjc74mvn1vksiyjcLpJP2yOBCCByCQ32BwOfY2b3mMn1QsSpdE
 eSK1JpdO5IqUfpw0V0NHqTn9/5pI1AbkxrP1TVQOEVXIi7xIetwdo5IPHymuPU/dEvbl
 REzZ7AQK4lIO/1HPJdmA6qXqw2Jvn8Jct69Bia7mbZDZe+JtcwCAcytpokHc2yKBb9of
 TSDjnmu7UYjU5CHRDGtI19IrF9MOQBuvU0Z6IA88SzbdtsYdA1tU9M1rWRTABuFf90Uw
 sgZXmkfCHf9f+l/M/3I4FcXTlHQMZgTVixsMMsj3LcQ/eiG9mMZdRHJPM+SL4jwa/4h9
 zk5A==
X-Gm-Message-State: AOAM5324eFY2KHZPhNaVQJgsxxXmuMIGne78nkeGvHZEn78XN8mCF5S2
 k+c89rAubto9s+SOMvwoSChcIQ==
X-Google-Smtp-Source: ABdhPJwAOFzgKXb5o0/gt/GLKEE9cIElWAjB3owyDIaR+6bxgF6h8F0cDofxMRbqsSW6prkSSXgJww==
X-Received: by 2002:a5d:48d0:0:b0:207:a861:dcc9 with SMTP id
 p16-20020a5d48d0000000b00207a861dcc9mr21855607wrs.490.1651048205092; 
 Wed, 27 Apr 2022 01:30:05 -0700 (PDT)
Received: from localhost (laubervilliers-656-1-151-143.w92-154.abo.wanadoo.fr.
 [92.154.18.143]) by smtp.gmail.com with ESMTPSA id
 m6-20020a1c2606000000b00393fbf75a56sm1044666wmm.29.2022.04.27.01.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 01:30:04 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-pumpkin: fix bad
 thermistor node name
In-Reply-To: <20220426164755.435372-1-fparent@baylibre.com>
References: <20220426164755.435372-1-fparent@baylibre.com>
Date: Wed, 27 Apr 2022 10:30:02 +0200
Message-ID: <87a6c753p1.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_013007_465238_08E265F6 
X-CRM114-Status: GOOD (  14.69  )
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

On Tue, Apr 26, 2022 at 18:47, Fabien Parent <fparent@baylibre.com> wrote:

> Fix the following dtbs_check error by using the correct node name:
> /home/fabo/build/linux/mt8183-pumpkin/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: ntc: $nodename:0: 'ntc' does not match '^thermistor(.*)?$'
> 	From schema: /home/fabo/devel/baylibre/linux-mainline/Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> index 10b2c0500219..3d6da7efe31b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> @@ -55,7 +55,7 @@ led-green {
>  		};
>  	};
>  
> -	ntc {
> +	thermistor {
>  		compatible = "murata,ncp03wf104";
>  		pullup-uv = <1800000>;
>  		pullup-ohm = <390000>;
> -- 
> 2.36.0
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
