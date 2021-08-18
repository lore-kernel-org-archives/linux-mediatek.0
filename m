Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB212C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 01:20:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB21D60C3E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 01:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB21D60C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h0Qip/Uqw6WGOaFOZx5+XMDdIM2TCZ3MtJajlkjjqSM=; b=0n0bqab5kzz7iW
	Olp9rUihNTdm4ILcQ2NxJnLGlStGfA9Spdp+uXqqXV+qurR9f9oy0OrH4NqO2c069w1Heg1MDGvkv
	pftX+upYqCPjL+be157kvvrafnTJSF2fq1FphHU/xfSQ0GRG0TS4niNT0EHJRgPTnIVXLZ5aXMmZF
	Vg+OI3eMrv3VRCo3qUdkcNnHQpX7yqL/5+GHPEtMpBkLtgY8MZGO9nU8zNzIEDv5BaasA7NNAuEff
	A9PhORIHylZRwBYo4R9CgAcRc/LuDMEU4Vy8MQ+QznbMfR/l5b5af4gKRiwnER7WZtlYs6OqSgFhw
	nG9DLEVYTtgacJMS+MVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGAFl-003ret-HV; Wed, 18 Aug 2021 01:20:25 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGAFU-003rcN-RI; Wed, 18 Aug 2021 01:20:10 +0000
Received: by mail-oi1-f169.google.com with SMTP id u10so2128183oiw.4;
 Tue, 17 Aug 2021 18:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+z3ILV1fVhurBfPQC3iXBEQ2csZiT8sJKpTVvArWqCg=;
 b=A8iE8aXdyRfoHBsmpl349v1uaHDtkefMLiF/SNYRMqBP0FHjZhT14ePiqAOKtDx7yo
 yoqzP/hcAwHxUXgnoKNfNQ+WKzF4XHnwXOju3aGGh4GnLlkoFzd8al/nb7lCI3S9TiHe
 w/und7Ng5CBWCpApctPEyvmnZ0rKA4Pk5E0+5ZBvf5UnxZUFwS7CwiLiCqTKqKwDDH4g
 ywD+ODnHbYs4G+dY1lTYOBU+niOToU3Jfw6svUzJYOhG5Np8fxr7cZARs5FtTBdnYSli
 JsfxOWAfs8fkt1j2/T6NDx/EzqdQrdVnnqrtP7BXluxtDVpnR64nxDQefS9C+rneBgwk
 ds7Q==
X-Gm-Message-State: AOAM532odM1hCrqO7kaxXE304V0l+mLaABwUppqmH5MMNnJWvRAH5zUa
 w6fN22CehuMGz8JPGLq70Q==
X-Google-Smtp-Source: ABdhPJxQxcNn3z/Tx3n1n06qxWShd5xmbfoiTFU7Ma9Drddtx9IGPWVaSH8gdzWvG7uNbFGtcCC5rg==
X-Received: by 2002:a54:4714:: with SMTP id k20mr4720831oik.103.1629249607974; 
 Tue, 17 Aug 2021 18:20:07 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o68sm735648ota.33.2021.08.17.18.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 18:20:07 -0700 (PDT)
Received: (nullmailer pid 1182094 invoked by uid 1000);
 Wed, 18 Aug 2021 01:20:05 -0000
Date: Tue, 17 Aug 2021 20:20:05 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Shih <sam.shih@mediatek.com>
Cc: John Crispin <john@phrozen.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 devicetree@vger.kernel.org, Sean Wang <sean.wang@kernel.org>,
 linux-watchdog@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Ryder Lee <Ryder.Lee@mediatek.com>,
 Matt Mackall <mpm@selenic.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-serial@vger.kernel.org, Seiya Wang <seiya.wang@mediatek.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-clk@vger.kernel.org
Subject: Re: [v2,01/12] dt-bindings: clock: mediatek: document clk bindings
 for mediatek mt7986 SoC
Message-ID: <YRxgRZ5VyXSPqY42@robh.at.kernel.org>
References: <20210817074557.30953-1-sam.shih@mediatek.com>
 <20210817074557.30953-2-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817074557.30953-2-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_182008_945860_CBD816E7 
X-CRM114-Status: GOOD (  12.22  )
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

On Tue, 17 Aug 2021 15:45:46 +0800, Sam Shih wrote:
> This patch adds the binding documentation for topckgen, apmixedsys,
> infracfg, and ethernet subsystem clocks.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
> v2: remove compatiable string 'mt7986-sgmiisys'
> 
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt    | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,ethsys.txt        | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,infracfg.txt      | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt      | 2 ++
>  .../devicetree/bindings/arm/mediatek/mediatek,topckgen.txt      | 1 +
>  5 files changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
