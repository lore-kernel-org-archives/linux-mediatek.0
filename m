Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9D3CD98C5
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 22:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/DREgCFSiVRPA/ISCguieFaPwHHRhAppM9UFQUW3iU0=; b=AG7q99UqwuaJgM+HeE2TYlnGnE
	3ZdyyHsAyfoJJOxkSAO3DN2xjCm0o1W7V4gxDKeCx9xLVNbuS0TXI9aFJi9bcVT6JA0+sMIY42REC
	6yQXmXQHFQ3pOJmaO2/Pfsqi7gt+kWs3QdmP8o0dAgn/RKCmh6+EaOyy3rLSUOr3nRB7Nv7Qu1mgH
	ZJSxaDWm52v3xDL1YdLoKWJmY7n/DoTvFihZ7M7/2Npxr6NLKDQkjFsBGVd0ISilJa2nFiTCpI2UJ
	Tw/H9fbRV0KQzgNmcGvs4EKEtVFYyfr2vQ9zadOP6TgAaJLyigaSiRVOrpHLoQjRbEdDVdZ6MQ529
	kW4JCaqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX8A-0000000CaIO-1IVL;
	Sat, 13 Jun 2026 22:47:10 +0000
Received: from mail-dl1-f41.google.com ([74.125.82.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX85-0000000CaHm-2G25
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 22:47:08 +0000
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-137ec563a95so2209863c88.0
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 15:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781390824; x=1781995624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DREgCFSiVRPA/ISCguieFaPwHHRhAppM9UFQUW3iU0=;
        b=aPSbILAav3cemdhp7aBZ0TQcOeRFzHON2jbRp8+4CGSfRi84ww7Pt38sbLZpAazqbi
         g0aFbvasU4sKUtaxRqjth2xSBTZUDgyVZ5Wjcjj+E51UPSYHyzAGpGSw7SnrnaRGWXSX
         USukmkdOj3SAvhGtCKejStDigb6A+TWkHTZ8Iykgq/bIYuHBoFzk2XiEGU76VhK4fQHw
         3+sUMAT984hT0RX58nt1ttUtbD3lCekxxzbGSLvyQOtS9TAJTFYKTZmqjOHoGul/0zxh
         8S4WWWNSUZpWG3XwS5bxbqWzhJ82H3FjpWACjCaviY7IwzT1EFHcRkUHZk8sm0ueSKlC
         gglA==
X-Forwarded-Encrypted: i=1; AFNElJ9GE5t4FVyZCHeU2S4DAq/Yb9D5I5uuIgPaNQmJ7hN3zPxeh05ER92D16ZACb+XJHklEeOBLpSCfe8+6QdFEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsIj0RITk9+O8KF6f7xrECTa1bKJ6tOyUSdzLDRAtAHO90y4gX
	KgCtNiSIpwfl+Ek9VSZh0ebtWcyn0Iwois/T4BI9UEs6Xhcx6RaeGSekNXKNBcId
X-Gm-Gg: Acq92OFmE/jkh395R1uzTqqySId9/puBKBnODbPv2cClDWAypBm8zKvjc9f3h35nBYd
	jYOCGUPmEY1WCDAF2DgE342DqFLfhljU36EK4ykSrPhVDABbhW5U7bcZaTJ5ujdfmm5aJBk+CZq
	IpRrKdhD7tIgF5czjZLC7cjLL8dW7tcSNMYdzGvTFkOSs6p6yzmkWMcwOD1UHc327kTqXZcYmml
	A2TiZFyBL6xwO1GQizVdvRbCJJ/awzmWDF45GBvLWir9DxoSx1ZKBLxASg+0ztDYlnWf4Qvyw13
	eXTXsUoMI3x2eKIfLYKQgz/B22FM4sCIply/HLzmDrzNhpt/jAvCyAHYheVlg3XjkL54jerrnqI
	00VzKJBTdOSFsi05pJSvxdohn0hvLsPCOCLk6pO3lghUhgZZ2EjAoayKdMQ/SilaiyukLz6f/vz
	/w7qC9254ZPQypcwhr2cnxcycDf+IP8LPb9s7PL7iJW3uUmUWZsYsY63bSCpafhnLE/fjP8xAz1
	5QsVuM2jY7gj5RcpN490Ap2+EVI8+p29uKxCCq8ruSVeJQ/kV8=
X-Received: by 2002:a05:7022:60e:b0:136:e639:9c22 with SMTP id a92af1059eb24-1386f39567dmr2020156c88.21.1781390824318;
        Sat, 13 Jun 2026 15:47:04 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b97bf09sm6345380c88.14.2026.06.13.15.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:47:03 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH 0/5] wifi: mt76: add USB RX aggregation support
Date: Sat, 13 Jun 2026 17:46:50 -0500
Message-ID: <20260613224655.2405686-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_154705_580839_C6FB31B8 
X-CRM114-Status: UNSURE (   8.74  )
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

This series adds optional USB RX aggregation support to mt76 and enables
it on mt7927u.

RX aggregation allows multiple RX frames to be received from one USB URB,
reducing USB completion overhead and improving RX efficiency for
high-throughput RX traffic and monitor capture.

The common USB support remains opt-in, so existing USB drivers keep the
current behavior unless they explicitly enable RX aggregation. The same
settings work for both mt7927u and mt7925u, but this series enables the
feature only on mt7927u for now.

This series does the following:

- size RX page-pool pages from the queue buffer size
- support out-of-order RX URB completion
- add optional USB RX aggregation parsing
- add debugfs stats to verify aggregation behavior
- enable USB RX aggregation on mt7927u

The series is based on wireless-next commit:

21352612198c ("b43: add RF power offset for N-PHY r8 + radio 2057 r8")

It also cherry-picks the following patch from patchwork as a dependency:

wifi: mt76: mt76u: use a threaded NAPI for the RX path
Link: https://lore.kernel.org/all/20260609105301.196302-1-phial@phiality.com/

Sean Wang (5):
  wifi: mt76: usb: size RX page-pool pages from queue buffer
  wifi: mt76: usb: support out-of-order RX URB completion
  wifi: mt76: usb: add optional RX aggregation support
  wifi: mt76: usb: add debugfs aggregation stats
  wifi: mt76: mt7927u: enable USB RX aggregation

 drivers/net/wireless/mediatek/mt76/debugfs.c  |  35 +++
 drivers/net/wireless/mediatek/mt76/mac80211.c |   3 +
 drivers/net/wireless/mediatek/mt76/mt76.h     |  38 ++-
 .../net/wireless/mediatek/mt76/mt7925/usb.c   |  18 +-
 .../net/wireless/mediatek/mt76/mt792x_usb.c   |  23 +-
 drivers/net/wireless/mediatek/mt76/usb.c      | 251 ++++++++++++++++--
 6 files changed, 335 insertions(+), 33 deletions(-)

-- 
2.43.0


