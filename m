Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524CC606A321
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 20:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xiPbg+Ox;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RtM3QgtK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lafBaGzib/nfUJhb2MTI1mfxlmB6w3uNCmPXLXoCcU8=; b=xiPbg+Oxk0Ws/NPoOtTqZ18Xah
	XGt/PzxDP3R58PVXIF1Jxw80qgP+h1GK46Dqt14kfFAh0Vv4X52MqudACf5pLHFvnmBNFgj+3ryah
	XkQ3rkZOf8EYR439cST97BIUFN2VpFlPiNR7Y/UGxAlnCccRBw290KkUTFSwBP6SNF9UjOmTTVpnm
	ucoboYliDfS7XXfkjP64iXL+PMktGnxsYXYQ5rOOhVjcAXoXapMUqkKD6Y1OOEQAQPWh9pJHJS5Hd
	TxGn59Jh1Xr1WS0eATqWvPujNGPuU9eb/jRI5HXq+JS504gmRnl1FaiNWZ5uZ/4kcTAAGHXOhjiKK
	sZr0x/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaDG-00000004m8u-3v4L;
	Mon, 23 Nov 2026 20:00:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaDB-00000004m69-1bky;
	Mon, 23 Nov 2026 20:00:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 94CB8623BC;
	Mon, 23 Nov 2026 20:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B9E1F000C0;
	Mon, 23 Nov 2026 20:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795464023;
	bh=lafBaGzib/nfUJhb2MTI1mfxlmB6w3uNCmPXLXoCcU8=;
	h=From:To:Cc:Subject:Date;
	b=RtM3QgtKHi93BUZ9vS0uZST9CtS2F3EgWc+cpbG02hKYxlSmf81K1oUwIWTCilMvt
	 SWmSvcETrz7V+fQF8vKyXJTjQT5oFLpIKj3rG2OVttqDuG7V6mp4cCR6uru2EuGptP
	 Ng9J+xAzf0121RYp4FzJdVZOZgFdWLs9JLfz4To7zR0Tc900Se6TREYY5AJ1zkGwmx
	 UxQzK06YqT5o4JPp3gC5VVUqHD/lwtYyZBgSjqrHgl1An8bOnncTGFPKGiQWQMQTNK
	 Nd2K3CpIbiCMgc6CcKGnRaEomijNHI0TS9Oy1ujN51pHFTW3Bv35KMSnK9JLTAkjXx
	 gOiJ0UPm6RSOw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: "George G. Davis" <gdavis@mvista.com>,
	"Mark A. Greer" <mgreer@mvista.com>,
	"Tianping.Fang" <tianping.fang@mediatek.com>,
	Adriana Stancu <adriana@arista.com>,
	Alexander Bigga <ab@mycable.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Andrew Morton <akpm@linux-foundation.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Benjamin Fair <benjaminfair@google.com>,
	dmitry pervushin <dpervushin@embeddedalley.com>,
	Dmitry Rakhchev <rda@emcraft.com>,
	Domen Puncer <domen.puncer@telargo.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Eric Liu <liuer@nvidia.com>,
	Gary Bisson <gary.bisson@boundarydevices.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	Imre Kaloz <kaloz@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	John Rigby <jcrigby@gmail.com>,
	Joshua Kinard <linux@kumba.dev>,
	linux-rtc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	lm-sensors@lm-sensors.org,
	Matthias Fuchs <matthias.fuchs@esd-electronics.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Medad CChien <ctcchien@nuvoton.com>,
	Mia Lin <mimi05633@gmail.com>,
	Ming-Jen Chen <mjchen@nuvoton.com>,
	Nancy Yuen <yuenn@google.com>,
	Nicolas Boichat <drinkcat@chromium.org>,
	Nishanth Menon <nm@ti.com>,
	openbmc@lists.ozlabs.org,
	Patrick Venture <venture@google.com>,
	Pavel Machek <pavel@denx.de>,
	Peter Hartley <peter.hartley@sigmatel.com>,
	Piotr Ziecik <kosmo@semihalf.com>,
	Ran Bi <ran.bi@mediatek.com>,
	Ryan Brue <ryanbrue.dev@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Sergei Poselenov <sposelenov@emcraft.com>,
	source@mvista.com,
	Tali Perry <tali.perry1@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Wim Van Sebroeck <wim@iguana.be>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Wolfram Sang <kernel@pengutronix.de>,
	Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH 00/10] rtc: assorted bug fixes across RTC drivers
