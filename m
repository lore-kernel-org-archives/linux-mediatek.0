Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2280D10F2862
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2026 17:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LslZTbQuCgzCpaXkkqU/ikNfkg2VIP9zaNKZdPAylrs=; b=gs96AB4IWjF53SumTNchodKPB/
	zpSTv8o8oaYVOpUhSX7VTHrw5bxECyqN4hypwWLNsHRn8ffSjMzlG+XrNo9xQlprAhMpXae2RN+sI
	Dyk3+XvU5PJK+ay8wyPFLIjsrbYgDRft16/97132kmfYEFXvZL1Pync4vNSdBEt1kyROxOFM5+08r
	ngmHi7R33tuM4z776S1091J/OY0g0pPVDfkM0CfKs+Gp+hPUSqJ5hWRwqS3RL3a/Mpx0drv60+Z0v
	+D/+S7u+/TRyjJq/buD2KKQZORMKdmXEmIW+jWjbBKd/50tnsjw+YnUYfA+enYywT3yaFk8j5fFEN
	enVOH97A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BSF-00000007u4x-0Snh;
	Fri, 27 Mar 2026 17:58:43 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BSB-00000007u3S-3ia9
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Mar 2026 17:58:41 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-64ad019bbd4so3049764d50.0
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Mar 2026 10:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774634318; cv=none;
        d=google.com; s=arc-20240605;
        b=SLqiI7//kXLjte9bg2KzFMfGXxzai7arEilQ+ySy5AQmm81MEQGQP+Lou9NrTKiser
         epLXiKA26AFc4+3Ov4qvNr72n1qA93RJZxIK3v0B5g/e4ENdI5C7cya4smURzTUPmqt7
         H7jZw6vB2OYcfPa9qsw9gFz38SdqJKNku5JC1tY0Tqw1N218U8Jy9yalnOaNBjl/UtPJ
         iYunN9jZRd+oIabAYNOrRjqYA2YED6qQAuRuS0XX02Q6/GeFfCncfZ2gce0RV1Lsfj+t
         vsgsLyMWM923eJh3rPkxxt9QXswWbbq1Di48d4TIPgl9NqNJ+GCJxHPj/7XDsB/sQW1C
         heBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LslZTbQuCgzCpaXkkqU/ikNfkg2VIP9zaNKZdPAylrs=;
        fh=Ni/RvsVa+d9xpXYK5HFhcmvSkeUu+nl++jciYMiMjtw=;
        b=elOL6i9CErOcSXN9lamCwxLQLzoyCBTcBplh1IZBllsPIi2jsNFsMMINhft9cwUS7A
         nfAJFQm+m9igtANbxEQ+Q7mlGCKC/mSXJprzd2EFe+wzlnKB2HYlCO3uKBQyyasoHfIA
         WjB0si2YPfS6IjU6gld9/qSD0JcoywRijm6SIy5SOtvoFLyaCIddYTsFuAF/yKXZQvbY
         IK5a21eR/c7Qmof19iGKFron7uRDL4GJbVTo/SyRizWNJ8+G9xSBdRPkSRa3EWwM0tmv
         MOug9Mnc3yZDfs+u7W+DKvlgMQsCahajx3oVqbRRd55A5eGZ/NuhW5HtziEnFZgWIXJz
         sEhA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774634318; x=1775239118; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LslZTbQuCgzCpaXkkqU/ikNfkg2VIP9zaNKZdPAylrs=;
        b=X91eCEkT4skr297OMCHI0XsBteOaiLaB19S4zZAdkXB2ZAJm4p75rkF/HjU2FAWx+w
         EsiHc55myIdeECHfjdm516P7bh0VYeNRwU0e82H6SHOi1PPWsUAJ0yg6wQpwk9paFO1H
         pN64rJJx5A4jIIX/Gqys03Z8M2bZuhAwaS9UG3mKS0ow397ra2Jdg9/djUUaLspJuzXZ
         olE6pqawNK+ch41eMeHmf0HQhxXbpdqlTmRrKPc/2iIK8Wos9YfKRE/CH64G8UJGBSJe
         uZGYaz41uf1Bf/7JYzddtduwZaht0qNuSqIczGk7z37mBry3eMGrzesxHODrp4JqLLMv
         txqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774634318; x=1775239118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LslZTbQuCgzCpaXkkqU/ikNfkg2VIP9zaNKZdPAylrs=;
        b=FTsl3ajK4QK1zy70Pav0YwkrUc13ba6y9aSJsotGcwheDmRmIb7FkiCunUgKZ26NTk
         6fAtLxBMU+0N5gPEQJXd5TC+aBxy+DvpAWu/t70bJRj10y7jcUL2jMZEt+v0lNDcg7xw
         NhOnU2gvcnbdDPsCvqjMIJglVHwTFsnEq2lgCOC16w+HSbLe3gK98jm0Bo9yzgRZXSKL
         qUdfrnntJFDKTrXzjpAEd9gVSk0SSB5VWGpvcGaNYyrqByGpIS91Yo4qJvIk/cYgtO/B
         XNjBU/TvDVjEFk/92+necx1/mnr+PkPA53iOnt/a24KBgXSr4tNb+cqbr5yWEcvphIU3
         oDSA==
