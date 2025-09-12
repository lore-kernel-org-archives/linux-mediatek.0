Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7968BCA101F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 22:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/ALLDcBZ6nZwBY7ZN6L7gT+4ClMkunGI751uMEjico=; b=bBePKg1gCrlBVfWgjYZsX0DhSZ
	n65pvIs1m38ftqEWmT7nw6hrZd8ivJGRAZEgbWqCtofZcJbNgS0VRT5bSxjkczoTt9Eew7S2j0HXy
	8kT9okRp3uLStY+YwN2HhrbPpmOGPbmx5sonpnRRS5VSK64V8znx5yOrTCZIzeKC1yz4wMgMzdGgF
	XHeBj/vt3PeTjxXREKzdcH/iAnAbUAVEc0FmR7ViTB55cpprOy1nqUTMTaNJVPju0xr8LPX2w+mdT
	cmCur4OGjkZBhBGb4f8VaIuGknGoc56JjQmGDWbsZ1kS4LWXsEygdjJXzBQfLVAukl2PdpRMddYV+
	sRrbGfjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxCeb-0000000Bxdj-0urY;
	Fri, 12 Sep 2025 22:54:05 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxCeY-0000000BxcH-30dQ
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Sep 2025 22:54:03 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-62bb2e28ba9so78938d50.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Sep 2025 15:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757717641; x=1758322441; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/ALLDcBZ6nZwBY7ZN6L7gT+4ClMkunGI751uMEjico=;
        b=GvlGaV3EgZi9mNmw6W92x7+hDJuDUf5bDmj0cyZpj4FNH3AAAKWUeDuYlfG37XM+Bi
         iAG1HVRKWOcnsMUqX2W/bVzoawqz61uIl1IyW5yDfJK/IFxQcQ09juXsaeh0BKtyq3+H
         EY2Y7Fm/8+Ag2AKlzsYCEQR4mcL156kLfbPwFFkPucgWlGi+JMbfgoEmOVUVk8ZyKOzU
         l59lMLvUjGmq6LrAzNUOZkh5suhUr9cvSI2q/pUterMwN6g5hpdktO0eo8jzkTxcbgF3
         qzC/VuF+YabFzs+Ji2wP3De3ugrnm354w/ijACmO9nLlWbAxJZJe9+v5rguQsL5s0qk+
         +p8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757717641; x=1758322441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/ALLDcBZ6nZwBY7ZN6L7gT+4ClMkunGI751uMEjico=;
        b=OCB1w2xqt9n9PuJFBbq85DN/hstVeDMg1RZSWZs1drEHlsV7nTPiNrqXLnZCrdmUBp
         nkDHpoK/IcmgaoiI6DUbHzEPkOKgktpa1yQzrft/3VOMiq+HBTFUkhivoZSoOJDZQaW+
         jTRLQfXNOBQI2jBcLGDOe5Uqbt4VwAOAOmeHnvqU8JhA5Oql6dxPmNBsE3IEzvhbGRgj
         pRl42qtPcwnbPey/EJXFQ6PijSe8poHToGnjtAvpRgoGAoFtaLRO/4WssHCBvueRYYiC
         ThEjZ9o+HXgs48bkB41N20noeHd65LbUB+9PsIfVet8J0vSpEYjgnt77PlujvCKpKK1L
         yiaA==
X-Forwarded-Encrypted: i=1; AJvYcCWU4L4FgaRbTjXP19kbEwtGLe/hm9T+CMXGwsWvsJhB/dvJsG2wcvWyI0952wnU/jd9DFiIzgYABs4+QFc1yw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlElZz6Q1IffDLyh2aUOa27DySV5i5VGrkVvAW7semC7vD8LxH
	qckzZC6maIr1zNvaxtf95IJTsgO10uVGyluQAwXNtaJrw2aGd1OVxyFVVhVBLfMnu63+vGTmaIQ
	O01Pl1Wp5ZMHu608mc/ofMs5eskIayn0=
