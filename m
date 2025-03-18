Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D29C282EC
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Mar 2025 19:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=19z1Kk5mXf9SmqNPxTrWbr2dcMvFexRCx2f5g7HF46k=; b=sjwLD3gchL86pJRICudQSMCAbz
	Z6o9PfVw3nxnjP50++U97m3xiZ8brgeHwOQM0ON49IoCoseX6OCHtEkQgXzi1hVU8Un02MvcO9AjT
	dPp3gDT526dKhkIGH3/RlV1A/z0+9fW11Xb9Lsg0rcPcokw/13RgUG0gE8AdczYBQPg/od5hSwZu7
	S4leoYyciD8dZz5f67jNedmTFoaDw+eUKcJ312irlAli929kPYklz0N96kSJVpvUk9u4RlBrcgY40
	XmnuDmfdqJgnfPIcleF+BJavTyeKuXcNC+MrtUrZKWMBOykOvTIEI9JipWyR5VFH8+8WHA4OFNXTa
	9KrO1eSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuci2-00000006voO-1Kaf;
	Tue, 18 Mar 2025 19:34:42 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tucem-00000006vZz-0Nxt
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Mar 2025 19:31:21 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2239c066347so129855445ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Mar 2025 12:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1742326279; x=1742931079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=19z1Kk5mXf9SmqNPxTrWbr2dcMvFexRCx2f5g7HF46k=;
        b=eqSD333XtdfSh22Xfd9PJ4Pzi3naFJYKSqORwSjZ6IqeoB2LzhvaOtPpTuz0omgLBf
         G0Ml2H3A2EnzixA32Wg5kxsQAi0TTwNWbVSyy88Hpv68AI/su0T86wliy2/6gcnslY8O
         plabT5wfY75Lb5iPCEw3urnpvaYhgTLzwfCS2D/Lp928wjR5FDjxHeBD6WQckOcp1P6v
         k5PBcEn9m9fj79eY+HkGY5zTS46kxK8Y1x6jWfqJQq3ebarSs+1VNZqihwdS0TAGzPRb
         wEFFke+JLsvo+AVIQAVJAJ4wbRumanZqGmrg/UWaJZ3XXQErPFOPIeK+1qdysRbH3Kf7
         nlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742326279; x=1742931079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19z1Kk5mXf9SmqNPxTrWbr2dcMvFexRCx2f5g7HF46k=;
        b=elZLmHOaY+lzjH8Z0inMmJAD6P5ssqsLzrOta00dB3grdynfpkMyhAw1aJwrhyhnYj
         AOoCcCqBp6MNqVVGPZ/D8Ld5fEUDetMXh4Ucqea/cD2GKamNgzKwADePfaa5fmdkcHAP
         9qlbBvhJSr906QgfYTGDZi47uN2wx4Dtz/sXaGdxGf5tHCS33+S7IeREak0E3TA6CbqO
         JlPIY0ubFW4AEN5gPRLymy7KZeQ+PKZkuw0bQbJIehs+S16D+i1cPM4SM8Jdh+pZ2lyi
         /eVWdrfYkf9k250u1kPoU0EXFTv9xl93nCsbyo43dC7FmkVk1OFDt+XwfvxwaUrm5G2H
         xMgg==
X-Forwarded-Encrypted: i=1; AJvYcCWhvUlJGy+N6LlNa7Vs8qNyNZpwd9qnKPJCKT00xn5CTRodlaiIMvhA4YOQ5mR6YwxHDSQjGDFmRHos8fA2Kg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk+tY4GkFNp9QhFr2RpcuQqWMyjCbW0Er5epXJ0qTPJcaHFE1Y
	7C+m8Y1Gyjr5wVB1X23L+nFpy2whbY9T3QBCoGiJvM04Dc548TO9l38zh3vWw4k=
