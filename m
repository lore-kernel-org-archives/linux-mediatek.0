Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72335C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 08:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/LaRze2iReVdITozRxpSW8O9Q/FJCbbeSJegkgQVeM=; b=ltJyXeTbRmVXjwNRLJgH8fINJH
	SEaQq+Ibm4bMTeEPiC5YQS90wEjy1P0JASPO7DpwfYRRMBIQJMbZ9RRxHCkJBZZB/RP31ZviSHfuX
	uR3iB2eXEHxCZ3GZ+qjVPlEHRnTi2Byq9OPVjSPDdQr5tx8fV3BMEJkp5MCFEi2MrS0EhjnKvg17N
	yGqiQnzyvkL1wDQQJRiJNBnL36tB8OcmRczubPFiby8lXe8jCGVtHcOrJqE3ULPtXHnZDdbYZiBWA
	fZ6zCQSzTVxNk75Dr+cbHgb032fMlAmN6TbBdvqs8Pr4xTCFWF+8OKiDgcibjjkFHfLK2Ih5zqvj8
	w0KHLvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEkL-00000003PoB-3ABk;
	Wed, 29 May 2024 08:33:21 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEkI-00000003Plm-1P86
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 08:33:20 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52b119986f2so324971e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 29 May 2024 01:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716971592; x=1717576392; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/LaRze2iReVdITozRxpSW8O9Q/FJCbbeSJegkgQVeM=;
        b=gAh4DlBvyF3MPXHXJgdZoRr5qiEnSlNoGOdrp5oAiG9Ie8yRDjum1n90WyimXh6RF6
         jbgmlMwgabb12ejLDcq3c9LuZd1mV51sEIUFQWOLw1h7L01XGRUq6ZhpfZHIQ1zuqf8U
         X0mvAUSH+gBKZ+lldf+wF8KcXSCriJKq+sKvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716971592; x=1717576392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/LaRze2iReVdITozRxpSW8O9Q/FJCbbeSJegkgQVeM=;
        b=xRkxP5Gg4g+l7g/Ilpm83miH/2grbX7oZ+DlgxsL9f1WA2tRyFC5Dl7bwMUcTNVpUe
         wXhK5CuyRcEXlwtfS6IQh4Ema5yL29MOOxaGq5OQTEAfFdDK2LxYCCqlhDGnDrQ+ZZqX
         XSfeXbmFBqhPxA1RngF6GmqUPS/14jexoOdie74uFpGXP+00rMa69+LpKdpFWozYWMg3
         Al1L4aeU1PwF7P96ClMEX9zc7QiwaRulGmm6Mr8T7q/06cX+bBKNu3kVHdpwZa5u2hcy
         eYEzSoeNQsB9PuvK9mVQduRuq9r0cwXF4If7d/fAAZBZAeQyUip227aEYcQgA99tcY1Y
         Vbsw==
X-Forwarded-Encrypted: i=1; AJvYcCVlo6/GDOkSxxEucn+0mQfhCrurH+CNzZWxbxs0kGpMyarhvytL16jaIrSaiqqkVb/sDlBnzYeMu3Q2hBLiNItZbtUETgwk5aUi/qrhZnDRy56W
X-Gm-Message-State: AOJu0YxPFWUpUrEB4oSbMu9JfUrp3Qy2ulhyPhklGPa3REl+V9BQ1Z0V
	bP5HR/IkJja/8JRqgh2pnMCWyn8idWX+bsJs94zKjMNJXQYljZBdg9H3Cu12gXC/Qk0Bg5b2vjj
	dLp0wy8urUulPBCEGuMcXCKoEFAG2CvtyDy9B
X-Google-Smtp-Source: AGHT+IHcO+FygnC0TbWkPGa0nLxOhGY7/OgenVpFufgaX9HqoJKiSuswBtm8hAFMkn+oyxq2QoDGhVBhj3hQ94XJHIU=
X-Received: by 2002:a05:6512:4da:b0:52b:78c5:b058 with SMTP id
 2adb3069b0e04-52b78c5b216mr44428e87.17.1716971592060; Wed, 29 May 2024
 01:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com>
 <20240529-mtk-thermal-mt818x-dtsi-v6-4-0c71478a9c37@baylibre.com> <75826085-fd59-466a-b1de-b4c323c801c1@collabora.com>
In-Reply-To: <75826085-fd59-466a-b1de-b4c323c801c1@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 May 2024 16:33:01 +0800
Message-ID: <CAGXv+5FPG4ob3mTU0Utm8Wgk0_ZLw=NLPbfFerWh4OUeAz7UHw@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] arm64: dts: mediatek: mt8186: add default thermal zones
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Julien Panis <jpanis@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Nicolas Pitre <npitre@baylibre.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_013318_400403_F98052DC 
X-CRM114-Status: GOOD (  11.31  )
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

On Wed, May 29, 2024 at 4:17=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/05/24 07:57, Julien Panis ha scritto:
> > From: Nicolas Pitre <npitre@baylibre.com>
> >
> > Inspired by the vendor kernel but adapted to the upstream thermal
> > driver version.
> >
> > Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> > Signed-off-by: Julien Panis <jpanis@baylibre.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

I'm getting some crazy readings which would cause the machine to
immediately shutdown during boot. Anyone else see this? Or maybe
my device has bad calibration data?

gpu_thermal-virtual-0
Adapter: Virtual device
temp1:       +229.7 C

nna_thermal-virtual-0
Adapter: Virtual device
temp1:       +229.7 C

cpu_big0_thermal-virtual-0
Adapter: Virtual device
temp1:         -7.2 C

cpu_little2_thermal-virtual-0
Adapter: Virtual device
temp1:       +157.2 C

cpu_little0_thermal-virtual-0
Adapter: Virtual device
temp1:       -277.1 C

adsp_thermal-virtual-0
Adapter: Virtual device
temp1:       +229.7 C

cpu_big1_thermal-virtual-0
Adapter: Virtual device
temp1:       +229.7 C

cam_thermal-virtual-0
Adapter: Virtual device
temp1:        +45.4 C

cpu_little1_thermal-virtual-0
Adapter: Virtual device
temp1:       -241.8 C

