Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75930109B469
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2026 13:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsHouUjM/sX6MNpZdJ+2Xl09xrG1oeKuiE+2byGWXSQ=; b=Zz8PhJvGRnlEuJvSmGSBsvliUU
	doOg/3FrrvkOwWv2wKw+V+gdvjyb3XTWHxqvEIhSbf4VtXsFchgNIw1RzFoKvGVzEYx2KX+2KQxoi
	9BNMtaUj+KNj0Ohuye1HZ3FySwt9/RMu8t2RYfO3PkgqWDdxQaeBkZOwSO3PD/r0TD0PT0MGAtIQo
	5vrxMogH/6du7N1mO3FEs0kgwBrwbvcX3VSC4HSymV9AeglLat4RtolY26gCWNGNH8pirFdYxJuud
	jtSFGOZU0djH/VgFnNO3qdEY21eAJaoFhnoRTY+WbeQ0CsDjGEQpFD+9s9EU5w3zrcUF5A9NazH17
	jChm5BoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Z25-0000000D0KH-2cq5;
	Tue, 31 Mar 2026 13:21:25 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Z23-0000000D0Jc-1M92
	for linux-mediatek@lists.infradead.org;
	Tue, 31 Mar 2026 13:21:24 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-650221149e2so3464145d50.0
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Mar 2026 06:21:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774963281; cv=none;
        d=google.com; s=arc-20240605;
        b=Jv/07A7VEiKfroaOKr/vgyau5gsRGbmJ8kJTP04SwHhXeBBepGgQ0mzbdGJp7A4aOL
         UEg2khIGh4JH9JxDF4kkFs7f6ZVoSN+zBOt4jlNhPBA7rdyJqa9kQBmxhqaGN3B3g6ER
         3QnWe+OPoaV1eGFclOyLSmogf0Z6wmOO7ETDsaOI0uyLKOfbDgMMarCFEPt4D0Ieb9jF
         rFI5NGCP518VrAFpvYdVtdko8IM8iC7NuByysRPsM/ZKlcQDA129vx+MHZOQzwKV6gEq
         Wy8N4+0CaP3ouYL1fCOZFC5V8USYzrgWV6cToPrVsuyxNs99mP94oGoCWpWEyABZ1AIh
         Bxew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TsHouUjM/sX6MNpZdJ+2Xl09xrG1oeKuiE+2byGWXSQ=;
        fh=MyaxuvPh0Gy5xL+wcMMJ/fxW9Qd5mFxcbeRgDk+x1SY=;
        b=SruBJiB2ez6cHxZ4ff2qwwQVAMtBSinpkC4mOC+hL8Z7ff9yMsYLAWb0Oy2Ap7/bWy
         faVhNSGWdyxWU8kfuNUOeako6A7G6+GCJTQh2VeV8y975nAfEuQqO4ssY+8EvX4ViuiR
         Px+uQpg89zMthVGLtAZIthtpN6uRPgysSwpAG6+ZNCnnyqWqyCT2VBTecAI8fuOrEClm
         uFhpW7p1rH98iXWTKbSuJIL7e7zUYbHxputPxUBvas/pnlvbi7FF8xCyI7jR6UBzpTnB
         5yOHF8lFYnuFTY3BqVJj7QVBZk2cMjdx4SsqpHU4fAKuu2nTL98eVnMJyHXOrXbtVYOL
         9uVg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774963281; x=1775568081; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsHouUjM/sX6MNpZdJ+2Xl09xrG1oeKuiE+2byGWXSQ=;
        b=LAYHZITMJToHIS5+duW5CKrXzx2ZTXPysPgsYQFOIDCCOpJ9ek3RcSrviK26gt2O3A
         wTTCNUbD9ObfPwx/CQHuRgbziHtB7OslPEC6AswmQXAOqrJbhsgiZOlpY9NXsSjR4NM/
         fe2zUTCpnOb0eSevYDzJQ+Yq3DkFANauWJO674N50EmLGLljA4mlxnQgZqgxMx3mMPLd
         zAzXafpCs5MUsRcNfWRob6sSH6uAfTwyIEP+/fwXe4pDHn1cZFS1/LnZP6x6ofb+Erhy
         FSgko9ygMUX/1CLWCvJ7IP3hdjwsw7l1bKFAiTxDNimvqOCSQnNK3e8O9JjxON/1Xcqe
         BiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774963281; x=1775568081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TsHouUjM/sX6MNpZdJ+2Xl09xrG1oeKuiE+2byGWXSQ=;
        b=cvyHr1rhyyhqjuFoDTkmV1iu8hl6Kty2N1RdyysGFmoM7jXBo+qVGoDaDnoRK1zEwr
         kk/F3DNLOpq0lOqyh2Iva6kZ2tMvnUvZsFdBW3R1ZEKZtYx4/po5Gm5AaAEoUY8IH8LR
         UODGsGSbQGB/mkRWeZCPQ14Vw84u8rk6bXiqjE9Dgk6m/9ipyMo9XZ0yzhAVkB7ORAVz
         bY4yloK1RRz2EDG7Kr91Okdvi54sYA04UmbSywLS/l8QOTmsjnMMYXHJLx1Tn3N/NCgs
         swaX2py6G/myf5hM6GLj9gWStfTi2PRw1hKKI3tJUxfciCgzqYHBs+Sm3bPhsLoU/2Mc
         1d6A==