X-Gm-Gg: ASbGnctV0knmwIX76SyvA5do1zIxjpwM+alGEflroRxcH1N8V6f846dYhKnQ2UdZmv2
	dXmzeZq4+7NMG9dreZWFW8MkQDZHc/PDHvT8AyJlC9rt+JXxpUEOAxvG6hEyN7TzXmkPsH1L3GE
	5lxG6XRYETuS+3l27KGJj0QdXsw8gtXMk4MI+Ygrr8SjUa4Oh05rq4L9Smt2flmHjFlkRudIJaL
	cvLL0kNGGXGuA/iZpp+njN6stFQwcZpOYw38xvDLelCmHmNQeUFRP4zMljaGwK9VNupoQ3wRHHE
	j98UVRc=
X-Google-Smtp-Source: AGHT+IGmrPKfHKqLuLVsedBSU1D7fMJ0SPSt1pUu9IK0SCtyHO6OiaCBaQyBDxty6OWXlqg3nf3oT3Kb2tAQnhUAUk8=
X-Received: by 2002:a53:7101:0:b0:626:842f:818c with SMTP id
 956f58d0204a3-6272297979cmr3570059d50.24.1757717641302; Fri, 12 Sep 2025
 15:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com> <20250912-mt8196-gpufreq-v2-9-779a8a3729d9@collabora.com>
In-Reply-To: <20250912-mt8196-gpufreq-v2-9-779a8a3729d9@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 12 Sep 2025 15:53:50 -0700
X-Gm-Features: AS18NWAVsbHM7asbGyyRZapaZP5ufrQUasUcMY0V45b2pm9dui9MQp5I0XZOq0k
Message-ID: <CAPaKu7TEN++z8r68k_4-iCyMLMthqJBUX35pgXupAHPdfttrYg@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] drm/panthor: devfreq: add pluggable devfreq providers
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_155402_764464_2E6C479B 
X-CRM114-Status: GOOD (  19.45  )
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

On Fri, Sep 12, 2025 at 11:38=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
<snipped>
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/=
panthor/panthor_devfreq.h
> index a891cb5fdc34636444f141e10f5d45828fc35b51..94c9768d5d038c4ba8516929e=
db565a1f13443fb 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.h
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
> @@ -8,6 +8,7 @@
>
>  struct devfreq;
>  struct thermal_cooling_device;
> +struct platform_device;
>
>  struct panthor_device;
>
> @@ -43,6 +44,19 @@ struct panthor_devfreq {
>         spinlock_t lock;
>  };
>
> +struct panthor_devfreq_provider {
> +       /** @dev: device pointer to the provider device */
> +       struct device *dev;
> +       /**
> +        * @init: the provider's init callback that allocates a
> +        * &struct panthor_devfreq, adds it to panthor, and adds a devfre=
q
> +        * device to panthor. Will be called during panthor's probe.
> +        */
> +       int (*init)(struct panthor_device *ptdev, struct device *dev);
> +
> +       struct list_head node;
> +};
On mt8196, we have performance-domains to replace several other
properties: clocks, *-supply, power-domains, operating-points-v2.
There are also quirks, such as GPU_SHADER_PRESENT should be masked by
GF_REG_SHADER_PRESENT. It feels like that the scope of
panthor_devfreq_provider is more broader, and at least the naming is
not right.

Another issue is I am not sure if we need to expose panthor_device
internals to the provider. mtk_mfg accesses very few fields of
panthor_device. It seems we can make the two less coupled.

I might change my view as mtk_mfg evolves and requires tigher
integration with panthor. But as is, I might prefer for mtk_mfg to
live under drivers/soc/mediatek and provide a header for panthor to
use in soc-specific path.


> +
>
>  int panthor_devfreq_init(struct panthor_device *ptdev);
>
> @@ -57,4 +71,6 @@ int panthor_devfreq_get_dev_status(struct device *dev,
>
>  unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev);
>
> +int panthor_devfreq_register_provider(struct panthor_devfreq_provider *p=
rov);
> +
>  #endif /* __PANTHOR_DEVFREQ_H__ */
>
> --
> 2.51.0
>

