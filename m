Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5D0C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jul 2023 18:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tmRRo6z0XJwtogTJmOfSjBRBDz+vO2d86DnPaoTj2os=; b=ZLidl7FykOsB/5Bu5L5P81TDEx
	xn1YGec/61qgfhTxm4yto/+KPPjwD5sFSGsr77S/IOFkchRM65NbZYXhCIoNFvCw57b0E+iEU1+ow
	E/Xs5a/JBwkfqX2zYBpRC1t3HU/nhGoe2lE1cGPZb11x1cQV/c3spHG/3uZBQ/Y0gbbBKOCOifh/3
	Uhop7+RiNh87jTe55KlByh6CjG4eeAjRqES4PGUTdBR0MqqmEwTag0huseDjRcmFYyUkXdB7a74Du
	wYPfX0fq7nleA60w4BUQbrzJAb7c726aNmC0jrKo4xND7W6Hs4VGXcmWSfZmR7gxAj5qmyeYM7HbP
	vBhr2/GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGO2z-00BAqX-1N;
	Mon, 03 Jul 2023 18:13:13 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGO2v-00BApT-2A;
	Mon, 03 Jul 2023 18:13:11 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3460815fde5so10662245ab.2;
        Mon, 03 Jul 2023 11:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688407988; x=1690999988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tmRRo6z0XJwtogTJmOfSjBRBDz+vO2d86DnPaoTj2os=;
        b=N7LftLLzwG4FVV8gMviY4BSuVmH2NBnGjrtgBbKWD7zYoAWyMb7QwJslEfKQUQLbu9
         iniHAJ0Zk22a9thimxyXsSBxGXNjg65+6NGwNR1u1c9UNtBtSfDMBWdHnznK/D5XEWnu
         7+ZdqdQTRMiqHfMUR4L3Yp2glX5KEwWrZ9NaiH4gdJ0Hg4aG3tjVp0VPorbiGX5wP5aF
         NdF/cSK/wT3uwDsgeSm+T3IKtjzdRXENsygoZnWLO/hKPqWhWZZ5SbCwbulWSbipepqD
         gfdZivKdwSJsRr81JE80w+x7ImxLr2iyPXG5ul/IpdIVO5v7iwR8ihrS2ki5/weLD3j/
         8VTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688407988; x=1690999988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmRRo6z0XJwtogTJmOfSjBRBDz+vO2d86DnPaoTj2os=;
        b=G19cxKaH0eiqzRYJn8TL6HmLsD8bpwFPLEq7hscNNtc6GKlbXtwstxmUDJ0+oEi2hJ
         ESm+xWWzadYtawuKQx4W/9NBZcKW6zaSwrGJIAgLhVOBKfJQmINd/FJXNif0nPz5PofJ
         0rd1ZjVeur69gEXE7HwKb+glfs0EyMTTPDg79Urs8FmxEhHvgTgDRXgxayDs6AZHCUG/
         0yZcWo+HftghVmQlOsMyEXzpeXDU8i8pO6ktpN5iWuMTLVIbbgYBxgiHaU39EC3Sz08I
         P2LVTWWvVc4Q2MVFkhWCoHZdftDMRByHuORUfJ9W/g6J07QVwupfykA7vZIw8nbbzxMX
         Nt4A==
X-Gm-Message-State: ABy/qLY0BMrWXHr9zVZTVlUaUEVmR3stOSmjUEr4At5u9dToTUxKN3dU
	gdGLTzYgml9CmVmvecLZiP0=
X-Google-Smtp-Source: APBJJlGlnasrPWopRlCXCRRfFTTSXyyifBfokHy4PV4SWPr4ghDQfwib3FELtUGie/MRK29F5WunCw==
X-Received: by 2002:a92:d7cc:0:b0:345:c1cb:864d with SMTP id g12-20020a92d7cc000000b00345c1cb864dmr10631401ilq.23.1688407988396;
        Mon, 03 Jul 2023 11:13:08 -0700 (PDT)
Received: from azeems-kspp.c.googlers.com.com (54.70.188.35.bc.googleusercontent.com. [35.188.70.54])
        by smtp.gmail.com with ESMTPSA id h2-20020a02c4c2000000b00411bdcdc488sm6276548jaj.173.2023.07.03.11.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 11:13:08 -0700 (PDT)
From: Azeem Shaikh <azeemshaikh38@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: linux-hardening@vger.kernel.org,
	Azeem Shaikh <azeemshaikh38@gmail.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: Replace strlcpy with strscpy
