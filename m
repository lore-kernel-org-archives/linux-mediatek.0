Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72963C46CD2
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jan 2024 17:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r13Vjhpp1w8wUVvF7CjpGTyopMC4ZZNMQ+oZrZiXUO4=; b=CyT2Q1g2+8IlknGHACPhFUzWZP
	B8DXWZDuhluK64gpAgZ+GCIfvMzlacwXufbNn31Yq57srDfhZrALV1BqG3EY6DWRyV6tUov87MV/o
	JWmcGVW/anQuwLDSf/seoHMu/gEzl85n0WQRYfU5wIZmAutyjclnltRbe74jNc97f//1w7/zAcKD2
	7f8eGTDAMOHJd/JpwdKCfLcpTRUoyDFtC+gMqPpTz3YP1S96RGeVg5+HW9oJkoLzN5juv6DJu5YEk
	V1QSKqXDgVWKYvKGYEhmPI1p+cIZ29URpb9dsdrNzOk8hRI6UXZ8ps9v1biphH7VsmXZfN1Bln7zW
	7FMdY2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTm6k-00000007sg1-082v;
	Sat, 27 Jan 2024 17:04:42 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTm6g-00000007sfY-3yc2;
	Sat, 27 Jan 2024 17:04:40 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so1189672a12.1;
        Sat, 27 Jan 2024 09:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706375076; x=1706979876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r13Vjhpp1w8wUVvF7CjpGTyopMC4ZZNMQ+oZrZiXUO4=;
        b=FzHWSwLjli4kJNQCzoM5YqEqK7yQGH2BKKD86Tz8v4SwPL5Sw66IUjXLBC7x3HNvY/
         18CFOQTqSvFY0T45gUlfnB9K5EYSr4NAeOVaOcUX60UpXjWGG1sekkAZ4/t5b5Ko/xbY
         Mg65SPGcik+KjvDkVk3LCqZdmSm+kA5t7Q6PYl4O5/JkRTPExU6Leaa8Ygga9IwVfDjn
         TnDOQsPv51bjFJSduR1C2bNC/7uibrgQ/5M3dYIglN/r3bvaAqnc66kOg/ZrqDw5zzKD
         2usRonJOZbRZ9zMpn8nXdEaNxCO7DWNdyuX5V07sqgzem6tTtsU5SJM5fRfPzA8DA345
         5aHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706375076; x=1706979876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r13Vjhpp1w8wUVvF7CjpGTyopMC4ZZNMQ+oZrZiXUO4=;
        b=KjyHZGhcvIjFmoJzynNsJ8ruXczgjtyhK+yS6GkBKlQW5Lu7h8ne2n+U8FetEdOpuG
         Hx3c+v/qZuyyXaVFNpm1U+1ZbX1uZlKMDu9EERjZ6EoUOj3/OfwAX1bRD5ldrcjlQYir
         RkGLKrHDpC0V0/4Zh/0NG55NfdHMCX35CW3I1wmQde1v11KxDZf3gKggLO+k/4l+mZcL
         Rifo+oZsYQCqaQ7imOwfnKG7nrE1fsDTcInhjYuaqfSEQlFVM+qOTzIGyIgCLg5tnMdW
         TZGTaLvF3WK3wgxd655pbjwMt0HNoHPpRF2YHxxXHlOPtWx7FCkA4um4s8VqAPCZMSMH
         0ofA==
X-Gm-Message-State: AOJu0YwQ/bu6tINQe0BQE3w02z0OEngl8Ew42SKzYCIbnCg3Nfc0hY4K
	2/d6iFwNQHHak4J5oTUwxYqRnXmeZjCD9tRY4CfHN6qPB6VrlVnApbCTl/O/HHI=
X-Google-Smtp-Source: AGHT+IE+5nHeNioxu7G8Kqsq/+WxVEz/RqtW33uaScGNhyPBfdpbDeCRCclIYUZEk8dRLEWDT+CBRA==
X-Received: by 2002:a05:6a20:a209:b0:19b:2303:88a4 with SMTP id u9-20020a056a20a20900b0019b230388a4mr1529034pzk.105.1706375075733;
        Sat, 27 Jan 2024 09:04:35 -0800 (PST)
Received: from gen-frame.. ([2607:fb90:8763:4b41:e82e:cfdd:7c39:5874])
        by smtp.gmail.com with ESMTPSA id h2-20020aa79f42000000b006ddc2a97806sm2994160pfr.213.2024.01.27.09.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 09:04:35 -0800 (PST)
From: Gen Xu <genxu6@gmail.com>
To: lorenzo@kernel.org,
	shayne.chen@mediatek.com
Cc: nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Gen Xu <genxu6@gmail.com>
Subject: [PATCH] wifi: mt76: fix ethtool stat for EHT rate stats
Date: Sat, 27 Jan 2024 09:04:30 -0800
Message-ID: <20240127170430.68427-1-genxu6@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_090439_009365_DB24678E 
X-CRM114-Status: UNSURE (   8.78  )
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

The patch add the missing ethtool stat for EHT rate stats.

The commit 731425f3a940d01be0cab0a5e45382988146aed8 introduced the EHT
rate defined in struct mt76_sta_stats, but missed to add stats string to
mt792x_gstrings_stats, as mt76_ethtool_worker walk through, it prints
out error like this:

[98179.287352] mt7921e 0003:01:00.0: ei: 74  SSTATS_LEN: 73

Signed-off-by: Gen Xu <genxu6@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 502be22dbe36..fb35eff6dc7b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -354,6 +354,7 @@ static const char mt792x_gstrings_stats[][ETH_GSTRING_LEN] = {
 	"v_tx_bw_40",
 	"v_tx_bw_80",
 	"v_tx_bw_160",
+	"v_tx_bw_320",
 	"v_tx_mcs_0",
 	"v_tx_mcs_1",
 	"v_tx_mcs_2",
-- 
2.43.0


