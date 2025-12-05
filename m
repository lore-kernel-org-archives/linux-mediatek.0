Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B3FD32D9C
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Dec 2025 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRu3vn/L5SRaR0SSwrxKoGLCPSzcYT0aQdaJ5FnQFyM=; b=HlG9gSh5Py7gRWgLLhgPaEEe96
	kQTvfqwHFNBURb01YMx+sD3SqZrQr7fDd0R/eETBBzIa2HPufOPkfhZNQhXiC7IY2M3pqaRlIF4qO
	sW0RDcihBetl89SczaIQkUfqIUhKmYJ3qZWhaufBJsyqXLiA3j8ahqJ6V3ljSNndeh3Y+lpmUR4eo
	g7ITYNEZm5a48f7JXp4RtgceTyN7osJpHlRrhk0seSLoETBhjW6nGuaFDtgfRWSRp9udIKrKkN9K3
	mfMWhhdgEBK3pnouNOrHL0UydxIFZe65nPDA12w0ck3TgPahsOA4IhWavh5Lmf5fAI5T0gvid66Y7
	ujW+btmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRY05-00000009fm0-3MhV;
	Fri, 05 Dec 2025 15:45:41 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRY03-00000009flY-3bsy
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Dec 2025 15:45:41 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-59584301f0cso2502743e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Dec 2025 07:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764949537; x=1765554337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRu3vn/L5SRaR0SSwrxKoGLCPSzcYT0aQdaJ5FnQFyM=;
        b=LxiISpvJUjVKmsPE/78ZpAnDci25jQJkU6YjMho11DOXjGvjl3KHQ/VyqwYK0fOBai
         ztrpVEPLW831b/Cgjo3PLilf1V3341UYQQsnxCmLeaI5lcHcj6Fz+BMzvMROJokZVmaA
         gIYk5pwKumNQzE4Q2OOs5XlX6N3MtS40zQAHBj5pGMb/T5+V6C7qyx5Xh7XGuNlhXkCZ
         C9Z/mwUchbSR2zwSUxVgcZTqEyxvhrwXySrQLrIQnabrkYmtlo/MSkdnR5NQ1jRo207q
         57hc0wMDgYW5IeD0KX2Ep+MPowy+1zNMzq1k53OaHx8evIYU5i/qzVDTZqn+0wniHVEa
         vHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764949537; x=1765554337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yRu3vn/L5SRaR0SSwrxKoGLCPSzcYT0aQdaJ5FnQFyM=;
        b=ZinLbkZCbKIZ6aY+9Ac+RdAF/kGrOE2CazyABaTbQEhs7W8IPfXVhcUDhDpbKPnJUe
         WZ2UBeR9AbYvwsvXkouICWmEtQJDPj87jfuIU46Op5EP9Tc6j2Pg8hrqB4g2LPVw5TSc
         BSG2AkjRx7b4SoMbHT7RYzvYn5cl88zWbZzxFiHwo2znpAax/iXnuUHenujhrlaUp/23
         hV9aG9znIeRPSct+NV0P/mpR3dd94WkbOQeYAhjVgPiMQ3cFo/XRWf4MnODOQvE3KBiM
         eg8SKSf4qu3MXUA5Vuz9yfIsbWpw+L07uYAu5HaWnmSMh2xmQb0HCmHrWjL/NZP3FLNV
         cPag==
X-Forwarded-Encrypted: i=1; AJvYcCXVhaDgogOP9QZSqQQJykqUJQmVC6SKvGgwkPL+6O1VuSXwnav/v77pkN3Hu4aSdUgleiEDuEUrkxyShEM5PQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVmMOjTmd5naF6Zt4y0QBVK2GBundA/BJsZn5BM+pv/LWNLnNA
	L4yJbPzeyJpJhGohpwrfU89qWBt/XLKVKMm4VxW2G4lg+qe6NCascqsNoy+Bl0QHV6KLFm3J
X-Gm-Gg: ASbGncuE+SGTmAx+OA594sRogiKwjfLXhL4sbCSRqMqNcliqFUkky4151LxxgNCLsJY
	EA3U7+8PGLzOtuNRifuMX3zxrrMyNkmnDRo4tAIc4skO8yrTzaubTNLZA3OeW0vz7x/70GJdSbN
	p2he5109ri5WojuuhkGnG4arFq3NWNOWJg21Ca6JMRI90IithVFWLQ1xV9qbZm+XaIDX1XqxqNb
	3KKpClsk2yIhgVBvVbszLrp2Rfo1FRXpcWafYKRjg29FtY4TsnbTgoqqwT4RrEEjXldEqKZ4qND
	p7tHlxlgTIHT1cvmWuLFR5kPjwVuFpKm8bPEwCuTmuho8bbfRH1ddGzZlKt804AyOIpnoK9fmSF
	D9wO5z1CFUiCWQ+FnskCb1EQ53gTHfeX4Kwe25MTftO3LjlfLMUTlAnPSDCaGZcRLr0YevstVR3
	ItxHctwi+vhCbyfygRKuayJQ==
X-Google-Smtp-Source: AGHT+IEuOdjJ6eVJfcxdzeuAE6q+1nDIVgt3bm5mPBvJGVsrRtI1D3I0YRQqf1Y/gNOXYRySnPP9ng==
X-Received: by 2002:a05:6512:3b9d:b0:594:55ab:5800 with SMTP id 2adb3069b0e04-597d66c8175mr2515414e87.30.1764949537099;
        Fri, 05 Dec 2025 07:45:37 -0800 (PST)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c2e93esm1624775e87.97.2025.12.05.07.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 07:45:35 -0800 (PST)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH] [PATCH] wifi: mt76: Fix strscpy buffer overflow in mt76_connac2_load_patch
Date: Fri,  5 Dec 2025 20:45:32 +0500
Message-ID: <20251205154532.27704-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R0YPGnQ@mail.gmail.com>
References: <CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R0YPGnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_074539_942818_8539BA50 
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


