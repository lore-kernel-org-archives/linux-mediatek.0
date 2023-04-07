Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084DBC77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4B39VyebJYnuGTjHcWDPxYe6oPc5V8Fl1158lshWAUY=; b=Qg0OjJiFff/fw4LtwBIO3AyhHn
	PpSG3Z1BMWPL/niC8ijYsd68h4HW8GrZdk66NSGr+AavzRj2XQoS/Yw7dkWlMXNINtNG0bzG/3xUL
	XYioGKgTQuIujEEhIKnXWOD///KIXOImHlSzTsr0wV8sLeHdjl3MmVUcSk4Pppm1bfPCSof1xsLpc
	aB2tGifqARL5woOhFsAaSfa7m8vTyUfMaa4kHTchd2EFTQA1Jjb9en5d3eMh2IE7+cIvcsEIRebZJ
	+ZeIbnMoFxP6OO6iY/4VSnpzSp7iNW5hoDMzq9FQok/vfae42z11vAuKCPXF6ihvv1Y0+vKv4RTsm
	oMA/gaMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pklr8-00AFeu-1t;
	Fri, 07 Apr 2023 13:10:18 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklr5-00AFdA-1O
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 13:10:16 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-54c061acbc9so115148307b3.11
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680873012; x=1683465012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4B39VyebJYnuGTjHcWDPxYe6oPc5V8Fl1158lshWAUY=;
        b=f53//PACP7kgOmszXV77uUvDMPT9Y61TmpZjdAW++41qj3A7aw+ir36/BtlIPyO3Kn
         i2ORUv2zWrELKrrquOBN3xLuhxSv0ET3weEr+ssjZADJk3DWzO02PeSVHsWd1uHeqvjn
         XBvA73Byqt3wilVvJtGKMV8oxjG8HG1lDrsg2plH/mTAk9d6SrTw4W37bpp14Nmsc/Ty
         AY0uqFeUWbq2xuTSjphtvf0QwZteTHm8qD46xt2SCYdyoIrVYj3anLDvYSLjj1wC8oTJ
         54yNVjhD+S7vU0IFIEsc8/G/dJM5otHT285DoNf/nX2R9WkcIyOLxYu4pN+wBsaQ2/Gz
         sEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680873012; x=1683465012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4B39VyebJYnuGTjHcWDPxYe6oPc5V8Fl1158lshWAUY=;
        b=Cg2ZG+amewg7UGVAiTa/JyMH2rzy9yEhGTF/JUiAUQsnliBZ4d9wPoFleRDDh7DrEO
         a349lc44SVpYYW94TNM7S38SdBvcopV+jdDOIfNwaijujMUwgvtW8AdV6XoKFkNt03pl
         9QjOzqCEWoo4D5pGtMezoq2zUn8eMT97rO9/Ne3krAMV/tVcJjIKxvoi9mK5kWHJ+bsw
         7iebxhgaxG92IxygbKlUkgkI17gmu/ghwrfLN2lymlKtzR5W91tyOblaG0/EFas7PX3J
         wvDvjrXhRbUmygwgdHgTAUat4mxOPkvIyKK3FNIA1FdX/6QGiWyHz0VEOBuc9uE6dZuL
         nKJg==
X-Gm-Message-State: AAQBX9dynUP2rQ3IedImybwit/Uc54tltLisDoFnkpyVeMB/6N6XhtAM
	SCUsLPUbzz4E/0oPU9LG2CjvKedipUnureZz8L2ilA==
X-Google-Smtp-Source: AKy350bJk0AACnynN0kqCLCkF/5dozOA90cXc4Q98GGea0b+hZw74doxVa3aZnouULl/xJ46a66T+ja5Kmji9UF77dY=
X-Received: by 2002:a81:441e:0:b0:540:e744:13ae with SMTP id
 r30-20020a81441e000000b00540e74413aemr1092692ywa.3.1680873011652; Fri, 07 Apr
 2023 06:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com> <20230203-evk-board-support-v5-1-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-1-1883c1b405ad@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 7 Apr 2023 15:10:00 +0200
Message-ID: <CAFGrd9p8gR+poX48ubMm9n6Rg1RaGqZR1BG22fJQYcjBzX0wOg@mail.gmail.com>
Subject: Re: [PATCH v5 01/12] arm64: defconfig: enable MT6357 regulator
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	Will Deacon <will@kernel.org>, catalin.marinas@arm.com
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_061015_515175_89F38D7D 
X-CRM114-Status: GOOD (  11.93  )
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

+ To: Catalin Marinas <catalin.marinas@arm.com>
+ To: Will Deacon <will@kernel.org>

Sorry for the noise.

Regards,
Alexandre

Le ven. 7 avr. 2023 =C3=A0 14:59, Alexandre Mergnat <amergnat@baylibre.com>=
 a =C3=A9crit :
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7790ee42c68a..e4cb65889ae6 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -685,6 +685,7 @@ CONFIG_REGULATOR_MAX77620=3Dy
>  CONFIG_REGULATOR_MAX8973=3Dy
>  CONFIG_REGULATOR_MP8859=3Dy
>  CONFIG_REGULATOR_MT6315=3Dm
> +CONFIG_REGULATOR_MT6357=3Dy
>  CONFIG_REGULATOR_MT6358=3Dy
>  CONFIG_REGULATOR_MT6359=3Dy
>  CONFIG_REGULATOR_MT6360=3Dy
>
> --
> 2.25.1
>

