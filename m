Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE54C982EA
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2026 09:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cwEzXtz3NNCFqU3FWhb/zI4kz8S9UO05RDNlkWDHdYw=; b=EtwNe1yAvydeycAPXSZ5KwA70g
	sEAXMuJnYTpHibm0cnGJbmYxChslss0hYV6RVCWdA3epDCZkzuFOPB7N7Ui7n2Z+OdqooEyXNgbVW
	WKPajEEdeMiJ1zeyDUECwojZcuILIW7tAKnVyuicsuqfuNAlBPCGKXxECNeqx0PAij9ifcZpmJEw8
	ZgA/rxrVqKSFgAOVMjDX//7AebhSNUQIxzznMjB0LiNXTjveaSk95UTu05i/6xavSdckzTosIkbV6
	rzkKnoEjNHGbfS6tUQzgp/IGTv1y/HJgbBfMClKfCM2iLCkTRP7SFsbQoOCiutZP0j7y/Z+/S//on
	4EqMmNXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JWp-00000007mqc-1ti4;
	Wed, 23 Sep 2026 09:44:39 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JWl-00000007mp7-2PgV
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Sep 2026 09:44:38 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396cccbba92so516405a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Sep 2026 02:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790156675; x=1790761475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwEzXtz3NNCFqU3FWhb/zI4kz8S9UO05RDNlkWDHdYw=;
        b=Icm64x4U3zdjFN3FNl1urb2zVgmn2VREOuDHZ7k5PBI7hxsU81gZEgaLg4guKJIJ/J
         2TaJathGyjc9srZQfNt0Bid+xraLPK0NVQ/xXFRQLiiQw0G/Z/o7LEDFxL41RmFJoqCh
         /jXTsef+Ct+JgdC65bhbfRgXHDi2VaoiPotEjqrFpZhIm0lX3yWiBZrVSRvxUfI7KN3y
         TYpA8lq0ilGQJofneQ0hmPQGGCqZlOwRhquq6C3zsLJvZmqYYtBNBUGnkWk6HW0Z/rOe
         eo1u4u+rnwzshsQRuHwWazxg11ojilY0JK3VU0nVg16pSiJ9VD8mHDHhfSrVdCRX4w9Y
         nuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156675; x=1790761475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwEzXtz3NNCFqU3FWhb/zI4kz8S9UO05RDNlkWDHdYw=;
        b=10URwIpF5yq4heCdjs5pYXbQoj1fpNzpBAkU01DEtltz3tvh7y2NGB5O9gMo32gnFY
         0IRQyxebPTExKS7SIXUm4zw/MZw4DC1g+h34lW8fjXKAJxO+SVbQcpEqmVkv8eyGnRIU
         Be9DKjcKhaLTXpPhCSqTu2Dux6GHWohT1QI/yPZxhkjQhiHB2zK2EhbcdtKeV8QNOhHT
         /RvFQfpCs8dAEvld3lGlb3ifrzUUKIVgEGUFd55MExyGi0KYGdgQpLdXRsa2knOXhps4
         1lBbZbab/0iFgnD+SZulVtWyVftfIFKf4EsmiaL1z+nEC/NN+wWlNxVTzGiagT7mOi9R
         mjog==
X-Forwarded-Encrypted: i=1; AKwUvByozTqIztUG09FedHkr7TwzLcIb3hiFzMZYoc8NgSyckdo1KTsbc/DILjEs8nVEIZbulcqX/XMgEsuCGvVNwg==@lists.infradead.org
X-Gm-Message-State: AFuF++mA1sRBtIlQhIwYqC55TKpG/9ZEGndHxuBfcvlUkKSf6BG3wLiY
	wzb0wbuqcuPHa0cGZXNxL4tzAxNhgcDhgMN1vLWJsOU9HyJDGGd1ZTQ+
X-Gm-Gg: AYBFou0TiotgIhwFDJLGiZvTf+wRBv1nl/1xl2RwpGZy/M5gRsn96BcEliIExhKXtut
	aReVK0T3Tzl2EYAax8xf+nRPNrQURkMD6tO4dGP0gYDzQjevvj2wjPPxPWKfmNbn7oDjpHMkODU
	7jDZOYrk8cR77cAfhs2TzIwswNObKk2mYjkeU70fZQb6mfcWYcgJSkVKsAU3qDBOKCIbIA9U9uv
	g5UWCMfCo29K8ARz3sCx+14t4GClVhJu6B2cTA0ud/SbjnjUSptyopp9InqhPX5o/O17OS+R15j
	gnb1S2vPYKlZhQmNz7g/HmrX2w0XH9n0MVGcGpWeg4H0o9hdw+w9clq31Ug/X1JyoM9dGYI3uOn
	9rJQIKCYePwmYkSLUNdmPuIB0mGbSo/xfp9uqfHVb7KeCWTZ/EdBZeUEC2npZt3P5CteAKP6jNT
	uDFcaZIsihBGulYzy4PpGKRoKNyCoR27WptB8hIcnac2spn+ApR427C4S4Gci+E4UMRzRgpyijY
	jQvBWmLw1RED3C4DQ==
