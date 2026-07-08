Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80681C44503
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 11:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zr96JgiP4egzaGIJKICX4lchZUuxQ9WiGvVqK3+0YdM=; b=K/QDAqr/l4hPD21hQ7d6mN6rKE
	5xKQmrcOdjqjJVtGgBjaXdDhlPOa7JwyJc0ULyhTX7rsUFgry7iDnTr7CA9hIHcWUuseUdyruR269
	W+tk+K0R6Oi+4HmHgjgDAQjBnHH7CTi1OVO2THRQOPnfb5zzQjuKu0orALV4e2UnAvnHJXSyzWmjW
	ZU/775eb3zVy9eI2vyOu6kTs5Qpo5AdesNgVpypuv4f9fXxckhRPcBHLe6D40fi16mV9OY528noyp
	LB65+3X0alnCmhaeO8t4ezNks8TArT52zvC9DdtJZn+4dOiNzlje9YpCHL53/JCTpX112uZ7othF+
	yayF9IIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQGn-0000000GyeY-0ozL;
	Wed, 08 Jul 2026 11:16:49 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQGj-0000000GyYi-2AA9
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 11:16:46 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47df43bfb07so25421f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 04:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509404; x=1784114204; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zr96JgiP4egzaGIJKICX4lchZUuxQ9WiGvVqK3+0YdM=;
        b=Rn7ImwVhYfKWiixLvv6kJpnwBZeyBRMKFZmL01ATkDDK1ZmTqNbe1B6mUYxQI4RIdj
         OSk62vZJj4qBulGmj346z0FwnphPxpWm07/mololT1Ya2O/DJa1r13/TuzqIBI2Z+l8t
         QZLPjEITDOv+cGMSybalbZfTVYvbiE8qM2ol/inO7vhikcs0ycaAwYvWk2WL3hJjCNFd
         xAu9PvMwl/h8jtscDeu46v+ExOoLmMTlGgb3bZOOQJ0lAtd7d85lAq29nnTljEhIRnPY
         tmzaGgIQuk3MhUyW5Y6hAD/yBaeNTvthxEiGDLRdlx4ky5I2XsjpVJnANffC8VdgTWNS
         nYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509404; x=1784114204;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zr96JgiP4egzaGIJKICX4lchZUuxQ9WiGvVqK3+0YdM=;
        b=nw/Zf88RSsw7OjCH11JVuRAqpXk/UEVG0T/vXv8HJwXGtt4g1jps98uO+/croR2n+D
         XnpzMYv/Rquydfxs4yM/UhCp4J1hqh2Egl0VKnxNWaKvwKQ0Mhcyqdk4L7Vnluf1i4gZ
         CQAZrdPkvLIN4VlzTrLDov0zTFAZpbW9L7D/E0enFXt5BzlNBHyop2OnIdgGsZ8nfpse
         /IhLw/Xl59iEmeAAW3seIpbZ+bHnOmhPRKIWtOzYYkZEvZO8m0F/13JcxPeGozxyTdKh
         VMtiI2juNePV6d+BwNUy8wrQDpzOATwpQScVtbl5HpDvJG6zjVDS1ZzyycJbFaHi2Adg
         XxYw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6G2KCuJl8WjqHCbYsaBaVF1iVV+mkssPy4hb3SGRqlG4Nugy594CfNHkbPKn0e6acOQl0MuGscVAWpvrUnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt1OSZHihhK72XuBAF5TKXhkVTiaqj7ZhVsL5BFKVJPLXRyKUp
	fSY8Hx/5ohQhaYwms7ToaIfxdV9bcK70MHFlpMpbJyhZ43neRc5M0oNtqJYA67eHC2Q=
X-Gm-Gg: AfdE7cnPYpyV+wiyevjFzpWMjFE9sD27Uhzp8enp6rNHrj60f65iN91P2BSkaxd7gYO
	xuhWESHzrNt4GvBf63q8LDKC/KFhoMB1wqOy+rGIt/wAnI9+xZLyucB5a2VUzjhg0ssAvB0aLfi
	57wPwWrHswbsq8bqzs6VNHy1fbCuYzKPs3Datr/OjdzF8HxrTVZsID7gMe9/GypCXtyFAIMQaYM
	OdDI8Upw0WrG94gHszOaUqOWQb3/qUCHAx5pgCGK28QwavZANbdNcA6vOF3joiQXUoMF1AOkXfv
	lokcTDRX4PtBppR2tMhfX5+nbfI7K10wU3hBoY7INcQ9aMdKlc/0RjJrIr4xcwScGJvyE1fhdHh
	+tmwc0+O+ZajLM4pQztnraIDIGf5qrKTnTaPdztq1JQI2ZJEbS6h4JSSNrJ07hZT4b3Em2sx7S3
	5EbtoFsdoOfZbm3U0wevYge5zG6w2kW1AoYflQGRX0HufSuvsNa4+c3sxh0KMaWZfsUEIo5m1BT
	Ekc
X-Received: by 2002:a05:6000:41fe:b0:473:3241:26a4 with SMTP id ffacd0b85a97d-47df071e158mr2025123f8f.12.1783509403913;
        Wed, 08 Jul 2026 04:16:43 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f2186bsm40991938f8f.36.2026.07.08.04.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 05/23] mfd: mt6360: Drop irrelevant __maybe_unused
Date: Wed,  8 Jul 2026 13:15:12 +0200
Message-ID: <f4ea197a16a6345018db79896ac9af4fa0567ac1.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=992; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=RMStdZg/15uHp9XX3CRWrZzbzmqyNCoBwi5HiHoruCA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFKVe3Rk3+DT5D9qv2Ke/Xmv8u1/SSXaZ6sQ KvzRDDj37WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xSgAKCRCPgPtYfRL+ TrVTB/9U9NSx7cQnxDfiSL9uHTLoz+ZKQsJ9WOve4lpf0a3lxAHplLM93LtJHZvDEnioO68Beui D4qHHssA3c8cAIlbwOqfO/KS8wMt1mXGuipK6H6bK5uYV5G+9zdCZe2ZIIRc/QDgKs7RPuHz13f e4+5Xf7F3CgdYBLHCsmwxqlq4rFXX2OQqFNqKm+Qz4X8dlHDCVns0FrMPgjMn8zx8sSVJ37PNC6 lxrpFfJwxAGDkbedGWE1DPVl+RJGAhXbOOC5DyZqIyI8sbs14I69wN6O4ZarIBILvC0yQZkDTga xVuNjVWo8BWwvEZvfDbGDVyzggvFMFvndlS9/uw6frz9c6B8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_041645_579347_DF76CF8B 
X-CRM114-Status: GOOD (  12.66  )
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

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So mt6360_of_id[] is always used and the
__maybe_unused marker serves no purpose and can be dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/mt6360-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index b9b1036c8ff4..254b00c905b7 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -606,7 +606,7 @@ static int __maybe_unused mt6360_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(mt6360_pm_ops, mt6360_suspend, mt6360_resume);
 
-static const struct of_device_id __maybe_unused mt6360_of_id[] = {
+static const struct of_device_id mt6360_of_id[] = {
 	{ .compatible = "mediatek,mt6360", },
 	{},
 };
-- 
2.55.0.11.g153666a7d9bb


