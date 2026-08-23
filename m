Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65170C5DF8C
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Aug 2026 05:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VI+wC2ZwURtRw83o8Q0TT7vjqPfR+zB6SD6dpsg4Vi0=; b=W6wiv6HR2QqvboEm58m5yjLt01
	NmFeKRmq3c0nxcKKJuP+GPUmoLnhvHHnnJwLrx1HvpEv/hDhvnBpZPzoWJphsuojyK0KNHCGLOseA
	C6AmiynfemB3pxfhxRFAvgUoY1ps0Q7iSsT3sEzfeJ3tKTQmRY9x41neTqfbcqIpdU+iDTHs9n6Lu
	KsV6Tlz/CAat/prpUb9dj8bph888XbAmcSAnFv0N87jrugsvpbUqJclXMBJZD7PX2stYNKOkyuIcl
	vn5poYJOYB7yhJrpq6Sy0r8Rn2SIvCHSNy8jrQ5IY2sI9sSXcYh28GyB7hyG/dQtbEvd04HMO6avl
	wDywbdDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy0tw-0000000F6FB-192V;
	Sun, 23 Aug 2026 05:37:48 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy0tt-0000000F6Eq-0CXy
	for linux-mediatek@lists.infradead.org;
	Sun, 23 Aug 2026 05:37:46 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-39266382df6so1855143a91.3
        for <linux-mediatek@lists.infradead.org>; Sat, 22 Aug 2026 22:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787463463; x=1788068263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VI+wC2ZwURtRw83o8Q0TT7vjqPfR+zB6SD6dpsg4Vi0=;
        b=AuBHn9+qPID5NGgUVnf8Z8L94ycHV/SI51oGimmGI4ocxL3UC2XQobZ1qczUHpNe5S
         J8gPlGinrRIdHj79JtlwlwnkGeJd4JF/XcsqYdEIEoYBGmueo2QfnxvVnOo8DgsyAz4/
         IPFVLkG8+tbLeVx5XMEfe0TDPrsqMUTPtMTrQ4YBCSegvjyTHwhlXSJKx4NqiVmyiaeP
         96ZxNCoS7fQhTVzGNRzOvil+ZqsGVV0Pf6eu536963Y9hmoPbiQfT8T3HLXPYNsdI60o
         fPsFQjPl+FAEUBGryJf2p4VxL2pAoYFCmx/66xXREldETqP74c8O+hR8Be/83Fddpk9N
         qAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787463463; x=1788068263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VI+wC2ZwURtRw83o8Q0TT7vjqPfR+zB6SD6dpsg4Vi0=;
        b=PKUPKuWKOoehnouLTTLPm2DUis4+zmjwZaRCpD60Le22yEtiGLxxjqjdHDwEH/HQ1O
         GZlMP8d3+xsPyHOoc8mUJLW+h1Exjio0pr5GdpvG9Dkph7qVcqzgxku353UyU2bKP4tS
         zRFDapTttBoamhVgUathYBTQ/ZGL8DOa5R/KJCvWswHGhJgAGJWwiSAjQh6nDpVFwA8t
         WSD3zktWCt0qvVR4YR2IfLKm4EZDw60FVbgJVSKdsR2jZWhcCG51EUp+g1VGNQxtJlOP
         EPyYAeWoNxAdrdjoMp1PXh1Q1W9sDTFj2xKxDjrl52pOLzQ9cBU3KZZiEMR7JW0F9XcP
         9AtQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVGnV1C75Ua9t4OF3lqUyc6crp2EnG787YhB05PwsEA/5vYULS6u/7kKNqKcjCojnTSajHr3dG+u/j7GyzIw==@lists.infradead.org
X-Gm-Message-State: AFuF++mgG2X6dEqbW0IADtKomf3OBJnKKwduOWuPW6Hc/+5n7Pg4H1DO
	Q1/A4rxZHGU9D5kiWWIO3yzaeHLTEuvUhhgYxhNfLshMaull2eN6L5Nb