X-Forwarded-Encrypted: i=1; AJvYcCXlggiVfeHE9jtVKXYjF3VvTBqXxnTWP76HyN1Fj4dY0uR+/i1LIugL2VTaViXEH6RpEuPQyeSiWD+A5kEvvw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn6lernG2hKWzp3RGi00v20DqISO+aUTSB1hwXxs0uQSc75RSY
	wkRbGCw3Tggz/IkVgeurzu37Jmkd+pvkhkJ3s5uUbhN7bH4ulUIW4PAOZHqK1nMSNGgwixGgE3d
	0+GcUem9iKAno15uoTwa27ZQC/WhhSTY=
X-Gm-Gg: ATEYQzzND2Y42DKOK3UdzujIESPRnZY+uFl3Tl0ctWuGafUsAojBKXF7IiSu2QOIQTS
	7o3cPyGrmt6zXIPZFwGzWErcMpMbJbXRyo3dUT4pjv9dkQVugRIcbQQQxzbQ+HgPo3sJUAFhxRl
	Syw0jeegVaZTtzKidxuuiw9CE+1EroghZbYzvvS1ZdEBR2Kn52mfwdCsBW9AcRa0a2A+jpxSzI+
	3CGpWDxtzU8q38dLbC8Ki7/C8ZAGfWATBYUcbUdcEZeIJSyYc4epV1BylrbWLbP7HQtE7sj+Kpj
	gRnK6l72cgj/ZVdsI4Mx/h3qBZvOY+7ppPxfudAnRn4PNOLq3iiy2Gs083B6YSYi707j7Q==
X-Received: by 2002:a05:690e:4106:b0:650:1203:b18e with SMTP id
 956f58d0204a3-6501203b3a5mr10132128d50.73.1774963281252; Tue, 31 Mar 2026
 06:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260330-mt7927-bt-support-v4-0-cecc025e7062@jetm.me>
In-Reply-To: <20260330-mt7927-bt-support-v4-0-cecc025e7062@jetm.me>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 31 Mar 2026 09:21:09 -0400
X-Gm-Features: AQROBzA8Gvb6W-nwoEVCHeIegRAguGDmKStqgZKVOgir3Am0LgLVxEFaOOAfJvw
Message-ID: <CABBYNZ+MFJU=LLEaizYEt1b-7VzosErkav7dyneZExr_rLUnRA@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] Bluetooth: Add MediaTek MT7927 (MT6639) support
To: Javier Tia <floss@jetm.me>
Cc: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Ryan Gilbert <xelnaga@gmail.com>, 
	Jose Tiburcio Ribeiro Netto <jnetto@mineiro.io>, Llewellyn Curran <melinko2003@gmail.com>, 
	Chapuis Dario <chapuisdario4@gmail.com>, Evgeny Kapusta <3193631@gmail.com>, 
	Nitin Gurram <nitin.reddy88@gmail.com>, Thibaut FRANCOIS <tibo@humeurlibre.fr>, 
	Ivan Lubnin <lubnin.ivan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_062123_398213_9A436150 
X-CRM114-Status: GOOD (  26.08  )
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

Hi Javier,

