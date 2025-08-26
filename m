Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847AACA0EFA
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Aug 2025 04:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SihI0LEZCbrlbxxp8mie2+EGuARolL/677aRNBJupM8=; b=TpDY+69QqC502P6dyLWJjlo/jP
	aXmAS31WRVRs+jneyYOYpNYMnvYK+XOMZOfM7AL3NH+AD6DWSEQz6WwV+tg27KU1gQCbD+F2xRUcQ
	MmPPhebmXp12xe/DE6QpKHJbTlNGx3jO2DSq10kEDR/hkP6e+A6vRre2Za6rhHPnMgjjJf7BfnsS1
	zedGRs/TqDq8yXScpvd5bM00SY9AN+TSllohEP43fXeTDwvPVJWfg+6mNz442+jqYf7B6887E/nRE
	T9+8lZWWQ8tU/cbN9LjjoHCsXUA3ibrNVbUbL5GPgwDFKkKG7Pr4anmV+3rjU6Px5nxLYOxWHCg9w
	Y4Ue1bZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uql4S-0000000AV2x-48Fr;
	Tue, 26 Aug 2025 04:14:08 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uql1h-0000000AUs5-0Gqx
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Aug 2025 04:11:20 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-771eecebb09so1331680b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Aug 2025 21:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1756181475; x=1756786275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SihI0LEZCbrlbxxp8mie2+EGuARolL/677aRNBJupM8=;
        b=DN5sNI0xOnBZfZbOSUAWNYFjgrgW0a4bwa7ylVkb6QeZ5FyymsId3KR0+9rm6+Yv+Q
         7y+tJWIckxBhlgvm+KV2H0t1kLcocv7To4YsuHsxrfksgVYl8MZIsupN2Al5FywEAL0F
         oke42rsVC+QCEhZ26pWEzs9js4+JHGHr9Tte0l0+ld70B0f9uz3xkJnX0aDi0KqEQ1UI
         z3JggnUV3q5MLhuLyZVbCCYPrzOn+xQqaQp4/oBPqrssWQoyi5addKfW2lltGpjIHBew
         y2lhvAewo033SKYIlxELcYTnV9QXAC5aU8/l7i1Lbe8nr2sE+reVhq4dwueNiDfzqgt3
         E2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756181475; x=1756786275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SihI0LEZCbrlbxxp8mie2+EGuARolL/677aRNBJupM8=;
        b=V5FUIb2K5U8R+7l0ZE6hGNxyECWQWuq4/B98Iq9M/UqK0DSqmaIAYF47hO7rsIh/ub
         /1njIut5wVupXhBqhrQXyes/nleUrTxdU7JJopdG33PauxbrJHHcqLnQf5OOoSkLEU5e
         E2fuigTkutagr6EE7iTSGY5hSL8lIOtARXbOoZlLqH4qmQLOlxkZrIuuo8JI46uM4s7O
         sHjKzZtU9Uj5sqt7oc5qWaRhhqC2aOic77KupkmkbWu92eEKu7ssc/oMC62iyLHCqoS+
         pKC3M9769+jZtCFDL9mTHeZz6qJtbC9aevbS4Go4Y78AdxgeA6MHUKbyyRMtdhgiZcHk
         1OIg==
X-Forwarded-Encrypted: i=1; AJvYcCW3VvfVZJviCZVucEKLYCnq2fNcAb7B/k30QLTeu5GBbyo6PeldLR6CyksgWTKLOAmLVo4hAoKcdSsqPhD1+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YySArxOBWaip+sLq5qqdG4SwogW9OcZEgJ7iSdvFtqkvekLId0o
	dre79BaXuILijzK61C+mJAzstdraUqwP5JyPrpXcB1wDb13w1crM+pJMZI7rT30uZdY=
X-Gm-Gg: ASbGncvbf78vQlDMc6HhDbn79kSmBPs+7wBQdUWhTMtUCr7Euo2pUXYziFxKikxl6Ps
	LCZBJaH2Q2ZFUOf6t4y31J9u12zMg1jAXnh9L7LukENjebgr0Q8Zube23mDp8N7isjxOMfDbq1x
	IDl3fgzdAB/9Nf9D6lWJbgq6HZWVyTW1NL/vdHgbqnTZoHyKyTkPyFJsJzV6k+4Oiw18FZz91NN
	eau9qZvvLftmwtJupdg4vTC8geobGmIkGX3oXM4wqHMOWLlaIVoPtXmRxyJk6PQJkFBmyv40npD
	NXNY9/Dt1IvFGkljIJ2yX9VY0brdX4xVreEY0h6/xbnXCmMDxbr1CkGLGHbdzYPW2rorku1aLUn
	fvs9flB57DWa8JT5SiZ3rjgiH
