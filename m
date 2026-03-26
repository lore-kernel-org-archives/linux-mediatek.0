Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B422109E54B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 05:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bl28UD4hohd/NY1SWa8YfX4dzDR7PBtZycCAzWaHs8M=; b=WuOOn1xjzYquVdiGCuVVWJNkOU
	A2a2DTeoIvtGkQUR8RRgJbVdi2+BOsRsEq+jVIpOHvwlGlSzTbgz03fHZ1gXGdNMrHhO6JIpzADix
	KfMj8UeJaPNtJG0n+7jWvFlluWMKJJ2wTSUzuENkiezc9B2OorqytBXrvQFECXAi5JWjl+fbqzEm7
	e32OGObHUV2pRPZp/AxcUr2nUztXC4ZY/JWsHcP4gwhDTMyM4QboPrK14s/kLmRgF9O/MVdCLh832
	BcuWg8M8MYz1IAFPLsilZuv14i4ETTKa31ClTK4j91vMz16EJSsTJikQvJEItQLI34TzDVDqgrYYJ
	970FmV5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dhn-00000004lbi-0uuw;
	Thu, 26 Mar 2026 05:56:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dhk-00000004lay-2vWF
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 05:56:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00702442F3
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 05:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E89C2BCB3
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 05:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774504587;
	bh=GSGBiV6pimsYFcaUTsHEze3oEMK+9eMZdVzhhnNbZkE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j6FlajmqlcKnMB67VjeYmzeEhOtYZ15Eh5qiNBBHa9r0eSf87NELEaHC5u9Iu9sE3
	 hHJzJhIG9LN8q8pkHbQqZSO1YL0YTqeQixUQbsU65rXRSMu+eMZiXfWkE651ToOdp9
	 6BoMwKcLSJOx7HI4DRnALWHXpoatf0uLioz1XyDcCsQanlkYWvcO0CAjb8jFxnRLeV
	 Hj4SZjCVA37bNJkytVp2/di1rGOtHLaHu6HPig8lfj34hKjGzG26gamqslSXpDGBbO
	 5ogTp3cQQddUeN7hVQEmcjw5ytWpjvQ5I/txfEXulbpEksxSKEUw9nO9oYONhkYJI6
	 wpRxCV0SP8YgA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38ad12fb595so16073481fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 22:56:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVugQPxnR/VISp8ZR7YBUyvsP2aQBZU6rA/eA6IoREG43FpUVx1+ycfM/TGs7KU+WOdwSNRGeTTO140ftBLJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2NQ7/NAuBGEEfrsQciKjCT9SsOc/P7miujYMG0PuCVwGO/0Qs
	/NVhmktFTGhKiDzaQ7qXMmJsRJjUJ34GMsDI9pRgohlcaKoQXvXaWDrdqLfNnr80BhPMNyYHGJf
	QQYJTQOGH6zDctXrCiHt/0itxnDfLDYY=
X-Received: by 2002:a2e:800f:0:b0:389:e3ad:40b7 with SMTP id
 38308e7fff4ca-38c6537b4a4mr1146961fa.2.1774504586085; Wed, 25 Mar 2026
 22:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me>
In-Reply-To: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 26 Mar 2026 00:56:16 -0500
X-Gmail-Original-Message-ID: <CAGp9Lzo1XPR7=Gwi_Qr9ZC=g4ec+zGg_eUdh8yBgUdi=qiHMag@mail.gmail.com>
X-Gm-Features: AQROBzCgBXUtbhG8iRwtdKRawqSwIZWXpTZoHZD06hGoEDbZC2YT7tVUlmNXhZc
Message-ID: <CAGp9Lzo1XPR7=Gwi_Qr9ZC=g4ec+zGg_eUdh8yBgUdi=qiHMag@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] This series adds support for the MediaTek MT7927
 (Filogic 380) combo
To: Javier Tia <floss@jetm.me>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Deren Wu <deren.wu@mediatek.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Marcin FM <marcin@lgic.pl>, Cristian-Florin Radoi <radoi.chris@gmail.com>, 
	George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>, 
	Samu Toljamo <samu.toljamo@gmail.com>, Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>, 
	Chapuis Dario <chapuisdario4@gmail.com>, =?UTF-8?Q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>, 
	=?UTF-8?B?5byg5pet5ra1?= <Loong.0x00@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_225628_777736_D9A25F04 
X-CRM114-Status: GOOD (  30.68  )
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

Hi, Javier

Sorry for the late reply. This version already looks better than v1
overall, and the patch order is cleaner. I still think a few areas
could be refined further, as this would also be a good opportunity to
refactor the code a bit so mt7927 support fits more naturally and
future chips are easier to handle as well.