X-Forwarded-Encrypted: i=1; AJvYcCWJurIpeHlzBnu2HCzNixPCUBzMRxmdh+IN+jPHLT6g4IgDscV24sXNnlwQ6EKxi+fWoYpVJUisTM04QliNPA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6BXOdfy6Of+2i8PKghB4FoVdc3TMJHGyEWKhEVmSN9MKC5f4o
	imyU60gjtOaFEP5nrPQVdx+yW6H/hIiDbGbNJotE8BwniOxZOWFerh46//fFfq3c3Mtq+VZObKt
	S5FPPcF2X0ILu/DvjjXwFJz4vWSeq77U=
X-Gm-Gg: ATEYQzxqCmx5t+p4e7bJ+h8PKwdZ0NshTpgB0g/IwYePcOqhC/WRhwK7iyv7LkiK2wp
	vnL/knU6hhRoWKqQeOuwJLalFDjqRyI5TagkLTMHJjilsWbUnBqtlLg/ZJEnWM7nWMBD8D2HPog
	6Yk77wepZqgTYx6HhNcq/B0dUmbDw3YG3NEYZpZoeCmgXrdR7x3qsAJloGg0iwL/W40zZgBp8Jl
	vuX4dnbng1zp8WtuR6S1xNma7IlEyet8U2saRpEilFYmP6jbYzL2cVfEj9ZFVCjRZFRUGbC5zlZ
	oyJ3fkgOEiKsKE21eDYFd6cZrprtNybU9Xt17JuZdVh6iQaroXU7xDFpzVywfJxXe95bW8n2ZLj
	tD347
X-Received: by 2002:a05:690e:d42:b0:650:509:1b07 with SMTP id
 956f58d0204a3-650050923b4mr1392484d50.0.1774634318385; Fri, 27 Mar 2026
 10:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <177272816248.352280.12453518046823439297@jetm.me> <20260326-mt7927-bt-support-v3-0-fa7ebd424323@jetm.me>
In-Reply-To: <20260326-mt7927-bt-support-v3-0-fa7ebd424323@jetm.me>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 27 Mar 2026 13:58:27 -0400
X-Gm-Features: AQROBzBLmQGFzRqmnDnZOf06xEI8m2lMtSggZgTni-ORGhpk4NTmt_2iIVVyT1k
Message-ID: <CABBYNZJLQ99727+3vnKscsDwgTnuP0NijWr9T=YWBpdq7giv7A@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Bluetooth: Add MediaTek MT7927 (MT6639) support
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
X-CRM114-CacheID: sfid-20260327_105839_933208_603F5531 
X-CRM114-Status: GOOD (  26.56  )
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

On Thu, Mar 26, 2026 at 6:13=E2=80=AFPM Javier Tia <floss@jetm.me> wrote:
>
> This series adds Bluetooth support for the MediaTek MT7927 (Filogic 380)
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
>
> Tested on:
> - ASUS ROG Crosshair X870E Hero (USB 0489:e13a)
> - ASUS ROG STRIX X870E-E (USB 13d3:3588)
> - ASUS ROG STRIX B850-E GAMING WIFI (USB 0489:e13a)
> - Gigabyte Z790 AORUS MASTER X (USB 0489:e10f)
> - Lenovo Legion Pro 7 16ARX9 (USB 0489:e0fa)
> - MSI MEG X870E ACE MAX (USB 0489:e110)
> - TP-Link Archer TBE550E PCIe (USB 0489:e116)
>
> The firmware blob is being submitted separately to linux-firmware via
> GitLab MR !946. The firmware path has been updated to mediatek/mt7927/
> per maintainer feedback.
>
> Changes in v3 (suggested by Sean Wang):
> - Scoped CHIPID workaround to a static VID/PID table of known MT6639
>   USB devices instead of mapping all zero-CHIPID cases to 0x6639
> - Changed firmware path from mediatek/mt6639/ to mediatek/mt7927/ to
>   match the WiFi firmware convention and avoid confusion
> - Added MODULE_FIRMWARE(FIRMWARE_MT7927) for initramfs firmware discovery
> - Added Tested-by for 0489:e110 (Nitin Gurram)
>
> Changes in v2:
> - Split USB device IDs into per-device commits as requested (Luiz)
> - Added 0489:e110 (MSI X870E Ace Max, new hardware report)
> - Added ISO interface fix for single alt setting (13d3:3588 devices)
> - Added Tested-by trailers for all USB IDs
> - Added USB descriptor output to all per-device commits
> - Removed BTMTK_FIRMWARE_LOADED skip logic (Sean Wang)
>
> Link to v2: https://lore.kernel.org/linux-bluetooth/20260325-mt7927-bt-su=
pport-v2-0-b892a3252880@jetm.me/T/#t
> Link to v1: https://lore.kernel.org/linux-bluetooth/177272816248.352280.1=
2453518046823439297@jetm.me/
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
>  drivers/bluetooth/btmtk.c | 56 +++++++++++++++++++++++++++++++++++++++++=
+++---
>  drivers/bluetooth/btmtk.h |  1 +
>  drivers/bluetooth/btusb.c | 12 ++++++++++
>  3 files changed, 66 insertions(+), 3 deletions(-)
> ---
> base-commit: 50003ce2085a7f7dacf2426065d1a69c84b5b963
> change-id: 20260305-mt7927-bt-support-6589a50c961f
>
> Best regards,
> --
> Javier Tia <floss@jetm.me>

https://sashiko.dev/#/patchset/20260326-mt7927-bt-support-v3-0-fa7ebd424323=
%40jetm.me

First one is more concerning since it may mean it can lead to crashes
with SDIO driver, the other comment may actually need to be addressed
separately, perhaps WBS handling needs to be fixed on this family of
controllers.

--=20
Luiz Augusto von Dentz