X-Google-Smtp-Source: AGHT+IE6PpW/HOdNS5oZX4PeHU+PjR/DEI/AATl9npioGYOmUwe8aFkAarlXPhw3BZVTIZPHP8fcZw==
X-Received: by 2002:a05:6a20:918a:b0:243:15b9:7790 with SMTP id adf61e73a8af0-24340eb9569mr22274208637.52.1756181475437;
        Mon, 25 Aug 2025 21:11:15 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb891a00sm8039888a12.2.2025.08.25.21.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 21:11:14 -0700 (PDT)
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Amitkumar Karwar <amitkumar.karwar@nxp.com>,
	Neeraj Kale <neeraj.sanjaykale@nxp.com>,
	linux-bluetooth@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	johan.hedberg@intel.com
Subject: [PATCH] Bluetooth: remove duplicate h4_recv_buf() in header
Date: Mon, 25 Aug 2025 21:11:08 -0700
Message-ID: <be8edf7f8ba8dea6c61272b02fb20a4ac7e1c5a5.1756179634.git.calvin@wbinvd.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_211117_184693_9F811B31 
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

The "h4_recv.h" header contains a duplicate h4_recv_buf() that is nearly
but not quite identical to the h4_recv_buf() in hci_h4.c.

This duplicated header was added in commit 07eb96a5a7b0 ("Bluetooth:
bpa10x: Use separate h4_recv_buf helper"). I wasn't able to find any
explanation for duplicating the code in the discussion:

    https://lore.kernel.org/all/20180320181855.37297-1-marcel@holtmann.org/
    https://lore.kernel.org/all/20180324091954.73229-2-marcel@holtmann.org/

Unfortunately, in the years since, several other drivers have come to
also rely on this duplicated function, probably by accident. This is, at
the very least, *extremely* confusing. It's also caused real issues when
it's become out-of-sync, see the following:

    ef564119ba83 ("Bluetooth: hci_h4: Add support for ISO packets")
    61b27cdf025b ("Bluetooth: hci_h4: Add support for ISO packets in h4_recv.h")

This is the full diff between the two implementations today:

    --- orig.c
    +++ copy.c
    @@ -1,117 +1,100 @@
     {
    -	struct hci_uart *hu = hci_get_drvdata(hdev);
    -	u8 alignment = hu->alignment ? hu->alignment : 1;
    -
     	/* Check for error from previous call */
     	if (IS_ERR(skb))
     		skb = NULL;

     	while (count) {
     		int i, len;

    -		/* remove padding bytes from buffer */
    -		for (; hu->padding && count > 0; hu->padding--) {
    -			count--;
    -			buffer++;
    -		}
    -		if (!count)
    -			break;
    -
     		if (!skb) {
     			for (i = 0; i < pkts_count; i++) {
     				if (buffer[0] != (&pkts[i])->type)
     					continue;

     				skb = bt_skb_alloc((&pkts[i])->maxlen,
     						   GFP_ATOMIC);
     				if (!skb)
     					return ERR_PTR(-ENOMEM);

     				hci_skb_pkt_type(skb) = (&pkts[i])->type;
     				hci_skb_expect(skb) = (&pkts[i])->hlen;
     				break;
     			}

     			/* Check for invalid packet type */
     			if (!skb)
     				return ERR_PTR(-EILSEQ);

     			count -= 1;
     			buffer += 1;
     		}

     		len = min_t(uint, hci_skb_expect(skb) - skb->len, count);
     		skb_put_data(skb, buffer, len);

     		count -= len;
     		buffer += len;

     		/* Check for partial packet */
     		if (skb->len < hci_skb_expect(skb))
     			continue;

     		for (i = 0; i < pkts_count; i++) {
     			if (hci_skb_pkt_type(skb) == (&pkts[i])->type)
     				break;
     		}

     		if (i >= pkts_count) {
     			kfree_skb(skb);
     			return ERR_PTR(-EILSEQ);
     		}

     		if (skb->len == (&pkts[i])->hlen) {
     			u16 dlen;

     			switch ((&pkts[i])->lsize) {
     			case 0:
     				/* No variable data length */
     				dlen = 0;
     				break;
     			case 1:
     				/* Single octet variable length */
     				dlen = skb->data[(&pkts[i])->loff];
     				hci_skb_expect(skb) += dlen;

     				if (skb_tailroom(skb) < dlen) {
     					kfree_skb(skb);
     					return ERR_PTR(-EMSGSIZE);
     				}
     				break;
     			case 2:
     				/* Double octet variable length */
     				dlen = get_unaligned_le16(skb->data +
     							  (&pkts[i])->loff);
     				hci_skb_expect(skb) += dlen;

     				if (skb_tailroom(skb) < dlen) {
     					kfree_skb(skb);
     					return ERR_PTR(-EMSGSIZE);
     				}
     				break;
     			default:
     				/* Unsupported variable length */
     				kfree_skb(skb);
     				return ERR_PTR(-EILSEQ);
     			}

     			if (!dlen) {
    -				hu->padding = (skb->len + 1) % alignment;
    -				hu->padding = (alignment - hu->padding) % alignment;
    -
     				/* No more data, complete frame */
     				(&pkts[i])->recv(hdev, skb);
     				skb = NULL;
     			}
     		} else {
    -			hu->padding = (skb->len + 1) % alignment;
    -			hu->padding = (alignment - hu->padding) % alignment;
    -
     			/* Complete frame */
     			(&pkts[i])->recv(hdev, skb);
     			skb = NULL;
     		}
     	}

     	return skb;
     }
    -EXPORT_SYMBOL_GPL(h4_recv_buf)

As I read this: If alignment is one, and padding is zero, padding
remains zero throughout the loop. So it seems to me that the two
functions behave strictly identically in that case. All the duplicated
defines are also identical, as is the duplicated h4_recv_pkt structure
declaration.

All four drivers which use the duplicated function use the default
alignment of one, and the default padding of zero. I therefore conclude
the duplicate function may be safely replaced with the core one.

I raised this in an RFC a few months ago, and didn't get much interest:

    https://lore.kernel.org/all/CABBYNZ+ONkYtq2fR-8PtL3X-vetvJ0BdP4MTw9cNpjLDzG3HUQ@mail.gmail.com/

...but I'm still wary I've missed something, and I'd really appreciate
more eyeballs on it.

I tested this successfully on btnxpuart a few months ago, but
unfortunately I no longer have access to that hardware.

Cc: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 drivers/bluetooth/bpa10x.c    |   2 +-
 drivers/bluetooth/btmtksdio.c |   2 +-
 drivers/bluetooth/btmtkuart.c |   2 +-
 drivers/bluetooth/btnxpuart.c |   2 +-
 drivers/bluetooth/h4_recv.h   | 153 ----------------------------------
 5 files changed, 4 insertions(+), 157 deletions(-)
 delete mode 100644 drivers/bluetooth/h4_recv.h

diff --git a/drivers/bluetooth/bpa10x.c b/drivers/bluetooth/bpa10x.c
index 8b43dfc755de..b7ba667a3d09 100644
--- a/drivers/bluetooth/bpa10x.c
+++ b/drivers/bluetooth/bpa10x.c
@@ -20,7 +20,7 @@
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
 
-#include "h4_recv.h"
+#include "hci_uart.h"
 
 #define VERSION "0.11"
 
diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 4fc673640bfc..50abefba6d04 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -29,7 +29,7 @@
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
 
-#include "h4_recv.h"
+#include "hci_uart.h"
 #include "btmtk.h"
 
 #define VERSION "0.1"
diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index 76995cfcd534..d9b90ea2ad38 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -27,7 +27,7 @@
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
 
-#include "h4_recv.h"
+#include "hci_uart.h"
 #include "btmtk.h"
 
 #define VERSION "0.2"
diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
index 76e7f857fb7d..d5153fed0518 100644
--- a/drivers/bluetooth/btnxpuart.c
+++ b/drivers/bluetooth/btnxpuart.c
@@ -24,7 +24,7 @@
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
 
-#include "h4_recv.h"
+#include "hci_uart.h"
 
 #define MANUFACTURER_NXP		37
 
diff --git a/drivers/bluetooth/h4_recv.h b/drivers/bluetooth/h4_recv.h
deleted file mode 100644
index 28cf2d8c2d48..000000000000
--- a/drivers/bluetooth/h4_recv.h
+++ /dev/null
@@ -1,153 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *
- *  Generic Bluetooth HCI UART driver
- *
- *  Copyright (C) 2015-2018  Intel Corporation
- */
-
-#include <linux/unaligned.h>
-
-struct h4_recv_pkt {
-	u8  type;	/* Packet type */
-	u8  hlen;	/* Header length */
-	u8  loff;	/* Data length offset in header */
-	u8  lsize;	/* Data length field size */
-	u16 maxlen;	/* Max overall packet length */
-	int (*recv)(struct hci_dev *hdev, struct sk_buff *skb);
-};
-
-#define H4_RECV_ACL \
-	.type = HCI_ACLDATA_PKT, \
-	.hlen = HCI_ACL_HDR_SIZE, \
-	.loff = 2, \
-	.lsize = 2, \
-	.maxlen = HCI_MAX_FRAME_SIZE \
-
-#define H4_RECV_SCO \
-	.type = HCI_SCODATA_PKT, \
-	.hlen = HCI_SCO_HDR_SIZE, \
-	.loff = 2, \
-	.lsize = 1, \
-	.maxlen = HCI_MAX_SCO_SIZE
-
-#define H4_RECV_EVENT \
-	.type = HCI_EVENT_PKT, \
-	.hlen = HCI_EVENT_HDR_SIZE, \
-	.loff = 1, \
-	.lsize = 1, \
-	.maxlen = HCI_MAX_EVENT_SIZE
-
-#define H4_RECV_ISO \
-	.type = HCI_ISODATA_PKT, \
-	.hlen = HCI_ISO_HDR_SIZE, \
-	.loff = 2, \
-	.lsize = 2, \
-	.maxlen = HCI_MAX_FRAME_SIZE
-
-static inline struct sk_buff *h4_recv_buf(struct hci_dev *hdev,
-					  struct sk_buff *skb,
-					  const unsigned char *buffer,
-					  int count,
-					  const struct h4_recv_pkt *pkts,
-					  int pkts_count)
-{
-	/* Check for error from previous call */
-	if (IS_ERR(skb))
-		skb = NULL;
-
-	while (count) {
-		int i, len;
-
-		if (!skb) {
-			for (i = 0; i < pkts_count; i++) {
-				if (buffer[0] != (&pkts[i])->type)
-					continue;
-
-				skb = bt_skb_alloc((&pkts[i])->maxlen,
-						   GFP_ATOMIC);
-				if (!skb)
-					return ERR_PTR(-ENOMEM);
-
-				hci_skb_pkt_type(skb) = (&pkts[i])->type;
-				hci_skb_expect(skb) = (&pkts[i])->hlen;
-				break;
-			}
-
-			/* Check for invalid packet type */
-			if (!skb)
-				return ERR_PTR(-EILSEQ);
-
-			count -= 1;
-			buffer += 1;
-		}
-
-		len = min_t(uint, hci_skb_expect(skb) - skb->len, count);
-		skb_put_data(skb, buffer, len);
-
-		count -= len;
-		buffer += len;
-
-		/* Check for partial packet */
-		if (skb->len < hci_skb_expect(skb))
-			continue;
-
-		for (i = 0; i < pkts_count; i++) {
-			if (hci_skb_pkt_type(skb) == (&pkts[i])->type)
-				break;
-		}
-
-		if (i >= pkts_count) {
-			kfree_skb(skb);
-			return ERR_PTR(-EILSEQ);
-		}
-
-		if (skb->len == (&pkts[i])->hlen) {
-			u16 dlen;
-
-			switch ((&pkts[i])->lsize) {
-			case 0:
-				/* No variable data length */
-				dlen = 0;
-				break;
-			case 1:
-				/* Single octet variable length */
-				dlen = skb->data[(&pkts[i])->loff];
-				hci_skb_expect(skb) += dlen;
-
-				if (skb_tailroom(skb) < dlen) {
-					kfree_skb(skb);
-					return ERR_PTR(-EMSGSIZE);
-				}
-				break;
-			case 2:
-				/* Double octet variable length */
-				dlen = get_unaligned_le16(skb->data +
-							  (&pkts[i])->loff);
-				hci_skb_expect(skb) += dlen;
-
-				if (skb_tailroom(skb) < dlen) {
-					kfree_skb(skb);
-					return ERR_PTR(-EMSGSIZE);
-				}
-				break;
-			default:
-				/* Unsupported variable length */
-				kfree_skb(skb);
-				return ERR_PTR(-EILSEQ);
-			}
-
-			if (!dlen) {
-				/* No more data, complete frame */
-				(&pkts[i])->recv(hdev, skb);
-				skb = NULL;
-			}
-		} else {
-			/* Complete frame */
-			(&pkts[i])->recv(hdev, skb);
-			skb = NULL;
-		}
-	}
-
-	return skb;
-}
-- 
2.49.1


