Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C8BC3DA59
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 15:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxJdvG4GHPuYd2T0/+njfFwbHisz/VRVz1QjmDGv7Rg=; b=wz/H1UfYBgFgKhN3VemVAJQC9v
	Hc7F6ZJ7EQT3XNVttV9p8XsvXBxfb1YJLuGQgwiRTgjEnb4CHtj8O/Y4vgtl5umaLJjqnsrdyaCP0
	WWYT0He1mnYzrWXjzjiLN2tB0IrzLT88YtAQw66GWpTOA2NIIbK3pKMk4AsRaAW/bSZwsrIcUvvu+
	2HPAJ853VZelyQR3sdiApAOPuic/TYxApWW5fJ1OSi0B3AWs7BN6XP2r0zHJvXh7fG6TPrJ9pYQjR
	5iIkZgEfIctBsAT5fGTlZKRrk0M7cGb/Ws+a9XHbAZNeSkhgtazL9c9IgRWGWwCcGO5/fX+Ninw62
	1UGmVp3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUpEO-000000032ec-3bcU;
	Fri, 19 Jul 2024 15:09:12 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUpE1-000000032XG-3ud1;
	Fri, 19 Jul 2024 15:08:51 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2eea8ea8bb0so39027671fa.1;
        Fri, 19 Jul 2024 08:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721401728; x=1722006528; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxJdvG4GHPuYd2T0/+njfFwbHisz/VRVz1QjmDGv7Rg=;
        b=mZEyTeUH8C5sS3XyBGVtvGoCVflnhiqJXPvlPKQjm2bHFUxF8C35IC9sQ+9Ay2ZrXP
         W7rOug/BAAATAhpyypQWid/4ETiFqQ1OkJU+2nxtu9/0rdfpkyBCRoKIJsVQryRUlJZr
         hv7P1GGIwgGduPDHbrP9j9INZO8wdinYxe2oR0RHC0rqsgJVnCz0Sd2eqVupZYiE29u8
         /O8chs/Bif839GPCgXOY4lYtzbDvpYq/BlzdDxy70MmSc2su8oQ/26QQ3QS3uHwJiSZW
         6+WVVV+6K9dd4z9ov2BHpaFYOwvB5SY+9KjCYS3uZIIb1XW838olLLueD5QBRHRuAXkg
         jHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721401728; x=1722006528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxJdvG4GHPuYd2T0/+njfFwbHisz/VRVz1QjmDGv7Rg=;
        b=oGCyUSGDkjI7ARjBeP22IwwMsQJqmOpvQaCmK7Z6UJgL4pG+cgYcGGiVslj8UuhdzM
         SfekKovJYfaSPSxUE3D72wGi/KT13+B1rAtH3IMgMa2yT9mar/E8zwt/V/YPfHHOfoqC
         r0eHYezsYlHXolNyuCwOOqwMs2U8a+fifopTKA4n3WJakSMHPVs7tf4Fk4OkPhExTj6u
         HSJOeb4rdG3KFSn7WLQ9LkkdB5hSMuEq7rq7mLSqk+WI1MDDhOxob0DypSXB9zrdFteQ
         VSv1Nle3lDIK3U5uptWhplaFxie+v9Eh9P1pTS0lNZuWcgw8ng4nR7pLESWAZIkcyUqB
         mg1w==
X-Forwarded-Encrypted: i=1; AJvYcCXD4WPtK9DEZEez5rSxLqB+PRX1FqQXbU6o/NzUP4KSRyrGbo1rcJqHmpTpYDQWICM3Ms1Vwg49KzbycHR5GfH128UGwse8U61oaLen3zqqM8hWOe6aauXsNszFXK5NMK+HrlprS1VVQtFfgIply7nf5n6dTtBL1WI=
X-Gm-Message-State: AOJu0YxuAk7rC6WIll4JZ/S6P4+8e59o+HdL8/GNkqLd2kyCx4l4D2xh
	NxPFy2hxAnDfE+O8gPgknI7Jg7vdWuCFN9hLLT1RwaVub/nSDvgkCOOFgrXpEQk4prFOLV0dVcJ
	24EW2UZk3aHZmoint+B0xb+/LUDI=
