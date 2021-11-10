Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE97C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:44:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 966026112E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 966026112E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UrBhxm2wnhoX/f0fut693o7Nw+T0Lskp+a/0U0AR5Es=; b=rKgfR4/UCzVf9/
	ltJwDAC7O9a45Hp9tXhLcqgsz3WYprkqFHAsszwbzLLM1mOkrPHDLIxdHkDI8j/k+b3210DU4EgdT
	c7Q2aEjP8fpIw6Z7y+An1RNzlmaeSC5suPmpO+jMAX5iPmpsH9nhNjeM3TTAZ7yaiASJpPkoNNYCa
	8jciDvettW0xzGCyIWgOOaOedmZ97FryrWOcAI/r+leO26AAH+1/tj5ZaqabUZ3JFEqbRoK27DMSb
	kMvjqK7LQLHNBC3iczWVun/IFruOsnmESCzTE6tk27kv5Gati/1utFkgKxayrb/809RZIsvvs9gbf
	qjDcC6/1xMifVPEtOntw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mktWa-006BcL-Tp; Wed, 10 Nov 2021 19:44:48 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mktWD-006BVq-Ki; Wed, 10 Nov 2021 19:44:27 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so5558818otl.3; 
 Wed, 10 Nov 2021 11:44:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=LwMY7yGoVHRADsH1iBdmXQvs2eZecM5ZTPN7Dz6EBk8=;
 b=SpXk39dLyUVKL8f2g0m2AE+srk81A682MARg8yPT+jzhUCYL9uqUFyA/u6xHl4TPX2
 KA6cbzabXFdzS6WDhEelT8heZUv9cJeUG9LP9k/qLd7cyduQ+oZ+Yff/wcb2l64UtSTs
 b878aNpRh1av2ORynQpS9BwWlMh/MdSD2I0Gi4iVIljzd0JpQhzUzn+Ov739dEYfviIZ
 qzpIQuLcVxKdEn3XT4e7zuOqjlRzYXRF82AsAiaQwDngtsG/BGxBoeDuBq8/bCv8UDSI
 5RZoEdRQ4Fo0sWJKjeGxj9m9+OZIqmECXvCfWJDkPpgTBD9o/BsVe+C182KkiVY/M7jy
 HJeQ==
X-Gm-Message-State: AOAM533lF50D4GKRhZRfYwIbndXQuRqJme3HRiFGFvBdfNtxZ/JrWDZi
 BlJERiyhLycxEfG2+UDMag==
X-Google-Smtp-Source: ABdhPJwhKGD3zE5gwHgBoQy1rxHWG/g8Q1BHdfqtTlTJi1rNu2B51GVLx0DXi7o9Y8ZiTLEAs3H9uQ==
X-Received: by 2002:a9d:8e9:: with SMTP id 96mr1491465otf.192.1636573464270;
 Wed, 10 Nov 2021 11:44:24 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t12sm169197oth.21.2021.11.10.11.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:44:23 -0800 (PST)
Received: (nullmailer pid 1783741 invoked by uid 1000);
 Wed, 10 Nov 2021 19:44:20 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Jitao shi <jitao.shi@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>
In-Reply-To: <20211110130623.20553-3-granquet@baylibre.com>
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-3-granquet@baylibre.com>
Subject: Re: [PATCH v6 2/7] dt-bindings: mediatek, dp: Add Display Port binding
Date: Wed, 10 Nov 2021 13:44:20 -0600
Message-Id: <1636573460.915903.1783740.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_114425_703387_89DF9596 
X-CRM114-Status: GOOD (  16.53  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 10 Nov 2021 14:06:18 +0100, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dts:20:18: fatal error: dt-bindings/power/mt8195-power.h: No such file or directory
   20 |         #include <dt-bindings/power/mt8195-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1553428

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
