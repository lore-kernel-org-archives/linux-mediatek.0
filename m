Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5A9C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MvL4FM6K7sFiatPoW9lB13zR0/OGaSTbkxaFtIhuADo=; b=u+02wes06wCbz1cnA0sZvmUaht
	BF3kEIycwI4EITbbMcuTTXA4GRH6sQCxP6ZSobDyBKAJrywhvEUtQXSrGCrbieFXD6Sxp6Hv0EK8b
	0SnzcJJqllLCOiOTvKSyFVC+064mRDlNYM+glf+R+CXIoj8FHQjLaowExxF87SYUU0tRedBKJwXGQ
	wS9J7s2iZOrMWY7pySz0L8iMs1YbZTA8qrBivlTvKpdKbPMjk2MDtQDAka99rIJQs/D6Bt3BoF82M
	c98GZeEG66TXgnC7h8Ny68WmmgslHgtGlnv3FG99OGRFYkFjJeGHevBAycd07EfjGtw3tvj4OUvBE
	YOtE2ZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pklu0-00AGYw-2L;
	Fri, 07 Apr 2023 13:13:16 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkltw-00AGWf-1a
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 13:13:14 +0000
Received: by mail-yb1-xb36.google.com with SMTP id d3so21064693ybu.1
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 06:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680873191; x=1683465191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvL4FM6K7sFiatPoW9lB13zR0/OGaSTbkxaFtIhuADo=;
        b=ukJ76x9GiFfA5bEM7OvmkeAGsaMYAsJaXFxWNRyp2t0bW6KfuLZcxoXAUsp7FVyKZZ
         D4iBeU0jqNAV+EnZ+7LnoS+/TSlWoUVEFwZQf/l0y60k1/fvTf77U+ZHgFdefKIEvK3M
         89onXFwEIffZ63yNNQcLSILEcYbnBRZIQYv5uJS686o9uCL/za2Tl0itkXWt8Z/F8FLc
         23ke2JENVLlGxQ2Q538u2enguzOmet1kXFEp9FBMHKhnqjagebk/V39dBGFCl/4J/D23
         q8ydzwvox3k3IdgUTuaiFJfj+QAX5hnvF/DeyqeJn4Ts6Eb2fICWY1EPQXrVwDEZPc0X
         +etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680873191; x=1683465191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvL4FM6K7sFiatPoW9lB13zR0/OGaSTbkxaFtIhuADo=;
        b=HpaQz7A4LTWH6YDLsSWpMhy/2QIopfY3ExfyAK449UlEJl2h8bk9/9E0rjDkm41l7e
         yKtk0lw5yio/u8nxMtLqxToeioBwjEyX1rbGvpyqueaR+pkF+fkG27768Xp5bNd8AhT7
         FDMdRIg9dpuKw6FI5lDUq6EF8orr/nItgiKRGbKOirKFv/HEmCfRjXCsVn6cooBm6MlU
         NHTy8SiNHTiHYyOThC/E4Jb7HQPg9HB+oDXVhOVTk2INmlUXmZVZsRDiFSa1V5Wc8IHX
         GorDVKBusy+pn21yQ8g8Rt8SFYxdyeDayUyWLcVm0LP49D+ajJLb6wsMJs0CLRNKIUUW
         0UAQ==
X-Gm-Message-State: AAQBX9donTM74QxlPHGPMujRndo2h1T8m98P+4TV/v6fswuM+xaaJIDQ
	XbhJcEXfaqIHTIIwTkGc52+NWYrcPpKK017MI0mLsg==
X-Google-Smtp-Source: AKy350aCRZnuELD2k32jpyfqMWnAcFkkXBqQEV+LvaQFGGo1MZu+6ebnj20/GbABh6hYrIQtMyIogGEdSSEzQbd8Nf4=
X-Received: by 2002:a25:d994:0:b0:b33:531b:3dd4 with SMTP id
 q142-20020a25d994000000b00b33531b3dd4mr1373350ybg.1.1680873191647; Fri, 07
 Apr 2023 06:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com> <20230203-evk-board-support-v5-7-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-7-1883c1b405ad@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 7 Apr 2023 15:13:00 +0200
Message-ID: <CAFGrd9oRoqsE=eNDbT4o+j5s_3zwOLi_RsFnVPEW=0MXCMZjFg@mail.gmail.com>
Subject: Re: [PATCH v5 07/12] arm64: dts: mediatek: set vmc regulator as
 always on
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	catalin.marinas@arm.com, Will Deacon <will@kernel.org>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_061312_600277_853781DC 
X-CRM114-Status: GOOD (  13.93  )
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

Le ven. 7 avr. 2023 =C3=A0 14:59, <amergnat@baylibre.com> a =C3=A9crit :
>
> From: Fabien Parent <fparent@baylibre.com>
>
> MSDC1 IP block is powered by VMC. Make sure it is always on.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boo=
t/dts/mediatek/mt8365-evk.dts
> index cd920d09c3fe..1c36d8f19525 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -137,6 +137,11 @@ &mt6357_pmic {
>         #interrupt-cells =3D <2>;
>  };
>
> +/* Needed by MSDC1 */
> +&mt6357_vmc_reg {
> +       regulator-always-on;
> +};
> +
>  &pio {
>         gpio_keys: gpio-keys-pins {
>                 pins {
>
> --
> 2.25.1
>

