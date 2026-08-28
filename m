Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FFDC61DBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 15:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NOOUEhwDmB12LFQNSiGGCOAzSpgGLKnq2vsZHwr0Wgg=; b=fJq6jx7vifvXg3H/M6Ocq27HDg
	+8u2ON25anP6htB/WJUyoNtTck5HIGwR5qqWxClxjjCbJVTL6107pnmj/ZuIHFh+Nl0AdwUH0KJDp
	UaIHU/TTGipfbAoIbEOsFT+I102fVxkWCbRvzedGeh0HJNehOofQruWmNQ8ECF0lCwkcuuN8Ddlha
	BDvHQDPth7kuS5ryfnQGzRX3o88Vib4Hj5/fDckgIuGJmQ4L9PkD9I4xjTAdRLJD5mjzXXYpdr1RY
	S4N64dfcMMXRCvzSMwgBLSWcx0jmdYT12JgNQ1olfySSQn2rCBFGxrc6rCOCqTWi1xMdHCug204nN
	OV9rqdMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy6T-000000062sg-1uc0;
	Fri, 28 Aug 2026 15:02:49 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy6P-000000062r0-3fSb
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 15:02:47 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc1c9879395so859943a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2026 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787929364; x=1788534164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NOOUEhwDmB12LFQNSiGGCOAzSpgGLKnq2vsZHwr0Wgg=;
        b=tMhUEjNJMyL5EzNhjDi2P1PWKY7x+JRAV8EF9t7QfYbaAK6QBqhQczQ8rgxZz3Jxx0
         +HwqK7V94d3U1xw7k8I68iOSBv9oyaBeM+2auBVuJfSTHth61oaAg2b9ZZF73FP+kLtv
         s4Adr+h6Fs8RRujtKKNj9i3WDqLzJymGErz7GIckb9Fuy79qgS9/JbtHPUL0Um8oYPK8
         Yk1SCGcMZ4IuksYfjnK2VDLMOeyyi02nCU4CYoY/MySPhHIbmYDVeS0O5zEAcfYbdOI2
         EZdtPrdDYdj50vqwK83I5Veg1hnv5bN6gQ/tHxs8Hs8TG/+fvW6z1tqtv3hFl4/WUwol
         Y6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787929364; x=1788534164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NOOUEhwDmB12LFQNSiGGCOAzSpgGLKnq2vsZHwr0Wgg=;
        b=Pz0BU87fMlyxNvOFtRAeBpfRt4VeN89u+m/43iKvioVHZ3IB1R3sT1xPOl4Wx2JmPW
         ePNAD/pricVPCdFp1kV28pdskDz3FW/DiXGvZDsEsL6La2LsQdEgxxB8b/asqlBRcUan
         9T/831AFtOcJpUJkGoQB65Zobz9yBN7dhq870K29jQOrWI4+3BEwl8rqbXXCmjt+qQQM
         uCY44wO+ckUvOfke39+ZF8ZpUM24+b1N2Bmapa57r6Sd5TNeZ8fiRdJnjA09I1sofJ3E
         dx6Ji6+3p1f8iT6/n5bqGPDX40O9oAKDNKpqtPhYPRe4sowbSJF//u63aTRFfkbtc9y8
         m/xQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlWIcRq3n47cAA72yW+b42lj5PDy1gzEvQeiroESJIIWkFeXNPc1XpxAXGsA0cQZc5wWAv1fIqxeZ1yd8qtQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kk49UvG13zibbFy8uztz3nhcFgjn8olab7X+NRe3sEO5sUIuId
	P0k6GLY0DVyRHrGEYoTWcrqXMV5EW/qg0XtvhW+GIoTEmKgQ2pEjxaWn
X-Gm-Gg: AR+sD1060Alh1wfqXkv9kHKPSFio6krjSQNDjUqSZgf3nBZ8MI1qtA1XrWdmSGCoJ7c
	7teX1PZqndjGBUh1QbnEuVJJ4L+j1ElT05X/rfK9DZnW1WKvm3v7KxfYozCox7ddOt3WTuR8+Vw
	zEkl9EfmWDqtBzOUC/FQA2Yh1fsDb0zUocxIqDFqd3YC4h7lsNtArMIe22Ami25uXHFRXB+a5TM
	7D6boOltZurd1tLx80aWtzmOnlwLITRDdvI6LG7NorbArYWrkCLIbcB0r41Lq2ClqnZLYZdAHQE
	cu7HXWHhhxS71qb/cv/FP47SKU+4n4YDz0I/N1hBq0HWnipxKjTn5gdsZHjUtOKqv73IPwjGOK8
	g9Az+kHH0BFKR4PFjGiN6VyiDVoA6FGHUbNySDi9fTSgltH/8zCQUxWZEoL0oRyIU6/9dT2s7YX
	4QT/AAm3tTqlKwNUi8DErM3ZpApV2Fjdi42CYpdZgfnfk12cmkzkKhbyBPIlRGT9HMLdj+kK1yy
	A0hz7hqbQ==
X-Received: by 2002:a17:90b:5188:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-396d0ea530emr17557004a91.4.1787929360339;
        Fri, 28 Aug 2026 08:02:40 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396db196903sm2911068a91.0.2026.08.28.08.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:02:39 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: Ridham Khurana <khurana.ridham222@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt7915: validate default EEPROM firmware size
Date: Fri, 28 Aug 2026 15:02:22 +0000
Message-ID: <20260828150227.1062217-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_080246_032090_9989EAC5 
X-CRM114-Status: GOOD (  10.37  )
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

mt7915_eeprom_load_default() checks that the default EEPROM firmware was
loaded, but not how big it is. It then copies mt7915_eeprom_size() bytes
out of it, which is 3584 on MT7915 and 4096 on MT7916.

If the file is smaller than that, the copy reads past the end of the
firmware buffer. The extra bytes are whatever happens to follow it in
memory, and they end up in the EEPROM buffer that is later used for band
configuration, chainmask and TX power.

Check the size before copying, the same way
mt7996_eeprom_check_or_use_default() already does.

Fixes: bbc1d4154ec1 ("mt76: mt7915: add default calibrated data support")
Cc: stable@vger.kernel.org
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Based on next-20260828; applies cleanly to v7.2.

 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index fe7b29ebc0bf..145d14a1012d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -111,6 +111,12 @@ mt7915_eeprom_load_default(struct mt7915_dev *dev)
 		goto out;
 	}
 
+	if (fw->size < mt7915_eeprom_size(dev)) {
+		dev_err(dev->mt76.dev, "Invalid default bin size\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
 	memcpy(eeprom, fw->data, mt7915_eeprom_size(dev));
 	dev->flash_mode = true;
 
-- 
2.47.3