Date: Mon,  3 Jul 2023 18:12:56 +0000
Message-ID: <20230703181256.3712079-1-azeemshaikh38@gmail.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_111309_716238_6E0799F0 
X-CRM114-Status: GOOD (  11.06  )
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

strlcpy() reads the entire source buffer first.
This read may exceed the destination size limit.
This is both inefficient and can lead to linear read
overflows if a source string is not NUL-terminated [1].
In an effort to remove strlcpy() completely [2], replace
strlcpy() here with strscpy().

Direct replacement is safe here since DEV_ASSIGN is only used by
TRACE macros and the return values are ignored.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
[2] https://github.com/KSPP/linux/issues/89

Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x02_trace.h       | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h | 2 +-
 drivers/net/wireless/mediatek/mt76/trace.h               | 2 +-
 drivers/net/wireless/mediatek/mt76/usb_trace.h           | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h
index d3eb49d83b98..9be5a58a4e6d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h
@@ -14,7 +14,7 @@
 
 #define MAXNAME		32
 #define DEV_ENTRY	__array(char, wiphy_name, 32)
-#define DEV_ASSIGN	strlcpy(__entry->wiphy_name,	\
+#define DEV_ASSIGN	strscpy(__entry->wiphy_name,	\
 				wiphy_name(mt76_hw(dev)->wiphy), MAXNAME)
 #define DEV_PR_FMT	"%s"
 #define DEV_PR_ARG	__entry->wiphy_name
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_trace.h b/drivers/net/wireless/mediatek/mt76/mt76x02_trace.h
index 6a98092e996b..11d119cd0f6f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_trace.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_trace.h
@@ -14,7 +14,7 @@
 
 #define MAXNAME		32
 #define DEV_ENTRY	__array(char, wiphy_name, 32)
-#define DEV_ASSIGN	strlcpy(__entry->wiphy_name,	\
+#define DEV_ASSIGN	strscpy(__entry->wiphy_name,	\
 				wiphy_name(mt76_hw(dev)->wiphy), MAXNAME)
 #define DEV_PR_FMT	"%s"
 #define DEV_PR_ARG	__entry->wiphy_name
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h
index 9bc4db67f352..887d5cfddd01 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h
@@ -14,7 +14,7 @@
 
 #define MAXNAME		32
 #define DEV_ENTRY	__array(char, wiphy_name, 32)
-#define DEV_ASSIGN	strlcpy(__entry->wiphy_name,	\
+#define DEV_ASSIGN	strscpy(__entry->wiphy_name,	\
 				wiphy_name(mt76_hw(dev)->wiphy), MAXNAME)
 #define DEV_PR_FMT	"%s"
 #define DEV_PR_ARG	__entry->wiphy_name
diff --git a/drivers/net/wireless/mediatek/mt76/trace.h b/drivers/net/wireless/mediatek/mt76/trace.h
index c3d0ef8e2890..109a07f9733a 100644
--- a/drivers/net/wireless/mediatek/mt76/trace.h
+++ b/drivers/net/wireless/mediatek/mt76/trace.h
@@ -14,7 +14,7 @@
 
 #define MAXNAME		32
 #define DEV_ENTRY	__array(char, wiphy_name, 32)
-#define DEVICE_ASSIGN	strlcpy(__entry->wiphy_name,	\
+#define DEVICE_ASSIGN	strscpy(__entry->wiphy_name,	\
 				wiphy_name(dev->hw->wiphy), MAXNAME)
 #define DEV_PR_FMT	"%s"
 #define DEV_PR_ARG	__entry->wiphy_name
diff --git a/drivers/net/wireless/mediatek/mt76/usb_trace.h b/drivers/net/wireless/mediatek/mt76/usb_trace.h
index f5ab3215af80..7b261ddb2ac6 100644
--- a/drivers/net/wireless/mediatek/mt76/usb_trace.h
+++ b/drivers/net/wireless/mediatek/mt76/usb_trace.h
@@ -14,7 +14,7 @@
 
 #define MAXNAME		32
 #define DEV_ENTRY	__array(char, wiphy_name, 32)
-#define DEV_ASSIGN	strlcpy(__entry->wiphy_name,	\
+#define DEV_ASSIGN	strscpy(__entry->wiphy_name,	\
 				wiphy_name(dev->hw->wiphy), MAXNAME)
 #define DEV_PR_FMT	"%s "
 #define DEV_PR_ARG	__entry->wiphy_name
-- 
2.41.0.255.g8b1d071c50-goog


