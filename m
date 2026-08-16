Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7102C5B572
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Aug 2026 17:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FflrZPo0SzDXc4fxWnUV1IFsVK9UvRmYYioklHORaLU=; b=QhVwj8MB3+O7GyFgpthQzkSPJm
	zGhp+fc7PkYkbd2IkBLfPAXIuBcaO17gWqHNyh+xxUiDj9ZYw3UY/VcJZRzWrWTAV85yGj9S+Ds0p
	1IAbP6XrvsRxWnIS6gZi1ABudT17Eya6HgyX+UYgZqCe0ob+M5crfv6XedLdWBK+zKR+Xc893DxGx
	a9E+QTBBDdHpCLQD/69caqkDeG2IpEpYwifEX4HNX+dz80rfrVIGrUamK99YeJttcWZZIPoZh0ARG
	LjzpJg//FvhXwP69YwTgsG36iFGlXuwl+x4246J+FSK1TrTLOlS8rBM6L/uhqtVO8/Zb9/2MEIxHV
	tm13bjEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wveyb-00000004wOb-0jJw;
	Sun, 16 Aug 2026 17:48:53 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wveyY-00000004wO8-3f9Y
	for linux-mediatek@lists.infradead.org;
	Sun, 16 Aug 2026 17:48:52 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c9e7391839cso2552727a12.0
        for <linux-mediatek@lists.infradead.org>; Sun, 16 Aug 2026 10:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786902529; x=1787507329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FflrZPo0SzDXc4fxWnUV1IFsVK9UvRmYYioklHORaLU=;
        b=jb0pNvacXf/8S4MI0dSAqESELUjIJD3YqvPQCr1DweI4jKVttATHqoRlOgPW8v3gCB
         tWE9O+xDZK1mtnfojTdAqncYcZ7d4+cey3fi8CLoLtInNUa5BlI7a6FWv4kEiZRwUszW
         ndcYwks2awQ0LdTvQfB0MdeayiC/sySo8V2Hbx4oisb9DfXUVCUEByj0iJKW9tIVm0rM
         Cyi/0ZdX7BtQNplL6u8Rxt9+/oJeSMYavhG431xG6QTjzHz1yx6MQtTuDLzzp0kTAXXv
         5bqHuV2Q58FfwSS6VvGyRBL2fSXsz1wySgLbrc0b25cFANDmk3wec4mibymyT2Mai9f5
         RRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786902529; x=1787507329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FflrZPo0SzDXc4fxWnUV1IFsVK9UvRmYYioklHORaLU=;
        b=Yh2vMG+nRMoG2BriRnmGAEtLnCPlf97hf/C5f0nu7s/bYXjktEjT6vMFWDhUqpuqt6
         JJpkiUNj0kaf+TQqexY2O768rUw6ewRKRU4AVYi0zn1IOSsGTdG4wUKx1P78wwHzZSg/
         4I1niUoSJqs7rNfSPI8qk138VvHDAzIV/fBFpWyAei/8m/vVLjq2UEC+MBNXczVSv9PG
         YxppAm4Qr1YZVOsKxu2CbGBJu9z/RJ4zzF4SroPSYiM6H53GTQVYI68nCFSrp9zRNa6X
         xC7+3HpjpBEsHZDs2FBSXM7shXUQj2shiSLFZCgd+N14uBLVyyUp910CjHo/8qRJRP42
         pIlA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+uvnPjBvUhhk7oYhcH943JzZJ0nRiR0gI5w8mLOgyuKDYGLH/AjHCMaInNvuAuAZdGAFbZFnRA2JMGUZBjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsYeFhKhhwrMioxjOOHx4q6K0OdlsCCy9GxOsKAQEZPnw3XRx5
	U5xO48ozhh0RgeBTbsSwYueMHw0Xtsf3w3pJT6qIhFbSTk4Okg5OQ1aH