X-Gm-Gg: ASbGncsvoBRXZmBO7QhLdit0PKdBT6SAiuKWjuxjy4sRl8SOf0LRORdVFnfRFtY1Kjq
	DKW4a779YXHktFbg7BlMay0mh8JfQs4Zv9dFZ0vn+xpInHY05FHpVNg3RvScjmkMM0bd3X4zfLh
	EsBohpkEJS1PgTrbGW8K4m+AInbhrUqsvbTXFUke/DVkdZSpszAbRcSRGVn5uY2brFrjvol5Uip
	jOz/7svfTqqUi0ZJV+wW7JihCgtJxb28hcg6XU3GaYwQ48Guy6cBW3jsgXUwOm8xasUZBUJ3qqH
	74OVtGhRuxkvKvgdsNFK1tUyRkmsfVSI9rcMZoM3K4Z5Q/w=
X-Google-Smtp-Source: AGHT+IGtg/Gus/fPA/C0wTqoGIQvSoUpP0NE5t1Cbk1OIUeB6Lmwk6dhW0m3CZ42u0xM6Wx6yXDp7A==
X-Received: by 2002:a17:90b:4c45:b0:2ee:d63f:d73 with SMTP id 98e67ed59e1d1-301b9fcbbc1mr589133a91.11.1742326278694;
        Tue, 18 Mar 2025 12:31:18 -0700 (PDT)
Received: from mozart.vkv.me ([2001:5a8:4680:a100:1c4a:720d:c0fa:efac])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3015363217dsm8638407a91.32.2025.03.18.12.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 12:31:18 -0700 (PDT)
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
	linux-mediatek@lists.infradead.org
Subject: [PATCH][QUESTION] bluetooth: Remove duplicated h4_recv_buf() in header
Date: Tue, 18 Mar 2025 12:31:12 -0700
Message-ID: <2b612e2c1f4fa697b47b5dd9b72f1949d7c206f5.1742324401.git.calvin@wbinvd.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_123120_124821_6671336B 
X-CRM114-Status: GOOD (  26.31  )
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

Hello all,

In the course of other debugging, I've discovered that h4_recv_buf() is
almost completely duplicated in an inline header definiton, and I don't
understand why.

I'd like to clean this up: see the patch below for an explanation.

Does anybody who was around at the time remember any more details about
this? Or failing that, perhaps somebody with access to the bpa10x
hardware can test it with the core function?

Thanks,
Calvin

---8<---
From: Calvin Owens <calvin@wbinvd.org>
Subject: [PATCH] bluetooth: Remove duplicated h4_recv_buf() in header

The "h4_recv.h" header contains a duplicate h4_recv_buf() that is nearly
but not quite identical to the h4_recv_buf() in hci_h4.c.

This duplicated header was added in commit 07eb96a5a7b0 ("Bluetooth:
bpa10x: Use separate h4_recv_buf helper"). Unfortunately, there was no
discussion about it on the list at the time:

    https://lore.kernel.org/all/20180320181855.37297-1-marcel@holtmann.org/
    https://lore.kernel.org/all/20180324091954.73229-2-marcel@holtmann.org/

This is the diff between the two implementations as they exist today:

    --- /home/calvinow/orig.c	2025-03-10 14:43:18.383882623 -0700
    +++ /home/calvinow/copy.c	2025-03-10 14:42:57.109953576 -0700
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

It seems fairly obvious from the above that, if alignment is one,
hu->padding is always zero, and in that case the two functions behave
strictly identically.

Since that is the case for every driver except hci_nokia, clean this up
and let them use the core function. I've done some light testing on
btnxpuart, so far everything seems to work.

I would love to eliminate the duplicate function entirely, but I don't
have access to hardware for bpa10x. Since bpa10x breaking was the
original justification for the change, I've left it there for now. I'm
hoping somebody else can shed more light on this.

Cc: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 drivers/bluetooth/btmtksdio.c | 2 +-
 drivers/bluetooth/btmtkuart.c | 2 +-
 drivers/bluetooth/btnxpuart.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index bd5464bde174..47d1073fb4a4 100644
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
index c97e260fcb0c..aeb111a0f242 100644
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
index aa5ec1d444a9..e6db563088cb 100644
--- a/drivers/bluetooth/btnxpuart.c
+++ b/drivers/bluetooth/btnxpuart.c
@@ -21,7 +21,7 @@
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
 
-#include "h4_recv.h"
+#include "hci_uart.h"
 
 #define MANUFACTURER_NXP		37
 
-- 
2.47.2


