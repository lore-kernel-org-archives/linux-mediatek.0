Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A1CC54791
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 08:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yweG9hIRFKQyYo1fdZnUFpZABdTF+shxA3D5c1UT5oQ=; b=Ipf84VyMrSdlBo4Ff7ooVai6OG
	ijpi7rJc5ZOCjYrVrRROddsiA91xnJL9CU9m5bDnkDsFlrzQHwYYz16GJAu0VHqix0ZHj/8KokcNb
	0nzeEN769GdhnOz06KvJaTgYKrlB+klVxoxJwAWtEgcY/vs6y+Etp/QXkdZWKw6Ptq3wU5TAeGbQA
	yhB8IhlRVrHstafp0Ptkw0dbmJNjtt89dmWqr8UU+N24Qmwo3ebOmJrhmTHLEfFspYWD1S0Qx+/7C
	cSGeKiyE3YoOuFEPa2kYH/ySrmZyr0NoDe0Lf0+5H7mRVghHRquDKXMdtTeaSGXSzFkLtEO274hvn
	bJfKHsxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkKMU-00000009Nyy-3I6Z;
	Wed, 13 Mar 2024 08:53:22 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkKMQ-00000009Nw9-02gL;
	Wed, 13 Mar 2024 08:53:19 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a3fb8b0b7acso579462766b.2;
        Wed, 13 Mar 2024 01:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710319996; x=1710924796; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yweG9hIRFKQyYo1fdZnUFpZABdTF+shxA3D5c1UT5oQ=;
        b=Gc8PW2PAvrKPHBN6iXDMmUaBKsxXe1MP9qQ3xqAoGNFJiYpq85z1Ewdn5+o9OndHQL
         +rMkjgAMvet64bkBVZ08VQ49t1kpjwJm/h/2yKjBYUoh6hbUVZvH5CzCu9vtkA1GWygY
         +excslzkIHXvO6UbBjM3unuuR283fMSQmAMYE/31UxsQGjvv6uQFyG8d2gj4W9PA6iQd
         qCKPfA9b1dpjbUlq0yJLqOk5P8uUdegNQ+Me7JBuepoEAl8aCWaqq4F5Z29jN3mkyil3
         SNuU/pyZJlPKawfvjLYe/2OdxkoQB1rhhaTjrGvYr/hdSbTmp30VszIWEYEgP7OD/bO/
         4wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710319996; x=1710924796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yweG9hIRFKQyYo1fdZnUFpZABdTF+shxA3D5c1UT5oQ=;
        b=iHjldIvU9dM4pfkSxmXtiewYCnB6b0rRDfFrSY+0b6pbf1iSaG+BTOAoPBPLesUBgz
         I4n1D6iF4UJFWA+Eq4zfJ3PVjL3de6XOIC84Sn6wzu2u2S8QSqw32CdfEqElbt6d2Cyw
         GTRC0Nxm2cZWrB7DcGmQ2akXw45xEQGYGvAJZBkv24AzypfA/838HHOq8CSXjxLyxdqF
         tmVJNwr84X79f4KuACot/5xKDorIyruRNAnqCBZ7KXd7ZzmKP0b7o6QUHLgT19QDCO7u
         rfl3RJe0RwYIBjYYZTTO1fpeIp2Vqv7vpl6KeqSMLykew8+xSdYYfoO6f0//IEqbSUkB
         zAVw==
X-Forwarded-Encrypted: i=1; AJvYcCV5eLZbH/3DUeP5nhveoN/F39dEEBEihPAVdh5mGRnaZiFJt+CS2LCvEUDbhv1vFcf/fxUpxzdjmWmlP0T3YzAEFs6P2N7wYx+INjPhES87WZ4F8VueMcRCBp5rZTkFrH82vEyIYcMiAltccI4xG3wf88funuer3sE=
X-Gm-Message-State: AOJu0Yw0Prd4OKd3xoGj3Njf0iikD42A1ImEpuKWFr1rF+CGGiDFUqXy
	tkpsgi5Pwducu4oajZ6Vnf1BCkF0aUNEljM+lFgwHMoyDyIKGebuKRqknocFmpzNiJ3ZjoHlapR
	fR4ZYr/8WRygLvnYHXOk7t1AXtdc=
X-Google-Smtp-Source: AGHT+IHd7J08pBgHLCf0ztlZ+XbOs+MP1ljuQd/tESI75Rxy4WQcrvNZX9ixvTusQ+jNH4dl3fGrVimzFVut5HkR/UA=
X-Received: by 2002:a17:907:7d8f:b0:a46:3ce4:5acb with SMTP id
 oz15-20020a1709077d8f00b00a463ce45acbmr2346152ejc.75.1710319995868; Wed, 13
 Mar 2024 01:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240313054409.8073-1-zhi.mao@mediatek.com>
In-Reply-To: <20240313054409.8073-1-zhi.mao@mediatek.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 13 Mar 2024 10:52:39 +0200
Message-ID: <CAHp75VeHVJpiaCTdQHWQocE9PFLsGhu+a2TP7VSV34i02v-ksA@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: i2c: Add support for GC05A2 sensor
To: Zhi Mao <zhi.mao@mediatek.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	shengnan.wang@mediatek.com, yaya.chang@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, yunkec@chromium.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, jacopo.mondi@ideasonboard.com, 
	10572168@qq.com, hverkuil-cisco@xs4all.nl, heiko@sntech.de, 
	jernej.skrabec@gmail.com, macromorgan@hotmail.com, linus.walleij@linaro.org, 
	hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com, 
	gerald.loacker@wolfvision.net, bingbu.cao@intel.com, 
	dan.scally@ideasonboard.com, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_015318_070065_17905B78 
X-CRM114-Status: GOOD (  11.59  )
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

On Wed, Mar 13, 2024 at 7:54=E2=80=AFAM Zhi Mao <zhi.mao@mediatek.com> wrot=
e:
>
> This series adds YAML DT binding and V4L2 sub-device driver for Galaxycor=
e's
> GC05A2 5-megapixel 10-bit RAW CMOS 1/5" sensor, with an MIPI CSI-2 image =
data
> interface and the I2C control bus.
>
> The driver is implemented with V4L2 framework.
>  - Async registered as a V4L2 sub-device.
>  - As the first component of camera system including Seninf, ISP pipeline=
.
>  - A media entity that provides one source pad in common.
>  - Used in camera features on ChromeOS application.
>
> Also this driver supports following features:
>  - manual exposure and analog gain control support
>  - vertical blanking control support
>  - test pattern support
>  - media controller support
>  - runtime PM support
>  - support resolution: 2592x1944@30fps, 1280x720@60fps

Not even going to do a thorough review as one should learn on the
previous reviews. Most of the comments that I had given to another
driver submission are applicable here. So, waiting for v2 with all
applicable being addressed.

--=20
With Best Regards,
Andy Shevchenko