X-Gm-Gg: AR+sD11VB+nY5ps3DCurSGhP/fLUOHS3EHcyup72BzHn2ZCnMB3PQ9DK4SGLJpex/gK
	kr8ho4aePNq1p/bOKEFxtmrkhI2dOccrWvbFKWjqk33XkddEXYQBbikrXAvEiUFkurn48i6biWG
	z7pR7YmSwa2A5Z8wfriZV0L08wikrKwgVnd8mO80mCumr2ClYpV9PyG9bedT9G6Z3PWEFyswVPT
	HQlHApe6VbYZZJQ2MmuMxbOILN15cmvkljKPbB1KL6SqEp9hTGPkKDp1cXRoKNdjUAJJgv1J3Cf
	/UC6eOZmgAS91/3MYx/VD2hgefPduBQ02iZ04lia/sYLZE9tkVVhWniVqLCZSVkk6Nd3Q7rLL+z
	qbjVf3z10tWfNJu/GKMEmetDeOZtoNces3XXJKzgUKkjPGxc6yNv41JDeIZhJReQBx5a0DT7ilY
	34O9tpUa/DTIhfxd2SElv/L8Cx5JY/aSMw5f+G0r+AWMVbUJ8CZ8MCJrLg8Fq6ZUuFdngdN3qkR
	Eex3/9nFb/Wi229w5aJmJiEgbPxJlmhdmhkIqROn7gUqhGVAboZjUVMlXYBxgzTqbLsa7R7IWR0
	pOIfIzuHpHLiWXGV4XEaA54p6YDUoCxCPYq2I124rKQMVFaiOWe6/U/Yx8QcczhQf0edlzaSbwo
	EIQxuwkmfQajtZYZ5qwNlr5/qzNENnwXoDI68m+zKQzNUCGud
X-Received: by 2002:a05:6a21:3384:b0:3c3:64cb:9b99 with SMTP id adf61e73a8af0-3cc719c78e4mr25685428637.6.1786902528936;
        Sun, 16 Aug 2026 10:48:48 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413889bca5sm46408707c88.12.2026.08.16.10.48.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 16 Aug 2026 10:48:48 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt7921: skip unknown CLC firmware records
Date: Sun, 16 Aug 2026 23:33:40 +0545
Message-ID: <20260816174841.1918-1-acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <CAMyXUJmh=WfwC4_KHupNxYR5e2Gy5QhBDL5TSG6XEW-XLa+X4Q@mail.gmail.com>
References: <CAMyXUJmh=WfwC4_KHupNxYR5e2Gy5QhBDL5TSG6XEW-XLa+X4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_104850_917929_0B093A9B 
X-CRM114-Status: GOOD (  10.93  )
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

Treat an out-of-range CLC index as newer firmware rather than a
malformed image. linux-firmware 20260810 ships MT7922 records with
idx 3, and rejecting them made mt7921e fail to probe.

Keep the record-length checks, and report those as errors so a
truncated table is visible instead of a silent retry loop.

Fixes: 9417c5818a01 ("wifi: mt76: mt7921: validate CLC firmware records")
Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index a118a301564c..40546005c743 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -477,18 +477,23 @@ static int mt7921_load_clc(struct mt792x_dev *dev, const char *fw_name)
 
 	for (offset = 0; offset < len; offset += clc_len) {
 		if (len - offset < sizeof(*clc)) {
+			dev_err(mdev->dev, "Invalid CLC record\n");
 			ret = -EINVAL;
 			goto out;
 		}
 
 		clc = (const struct mt7921_clc *)(clc_base + offset);
 		clc_len = le32_to_cpu(clc->len);
-		if (clc_len < sizeof(*clc) || clc_len > len - offset ||
-		    clc->idx >= ARRAY_SIZE(phy->clc)) {
+		if (clc_len < sizeof(*clc) || clc_len > len - offset) {
+			dev_err(mdev->dev, "Invalid CLC record\n");
 			ret = -EINVAL;
 			goto out;
 		}
 
+		/* Newer firmware may add records this driver does not use yet */
+		if (clc->idx >= ARRAY_SIZE(phy->clc))
+			continue;
+
 		/* do not init buf again if chip reset triggered */
 		if (phy->clc[clc->idx])
 			continue;
-- 
2.51.2