On Wed, Mar 25, 2026 at 5:11=E2=80=AFPM Javier Tia <floss@jetm.me> wrote:
>
> WiFi 7 + BT 5.4 module to the mt7925 driver. The MT7927 uses PCI ID
> 14c3:7927 (some hardware reports 14c3:6639) and shares the mt7925
> firmware interface but requires different DMA ring layout, IRQ mapping,
> chip initialization, and power management handling.
>
> Tested hardware:
> - ASUS ROG Crosshair X870E Hero (BT 0489:e13a, WiFi 14c3:6639)
> - ASUS ProArt X870E-Creator WiFi (BT 0489:e13a / 13d3:3588, WiFi 14c3:663=
9)
> - ASUS ROG Strix X870-I (WiFi 14c3:7927)
> - ASUS ROG Strix X870-F Gaming WiFi (BT 0489:e13a, WiFi 14c3:7927)
> - ASUS ROG Strix X870E-E (BT 13d3:3588, WiFi 14c3:7927)
> - Gigabyte X870E Aorus Master X3D (BT 0489:e10f, WiFi 14c3:7927)
> - Gigabyte Z790 AORUS MASTER X (BT 0489:e10f, WiFi 14c3:7927)
> - Gigabyte Z790 AORUS ELITE X WiFi7 (BT 0489:e10f, WiFi 14c3:7927)
> - MSI MEG X870E ACE MAX (BT 0489:e110, WiFi 14c3:7927)
> - Lenovo Legion Pro 7 16ARX9 (BT 0489:e0fa, WiFi 14c3:7927)
> - Lenovo Legion Pro 7 16AFR10H (BT 0489:e0fa, WiFi 14c3:7927)
> - TP-Link Archer TBE550E PCIe (BT 0489:e116, WiFi 14c3:7927)
> - EDUP EP-MT7927BE M.2 card (WiFi 14c3:7927)
> - Foxconn/Azurewave M.2 modules (WiFi 14c3:6639)
> - AMD RZ738 reference design (WiFi 14c3:0738)
>
> Tested on Arch Linux, CachyOS, EndeavourOS, Fedora (Bazzite), NixOS,
> openSUSE Tumbleweed, and Ubuntu across kernels 6.13-6.19.
>
> What works:
> - WiFi 7 with EHT 320MHz on 2.4/5/6 GHz bands
> - 320MHz data path verified at 841 Mbps (iperf3 -t30 -P8)
> - PCIe initialization with CBTOP remap and MT7927-specific DMA layout
> - System suspend/resume (S3)
> - DBDC (dual-band concurrent) mode
> - Explicit band_idx assignment for stable 5GHz/6GHz operation
> - ASPM and runtime PM disabled for MT7927 (see below)
>
> Known limitations (planned as follow-up series):
> - Runtime PM: disabled for MT7927 because the combo chip shares a
>   CONNINFRA power domain between WiFi (PCIe) and BT (USB).
>   SET_OWN/CLR_OWN transitions on the LPCTL register crash the BT
>   firmware, requiring a full power cycle to recover. PM enablement
>   will be addressed once safe power state transitions are determined.
> - mac_reset returns -EOPNOTSUPP (DMA recovery not yet implemented)
> - MLO (Multi-Link Operation): tested working on 5GHz+2.4GHz STR
>   (776 Mbps) but requires additional patches for link lifetime
>   and error handling. Sean Wang's series [1] addresses these;
>   MLO support will be submitted as a follow-up on top of that.
> - TX retransmissions: elevated retry rate on all bands, firmware-side
>   rate adaptation issue not addressable in the driver.
>
> [1] https://lore.kernel.org/linux-wireless/20260306232238.2039675-1-sean.=
wang@kernel.org/
>
> Patches 1-5 add generic 320MHz EHT support (no MT7927 references).
> Patches 6-7 introduce MT7927 chip ID helpers and firmware paths.
> Patch 8 adds per-chip IRQ map handling.

This part patch 1-8 looks good overall. My only concern was a possible
regression on mt7925, but now that the incorrect mt7925 320 MHz
support has been fixed  in the version, this should be fine.

> Patch 9 introduces mt792x_dma_config struct for chip-specific DMA.
> Patch 10 combines CBTOP remap, chip init, DBDC, CNM, and mac_reset.
> Patch 11 adds mt7925_band_idx() helper for stable 5/6 GHz operation.

I am still thinking a bit more about patches 9-11. My current
preference is to introduce the generic layer first, and then migrate
the mt7925 and mt7927-specific parts on top of it.
I will handle this part on my side, since I want to carefully compare
the vendor driver with your changes first, and make sure the mt7925
side is solid before moving the mt7927-related changes forward. For
the mt7927-related work, I will make sure your contribution, as well
as the work from the other volunteers, is properly preserved when I
carry this forward.

> Patch 12 disables ASPM and runtime PM for MT7927.
> Patch 13 enables the MT7927 PCI device table entries.
>
> The WiFi firmware path and filename in linux-firmware have not been
> finalized yet. The driver currently requests mediatek/mt6639/ (the
> mobile SoC codename), but this may change based on the linux-firmware
> review.

