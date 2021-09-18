Return-Path: <SRS0=6guZ=OI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1CEC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Sep 2021 10:29:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 610D46112E
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Sep 2021 10:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 610D46112E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpCpvU3i1Mij7vSkhYejCCMpPgO40XBjCIJS+VIH8l8=; b=NbSaJJRDwYYuOA5CDQidBp0WOd
	pUxs6ZbaRgo7bTTO78jDiS7aTwUvhkDI11yoNTlpK/CXWZxuG/FXo6wks+HmjR3axQc4uxeqsjcct
	4KjVdQSfG455C2wzf0FLR7y4Wkx0A/zX0LbyR/prSHVx42FXDP0ljstz3la2ynWuAtEqgQv9hOf6P
	N4DLYx9uBEXp33jG8PynaJXwF0cJdjt0gL/IOoRyc3u3up/Swp4sX42Nimkwt5ros1nV+eESYpqNV
	OimlFtyQQrrUTL8rYH7XFXlyMQgdLYzyjW6OYGSfDvR52TmyAyergJwT9252soJkMn685vv7m2yzX
	SoZM0XhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRXax-00FlTY-RE; Sat, 18 Sep 2021 10:29:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRXat-00FlT4-Pp
 for linux-mediatek@lists.infradead.org; Sat, 18 Sep 2021 10:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631960954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xk4W4dzyIDd+S8oRjOh+rfgRscAK+8ckqR0UwzE5ZDs=;
 b=WJg06MStGfFIAuHG2ooh/12JSISf3aa221ON5mYQW3QZbLsJjzTSsL/qS7xgwCdmTgVCTH
 3TA4Zcyo8BMyMHdw3hHiHk9uMkMFMhvps0wLLZBYGCnIrbUNOX249OAE3rBvkkTlmy6BGS
 sfB0hBN7cfj6gU0jzXb1kYcYXfwk3Mo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-MM0aOVGNMaq_4PFWZ0Ivdg-1; Sat, 18 Sep 2021 06:29:10 -0400
X-MC-Unique: MM0aOVGNMaq_4PFWZ0Ivdg-1
Received: by mail-ed1-f71.google.com with SMTP id
 ec14-20020a0564020d4e00b003cf5630c190so11534894edb.3
 for <linux-mediatek@lists.infradead.org>; Sat, 18 Sep 2021 03:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ddauZdhRCags/mZIKVS7Qc/Nq4p4+XE3xzeNjX2hcow=;
 b=2r2f+Zs6jMls2SnjJt6uYldVPRPONjXyqDTi//pOOcwg6Ee3PLenFRwJ6d1DadROzs
 puP+kWN1jiUXBR2yAdT9N0f62fyuERkNYq9xXtdGth/8vN/jpBeGhOSE1vctEvQr2/J8
 /430bkqOM5xAo16ZWdGn2PLiuLO6P8PT7ken/cr4l3t1cGGhEFHzhIGPtWEVpoAutUuX
 LySRgSYTnYD2fy9K0HXad8sacYpUzWUqIQgvt41Z2dHWnRZq37fMiwfU43rauinJxcZJ
 WElLiUos2F5BfOLz/32xSHn7xUUkuq/Dbm8XEkQK5JNVm8sHQpRuZYXY80oaymxUGvmU
 0UiA==
X-Gm-Message-State: AOAM532lx01VxS5q92T3g4S+zaG7ntT8tuYAOkg9fbXJrVOLhR1n/Ais
 PV+sntGQFT0KWZt8AvVTwL+XGHRitk4r0jkZibWcqzAVPvTq83vpwoEGF51fn8K3OURxQ4FD4Ws
 ZehKgK4/im+R5h7AtcUwS0f/DsMQ2KoaX
X-Received: by 2002:a05:6402:222b:: with SMTP id
 cr11mr18101633edb.392.1631960948836; 
 Sat, 18 Sep 2021 03:29:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXqlr8MDdYt2jjLctHx8ez4EvOBsqIfRMVymykoKJrDWiKizudPSsRljuFtFLHxeNZilyX5Q==
X-Received: by 2002:a05:6402:222b:: with SMTP id
 cr11mr18101613edb.392.1631960948606; 
 Sat, 18 Sep 2021 03:29:08 -0700 (PDT)
Received: from localhost (net-130-25-199-50.cust.vodafonedsl.it.
 [130.25.199.50])
 by smtp.gmail.com with ESMTPSA id k22sm3421866eje.89.2021.09.18.03.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 03:29:08 -0700 (PDT)
Date: Sat, 18 Sep 2021 12:29:05 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, jemele@google.com,
 shawnku@google.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Sean Wang <objelf@gmail.com>
Subject: Re: [PATCH v2 00/16] Add MT7921 SDIO support
Message-ID: <YUW/cZmGygR5E7yX@lore-desk>
References: <cover.1631918993.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1631918993.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210918_032916_094035_F9A0204F 
X-CRM114-Status: GOOD (  25.58  )
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
Content-Type: multipart/mixed; boundary="===============5178360316892630329=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============5178360316892630329==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Swo0ovMX/GFU72N1"
Content-Disposition: inline

