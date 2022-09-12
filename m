Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88100ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 10:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pa6W1YODU5uWUjf7zUhRw95uZp1QNrawRSVyyiW7Vl0=; b=C8otYPHvXW18Ymz0/ot9ecICNj
	dSr06hYJsyRyzB1iyrzxbi5O2U8NDBmkwO3Y+U0ul6kXjrNap49KeuxkTFmKxPfb6mdKAVvZ+H7wk
	So+8dIriAcH0Aegz+zBMU8R+ih+GdSX5TFBH65+ksnpl8TXAZ4CI1P4IUOs2y//mjqPFsd/ECyChY
	auSFlbO7l90NHgiTAxA6CzoZPqGIuE+abEs5N8EkIV7hF7qRteS10zS4MMW8aytyUtP8L86KqQo98
	e87r9zcrstFXDpovnD2nDVUtB48zcUPaPs3S7KjHmhkDp3FN1x46B5ZXnKgUAgtcSuITj0j/kZRpR
	L79RLDog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXgnq-008qKs-PR; Mon, 12 Sep 2022 10:36:34 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXgkO-008mjs-CF
	for linux-mediatek@lists.infradead.org; Mon, 12 Sep 2022 10:33:02 +0000
Received: by mail-ed1-x52c.google.com with SMTP id z97so12020897ede.8
        for <linux-mediatek@lists.infradead.org>; Mon, 12 Sep 2022 03:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=pa6W1YODU5uWUjf7zUhRw95uZp1QNrawRSVyyiW7Vl0=;
        b=RbzFH4Z4USAJQAYUrNqiIlm2Ou3paeEKXx7EA6MqxzRIeMg5OYjW7hnVzCRokjI8Uh
         UlSugb4mjNXVJA3f+6Stg4HhjA1g6w4rzssqcy+trVOXpReT/SWY/DhL00wgMFauBPY4
         +9KqJAYCJwyhtrWvNCzGEsoSLnpJdz1zmnzBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pa6W1YODU5uWUjf7zUhRw95uZp1QNrawRSVyyiW7Vl0=;
        b=qGDdT8mgjveM9jS5qd3J18OmSGeVJTcAiOd3lI9zU4cX2jKnQVx59KcF4Fku0guivT
         /s2A2N6AJ0Je9HvSEvjkXK1Oftf+tAjRIcoQtEi3BHjQj1w0tKoZ9VhtrQIMemVnxnjY
         WljAPMyhprllUO4Ku3cul8yStFEePE+1oHS+SMx4buNiwSQxnRfT/uVBKc60Mt1H9U4C
         VkZ9cEEoMPhJR0VfISxbY+YbKdWBjrhgs6WWHt7Pl/o9c8WZaIiqk+zVp4Ja5ieWbU+n
         2DlDGGIPOPBJVQ52qXiYqlmDbld289nK7FYacojyWWmGb/kwajF1p2vz4Y2z+7jPzX5b
         OjPg==
X-Gm-Message-State: ACgBeo2k7BprqBfAxyKDYhozWSoXBocJWMxyLP59rBdXDSW+Frcpuh7b
	CkfliuHYcQRPn8OtdyxpaczxaytR5hz3tDFs56s44w==
X-Google-Smtp-Source: AA6agR4M8kUfW+1+K71sRAnTB0B7zC1boeAgnNmeFDTIx6IxH5frVa+UGb0pWsh9PfgPzIod9Cpy0WGwITz9nMf2SRs=
X-Received: by 2002:a05:6402:890:b0:44e:bb54:7f54 with SMTP id
 e16-20020a056402089000b0044ebb547f54mr22112611edy.307.1662978777293; Mon, 12
 Sep 2022 03:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220908171153.670762-1-nfraprado@collabora.com>
In-Reply-To: <20220908171153.670762-1-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Sep 2022 18:32:46 +0800
Message-ID: <CAGXv+5ERm1kXf+YgeDMOgkEY77Fx1o8FK=anWn22g7SAGXSfhw@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: mediatek: asurada: Enable internal display
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_033300_460088_2EF97AAE 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

On Fri, Sep 9, 2022 at 1:11 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
>
> This series adds and enables all components required to have a working
> internal display on the Asurada platform.
>
>
> N=C3=ADcolas F. R. A. Prado (3):
>   arm64: dts: mediatek: asurada: Add display regulators
>   arm64: dts: mediatek: asurada: Add display backlight
>   arm64: dts: mediatek: asurada: Enable internal display

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Tested _remotely_ on Hayato, with EDID read back correctly.

