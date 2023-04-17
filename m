Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC849C77B76
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 13:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPiq0OVRi/FkSBkrx6r9kFVybHHOEdw9SmQm4viTMUc=; b=tzj5cdV2nBnBGjqrAanr854UiX
	ua4uEXnHs7m1ceX8BYnR6XtiSf6vSHVYaCtfWDZS88rCPjL4junPCJUAGpO68hYSk+1Ac2/ihxDZf
	4kR6OlbT0a/S8txI48vrJhF3JJPv5nhws8GPQLWDOcJX+4b5iveMogfEwXKSlyvqYL9YWvth6yCPj
	aWP1Qnm0rKGIMUROEfiKdd2nh+Ihc8RaHARHIWXxrxgDbFQ7iB6npueOT0v9Mg4iZeZ/y/ghA1zMH
	KNqy5vXu++hPDuDKkItzINolO8hwS8IFl+LRg919TuNhbWg/cA9syAnGYiluNoODzpGYQNpSXc+a2
	ZNfADAxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poOya-00GPMK-2i;
	Mon, 17 Apr 2023 13:33:00 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poOyX-00GPKY-1Z
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Apr 2023 13:32:59 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-94a34a0b531so587262366b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Apr 2023 06:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681738375; x=1684330375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPiq0OVRi/FkSBkrx6r9kFVybHHOEdw9SmQm4viTMUc=;
        b=HmaGMEqlD0daDB1jKy5x8/I2mHUSTv5MdkMvVgod2xVcHLDQWpfmEUu5hvCJhlB+uY
         RBIBvON9ydZaIZ5A0hEF3/JnYamojfOZPaNv0Fnl4KtKLUlLAYOm41hAjOu/nHweOkU7
         ah61rYpdk630cG/aRRas7+JhiblpbDRVJQmKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681738375; x=1684330375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPiq0OVRi/FkSBkrx6r9kFVybHHOEdw9SmQm4viTMUc=;
        b=b/uErCc7iHiALYO+yrhMXwa9hS93yDCjrYb+erpJrVtngCBDOCLkzRJOrlCa6husl0
         6QGthp9F9waoCITEj7Lkkit0c9S19P0wfGdr/gGYQQn84cgy5mcq6Gt/0VGZzBw1xPAf
         5B16wYKRt6O7zFwDHf9nxMMGul+Y9kAGvC8SW/DJ1VZpHZPAxBp7g7NFymQvyi5+KWPr
         8r5ve9sglI4GI6xnhsVnYt1wVYOic3/vyDth3goqoKbI0a19AvYjrT7W48vaYPAeqhFe
         Uz+oOk8jfCq/Ovhlj2wWsu5oQHWK3PkXyAIAWqyrhssxGQGVhJuIIeu4bDf4KjYdPglu
         /W7Q==
X-Gm-Message-State: AAQBX9fba1BXKeyQvgPAbYcaMBpUEGFCVIX7uFV+FYnfiMmItE+SSYiY
	OcZZolFeQtK9LBcASTf0dJZOMUAYEr2wE8WyMDgQJQ==
X-Google-Smtp-Source: AKy350aoC9m9Ur19AyGv9i384x9SXehHAen+6iCVhAMzCEFH5CRz6NPejsinYJTJb0hW30NFnCMMZQ==
X-Received: by 2002:a05:6402:189:b0:502:7d3f:25e9 with SMTP id r9-20020a056402018900b005027d3f25e9mr13994934edv.1.1681738374678;
        Mon, 17 Apr 2023 06:32:54 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id gq13-20020a170906e24d00b0094f17b7c4b0sm3720725ejb.134.2023.04.17.06.32.53
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 06:32:53 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id r15so4239086wmo.1
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Apr 2023 06:32:53 -0700 (PDT)
X-Received: by 2002:a05:600c:2308:b0:3f1:6980:2d34 with SMTP id
 8-20020a05600c230800b003f169802d34mr1272021wmo.6.1681738373434; Mon, 17 Apr
 2023 06:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230417123956.926266-1-treapking@chromium.org>
In-Reply-To: <20230417123956.926266-1-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 Apr 2023 06:32:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VoC2gK5MtBU9qhVxJwRRUGBMLT96UH7F+QKcmGEYo_sQ@mail.gmail.com>
Message-ID: <CAD=FV=VoC2gK5MtBU9qhVxJwRRUGBMLT96UH7F+QKcmGEYo_sQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8173: Power on panel regulator on boot
To: Pin-yen Lin <treapking@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_063257_543895_501C98CD 
X-CRM114-Status: GOOD (  12.85  )
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

Hi,

On Mon, Apr 17, 2023 at 5:40=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Add "regulator-boot-on" to "panel_fixed_3v3" to save time on powering
> the regulator during boot.  Also add "off-on-delay-us" to the node to
> make sure the regulator never violates the panel timing requirements.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> ---
>
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