--Swo0ovMX/GFU72N1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <objelf@gmail.com>
>=20
> The patchset adds the SDIO support to the MT7921 driver, basically are
> made up of 3 parts.
>=20
> PART 1: patch 1-5, 8-9 and 12-14
> These are preliminary patches for mt7921s driver to refactor and reuse th=
e
> current mt7921e driver as much as possible.
>=20
> PART 2: patch 6-7, 10
> These are preliminary patches for mt7921s driver to refactor and reuse th=
e
> current mt7663s driver as much as possible.
>=20
> PART 3: patch 11 and 15-16
> These are specific patches for mt7921s driver and reset mechanism in the
> same framework where mt7921e have been supported.
>=20
> The patchset are built and generated against the current mt76 tree plus
> the extra pending patches [1] expected to be merged to mt76 tree soon to
> help the review and merge process be easier.
>=20
> The change list from v1 to v2
> 1. rework the whole driver according to the new patches added
>    ("mt76: introduce __mt76_mcu_send_firmware routine"),
>    ("mt76: not accounting the MCU header size in __mt76_mcu_send_firmware=
 for mt7915/21") and
>    ("mt76: sdio: move common code in mt76_sdio module")
> 2. drop pci_init.c and sdio_init.c by moving the related logic to pci.c a=
nd sdio.c, respectively.
> 3. cosmetics the patches like removing unnecessary new line and adding an=
 extra space to fixed_map table.
> 4. fix typo in commit message
>=20
> [1] The pending patch list prior to add MT7921 SDIO support

Hi Sean,

I have not tested it but overall the code seems fine to me, just a couple o=
f nits.
Fixing them you can add:

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> da0054ae6b1f mt76: mt7921s: add reset support
> 31c979d37209 mt76: mt7921: introduce mt7921s support
> c8f8caad718f mt76: mt7921: refactor mt7921_mcu_send_message
> f4bb6338d638 mt76: mt7921: rely on mcu_get_nic_capability
> 0bfd21e29498 mt76: connac: extend mcu_get_nic_capability
> 3b5f8d1815a4 mt76: sdio: extend sdio module to support CONNAC2
> 28669a9ceff5 mt76: sdio: move common code in mt76_sdio module
> ad7ba2b9c6af mt76: mt7921: use physical addr to unify register access
> a6aebd446a9a mt76: mt7921: make all event parser reusable between mt7921s=
 and mt7921e
> 0c52f915f728 mt76: mt7663s: rely on mcu reg access utility
> 42112d6b7b1c mt76: connac: move mcu reg access utility routines in mt76_c=
onnac_lib module
> 23bf9455d505 mt76: mt7921: add MT7921_COMMON module
> 688be52542bb mt76: mt7921: refactor init.c to be bus independent
> 099a0527d05c mt76: mt7921: refactor mcu.c to be bus independent
> 378767d66e2b mt76: mt7921: refactor dma.c to be pcie specific
> e15c4c1be3ea mt76: mt7921: refactor mac.c to be bus independent
> b72eaca3c81b mt76: not accounting the MCU header size in __mt76_mcu_send_=
firmware for mt7915/21
> 870fe1bc5fc8 mt76: introduce __mt76_mcu_send_firmware routine
> 465a8a6e834f mt76: schedule status timeout at dma completion
> 4d3b6422fe5e mt76: substitute sk_buff_head status_list with spinlock_t st=
atus_lock
> 13d50c723b79 mt76: remove mt76_wcid pointer from mt76_tx_status_check sig=
nature
> ed46465dc741 mt76: introduce packet_id idr
> b3568b1f391a mt76: mt7921: add 6GHz support
> 6605e1e5c2be mt76: add 6GHz support
> 1dcae1bad280 mt76: connac: enable hw amsdu @ 6GHz
> 88c34fb4fdef mt76: connac: add 6GHz support to mt76_connac_mcu_uni_add_bs=
s
> 8bb780867211 mt76: connac: add 6GHz support to mt76_connac_mcu_sta_tlv
> 6e021ff24950 mt76: connac: set 6G phymode in single-sku support
> 21a96eed203d mt76: connac: add 6GHz support to mt76_connac_mcu_set_channe=
l_domain
> b70bae155a51 mt76: connac: enable 6GHz band for hw scan
> 92e29c77494c mt76: mt7921: remove mt7921_sta_stats
> 56ea41ec4ae3 mt76: mt7921: remove mcu rate reporting code
> 94b97e96549e mt76: mt7921: report tx rate directly from tx status
> 8dd12eb23009 mt76: mt7921: add support for tx status reporting
> 69328a635189 mt76: mt7921: start reworking tx rate reporting
> b915a7d2b882 mt76: mt7921: update mib counters dumping phy stats
> 2a694a754e32 mt76: mt7921: always wake device if necessary in debugfs
> 067927a52e93 mt76: mt7921: move mt7921_queue_rx_skb to mac.c
> a866733d977d mt76: mt7921: fix retrying release semaphore without end
> 8853d1b5b6bf mt76: mt7921: robustify hardware initialization flow
>=20
> Lorenzo Bianconi (1):
>   mt76: sdio: move common code in mt76_sdio module
>=20
> Sean Wang (15):
>   mt76: mt7921: refactor mac.c to be bus independent
>   mt76: mt7921: refactor dma.c to be pcie specific
>   mt76: mt7921: refactor mcu.c to be bus independent
>   mt76: mt7921: refactor init.c to be bus independent
>   mt76: mt7921: add MT7921_COMMON module
>   mt76: connac: move mcu reg access utility routines in mt76_connac_lib
>     module
>   mt76: mt7663s: rely on mcu reg access utility
>   mt76: mt7921: make all event parser reusable between mt7921s and
>     mt7921e
>   mt76: mt7921: use physical addr to unify register access
>   mt76: sdio: extend sdio module to support CONNAC2
>   mt76: connac: extend mcu_get_nic_capability
>   mt76: mt7921: rely on mcu_get_nic_capability
>   mt76: mt7921: refactor mt7921_mcu_send_message
>   mt76: mt7921: introduce mt7921s support
>   mt76: mt7921s: add reset support
>=20
>  drivers/net/wireless/mediatek/mt76/Makefile   |   2 +-
>  drivers/net/wireless/mediatek/mt76/mt76.h     |  22 ++
>  .../wireless/mediatek/mt76/mt7615/Makefile    |   2 +-
>  .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  28 --
>  .../wireless/mediatek/mt76/mt7615/mt7615.h    |   6 -
>  .../net/wireless/mediatek/mt76/mt7615/sdio.c  | 282 +------------
>  .../wireless/mediatek/mt76/mt7615/sdio_mcu.c  |  11 +-
>  .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  93 +++++
>  .../wireless/mediatek/mt76/mt76_connac_mcu.h  |   2 +
>  .../net/wireless/mediatek/mt76/mt7921/Kconfig |  18 +-
>  .../wireless/mediatek/mt76/mt7921/Makefile    |   8 +-
>  .../wireless/mediatek/mt76/mt7921/debugfs.c   |  18 +-
>  .../net/wireless/mediatek/mt76/mt7921/dma.c   |  38 +-
>  .../wireless/mediatek/mt76/mt7921/eeprom.c    | 101 -----
>  .../net/wireless/mediatek/mt76/mt7921/init.c  |  52 +--
>  .../net/wireless/mediatek/mt76/mt7921/mac.c   | 372 ++----------------
>  .../net/wireless/mediatek/mt76/mt7921/mac.h   |   4 +
>  .../net/wireless/mediatek/mt76/mt7921/main.c  |   7 +
>  .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 138 ++-----
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  94 ++++-
>  .../net/wireless/mediatek/mt76/mt7921/pci.c   |  49 ++-
>  .../wireless/mediatek/mt76/mt7921/pci_mac.c   | 346 ++++++++++++++++
>  .../wireless/mediatek/mt76/mt7921/pci_mcu.c   | 115 ++++++
>  .../net/wireless/mediatek/mt76/mt7921/regs.h  |  22 +-
>  .../net/wireless/mediatek/mt76/mt7921/sdio.c  | 285 ++++++++++++++
>  .../wireless/mediatek/mt76/mt7921/sdio_mac.c  | 220 +++++++++++
>  .../wireless/mediatek/mt76/mt7921/sdio_mcu.c  | 135 +++++++
>  drivers/net/wireless/mediatek/mt76/sdio.c     | 282 +++++++++++++
>  .../mediatek/mt76/{mt7615 =3D> }/sdio.h         |  50 ++-
>  .../mediatek/mt76/{mt7615 =3D> }/sdio_txrx.c    | 171 +++++---
>  30 files changed, 1982 insertions(+), 991 deletions(-)
>  delete mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/eeprom.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
>  rename drivers/net/wireless/mediatek/mt76/{mt7615 =3D> }/sdio.h (68%)
>  rename drivers/net/wireless/mediatek/mt76/{mt7615 =3D> }/sdio_txrx.c (59=
%)
>=20
> --
> 2.25.1
>=20

--Swo0ovMX/GFU72N1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYUW/bgAKCRA6cBh0uS2t
rKP6AP4lKM9tgYiErMma4o04zsU3ts+SZOe36Gpr/mO/xQjshAEAmjxZi1W3xW2m
gr16MdFqziWYFuXV+0I6ry5xMqbl9AQ=
=Y2Jp
-----END PGP SIGNATURE-----

--Swo0ovMX/GFU72N1--



--===============5178360316892630329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5178360316892630329==--


