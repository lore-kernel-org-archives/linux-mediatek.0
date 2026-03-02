Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EDAEA4E08
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2026 14:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BpP3A8r/Zsel4oeQ6sBuhbmtBjglFyQ+KJoiCGZoZ0=; b=NNMJFc2HQenBki62yKobLw4XgD
	u/RZ01T2uv++bsoKHETkZA5w+Bec6dS8kapTes76JcHc/9vJLXtKR/uxk2JmDm8Gc6XPwdgSSInBY
	CVU4P2mPmm63rm7e2SidCaiDZtg/5DMR4nbXRDwdze1GCcnUqC294m3TPb3ZXHOykHp/8XazBmfYp
	uTORlyRY3tPmAOMVefA05rqMcPIKsbkQfJhbSuNWT46w94BHYQb89tmNdZcgZfNII1fRXjjcB5ty6
	2H62Y4QZg8auPaFQycuBDbtsitOVwrC71KU5HqgCo7bw5u7HPy3nqye1x5G3IxamcAFXHVbzbDqgP
	7hjYv4Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3q5-0000000DC6k-064h;
	Mon, 02 Mar 2026 14:01:37 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3q2-0000000DC61-2GUG
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Mar 2026 14:01:35 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3597b474cbdso794723a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Mar 2026 06:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772460093; x=1773064893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BpP3A8r/Zsel4oeQ6sBuhbmtBjglFyQ+KJoiCGZoZ0=;
        b=AokUtbkbOUG9HVaks5TX/6h+6pfcLQ72Kkta3/bnBCiJlZ3Xqdm9kEn1fDZ9XJyhPG
         rD8GBf+i6Vu4hsBCP2n54KYyDYlgf6kGQLO8H0eTqANZxyK/k5PBWA1VeGbpIw7Lvp1N
         Ov+gOdlFJwULPdM3T5pl01YXZN5FB0Hwpc9R5G3hzDm2oxY1k4gCc5Aqr0NUlVjI1Iz7
         2lmehPE1zaEikmCRr/S/JUavLb0t4JhWFxiCrPHngFQ1XNS4AbK+ix+vle8zr5Oqnxij
         JC4MCYOYmC3aWO2mV2W2F1yN3v1UaEFTsoLOpOfBV1oxLhdUkNNhO3euO1d54l98xGnh
         7Ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772460093; x=1773064893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+BpP3A8r/Zsel4oeQ6sBuhbmtBjglFyQ+KJoiCGZoZ0=;
        b=rasxXUIM09JL89Z1aNHrsq7f60fNwRhNMIr58YTo4fAU6gwA8LPAGH1rwzJKJEFeME
         ZeiQy/Zhg6+udeC9VAYZVWQfeltLxRE34pSi1OSWOKKGjcpKXycWAtntNqJoUzKNKRqD
         /n4UWyRO8bmrlJPpnUoWRLcLlM0b6ydu9GpeRRjol26P1dBIJfEiZNVhIXoAIl5Ftj2I
         kuCq6PSTohceT4eU0R+YRAxZFPsXkdaXDc+YgG3zy7SjJu9yFHn5AZdJapA4n9B6F5+8
         qvl49Zvexf7iYvuvq7aNEecV3krNcC6gsmVKZEnSGKWrcwDUGlcLJeGIUGDugqndI1qE
         C+4g==
X-Forwarded-Encrypted: i=1; AJvYcCWktCTj/4vvnltYyWWxxvKZEEMMjRZH+dnnF8mjHhqT7CamC2MHmLfDywY4ddT0jz6BlH9axCMdBHF7RTCx5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFEQiYyCLi0lS5RYlycBLzmng1LmR8wJe6oOGDmXWRIyPRhCMz
	qsR0D64BJozKWhlecDwzNaKa3pUl09KvQS9+AMACpcVQdQzrKt1+Jq9I
X-Gm-Gg: ATEYQzwlipInwhUnLh6k6b69Z/Waf/3SR1H8eVHZ+J9X1fvZFgXrP9gmDZ9sH3K/IOe
	8HG3XJJzhJAFL7dw1u9zG/BwbqzK7ofBfYbsMF9CD8dvxntU+/dFbvI3MXEy7sZsLDqh8HVoIek
	+dqxUiO6B9Yd1DSEcLd4oskbSYNMrfwC0mt21cUCw5ilR6fm+L+3MxRnf+6EOdMoF2kaLM+SE8I
	iRqJwCfWXRwGsClhJ3zieqjx6JBAiOpJvtJYGbQRy8jBL3Wu0P5XXw2KR/58EAbil2Xr8W4X9+2
	vZIhvJJ8u19qSa79Oe/k9iBylSapa/JWRnipIMa+0i1bfKpzHu709ReGx3PSuB2evi8VFi3gRxr
	m8xrq7tSO3q4FCdEl6JkgRTDAVKlpIKT7X3zTNIoCz0Zg+RCqmDbFV8rklM416kUv/5TBhjpDsd
	q8xALkfsXSC3WqfTXjn9ZW41haXpVay4HXAUg6thX9JKG/5VjWdajiJmnU2zxFxVl4f/yR/szxI
	9RnbwL5beeGzew5yg==
