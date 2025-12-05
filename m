Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72158D33981
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Dec 2025 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRu3vn/L5SRaR0SSwrxKoGLCPSzcYT0aQdaJ5FnQFyM=; b=2UcuFAqBQ1oV77VX1UZbq6RA+R
	EtCpz93tO9qz/mL09an495baPDi3shfiFO1v8uRI/LO8wqP9D0Sx4yQ4Zdr30eLfgcAiSfbcjMABP
	pa80QVLmpGx6Qxbpuv+xERr9jIO0V08TkTHBYuNlz5rkUZYBz3XaGRQ2sSOZv6xQsS/TIM9dLC6Hx
	WxDWhqdNfUZdyjR1iri8TNyORnnsOzVrkuKX0uGvg88OdVesIX8Gp/mMI0iHZNCrddUTIwU65meh3
	tv2paIHnJnwOjsW4iCzWcLNPRZRetmwvYpflyTfAOdn0wmylEnRnnivlZBRiBeVQzdBPku+QKQXIb
	OQ3owvWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRYQ2-00000009h0e-44RJ;
	Fri, 05 Dec 2025 16:12:30 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRYQ0-00000009h08-0Yqy
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Dec 2025 16:12:29 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-59578e38613so2618234e87.2
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Dec 2025 08:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764951146; x=1765555946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRu3vn/L5SRaR0SSwrxKoGLCPSzcYT0aQdaJ5FnQFyM=;
        b=dyta40xzknIEpQB8pcXAXcWAsTZao9D15tm8/8WnjX7880dIXgCB32aBtebgV+h1nu
         FGNAYXLirK0yUxLv/YB2jXzswNQsKpvD6Ks7Vupn3wSODq3AkbyqlBN4fl0iM24BucHM
         7wSlwcxUlvxZ7RAAsdAK1dACZTFJtZjJNyK02RftjvPpCpQifmr8XK25Q/SRwc9/amn+
         9Hc7ydpSmXX/C0c5s/tuIkZSHDAThBUDmXbREMItkJDmxDxprgDN7vaiBn6QUtkuVbEg
         1hPiJU9ZCpMHhL9yhdhEhbiD03iEqETm9cRuYynt4HGDNadvjxX0gJCN4jBgaMeXLHck
         nzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764951146; x=1765555946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yRu3vn/L5SRaR0SSwrxKoGLCPSzcYT0aQdaJ5FnQFyM=;
        b=IdXNQbDTB0vjET+jyk2gl69LGqAZn8KWdHBPV5KxUGbb3D6QI/vucqUn1IofdhELWa
         CLYXYgHaxfCeShvI+8F5qvFDmTDDNFnxSXZQml1ztUjeZFzgSTSwXdtpq8H+z1t+72Ln
         6aOCYhNmRFwqz+6obP0Hx3cXV0J/DNXNSuQ18FkV1aMJY7T0/+PvA6Zcf2xhp1cPYIGv
         lhNUNUImbSQjoAUu8PQ1bm6GGssyPEPtEsuRzLxzAXRq9kVXwzHnBFdvXWseALYpZaeQ
         TbmJdNH5L7NECkDAb+iE3K6qY1Elz03C2xlC1E6ywE7Uanj6fZxGJ+HdAEErzc0lQaGI
         NABQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjcG2VFN/n4jEKWqLggCQldT9R5oJjqccJ+3ZsW2LKoCtOWnoWUlGFB9mqj+Ni1/QUkmDYCFtibOz+Lm0J9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJSxzjbiEfV+ePv7c/yf9PXnRgb6weDL4EGPDReNiPgTQ96/NR
	goLDrL8WSQ01b9jNUSRLFfPof1tjjDBOxy2fnQzebGcv8n+l4SAf0HUO
X-Gm-Gg: ASbGnctO6uims2bku1RRC+JA1ckjvhuc8dPvSzXt294dCEknOnbPbttKZGyEwg79pP8
	YFNNDZ7KBZ1o+iLF63PmRROhlTtxVhXa8MavvMPaZLROrqQ9um3yjgeUp223R3mcWOf4Uc6kHn/
	QQA9kxQfzlmSObazTSoQEJTb5Qq1gde6urmB+A/P2DUh4B/mN0TW7IKjYtzl076wyvf5FdVS8pq
	mLU0pV90r8bhbaLj7fvt9bIDToiPhsCJ7U/FGBYN3Al7T6whzdZixyz7fEwJKMnxcsPDK44E/sQ
	EIsiX3031KVaDKk/6kmEB1l2l3Gg7dWP7Qt1gjZBZDXnjGg+TT1/1soD/VAYl2HeomTuICjpm/W
	D3g4jOmm/0CJ84u3gq2Jivc74ahTI6LIrZaFmyw9rCvxqKCAjaNCMtmdmUhr4Bo4FcGTV6NwQ0k
	82jYe9m7v5e36gdVQQXgPpGw==
X-Google-Smtp-Source: AGHT+IFIv8sNT85tAoTM0JCKoOGi4DeHIdsW4Qkp4uPPjvN5cusGwlRPEBYBIrgPH3hNnQEFUHZHvw==
X-Received: by 2002:a05:6512:39d2:b0:594:b2be:f3a with SMTP id 2adb3069b0e04-597d66c816amr2685904e87.25.1764951145521;
        Fri, 05 Dec 2025 08:12:25 -0800 (PST)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a920sm1654026e87.12.2025.12.05.08.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 08:12:24 -0800 (PST)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v2] wifi: mt76: Fix strscpy buffer overflow in mt76_connac2_load_patch
Date: Fri,  5 Dec 2025 21:12:02 +0500
Message-ID: <20251205161202.48409-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R0YPGnQ@mail.gmail.com>
References: <CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R0YPGnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_081228_207450_81267495 
X-CRM114-Status: GOOD (  11.36  )
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

Commit f804a5895eba ("wifi: mt76: Strip whitespace from build ddate") introduced
a kernel panic/WARN on systems using MediaTek MT7921e (and potentially others
using mt76_connac_lib) due to an incorrect buffer size calculation.

The error logged is:
"strnlen: detected buffer overflow: 17 byte read of buffer size 16"

This occurs because the field 'hdr->build_date' is a fixed-size array of 16 bytes.
The patch allocated a 17-byte local buffer 'build_date' but used 'sizeof(build_date)'
(17) as the read limit for strscpy, causing Fortify Source to correctly detect
an attempt to read 17 bytes from the 16-byte source field.

To fix this, replace strscpy with memcpy, which is appropriate for raw data
copying, and explicitly use the size of the source field (sizeof(hdr->build_date) = 16)
to limit the read, followed by manual null termination.

Fixes: f804a5895eba ("wifi: mt76: Strip whitespace from build ddate")
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index ea99167765b0..d2c4c65ec464 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -3125,8 +3125,11 @@ int mt76_connac2_load_patch(struct mt76_dev *dev, const char *fw_name)
 	}
 
 	hdr = (const void *)fw->data;
-	strscpy(build_date, hdr->build_date, sizeof(build_date));
-	build_date[16] = '\0';
+	/* hdr->build_date is 16 bytes. Copy exactly 16 bytes to the 17-byte buffer,
+	 * and then add the null terminator at index 16.
+	 */
+	memcpy(build_date, hdr->build_date, sizeof(hdr->build_date));
+	build_date[sizeof(hdr->build_date)] = '\0';
 	strim(build_date);
 	dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s\n",
 		 be32_to_cpu(hdr->hw_sw_ver), build_date);
-- 
2.52.0


