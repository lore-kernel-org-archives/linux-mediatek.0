Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B71ACD98C5
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 22:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNnaW9ugZlbc80Hn5pdKU8P9P/zwK+1nCkZYt/5PNac=; b=EyKLURvGKerkXCXOxa5muoeCe5
	y7FBaWDGh03+R7qM/6Z6LnbTQaHzk487RE5asM8VjXmJ3kWVmI6hjRusA/EClmy6baQYBcXVHZ74v
	XfzFTWnyP5fqfuC8jN8jS+f+736rpqwY1KejZDOzS+wYt6AkhCKSZAqkg/UF7L3eA61rTk4gdZCho
	FyeXWzpgBcmwMWVrpSlCeETOBOdyExr827yZ9s6QljgLKNsBjw21lUSi/mkgPy1zCkQf7TymYl+NC
	jHMXw9R3bsxNtg0PKDsh55FA9XxyhP4KQsfiWaUVr5gw7piMKPmp2sdBBeXwdvLtyfVweSU8t0h5y
	uPG9Skcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX3J-0000000Ca0q-1cTF;
	Sat, 13 Jun 2026 22:42:09 +0000
Received: from mail-dy1-f182.google.com ([74.125.82.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX3F-0000000Ca0W-3hrA
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 22:42:08 +0000
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304d8362a58so1639633eec.1
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 15:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781390525; x=1781995325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eNnaW9ugZlbc80Hn5pdKU8P9P/zwK+1nCkZYt/5PNac=;
        b=iX1S20MBYGhxFJ21p3Lk4OnhrzmKClqdycQWr1SApc3TflWBGDD3wqNOd0Fo9GJI/G
         cNO8NPfqB642TlDqBbRHc3clX6OUl6Py6QLEaRgG02ktOw3RX+zobHWWYcDDGtRMk2dS
         iu330u5cK1pWZ2I2hRJrJkIE4Doxeq6XRDj/2aRAb0AlatZdT4s5YrQjT4PJMNfYh4hN
         AGfBbkT8qxzckgGTkSjv+21/bMDZ2rM7y/Xr/3WBtzYZRJw/JeJst/Yr2ZPFn6U6fe0b
         /sfuHlwghZHMRXEVHsWG62kDslikS4t6ykGyLMCIHiOVeQj3kwvZXWsd3epyxg4JKRDy
         ju5A==
X-Forwarded-Encrypted: i=1; AFNElJ/gzk3/uYKsHaJFtxjvw1yAHJ3CA7sXzX/oOgNjAVDW7njIxFp1vE3atTHRMmhpfr8d1dXT/bSD+cQBkHM3/g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4FVmoUhX4WHvnK/yRwUxYdPPzYT7Dy2STPfzzZI3OrgZiJVEe
	bSR2YyhA9dNpr8gglHXRxDJmhTobbIPV++1nrcoySYe6WmOiRstwmyVj
X-Gm-Gg: Acq92OGb0p8lp9PHQ3QJmPU/zpxPm3wbN0cakVTymw5gWB2zZQ3cqXVfUpl7gzm+rR5
	faFYBrld6BVhf4b9XfIUjDk/O4yNz20W4N6zKhRxFNoV6Se1/+Me/1gDBVkx2St3M7xwN4SPZ2K
	lxieCM9hdU41MPNIeHmiZo9IpsBsq7MXOuhrubaskjSdDZ0Bb71C5pCagxwJKzUduBRA6Eq+/R+
	kAaS5OKyGQ816cPNoQNGi4iGV+S0YZUeCYpyJbQ2RdN5/2ej1wzu/IPcbdxmFAxqqv3mk+vmIGK
	BgZFidwvQazl2VYxcMb53XYqJOpuH1VxTZ4yG8xFh5z8nR0JMAXJBYV0Pc8dLUOEZ//EjoXYiGm
	/HVzqZ0JJLJBjb5DQbLbZxN+X+in7CB6xb1WQe5N99LF17l086CGy//CDX/OwySUk5yLikPr0kn
	XEqKQHqSZf0+X9xkCw8r9p3DsH0ZXBnkFn2Ie773gqSjPKT/puiYkMxyli5etWDAcMAWRSb/l7Z
	o7SEg4+y03TZmafSiJLSWWWiam5+KNO9CFaNlb8
X-Received: by 2002:a05:7300:bd03:b0:304:d600:8731 with SMTP id 5a478bee46e88-30820cf4765mr4232755eec.15.1781390524924;
        Sat, 13 Jun 2026 15:42:04 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm11104825eec.28.2026.06.13.15.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:42:04 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 1/6] wifi: mt76: mt7925: stop init retries on hung bus
Date: Sat, 13 Jun 2026 17:41:26 -0500
Message-ID: <20260613224131.2396026-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613224131.2396026-1-sean.wang@kernel.org>
References: <20260613224131.2396026-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_154205_949711_B784111B 
X-CRM114-Status: GOOD (  10.56  )
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

From: Sean Wang <sean.wang@mediatek.com>

Stop retrying hardware init once the bus is marked hung.

The control path is no longer usable at that point, so more retries only
issue failing device accesses, including MCU commands or register
operations, and delay teardown. Exit early and let the failed device be
torn down quickly.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/init.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index e85b0d104fbe..e9ca5aa1e407 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -137,10 +137,18 @@ static int mt7925_init_hardware(struct mt792x_dev *dev)
 	set_bit(MT76_STATE_INITIALIZED, &dev->mphy.state);
 
 	for (i = 0; i < MT792x_MCU_INIT_RETRY_COUNT; i++) {
+		if (atomic_read(&dev->mt76.bus_hung)) {
+			ret = -EIO;
+			break;
+		}
+
 		ret = __mt7925_init_hardware(dev);
 		if (!ret)
 			break;
 
+		if (atomic_read(&dev->mt76.bus_hung))
+			break;
+
 		mt792x_init_reset(dev);
 	}
 
-- 
2.43.0