X-Gm-Gg: AR+sD12ey45F/IEPiWdgKMyqysaOLGdIa6ooq9WgakgOrh7u8Z2TaRxxyTRcq+6YEA/
	5KWCHtfpccUMmkVZLYGnXYFFuudbgskQZrvoVV4ADPr7EyPh57pZ/0ndTdYIuDnrsdKWjddHybG
	PuGgsk6QcRLA2S1MYJa6HJHqzEhy//IlSaPCZC5WdxiBCRefFSfJFk7Bpt/p5DxOYVIevzTl4aG
	qXwvSeDtEQIpkzRlyKIKgXB2jgH5u+BtSGTwQut4weF7wmWsteDQHCpwlHcpKitPXITbxZQZF1e
	pFCzOAvlt81FLp44u7i322ZuDiorayGgY3o/c6P43v8HT8lWKqjRXUjgrfjbKFaocDZIruJAh1s
	430LauPyns/PqTOTADMz8wfez6WLozIhAk1+zae768YoffurSyEUq+l4Ez5cDsUYWYx28e+Euhr
	hcDANEZL/yJ7LoYBIFuU1HLNu8LxCX7z1xPKxXDD0EMvZZgaXQgPFz0lo5s31khIOqb5juckCN9
	n7QpjbKWySgG7e/vW6IuAzQ
X-Received: by 2002:a17:90a:f945:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-395c35b75efmr31305716a91.13.1787463463365;
        Sat, 22 Aug 2026 22:37:43 -0700 (PDT)
Received: from abs.sf.dndws.com ([50.35.86.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4969fb1sm4884832a91.1.2026.08.22.22.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 22:37:42 -0700 (PDT)
From: Tao <gongtao0607@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Tao Gong <gongtao0607@gmail.com>
Subject: [PATCH] wifi: mt76: mt7996: fix struct mt7996_mcu_wed_rro_ba_delete_event layout
Date: Sun, 23 Aug 2026 05:37:39 +0000
Message-ID: <20260823053739.186748-1-gongtao0607@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_223745_097173_EC7AC134 
X-CRM114-Status: UNSURE (   9.49  )
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

From: Tao Gong <gongtao0607@gmail.com>

Correct the definition of struct mt7996_mcu_wed_rro_ba_delete_event to
match the 12-byte event record layout observed from firmware.

The event TLV sent by firmware is 12 bytes in length rather than 8 bytes.
It contains an additional 4 bytes that appear to be wlan_id and tid.
For example, a captured batch deletion of sessions 8, 9, and 10 (TIDs 6,
0, and 1) shows:

  00000000: 02 00 0c 00 08 00 01 00 06 00 00 00 02 00 0c 00
  00000010: 09 00 01 00 00 00 00 00 02 00 0c 00 0a 00 01 00
  00000020: 01 00 00 00

The previous 8-byte structure corrupts the parsing of subsequent TLVs,
leading to unhandled delete events and erroneous session deletions.
Consequently, clients that create and tear down BA sessions in batches
(such as Apple Wi-Fi clients) fail to properly clean up stale sessions,
causing HW_RRO to be lost upon subsequent reassociations.

Fixes: 0f89bf58efda ("wifi: mt76: mt7996: add wed rro delete session garbage collector")
Signed-off-by: Tao Gong <gongtao0607@gmail.com>
---
 mt7996/mcu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mt7996/mcu.h b/mt7996/mcu.h
index 71f87da0..922fec17 100644
--- a/mt7996/mcu.h
+++ b/mt7996/mcu.h
@@ -284,6 +284,9 @@ struct mt7996_mcu_wed_rro_ba_delete_event {
 	__le16 len;
 
 	__le16 session_id;
+	__le16 wlan_id;
+	u8 tid;
+	u8 __rsv1;
 	u8 __rsv2[2];
 } __packed;
 

base-commit: b2704cf5a4068b672bf47ad5bf6b4802b6770a90
-- 
2.54.0