X-Received: by 2002:a17:90b:4c88:b0:3a0:3d1c:2dc2 with SMTP id 98e67ed59e1d1-3a07e6df035mr1828489a91.66.1790156674636;
        Wed, 23 Sep 2026 02:44:34 -0700 (PDT)
Received: from localhost.localdomain ([2406:da14:10b4:9b00:211e:3d68:8776:5ca0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a60c741sm7874725ad.80.2026.09.23.02.44.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 02:44:34 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: sean.wang@mediatek.com
Cc: vkoul@kernel.org,
	Frank.Li@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: milbeaut-hdmac: Fix deadlock with the channel IRQ handler
Date: Wed, 23 Sep 2026 17:44:26 +0800
Message-ID: <20260923094426.67872-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_024435_631343_69FBCCD9 
X-CRM114-Status: GOOD (  11.15  )
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

milbeaut_hdmac_interrupt() is a hardirq handler and takes mc->vc.lock with a
plain spin_lock() for the whole time it runs.  interrupts are disabled locally
in that context, so the handler itself is fine.

milbeaut_hdmac_chan_config(), milbeaut_hdmac_chan_pause() and
milbeaut_hdmac_chan_resume() are called from process context and take the same
lock with a plain spin_lock() as well, so interrupts stay enabled while the
lock is held.

If a channel interrupt is delivered on the CPU that is inside one of those
critical sections, milbeaut_hdmac_interrupt() spins on a lock that the
interrupted code is holding and can never release, and the CPU hangs.

Take mc->vc.lock with spin_lock_irqsave() in those three functions, as
milbeaut_hdmac_issue_pending() and the other process context users of this
lock already do.

Fixes: 6c3214e698e4 ("dmaengine: milbeaut-hdmac: Add HDMAC driver for Milbeaut platforms")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/dma/milbeaut-hdmac.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/milbeaut-hdmac.c b/drivers/dma/milbeaut-hdmac.c
--- a/drivers/dma/milbeaut-hdmac.c
+++ b/drivers/dma/milbeaut-hdmac.c
@@ -214,10 +214,11 @@ milbeaut_hdmac_chan_config(struct dma_chan *chan, stru
 {
 	struct virt_dma_chan *vc = to_virt_chan(chan);
 	struct milbeaut_hdmac_chan *mc = to_milbeaut_hdmac_chan(vc);
+	unsigned long flags;
 
-	spin_lock(&mc->vc.lock);
+	spin_lock_irqsave(&mc->vc.lock, flags);
 	mc->cfg = *cfg;
-	spin_unlock(&mc->vc.lock);
+	spin_unlock_irqrestore(&mc->vc.lock, flags);
 
 	return 0;
 }
@@ -226,13 +227,14 @@ static int milbeaut_hdmac_chan_pause(struct dma_chan *
 {
 	struct virt_dma_chan *vc = to_virt_chan(chan);
 	struct milbeaut_hdmac_chan *mc = to_milbeaut_hdmac_chan(vc);
+	unsigned long flags;
 	u32 val;
 
-	spin_lock(&mc->vc.lock);
+	spin_lock_irqsave(&mc->vc.lock, flags);
 	val = readl_relaxed(mc->reg_ch_base + MLB_HDMAC_DMACA);
 	val |= MLB_HDMAC_PB;
 	writel_relaxed(val, mc->reg_ch_base + MLB_HDMAC_DMACA);
-	spin_unlock(&mc->vc.lock);
+	spin_unlock_irqrestore(&mc->vc.lock, flags);
 
 	return 0;
 }
@@ -241,13 +243,14 @@ static int milbeaut_hdmac_chan_resume(struct dma_chan 
 {
 	struct virt_dma_chan *vc = to_virt_chan(chan);
 	struct milbeaut_hdmac_chan *mc = to_milbeaut_hdmac_chan(vc);
+	unsigned long flags;
 	u32 val;
 
-	spin_lock(&mc->vc.lock);
+	spin_lock_irqsave(&mc->vc.lock, flags);
 	val = readl_relaxed(mc->reg_ch_base + MLB_HDMAC_DMACA);
 	val &= ~MLB_HDMAC_PB;
 	writel_relaxed(val, mc->reg_ch_base + MLB_HDMAC_DMACA);
-	spin_unlock(&mc->vc.lock);
+	spin_unlock_irqrestore(&mc->vc.lock, flags);
 
 	return 0;
 }
-- 
2.43.0