Similar to the BT side, I would prefer to have a dedicated Linux
firmware for mt7927 WiFi. I am not sure yet whether the current
changes will work seamlessly with that, so we can revisit it later and
see what further adjustments are needed.

>
> Changes since v2 (suggested by Sean Wang):
> - Fixed is_320mhz_supported() to check for MT7927 only, not the
>   entire mt7925 family. MT7925 does not support 320MHz (patch 5).
> - Dropped phy_cap_info[7] 320MHz additions (NON_OFDMA_UL_MU_MIMO
>   and MU_BEAMFORMER) to keep capabilities conservative (patch 5).
> - Disabled runtime PM for MT7927 (patch 12). The combo chip shares a
>   CONNINFRA power domain between WiFi and BT; SET_OWN/CLR_OWN
>   transitions crash BT firmware. Discovered via user reports of BT
>   lockups after enabling power_save=3D1 (Reported-by: Nitin Gurram).
> - Added tested hardware: MSI MEG X870E ACE MAX, Gigabyte Z790 AORUS
>   ELITE X WiFi7, Lenovo Legion Pro 7 16AFR10H.
>
> Changes since v1 (suggested by Sean Wang):
> - Reorganized from 18 patches into 13 across 8 logical groups
> - Common 320MHz patches first, chip-specific changes later
> - Introduced mt792x_dma_config struct to reuse mt7925_dma_init()
>   instead of duplicating as mt7927_dma_init()
> - Replaced is_mt7927() with is_320mhz_supported() in common patches
> - Added mt7925_band_idx() helper replacing scattered if/else patterns
> - Renamed MT7927-specific registers with MT7927_ prefix
> - Added PCI ID 0x0738 for AMD RZ738 hardware
> - Moved GLO_CFG_EXT1 register address into dma_config struct to
>   eliminate is_mt7927() from shared mt792x_dma.c
>
> Link to v2: https://lore.kernel.org/linux-wireless/20260319-mt7927-wifi-s=
upport-v2-v2-0-d627a7fad70d@jetm.me/
> Link to v1: https://lore.kernel.org/linux-wireless/20260306-mt7927-wifi-s=
upport-v1-0-c77e7445511d@jetm.me/
>
> Assisted-by: Claude (Anthropic)
> Signed-off-by: Javier Tia <floss@jetm.me>
> ---
> Javier Tia (13):
>       wifi: mt76: mt7925: fix stale pointer comparisons in change_vif_lin=
ks
>       wifi: mt76: mt7925: add 320MHz bandwidth to bss_rlm_tlv
>       wifi: mt76: mt7925: handle 320MHz bandwidth in RXV and TXS
>       wifi: mt76: mt7925: populate EHT 320MHz MCS map in sta_rec
>       wifi: mt76: mt7925: advertise EHT 320MHz capabilities for 6GHz band
>       wifi: mt76: mt7925: add MT7927 chip ID helpers
>       wifi: mt76: mt7925: add MT7927 firmware paths
>       wifi: mt76: mt7925: use irq_map for chip-specific interrupt handlin=
g
>       wifi: mt76: mt7925: add chip-specific DMA configuration
>       wifi: mt76: mt7925: add MT7927 hardware initialization
>       wifi: mt76: mt7925: fix band_idx for stable 5GHz/6GHz operation
>       wifi: mt76: mt7925: disable ASPM and runtime PM for MT7927
>       wifi: mt76: mt7925: enable MT7927 PCI device IDs
>
>  drivers/net/wireless/mediatek/mt76/mt76_connac.h   |  13 +-
>  drivers/net/wireless/mediatek/mt76/mt7925/init.c   |  19 +-
>  drivers/net/wireless/mediatek/mt76/mt7925/mac.c    |   9 +
>  drivers/net/wireless/mediatek/mt76/mt7925/main.c   |  61 ++++-
>  drivers/net/wireless/mediatek/mt76/mt7925/mcu.c    |  55 +++-
>  drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h |   7 +
>  drivers/net/wireless/mediatek/mt76/mt7925/pci.c    | 277 +++++++++++++++=
++++--
>  .../net/wireless/mediatek/mt76/mt7925/pci_mac.c    |  14 +-
>  .../net/wireless/mediatek/mt76/mt7925/pci_mcu.c    |  20 +-
>  drivers/net/wireless/mediatek/mt76/mt792x.h        |  27 ++
>  drivers/net/wireless/mediatek/mt76/mt792x_dma.c    |  68 ++---
>  drivers/net/wireless/mediatek/mt76/mt792x_regs.h   |  33 +++
>  12 files changed, 528 insertions(+), 75 deletions(-)
> ---
> base-commit: 9ac76f3d0bb2940db3a9684d596b9c8f301ef315
> change-id: 20260319-mt7927-wifi-support-v2-e89d779b28f4
>
> Best regards,
> --
> Javier Tia <floss@jetm.me>
>
>