On Mon, Mar 30, 2026 at 4:39=E2=80=AFPM Javier Tia <floss@jetm.me> wrote:
>
> combo WiFi 7 + BT 5.4 module. The BT subsystem uses hardware variant
> 0x6639 and connects via USB.
>
> The MT7927 is shipping in motherboards and PCIe add-in cards from ASUS,
> Gigabyte, Lenovo, MSI, and TP-Link since mid-2024. Without these patches,
> users see "Unsupported hardware variant (00006639)" or the BT subsystem
> hangs during firmware download.
>
> The series consists of eight patches:
>
>   [1/8] Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support
>   [2/8] Bluetooth: btmtk: fix ISO interface setup for single alt setting
>   [3/8] Bluetooth: btusb: Add MT7927 ID for ASUS ROG Crosshair X870E Hero
>   [4/8] Bluetooth: btusb: Add MT7927 ID for Lenovo Legion Pro 7 16ARX9
>   [5/8] Bluetooth: btusb: Add MT7927 ID for Gigabyte Z790 AORUS MASTER X
>   [6/8] Bluetooth: btusb: Add MT7927 ID for MSI X870E Ace Max
>   [7/8] Bluetooth: btusb: Add MT7927 ID for TP-Link Archer TBE550E
>   [8/8] Bluetooth: btusb: Add MT7927 ID for ASUS X870E / ProArt X870E-Cre=
ator
>
> Three driver changes are needed for MT6639 (patch 1):
>
> 1. CHIPID workaround: On some boards the BT USB MMIO register reads
>    0x0000 for dev_id. Force dev_id to 0x6639 only when the USB VID/PID
>    matches a known MT6639 device, avoiding misdetection if a future
>    chip also reads zero. This follows the WiFi-side pattern.
>
> 2. Firmware naming: MT6639 uses firmware version prefix "2_1" instead of
>    "1_1" used by MT7925 and other variants. The firmware path is
>    mediatek/mt7927/BT_RAM_CODE_MT6639_2_1_hdr.bin, using the mt7927
>    directory to match the WiFi firmware convention. The filename will
>    likely change to use MT7927 once MediaTek submits a dedicated
>    Linux firmware binary.
>
> 3. Section filtering: The firmware binary contains 9 sections, but only
>    sections with (dlmodecrctype & 0xff) =3D=3D 0x01 are Bluetooth-related=
.
>    Sending WiFi/other sections causes an irreversible BT subsystem hang.
>
> Patch 2 fixes the ISO interface setup for devices that expose only a
> single alternate setting (alt 0) on the ISO endpoint. Without this fix,
> btmtk_usb_claim_iso_intf() fails with EINVAL, causing ~20 second
> initialization delays on 13d3:3588 devices.

Ok, but on 8/8 it seem to suggest the problem still exists which
trigger the following review:

https://sashiko.dev/#/patchset/20260330-mt7927-bt-support-v4-0-cecc025e7062=
%40jetm.me

Perhaps we should ajust the commit description if the 19 seconds
doesn't really occurs when 2/8 is applied.

> WBS (Wideband Speech) was verified on MT7927 hardware. The controller
> reports LMP_TRANSPARENT, LMP_ERR_DATA_REPORTING, and mSBC codec support.
> A btmon capture confirms eSCO links establish with Transparent air mode
> (mSBC) and 60-byte frames. BTUSB_WIDEBAND_SPEECH is correct for this
> controller family.
>
> Tested on:
> - ASUS ROG Crosshair X870E Hero (USB 0489:e13a)
> - ASUS ROG STRIX X870E-E (USB 13d3:3588)
> - ASUS ROG STRIX B850-E GAMING WIFI (USB 0489:e13a)
> - Gigabyte Z790 AORUS MASTER X (USB 0489:e10f)
> - Lenovo Legion Pro 7 16ARX9 (USB 0489:e0fa)
>
> Changes in v4:
> - Pass dev_id as parameter to btmtk_setup_firmware_79xx instead of
>   using hci_get_priv, which is not available in btmtksdio
>   (suggested by Luiz Augusto von Dentz)
> - Skip post-reset CHIPID validation for 0x6639 in
>   btmtk_usb_subsys_reset since the register always returns 0x0000
>   on affected boards
>
> Link to v3: https://lore.kernel.org/linux-bluetooth/20260326-mt7927-bt-su=
pport-v3-0-fa7ebd424323@jetm.me/
>
> Signed-off-by: Javier Tia <floss@jetm.me>
> ---
> Javier Tia (8):
>       Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support
>       Bluetooth: btmtk: fix ISO interface setup for single alt setting
>       Bluetooth: btusb: Add MT7927 ID for ASUS ROG Crosshair X870E Hero
>       Bluetooth: btusb: Add MT7927 ID for Lenovo Legion Pro 7 16ARX9
>       Bluetooth: btusb: Add MT7927 ID for Gigabyte Z790 AORUS MASTER X
>       Bluetooth: btusb: Add MT7927 ID for MSI X870E Ace Max
>       Bluetooth: btusb: Add MT7927 ID for TP-Link Archer TBE550E
>       Bluetooth: btusb: Add MT7927 ID for ASUS X870E / ProArt X870E-Creat=
or
>
>  drivers/bluetooth/btmtk.c     | 63 +++++++++++++++++++++++++++++++++++++=
+-----
>  drivers/bluetooth/btmtk.h     |  7 +++--
>  drivers/bluetooth/btmtksdio.c |  2 +-
>  drivers/bluetooth/btusb.c     | 12 +++++++++
>  4 files changed, 75 insertions(+), 9 deletions(-)
> ---
> base-commit: 7f9446b23ac77f46d356b354ea8da49113e8000d
> change-id: 20260305-mt7927-bt-support-6589a50c961f
>
> Best regards,
> --
> Javier Tia <floss@jetm.me>
>


--=20
Luiz Augusto von Dentz

