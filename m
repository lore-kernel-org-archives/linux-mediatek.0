Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A14EC636D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 15:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAmFGspOZMSPZfnaoWYmVR2MjZajqXp66cfwHSIQL14=; b=Xw8lCoWBrlGw1jMIWXAIPwfMOf
	/tyciFVcgj7bd43Z5dKGGrqdko0IwNNxymF9yv+TuPKXnd8fch+pJcrpoqVl6FKNhZMgkuyXdfDiP
	cd+mx2d5tR9e8iRkwU+yfES8CVZy+Ur11QuKEAPIsSFXywzjs3aSnVOA1zJgaoC8ivfssZXgQDMeY
	zNPufg5N1XBYMWT+ih91dLsfo8LKoaFkWs/NlyqPRABkm0X1RSXn1YyWSA7J8TZVayJUXaPrJJAAW
	h8tAusF4tNceAfag7DKYGQ30fr2oCXCeGmdQ/pl/RuHGrcrI8shY/IUbsg5nVxn/kj5vWVtTzF0Sd
	uZEqgCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUnj-008lZe-GD; Tue, 21 Feb 2023 15:43:31 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUlj-008kM8-Gq; Tue, 21 Feb 2023 15:41:28 +0000
Received: by mail-oo1-f44.google.com with SMTP id m39-20020a4a952a000000b00524f932a4baso171260ooi.13;
        Tue, 21 Feb 2023 07:41:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAmFGspOZMSPZfnaoWYmVR2MjZajqXp66cfwHSIQL14=;
        b=DAR/6IhByYwU2bm+lhNnuqr8y2zdUBIkIbxfeGxbpIi2g0AAagr14UOvHfjbT37wMt
         sN8yciJGQ+uapqmZJ/e66j6xZk25+5Pjomibyf08KmCZJ5P//aOl9+rSw9DE1P5QN4Ne
         N3WE59mJM1ZBa02x8AwRGeGnD8yXaXPDyfe6FekSzvZFCuYv79efptbF7/gZmJNkDYoF
         /AewsiIezvZiFt8Qri5HMTCnImR14UoYfYOGb+74EHN9gav96efh1rib2nE/A7j83o/L
         7ckoy2ElLpE/5k/j+fHd39oMUmXWGiK+aToKzs8NYwWx15deYL7aMOICjfGPB2SHKFPi
         CV1g==
X-Gm-Message-State: AO0yUKWCJjXf5Lu9JsALQNXYocG5mAwQJuTzrIcXAyU7dPHRuX9/rsrS
	mUMOPxWhpgoLf3XmgCMCBA==
X-Google-Smtp-Source: AK7set85VAFntiNHIDjGtfCC2oOT1/ixiwDzGmV6KZlRV3vcVPs11dYw0ZIvaGYFHStwN8BXxG0AZg==
X-Received: by 2002:a4a:b6c3:0:b0:51f:e966:e3b7 with SMTP id w3-20020a4ab6c3000000b0051fe966e3b7mr1792287ooo.3.1676994086229;
        Tue, 21 Feb 2023 07:41:26 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bf7-20020a056820174700b0051ff746e2b2sm293867oob.8.2023.02.21.07.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 07:41:25 -0800 (PST)
Received: (nullmailer pid 2586813 invoked by uid 1000);
	Tue, 21 Feb 2023 15:41:24 -0000
Date: Tue, 21 Feb 2023 09:41:24 -0600
From: Rob Herring <robh@kernel.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Benson Leung <bleung@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: display: bridge: Add ddc-i2c-bus for
 anx7688
Message-ID: <20230221154124.GA2584323-robh@kernel.org>
References: <20230218111712.2380225-1-treapking@chromium.org>
 <20230218111712.2380225-2-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230218111712.2380225-2-treapking@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_074127_588759_C8A41584 
X-CRM114-Status: GOOD (  17.04  )
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

On Sat, Feb 18, 2023 at 07:17:08PM +0800, Pin-yen Lin wrote:
> Introduce a optional "ddc-i2c-bus" property for anx7688 bridge. This
> allows the bridge to register a .get_edid callback.

What's .get_edid? This is a binding and is independent of Linux.

> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
> 
> Changes in v3:
> - New in v3
> 
>  .../bindings/display/bridge/google,cros-ec-anx7688.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> index a44d025d33bd..9d5ce8172e88 100644
> --- a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> @@ -25,6 +25,10 @@ properties:
>      maxItems: 1
>      description: I2C address of the device.
>  
> +  ddc-i2c-bus:
> +    description: phandle link to the I2C controller used for DDC EDID probing
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +

No, this belongs in the connector node. The DDC signals are routed to 
the connector, not the bridge chip.

Rob