Date: Mon, 23 Nov 2026 19:59:11 +0000
Message-ID: <20261123200012.502284-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These issues were reported by Sashiko.

None of these changes have been tested on physical hardware.

Cc: "George G. Davis" <gdavis@mvista.com>
Cc: "Mark A. Greer" <mgreer@mvista.com>
Cc: "Tianping.Fang" <tianping.fang@mediatek.com>
Cc: Adriana Stancu <adriana@arista.com>
Cc: Alexander Bigga <ab@mycable.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Avi Fishman <avifishman70@gmail.com>
Cc: Benjamin Fair <benjaminfair@google.com>
Cc: dmitry pervushin <dpervushin@embeddedalley.com>
Cc: Dmitry Rakhchev <rda@emcraft.com>
Cc: Domen Puncer <domen.puncer@telargo.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>
Cc: Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: Eric Liu <liuer@nvidia.com>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Imre Kaloz <kaloz@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>
Cc: Johan Hovold <johan@kernel.org>
Cc: John Rigby <jcrigby@gmail.com>
Cc: Joshua Kinard <linux@kumba.dev>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: lm-sensors@lm-sensors.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Matthias Fuchs <matthias.fuchs@esd-electronics.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Medad CChien <ctcchien@nuvoton.com>
Cc: Mia Lin <mimi05633@gmail.com>
Cc: Ming-Jen Chen <mjchen@nuvoton.com>
Cc: Nancy Yuen <yuenn@google.com>
Cc: Nicolas Boichat <drinkcat@chromium.org>
Cc: Nishanth Menon <nm@ti.com>
Cc: openbmc@lists.ozlabs.org
Cc: Patrick Venture <venture@google.com>
Cc: Pavel Machek <pavel@denx.de>
Cc: Peter Hartley <peter.hartley@sigmatel.com>
Cc: Piotr Ziecik <kosmo@semihalf.com>
Cc: Ran Bi <ran.bi@mediatek.com>
Cc: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Sergei Poselenov <sposelenov@emcraft.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>
Cc: source@mvista.com
Cc: Tali Perry <tali.perry1@gmail.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>
Cc: Wim Van Sebroeck <wim@iguana.be>
Cc: Wolfgang Grandegger <wg@grandegger.com>
Cc: Wolfram Sang <kernel@pengutronix.de>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>

Lee Jones (10):
  rtc: rx8025: pass parent I2C device in clock_adjust_ppb sysfs
    callbacks
  rtc: mt6397: handle non-DT platform device matching in probe
  rtc: ma35d1: allocate RTC device before requesting interrupt
  rtc: mpc5121: get interrupts via platform_get_irq()
  rtc: m41t80: use devm helpers for square-wave clock registration
  rtc: nct3018y: fix clock provider use-after-free and leak on unbind
  rtc: stmp3xxx: unregister child watchdog platform device on unbind
  rtc: ds1685: check driver data for NULL in ds1685_rtc_poweroff()
  rtc: omap: prevent NULL and dangling pointer dereferences in power-off
    path
  rtc: bq32k: use u8 register buffer in trickle_charge_bypass sysfs

 drivers/rtc/rtc-bq32k.c    |  6 ++++--
 drivers/rtc/rtc-ds1685.c   |  6 ++----
 drivers/rtc/rtc-m41t80.c   |  5 +++--
 drivers/rtc/rtc-ma35d1.c   | 14 ++++++-------
 drivers/rtc/rtc-mpc5121.c  | 41 ++++++++++++++------------------------
 drivers/rtc/rtc-mt6397.c   | 19 ++++++++++++++++++
 drivers/rtc/rtc-nct3018y.c |  3 ++-
 drivers/rtc/rtc-omap.c     | 21 +++++++++++--------
 drivers/rtc/rtc-rx8025.c   |  4 ++--
 drivers/rtc/rtc-stmp3xxx.c | 29 ++++++++++++++++-----------
 10 files changed, 84 insertions(+), 64 deletions(-)

-- 
2.56.1.750.gf70dc682cf-goog