X-Received: by 2002:a17:90b:5550:b0:359:8c21:ef46 with SMTP id 98e67ed59e1d1-3598c21f117mr3504906a91.13.1772460090604;
        Mon, 02 Mar 2026 06:01:30 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3598d0b793bsm3330283a91.4.2026.03.02.06.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 06:01:29 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: lee@kernel.org
Cc: matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	y.oudjana@protonmail.com,
	angelogioacchino.delregno@collabora.com,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2] mfd: mt6397: Properly fix CID of MT6328, MT6331 and MT6332
Date: Mon,  2 Mar 2026 23:00:45 +0900
Message-ID: <20260302140045.651727-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260228190820.357538-1-akkun11.open@gmail.com>
References: <20260228190820.357538-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_060134_603294_E4056982 
X-CRM114-Status: GOOD (  13.63  )
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

CIDs set for MT6328, MT6331 and MT6332 are not appropriate.
Many Android downstream kernels define CID as below,

MT6328:

    #define PMIC6328_E1_CID_CODE    0x2810
    #define PMIC6328_E2_CID_CODE    0x2820
    #define PMIC6328_E3_CID_CODE    0x2830

MT6331/MT6332:

    #define PMIC6331_E1_CID_CODE    0x3110
    #define PMIC6331_E2_CID_CODE    0x3120
    #define PMIC6331_E3_CID_CODE    0x3130

    #define PMIC6332_E1_CID_CODE    0x3210
    #define PMIC6332_E2_CID_CODE    0x3220
    #define PMIC6332_E3_CID_CODE    0x3230

The current configuration incorrectly uses the revision code as the CID.
Therefore, the driver cannot detect the same PMIC of different revisions.
(E1/E2 for MT6328, E1/E3 for MT6331/MT6332)
Based on these, the CID of MT6328, MT6331 and MT6332 should be corrected.

Additionally, the incorrect MT6331/MT6332 CID overlaps with the MT6320's
actual CID:

    #define PMIC6320_E1_CID_CODE    0x1020
    #define PMIC6320_E2_CID_CODE    0x2020

This causes a conflict in the switch-case statement of mt6397-irq.c,
this prevents adding support for MT6320.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes in v2:
- Remove GitHub links from the commit message as they may become invalid. (Requested by Angelo)
- Add Reviewed-by tag.
- No code changes.

 drivers/mfd/mt6397-core.c       | 4 ++--
 include/linux/mfd/mt6397/core.h | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 3e58d0764c7e..1bdacda9a933 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -297,7 +297,7 @@ static const struct chip_data mt6323_core = {
 
 static const struct chip_data mt6328_core = {
 	.cid_addr = MT6328_HWCID,
-	.cid_shift = 0,
+	.cid_shift = 8,
 	.cells = mt6328_devs,
 	.cell_size = ARRAY_SIZE(mt6328_devs),
 	.irq_init = mt6397_irq_init,
@@ -313,7 +313,7 @@ static const struct chip_data mt6357_core = {
 
 static const struct chip_data mt6331_mt6332_core = {
 	.cid_addr = MT6331_HWCID,
-	.cid_shift = 0,
+	.cid_shift = 8,
 	.cells = mt6331_mt6332_devs,
 	.cell_size = ARRAY_SIZE(mt6331_mt6332_devs),
 	.irq_init = mt6397_irq_init,
diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt6397/core.h
index b774c3a4bb62..340fc72e22aa 100644
--- a/include/linux/mfd/mt6397/core.h
+++ b/include/linux/mfd/mt6397/core.h
@@ -12,9 +12,9 @@
 
 enum chip_id {
 	MT6323_CHIP_ID = 0x23,
-	MT6328_CHIP_ID = 0x30,
-	MT6331_CHIP_ID = 0x20,
-	MT6332_CHIP_ID = 0x20,
+	MT6328_CHIP_ID = 0x28,
+	MT6331_CHIP_ID = 0x31,
+	MT6332_CHIP_ID = 0x32,
 	MT6357_CHIP_ID = 0x57,
 	MT6358_CHIP_ID = 0x58,
 	MT6359_CHIP_ID = 0x59,
-- 
2.52.0


