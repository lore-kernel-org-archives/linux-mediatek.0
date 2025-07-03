Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03CCC77B7C
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jul 2025 16:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yZtpp18bFRC7s6jyevVEK+9w2uw4QUoeL3ZYyRfCzEs=; b=2KfysY4vK+hQyvFASSzOGt05tp
	wwYDO88FUaCQq/q/1B5p6JvHsJSmrtM5m07jgTlc8D0LgD4JKXmOshZeOyKfifYqAxA+9mokYyW2I
	DSAJ12eyWmTvbplt9QykmM/tN/hWOlaNvPWeAD6iyy6LHrHeBfw73h1dxk5rXeEBqpzJM95Pz7skT
	/en+9seZtXtXism/N8o/IgojzGWGwtl3lOBwykUuBP+NHfXohu0hWREQt03oN7lJBucn1+RlYXVaF
	+oKpMRr7u8xJCRk9w7yKSCzs5TODuisbtRApwVx+NUqIOFTqF9/Z8gwUozr8vQym4iNVZVE1Jk24Y
	/Lbh2MKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXN3o-0000000C2KI-4AxI;
	Thu, 03 Jul 2025 16:45:20 +0000
Received: from relay16.mail.gandi.net ([2001:4b98:dc4:8::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKsx-0000000Bet8-2rlD;
	Thu, 03 Jul 2025 14:26:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3495F449B8;
	Thu,  3 Jul 2025 14:25:51 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: trivial@kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bastien Nocera <hadess@hadess.net>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Kees Cook <kees@kernel.org>,
	Erick Archer <erick.archer@outlook.com>,
	Chris Lu <chris.lu@mediatek.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	asahi@lists.linux.dev
Subject: [PATCH 0/7] Bluetooth: Fix typos
Date: Thu,  3 Jul 2025 16:24:28 +0200
Message-ID: <20250703142542.985248-1-hadess@hadess.net>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeffleeuffejvdeufeffvdejjedvheekgfeltdejhfeitdettefgjedvuedvhfejueenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeejudgurgemfegsugemvddtrgelmedufeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeejudgurgemfegsugemvddtrgelmedufeefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhnsggprhgtphhtthhopedvfedprhgtphhtthhopehtrhhivhhirghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrtggvlheshhholhhtmhgrnhhnrdhorhhgpdhrtghpthhtoheplhhuihiirdguvghnthiisehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrghnrdifrghnghesmhgvughirghtvghkrdgtohhmpdhrtghpthhtohepmhgrthhthhhir
 ghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvght
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_072559_860486_83E8765D 
X-CRM114-Status: UNSURE (   6.00  )
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

Found using codespell.

Probably best taken in through the Bluetooth tree.

Cheers

Bastien Nocera (7):
  Bluetooth: btintel: Fix typo
  Bluetooth: btmtk: Fix typo
  Bluetooth: btrtl: Fix typo
  Bluetooth: hci_bcm4377: Fix typo
  Bluetooth: aosp: Fix typo
  Bluetooth: RFCOMM: Fix typos
  Bluetooth: Fix typos

 drivers/bluetooth/btintel.c     | 2 +-
 drivers/bluetooth/btmtkuart.c   | 2 +-
 drivers/bluetooth/btrtl.c       | 2 +-
 drivers/bluetooth/hci_bcm4377.c | 2 +-
 net/bluetooth/aosp.c            | 2 +-
 net/bluetooth/hci_conn.c        | 2 +-
 net/bluetooth/hci_event.c       | 4 ++--
 net/bluetooth/hci_sync.c        | 2 +-
 net/bluetooth/lib.c             | 2 +-
 net/bluetooth/rfcomm/core.c     | 3 ++-
 net/bluetooth/rfcomm/tty.c      | 2 +-
 net/bluetooth/smp.c             | 2 +-
 12 files changed, 14 insertions(+), 13 deletions(-)

-- 
2.50.0