X-Google-Smtp-Source: AGHT+IEKV6/lwbIVyxNP3HduGa6GJ48kF+FAfzn+2GtakQhGWGSSWW/vvNhiHswsej3AtB2nD3zNghHPoKfaW/ZXyxs=
X-Received: by 2002:a2e:84ca:0:b0:2ee:8f3d:e68d with SMTP id
 38308e7fff4ca-2ef1685d099mr393111fa.44.1721401727500; Fri, 19 Jul 2024
 08:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240719100554.4183635-1-arnd@kernel.org>
In-Reply-To: <20240719100554.4183635-1-arnd@kernel.org>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 19 Jul 2024 11:08:34 -0400
Message-ID: <CABBYNZKFD7axR5ZSGJL7mn=_mKufGnxopUeeZhL+AL40jWQjzQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtk: add USB dependencies
To: Arnd Bergmann <arnd@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sean Wang <sean.wang@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>, 
	Tedd Ho-Jeong An <tedd.an@intel.com>, Hector Martin <marcan@marcan.st>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Niklas Schnelle <schnelle@linux.ibm.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_080849_994297_0838A8C3 
X-CRM114-Status: GOOD (  19.04  )
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

Hi Arnd,

On Fri, Jul 19, 2024 at 6:06=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The mediatek bluetooth drivers have a common portion that is now used for
> all front-ends (usb, sdio, uart) but that internally relies on USB
> interface functions:
>
> ERROR: modpost: "usb_alloc_urb" [drivers/bluetooth/btmtk.ko] undefined!
> ERROR: modpost: "usb_anchor_urb" [drivers/bluetooth/btmtk.ko] undefined!
> ERROR: modpost: "usb_submit_urb" [drivers/bluetooth/btmtk.ko] undefined!
> ERROR: modpost: "usb_free_urb" [drivers/bluetooth/btmtk.ko] undefined!
> ERROR: modpost: "usb_unanchor_urb" [drivers/bluetooth/btmtk.ko] undefined=
!
> ERROR: modpost: "usb_kill_anchored_urbs" [drivers/bluetooth/btmtk.ko] und=
efined!
> ERROR: modpost: "usb_set_interface" [drivers/bluetooth/btmtk.ko] undefine=
d!
> ERROR: modpost: "usb_control_msg" [drivers/bluetooth/btmtk.ko] undefined!
>
> It would be possible to split this up further, but in practice anything
> that uses this driver will have USB enabled anyway and it only matters
> for build testing, so just go with a much stricter dependency.
>
> Fixes: f5c3f98946e3 ("Bluetooth: btmtkuart: rely on BT_MTK module")
> Fixes: 3a722044aacf ("Bluetooth: btmtksido: rely on BT_MTK module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/bluetooth/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
> index 44a2de58337b..2894a345562c 100644
> --- a/drivers/bluetooth/Kconfig
> +++ b/drivers/bluetooth/Kconfig
> @@ -21,6 +21,7 @@ config BT_QCA
>
>  config BT_MTK
>         tristate
> +       depends on USB
>         select FW_LOADER
>
>  config BT_HCIBTUSB
> @@ -413,6 +414,7 @@ config BT_ATH3K
>  config BT_MTKSDIO
>         tristate "MediaTek HCI SDIO driver"
>         depends on MMC
> +       depends on USB
>         select BT_MTK
>         help
>           MediaTek Bluetooth HCI SDIO driver.
> @@ -425,6 +427,7 @@ config BT_MTKSDIO
>  config BT_MTKUART
>         tristate "MediaTek HCI UART driver"
>         depends on SERIAL_DEV_BUS
> +       depends on USB
>         select BT_MTK
>         help
>           MediaTek Bluetooth HCI UART driver.
> --
> 2.39.2

Thanks for the fix, but we went with a different one:
https://patchwork.kernel.org/project/bluetooth/patch/20240719033019.26767-1=
-chris.lu@mediatek.com/

--=20
Luiz Augusto von Dentz

