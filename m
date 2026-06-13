Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC149CD98C5
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 22:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sFgM6pr1Jw6qKLoJhWrWpbUwhYhQ+a8Qd9W54UiixL4=; b=3YS3aZDZomBH8ns/gqXdaRRCzq
	0PhqdTGHWVeFj7G65f7tEZyJTSIL135rvGQxAxcoFCVRJvx5Jqay2ZMmp44S9KUbPofmDBrR49eBc
	cd6RhhcUSPRJqDUy3ud9Et5NFq7uxxtvv1YB8PZ1+SKgYyGxE77Fau8fYxT98aP5QxjXUiRtTby80
	OuN+BG3cLq+ZR6aA4urBnRsv3BPw7IPzLDYXXyNcIMRTPPzufzj7g2y9YMkLz+8ZavE39mjgZ+DjD
	3VzFM+2CxXp/pYZnFgziySz//lRNczSAYNRty6BuaoxV2oA9beRDIX9mfGGd90dokSPU+wjnEadmB
	h58O5uEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX30-0000000CZzA-1LiR;
	Sat, 13 Jun 2026 22:41:50 +0000
Received: from mail-dl1-f50.google.com ([74.125.82.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX2w-0000000CZyq-1iQU
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 22:41:48 +0000
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1370417c01cso2714779c88.1
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 15:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781390505; x=1781995305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFgM6pr1Jw6qKLoJhWrWpbUwhYhQ+a8Qd9W54UiixL4=;
        b=GmVv7jpwQRo1IfXrE9G2HxPm4lhv7lhWu2MTjjHizXaDD6zEVRRecIVfqTrn/O+gIy
         s0Xlb5BegseHK+KFTTiAQ9wm+6q/MZOQahOEBxcuau97vS3Lcg2zlVq3hilrOLOroXKT
         MqMh2zO69pEItm3jr/bKX88En1VzHBpAoWQPIfzfcq4zvuKmonmnQ1ZeMGevRdI7c/Sh
         twYqENFM/oVn6dZMJ1ej/uc4MQ+U46aeIg0EgQ2xElwDqWzM+kT/5pgvZJLV7clSR/rJ
         pC3dnYhaRXnTB7+LROmD1qfUCs8VQx+YV7L62oOZhGVXiQFIQeKOCixs08ZUkVdfn1oI
         6IaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8E4S4ikBleaHvClGUvZcjAcc0AXR3en1rrK6mpofWP51Zn6Gkoje+XVfjRWSZUz+li18FNg4cCVB3fUGOQTg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj6NLcur8v1ng4OfDEYC5jof1yKvvpb9X8HkW1r/nDXgVrRVzQ
	L0ZyK21NbNTtsjFQ2pzDIyhhz5oRwYXkKM19sHryNKjF8oQ6saF1ryDL
X-Gm-Gg: Acq92OGAsQRniOlcYQUGGtVLtje0AAXV4TJjlR8WbT4aZMSlkawAoWHnxOfmACFdVCK
	vwnbhw1jUmQrItjdj+p4RL91ihpOge8t8c+c7nAaCR3cBBRFma49aPd7BX/Mb7bHN52MS+Cwzfm
	jAtxGPscuD4K2RGCn+hZsIWILb7Z+Ou6UXeh0YHGfJnCi/thDFyp0xYVDQ3ECNSi/RzoZMlCb/U
	SKAmRLLsSELjoMBJFhrrNis2kz2BfkAcL5OHgOWfM0lFsZKxxz0eWIO97No17kqkljew7GhiusY
	XJoQ7puK0k1qymRzl9wOQON9peF5+RhjUO5GUmdSO0t+3y085KDXEwZc6MHnGkXcU1ftwZaftVG
	K3wnkXag2i5Sb5RfpcbqOUAXTRM5C1reWOJOYwx5T+YG4+C/j3cjMiLC9hO/i1KD0c3ILQ8w9h+
	JL7BBtrAhXUtYvtmKKcaUTiTSpZ5KEgBbWoDH0WKRjvjfDS+cGYtxaeTyolfNk4Am3w12yfVkPj
	/qbOXhXdRjOjUDPBab2AwzWkgIZf7Bha1l9txxS
X-Received: by 2002:a05:7300:d513:b0:304:54d6:20f3 with SMTP id 5a478bee46e88-3081ff3da47mr4390011eec.4.1781390504780;
        Sat, 13 Jun 2026 15:41:44 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm11104825eec.28.2026.06.13.15.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:41:44 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH 0/6] wifi: mt76: mt792x: harden USB reset and disconnect paths
Date: Sat, 13 Jun 2026 17:41:25 -0500
Message-ID: <20260613224131.2396026-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_154146_451495_FADD361C 
X-CRM114-Status: UNSURE (   8.33  )
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

This series hardens mt792x USB reset and disconnect handling.

When the USB control path starts timing out, later register accesses can
keep entering the same dead transport. Each timed-out vendor request may
block for seconds, so reset or disconnect can be delayed by repeated
accesses that can no longer make progress.

Avoid this by failing fast once the USB bus is known to be hung, stopping
reset/init retry paths that cannot recover the device, draining UDMA before
WFSYS reset, and quiescing USB activity before unregistering the device.

This series does the following:
- stop mt7925 init retries once the USB bus is hung
- skip mt7925 reset work once the USB bus is hung
- switch later USB register accesses to no-op bus ops after bus hang
- drain USB UDMA before WFSYS reset
- enable the USB UDMA TX timeout limit
- stop pending USB work and TX paths before unregistering the device

The series is based on wireless-next commit:

21352612198c ("b43: add RF power offset for N-PHY r8 + radio 2057 r8")

It also cherry-picks the following patch from patchwork as a dependency:

wifi: mt76: mt76u: use a threaded NAPI for the RX path
Link: https://lore.kernel.org/all/20260609105301.196302-1-phial@phiality.com/

Sean Wang (6):
  wifi: mt76: mt7925: stop init retries on hung bus
  wifi: mt76: mt7925: skip reset work on hung bus
  wifi: mt76: mt792x: stop USB register access after bus hang
  wifi: mt76: mt792x: drain USB UDMA before WFSYS reset
  wifi: mt76: mt792x: enable USB UDMA TX timeout
  wifi: mt76: mt792x: quiesce USB paths on disconnect

 drivers/net/wireless/mediatek/mt76/mt76.h     |   1 +
 .../net/wireless/mediatek/mt76/mt7925/init.c  |   8 ++
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |   6 +
 .../net/wireless/mediatek/mt76/mt7925/usb.c   |   7 +
 .../net/wireless/mediatek/mt76/mt792x_usb.c   | 124 ++++++++++++++++--
 drivers/net/wireless/mediatek/mt76/usb.c      |  11 ++
 6 files changed, 145 insertions(+), 12 deletions(-)

-- 
2.43.0


