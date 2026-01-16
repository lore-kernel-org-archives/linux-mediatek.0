Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B434D47CAE
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUlCSJ4sVDZpvZSnTCZZWPWUvx5qo1tAq80JkqdgelI=; b=V/FFq217kSM2EBlEWbhmSsQVbU
	QavkWMKPwUSzkBerCVbXTEqSIw0HMY3wUaei89O5w0xW5O7Ju5C3IMISvJ3oPPNA6+s6cAC8q6/xX
	1SdiNIbAlX3TsoBVOkw5qFOaLroIZ0RLHLisYvvoC9DZSwB0jxZp6xYgWGhAiSX9auXof90kC2xTe
	trViaYS4LOcGG6ppI827IqAkHuJUVqNkk8L2puHySPD2UKYBNE8tP4+TJNVKBk0kIGLhrnk47tmMu
	Rb+W76kpYZe2zXPe6KD2Dj+nScWE068HEMpO5gjg9W5lU7q+sH9SdV1HtJRPfBYTvLb7VLJBik74U
	6btDHhnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHg-0000000DOgt-0jpU;
	Fri, 16 Jan 2026 01:05:52 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHc-0000000DOcE-0Y5L
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:49 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-121bf277922so2035110c88.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525547; x=1769130347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUlCSJ4sVDZpvZSnTCZZWPWUvx5qo1tAq80JkqdgelI=;
        b=P4gclp/OggnJZBgzqAmo2Yvxs2iijdLhEbpKxzNvC/6VQuiHk6OyB0kGrBNMKFP/Cm
         sOa73JP+sunc+GHM5ybCnDwxM15caBVbZw2A0S+wD6OKO066Nm6TjX88+VVVQBOAoqmW
         yfXHvpWfdwp21XaNMytPce+nJVrmSDAK7svgWmDGa3qsK1oGnL2sS/CLoyNxcSDJ+fzT
         CaOAKnvpHuty1jNFTWleADBVJnAqhu7ShKXshj/n7/hBjOW1h0ofgjw1Abjh3GmOkc2i
         FFgYpBdZgusnuMBqrhvIsRtcCzKer6JRGtnO/ad1gZvbNBRyKeUfsa3KD7OX2BUhPfCL
         egdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525547; x=1769130347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUlCSJ4sVDZpvZSnTCZZWPWUvx5qo1tAq80JkqdgelI=;
        b=wVovNop9p/cCV5h1LirJQCbVP0ab0fNfYJQOOJ5xOrvnBs6qbrnkfxKOTgLBQhqjzJ
         pxuDPR8fEtir7JXaTz4XEY55pPg7eg0IOeXlTh3Jmjj9Fd7P62tOUpp30AeWBBrXLOOm
         o++gj+3yJaz7dJVI5K+4JJg24x/EVztqIkwRL5zy1ZCTnnAwGXNIATQTDrrxV8K2YbDG
         OlyD+yNAySVHE5MPKjZjk9Spc20fPfNceEdR23xtzdLbSlwHJY3CTKMw+KrZgDZILg4y
         dlMWEJKt7Bcm/Fi+Dy3B5zKqfuvHfZPuiMuGC7gFYL5wh92nSSLFV3KEaFofODDgBiFD
         r2QA==
X-Forwarded-Encrypted: i=1; AJvYcCVQm7d8veYVAsk9YWYkHwSLv8nzTOWahInIyCSP+xQqPwWQDlSySNNp9R++GlaG52DbS3UiSW2Z4ur5LAeefg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2qLOitc9xidfW+Nm420FqY+ao1O80RfvYRU7uxY8IhMCiL6II
	QtAXWFNOVakXGyfX6dxn6qsv1EhtIbLilZkeIWumjKDuIJb1yVH9+k4q
X-Gm-Gg: AY/fxX53KxpRoAID6O5j/JjxRLHXVtVInTfHiZxUk4SM60bLyZQz6z0eW3G3gs00sAF
	HMDuGoaDH+xfpCaPdUfvtXi+J8V8H1zsEB42navUrFkSfIIYbXwr4zMItRfqoplcEXXeYdX7B+o
	NRxj8MG3pqozrY+roDCjTgpU32QT0c5UHeQS6cEJrtxa2iFYldSn4M8seCpO/zwn9Q1q7f64PRL
	8uldeWqPJ/scRfoSY/daUMoRDXT0wZlyzy1Zs3hRW7Ad16CXGZBBgv8Z4bDxHP8/SnWlHXGRfpE
	D84qULoFqY/0ia4LOdK0AyK0ZDL6OahHREcqIySztGfmz7hhDz5x333BdwGnx5cjzwV+z9lUXIF
	F2H4Z21OWOtO53zaReh5t4ttiuQGIVjX4zivpcqrJXNCf6yq7LrB+rTGHwlN3kfltjfxbEG2IJl
	u7gOpqu6aZHTDVCZIJB68LL6vBVDCUVFABzCR5/BR5aqoAC+nURLLktMR3rhUUvw==
X-Received: by 2002:a05:7022:2491:b0:11b:38b6:a95a with SMTP id a92af1059eb24-1244b31e681mr1231822c88.11.1768525547022;
        Thu, 15 Jan 2026 17:05:47 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:46 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	linux@frame.work,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	Zac Bowling <zbowling@gmail.com>,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH v4 16/21] wifi: mt76: mt7925: add mutex protection in resume path
Date: Thu, 15 Jan 2026 17:05:14 -0800
Message-ID: <20260116010519.37001-17-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170548_171883_5CA7F2E5 
X-CRM114-Status: UNSURE (   8.41  )
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

From: Zac Bowling <zbowling@gmail.com>

Add mutex protection around mt7925_mcu_set_deep_sleep() and
mt7925_mcu_regd_update() calls in the resume path to prevent
potential race conditions during resume operations.

These MCU operations require serialization, and the resume
path was the only call site missing mutex protection. Without
this, concurrent access during resume could corrupt firmware
state or cause race conditions with other MCU commands.

Found by static analysis (sparse/coccinelle) pattern matching
for unprotected MCU function calls.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index e9d62c6aee..3a9e32a175 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -584,10 +584,12 @@ static int _mt7925_pci_resume(struct device *device, bool restore)
 	}
 
 	/* restore previous ds setting */
+	mt792x_mutex_acquire(dev);
 	if (!pm->ds_enable)
 		mt7925_mcu_set_deep_sleep(dev, false);
 
 	mt7925_mcu_regd_update(dev, mdev->alpha2, dev->country_ie_env);
+	mt792x_mutex_release(dev);
 failed:
 	pm->suspended = false;
 
-- 
2.52.0


