Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB25C369C8
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 10:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p18jL2hLutiaep38fb0ejRXREkRooHh3eI3tmn6pG+o=; b=ZWOGpa/gPIT5OaeD/NdvTbHTVF
	/1x67rM8APMgzxpNycwPPyLLRD0fQ5ZDD2SrrZTKabwWJsOFF2tQURAyO3CQIbg2qZDWhjH7iGyme
	fGX2fSEGgNcCIL/ME5KZvDD+xZOZtdH4fn6ykIGr2xM5nbLib68YgKiNVMoBr+9t2hDhNtqlF4cd8
	zTHd7Xuyjsss1l1TktpfZHbyV/NNsawjed4NzmRstl4Ohn+LPE9B0sE0N6nv2mqDXYGn/fH+62zic
	CLWQ9Tdxrswz8/18lf1UYkst6H5qtOGBGG0Q9pBY3vehYIPBtB+9MLtRlRbrX45Ru7gdnNaXgJvmx
	AfLMqzPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stPZa-00000004mZC-0TeU;
	Wed, 25 Sep 2024 10:48:42 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stPVH-00000004lqN-0v9F
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 10:44:18 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-710e910dd7dso3649358a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 03:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727261053; x=1727865853; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p18jL2hLutiaep38fb0ejRXREkRooHh3eI3tmn6pG+o=;
        b=khQY2ktPi/UuISKiBOHZK1dldbrX3w7tXmtX5Omh/qvy/OvPF7ktb0eF4g9FcGM+h0
         WyGzm/i9lcy0Z3KhmaZvGerekp5kcMZ4Ck5Mo9t0kn0HByxSQEZXXBhXP6Ak7iU+/Pnr
         rRUoxIFpB/C8Q8K0Ltkzd7KuKMWztBaSDaa8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727261053; x=1727865853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p18jL2hLutiaep38fb0ejRXREkRooHh3eI3tmn6pG+o=;
        b=tBQ2oT4fUDfjygNmoFX+kPc0NhjTTMxD8shf0mSmckxwGcZsbl+G5V9KA+eOsK2+X+
         CvkUIrxc0gxt612lHeB/2H4TknZ112TLrCEkDGdtxo9ReSZgkULIwaat24WmEoTHmSaA
         EO3MUw1srTV0Noy2VyguQFyZY+7m5yZtqdAQIg9SE2P+oYHqOFYuVky7YpH1nA8Ov31Y
         V18lj7+xGKf8Ay0iFbPp4yr03zYdk1fx//PrZ0ZrCGfhV1eNJZwQq95dPZK71rHzd/1A
         quYBfkenXweK7X+IVqOxu05QtKIQmL7AyFZIn+BB+G7p447Y8RYmAl08VY41rnsPxSyY
         QaRw==
X-Forwarded-Encrypted: i=1; AJvYcCVxJvrnH35S6WsxatJ5Q2UxVlXGDYtjOJiCeQPm+EdT+W1KhjIuc/FJpmBwqLGeSJFGXzihYcsxFH6F3rUp/w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4gdPWpT3kHehe0Z/uW6WVT22Umg1ZtrOl8gV5b4eHHZTHGcIq
	IA6oHi9ygqII6/GI6b3Ojr9KO7cqUATfflMEGu1tJ0jTmGaFH9bMbouuZSyOQuWBzJvhGcx53t6
	OOeYP+nVhWojJW6GqeDe0GsDVfor3otshEoujZSSZzNhe8ZXajw==
X-Google-Smtp-Source: AGHT+IGhoxWoyLCZ1aRxjjHIcUx8YFuna6OqcImZMuxL9OA/2tyXvCgmuAskMzvWBQ9WRNUkhBGHynShOaLw7Va2Cdk=
X-Received: by 2002:a05:6830:3894:b0:70f:6f4f:e8d9 with SMTP id
 46e09a7af769-713c7e2e146mr2486302a34.20.1727261053556; Wed, 25 Sep 2024
 03:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240919094212.1902073-1-treapking@chromium.org> <172676985046.765320.3471835988677145017.robh@kernel.org>
In-Reply-To: <172676985046.765320.3471835988677145017.robh@kernel.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 25 Sep 2024 18:44:02 +0800
Message-ID: <CAEXTbpeATBYmHpCYAGhiecVeH=+R8=E0aLLscnKV4QyVbfrWJw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: mediatek: mt8183-pumpkin: add HDMI support
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_034415_333258_D274DFC5 
X-CRM114-Status: GOOD (  22.56  )
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

On Fri, Sep 20, 2024 at 2:18=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Thu, 19 Sep 2024 17:41:49 +0800, Pin-yen Lin wrote:
> > From: Fabien Parent <fparent@baylibre.com>
> >
> > The MT8183 Pumpkin board has a micro-HDMI connector. HDMI support is
> > provided by an IT66121 DPI <-> HDMI bridge.
> >
> > Enable the DPI and add the node for the IT66121 bridge.
> >
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > Co-developed-by: Pin-yen Lin <treapking@chromium.org>
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> >
> > ---
> >
> > Changes in v3:
> > - Update commit message and fix formatting issues
> > - Fix the label name of vcn33 regulator
> >
> >  .../boot/dts/mediatek/mt8183-pumpkin.dts      | 123 ++++++++++++++++++
> >  1 file changed, 123 insertions(+)
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> New warnings running 'make CHECK_DTBS=3Dy mediatek/mt8183-pumpkin.dtb' fo=
r 20240919094212.1902073-1-treapking@chromium.org:
>
> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: dpi@14015000: power-doma=
ins: False schema does not allow [[76, 7]]
>         from schema $id: http://devicetree.org/schemas/display/mediatek/m=
ediatek,dpi.yaml#

This warning will be addressed by
https://lore.kernel.org/all/20240919112152.2829765-2-rohiagar@chromium.org/=
,
and it comes from the dtsi file this patch includes.

Regards,
Pin-yen
>
>
>
>
>

