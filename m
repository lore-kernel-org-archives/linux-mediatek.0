Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8E7606A334
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 18:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0If8eziE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VqpqqUkm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=w3cnyFXRTHoFwReHmudPZ5M2WczBBfc0l9gr3HBh5B4=; b=0If8eziED4kb8ZHdfAplHw7QzV
	UOkyf/vweACwi4qUkxcorSrmUC11wLZ22JBTNQ0GNWiEEdpYVyq9pBufZgZeuXajkiS1czCiEJ6EQ
	tczWtmNb+pLZhmyBakO1gsmHhVS7URSR2r4g3vea33mzYjC4YtjYuIH8AbP4YlY1rGplWS6iv5Ggi
	ZPs9bqOZIpIA/hhoYX7wwCMoz9siQAwhI5uh3W7y3mPJcuZZupeZAE41FVKyRnnAJkGGFa9f98sXy
	RuNnmjGna+TLwej2YSpJOjj2XGfTftq0pisAkYSQNDFfNHmPV4JeEBT+KZ9yYGRRRAwZ/FHGNnXg8
	Spf2ILXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYpm-00000004Uuo-1KId;
	Mon, 23 Nov 2026 18:32:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYpl-00000004UuM-10dP;
	Mon, 23 Nov 2026 18:32:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C53C2430AB;
	Mon, 23 Nov 2026 18:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873F61F000D0;
	Mon, 23 Nov 2026 18:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458728;
	bh=w3cnyFXRTHoFwReHmudPZ5M2WczBBfc0l9gr3HBh5B4=;
	h=From:To:Cc:Subject:Date;
	b=VqpqqUkmfi4DHoKE6YP7bpEvLzUv96RQgHL7OA8dKq/lyse5senryP7efA/DQlFeU
	 G7KhCVzmT7akQnmGu8o+F+6YwswzcqE91LE7xnPDU4W2u0aRrADHqRaqfRyCsPsd9F
	 9RfRdhobzagzcsJ09n80tNPXiNLIFSel+d4zHON0VgUp1MO7eFdeS17+pUsE/P1uKV
	 XWSULDlN9oFHahCFNc9I/LLeJrYpD/qCkZxWD3zz/QJtrLfsLFSS6csS5I/3zeGolP
	 8/WV0OLrgG8H1vEOua58Cx/znV6pnCH7AyHZPHLWNnzDhwq94mXnOnliFgZ6zNsuFM
	 saBdJino7XmEA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: "Cheng, Wacom" <pingc@wacom.com>,
	=?UTF-8?q?Ronald=20Tschal=C3=A4r?= <ronald@innovation.ch>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Andrew Duggan <aduggan@synaptics.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Carlo Caione <carlo@caione.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dudley Du <dudl@cypress.com>,
	Fengping Yu <fengping.yu@mediatek.com>,
	Greg Kroah-Hartman <gregkh@suse.de>,
	Hans de Goede <hansg@kernel.org>,
	Ian Bridges <icb@fastmail.org>,
	Jaya Kumar <jayakumar.lkml@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-input@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marek Vasut <marek.vasut@gmail.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Samuel Holland <samuel@sholland.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Vojtech Pavlik <vojtech@ucw.cz>
Subject: [PATCH 00/10] Input: assorted bug fixes across input drivers
Date: Mon, 23 Nov 2026 18:31:06 +0000
Message-ID: <20261123183200.3900004-1-lee@kernel.org>
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

Cc: "Cheng, Wacom" <pingc@wacom.com>
Cc: "Ronald Tschalär" <ronald@innovation.ch>
Cc: "Uwe Kleine-König (The Capable Hub)" <u.kleine-koenig@baylibre.com>
Cc: Andrew Duggan <aduggan@synaptics.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Benjamin Tissoires <bentiss@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Carlo Caione <carlo@caione.org>
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dudley Du <dudl@cypress.com>
Cc: Fengping Yu <fengping.yu@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Hans de Goede <hansg@kernel.org>
Cc: Ian Bridges <icb@fastmail.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-input@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: Marco Felsch <m.felsch@pengutronix.de>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Vojtech Pavlik <vojtech@ucw.cz>

Lee Jones (10):
  Input: matrix_keypad - validate GPIO counts against matrix limits
  Input: cyapa - validate firmware image size in cyapa_pip_check_fw()
  Input: applespi - cancel touchpad registration work on removal
  Input: matrix_keypad - only stop and start active device across sleep
  Input: stinger - zero-initialise driver state in stinger_connect()
  Input: synaptics-rmi4 - check for NULL drvdata in rmi_set_attn_data()
  Input: axp20x-pek - skip IRQ handling during sleep without input
    device
  Input: mt6779-keypad - enable keypad clock before programming
    registers
  Input: pinephone-keyboard - request IRQ before registering input
    device
  Input: wacom_w8001 - use reinit_completion() in w8001_command()

 drivers/input/joystick/stinger.c            |  2 +-
 drivers/input/keyboard/applespi.c           |  1 +
 drivers/input/keyboard/matrix_keypad.c      | 19 +++++++++++++++----
 drivers/input/keyboard/mt6779-keypad.c      |  8 ++++----
 drivers/input/keyboard/pinephone-keyboard.c | 12 ++++++------
 drivers/input/misc/axp20x-pek.c             |  6 ++++++
 drivers/input/mouse/cyapa_gen5.c            | 15 +++++++++++++++
 drivers/input/rmi4/rmi_driver.c             |  2 +-
 drivers/input/touchscreen/wacom_w8001.c     |  2 +-
 9 files changed, 50 insertions(+), 17 deletions(-)

-- 
2.56.1.750.gf70dc682cf-goog


