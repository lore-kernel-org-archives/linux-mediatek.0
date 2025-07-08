Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC95BC8303C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jul 2025 22:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Ziyoc6OWfBD4Ber22ISCAG5cMVClEJJdMXo55uffz4=; b=bX0HbJ8ekfy5h+/cduqbtZharg
	RLmK4hYRZ2KfRGCibcWqJr6NQ2Z0yEhjSiTqQ61g2DbHuGgKZoAHXvE4nlCIhaVkD7trWOWAR7sni
	8SbPI0tRf1gOkV15ogELqpRaAbt4arEpnvZg6ZmH1yyXerMVt5v6MaP5Tx7nK/wWk2hObUk1t4vFK
	yQS39svQmPru0KwHsBIqVwrQgJv7Tffc/MRVE3uxqtRKfviWE+SofHJBQJEwtaBUseYAPKdglD7aG
	MLMCaCBuTVCjYh/r7Ep00zn3pzzVtYMcxD1aSkVXBPbxEcDyJuSxsU3MAwK+FMD6OnHZGRilftNLu
	MkcQ1R5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZGXC-00000006kDl-2g3q;
	Tue, 08 Jul 2025 22:11:30 +0000
Received: from mx3.wp.pl ([212.77.101.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZGQA-00000006iez-1R3E
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Jul 2025 22:04:16 +0000
Received: (wp-smtpd smtp.wp.pl 7799 invoked from network); 9 Jul 2025 00:04:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1752012247; bh=/Ziyoc6OWfBD4Ber22ISCAG5cMVClEJJdMXo55uffz4=;
          h=From:To:Subject;
          b=BVOu1HOEHwN9oqxm64pZbA/fwotlzky4SavZdUIVoyfbQxxctjjt/jr0GtMv+SVF/
           boVnLuBQZrSMerk9rWxDUGpSKAjdmOq7qQzaMkJuxciNge9NPquP/EHVjXmouKxYWi
           UrHfy4PQKUh5ddrzWLWu2wPcruMxhOIegmH4YZDSsaDx+q4NMNGn17priedPlQ0MU1
           DisTBZg5JkjLWrFWzCEc1SCqz5HjZGZrPcP21qNJFsbNeGCdxGOJCSyqaKlOsTIiMS
           4gNdF6UgctLlGlAoTKCdFOojPGjp9OcgyThg2WTctA7DC1w7OLldbKQp/fVZAK6ldH
           uZo1aTmAiuofA==
Received: from 83.24.138.239.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.138.239])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rafael@kernel.org>; 9 Jul 2025 00:04:07 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	s.hauer@pengutronix.de,
	olek2@wp.pl,
	zhiyong.tao@mediatek.com,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/3] Add thermal sensors support for MT7981
Date: Wed,  9 Jul 2025 00:04:02 +0200
Message-Id: <20250708220405.1072393-1-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: c47a9be9f1745f53a3fc4eba447605ae
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [ocM0]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_150414_857481_0179CC86 
X-CRM114-Status: UNSURE (   8.45  )
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

This patch adds support for the temperature sensor in the MT7981 SoC.
This sensor is exactly the same as the one in the MT7986.

CHanges in v3:
 - added fallback in bindings

Changes in v2:
 - added fallback to an existing compatible string
 - removed second patch as obsolete

Aleksander Jan Bajkowski (3):
  dt-bindings: iio: adc: Add support for MT7981
  dt-bindings: thermal: mediatek: add falback compatible string for
    MT7981 and MT8516
  arm64: dts: mediatek: add thermal sensor support on mt7981

 .../iio/adc/mediatek,mt2701-auxadc.yaml       |  4 +++
 .../bindings/thermal/mediatek,thermal.yaml    | 27 ++++++++++------
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 31 ++++++++++++++++++-
 3 files changed, 51 insertions(+), 11 deletions(-)

-- 
2.39.5


