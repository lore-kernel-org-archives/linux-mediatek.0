Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15043C88E72
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2026 14:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HrDk21UY7OLFOZBR0vjrLvOMR24vY5+kMD8RCheOxbI=; b=Wz1O7/FENGxdOTaO96pqPbSxtM
	YlnQ5hfNMBz25TJdXAECfJQFdzDeUI79E5X1sSHG6DxWXCq7Q09KZ6uDlsLuYA8UfhZy54a/Wk4fA
	dKApMDgbB2klU6ul6h3Ib+3qCjzswJ/meVLtF3TuxBjhZ7lHOygJt+4LVgkV1nx2YIyACnobp1vzO
	crnkE8Ik2/wO/baNYSGNukw3IKo6uxUAEzgu2LWpgRI/WUSbtSl4snf192lruyNIQ5OI2JyDTFmM2
	G/eeQdAGYmnVjbxsmNj58hvj8/8PBs9f25tF0kscrN7Qk/75564mcicsOPhg4rAYgCgOD8+Rp95O6
	NImqiUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DLO-0000000BZfu-0Hje;
	Thu, 17 Sep 2026 14:44:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DLN-0000000BZfP-1gC5
	for linux-mediatek@bombadil.infradead.org;
	Thu, 17 Sep 2026 14:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=HrDk21UY7OLFOZBR0vjrLvOMR24vY5+kMD8RCheOxbI=; b=hNsJYmrBCGF2brmDB1a4+Do9f+
	J8Z+5qFb71nz7nAoKYzL+SqiFR0E0M6vMJCi/i48j1sCrWAx/LyQyZszDaXQ44wx9LgE/ev2gu77M
	mESACVX1svoco1OMeiaDK8bxMlR0naFVhicam1iDon8RkX76YhG9281v/iYS233wk0o22jgKCe4qn
	Zr2XE3+DAupAV3mONVHxfyLuajcOiHyItjLZUbv7yOi/qDnjylj+EIOMVje193ReATG0usOHeoyj9
	0TXoIa2134VxClk/kCp+2hq7ScVpVIl8oCPnaGOTgriE1jv208XZk82wA4mvDhRaiWhpXUcOIUeIQ
	x5Gme1YQ==;
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7DLK-00000008xbP-1Jeo
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Sep 2026 14:44:08 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-85469d249c4so795579b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Sep 2026 07:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789656244; x=1790261044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HrDk21UY7OLFOZBR0vjrLvOMR24vY5+kMD8RCheOxbI=;
        b=QcPO+Y67x/+Lo9mf4/Ef/50iuXEjpycG4RaArYZipcIWQ/9mQrVY/+tBhtMwNp6bb5
         UgQEgldCZY743InklLELo4fCxQjhwpSYvEq+nRbmFJr9Lygumcdu4UqdqG696Wv8Zy1a
         Gyf/OumJR7GjxX0aR1LyO+CbKWUzfalWQmvGyw/AXBWAxpOQFVaWaHvU4htuJPH1iozX
         7Lydmxvqj34h1p2qhk3sNyaJKhtKwd0RWwYHJBaMll8Di6+CXtiybDBKpii5nhZu9tS1
         gYFlQeSyKWhpplFXm+pO0bLBRW+cvolBBk5hFIBJKsLJmIpliFj9n1lDWdixQlP+SjBn
         jWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789656244; x=1790261044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HrDk21UY7OLFOZBR0vjrLvOMR24vY5+kMD8RCheOxbI=;
        b=v/YKUPs1LmKoepzDipB0MebN6MFe29kJ8sj5xj5C4U+qA5wRQNuYmy0G9yr9p8t7nS
         wt/7Jy1nQXYCOwzbcj4ZrzGgCkl4kO22B2Ybv4RDP1zeflU7DxgRIuDT3/5o5/rL/nlY
         jUXuBBylzWALV5GRuhKg5gkBu1j55+w8RmSetk+SF5zCsY8qpEa/SfOwqxoRU1U/TTF9
         55JdRxQ6IkTrk4G56jZoZClMX02jSCat8Ssj6DS/HxtRcroKq1W2U+kstxBzTJk1x9IN
         Xx+ptaqR+p7JzwcvmbXub3elz+rhnWhROr3iwhoIeR72wsGQXsTs/rE/yx9ruwW5Lil+
         Ercg==
X-Forwarded-Encrypted: i=1; AKwUvBxoWSWC5SAJ4aJestR7DuxDzJxP5bqwWBMDdzSk+/XYxN2kyLm/PUhHbVAi45OvsAVlKPQx5SneNZCvInzMXA==@lists.infradead.org
X-Gm-Message-State: AFuF++lOu0w72lWEQGWh+taBWLll8DfY6W0fr57jkDU71Z45a7JjsFF6
	tC+vtJGXYekk68aab+RcYWONA+Ra8exQlAig+7T2uYneJHDzr1/4l5dX
X-Gm-Gg: AYBFou3kT1BsQiyZ4mr29YFRx1Iq4fMd79pGTRvrWngCaCe2CqDP++sPUowkp7uMcy1
	jaaytAKmMqekiWqmjXpLVRID4rk3BzmFbFqTnrfc+Fbw+v/gwWMnAdKRiaPsPQ4B08rx1VRam0i
	R0Xf3sE7tNQybF5x9AqJ1l8CNju9GPRfN7XVG5yeC5L2dLkkVmhBCKRgcnI+XR+10B75ot65ebP
	2ejzUEF4+ihHkXiOM6c79HTi2yF/kc0iVCxwtsDQ5rWB+Ybm2nrWg2EUl3ck3AcGXis4vSHiuEn
	UW4WT+t8n4WINQARBbOVU2KtKV4lF82bLnhSkEK79ii3nIYrzJ4cTiDsIgJL9i3Hy2TfjPRm5Mn
	bLVSW8dKmUK8plORgi8TxVBzt1YOy+f4ur3WcWbwdHOPGokt0nqAIK/vRcTPiSvjBOrQUWG5jsC
	zCbqgSdnHDXFYHub5h0AGHsF0unVbLTVwZcAbqXRt6Pwn34u/UG7nAJNJXUO4kA9umyg+g3eu7Q
	Ae6y7CbgDbZ9yiQ545lPrDAOmcqYxhePXIwCy1HjA==
X-Received: by 2002:a05:6a00:1887:b0:85f:1492:61a8 with SMTP id d2e1a72fcca58-87236fd6341mr14621831b3a.7.1789656243473;
        Thu, 17 Sep 2026 07:44:03 -0700 (PDT)
Received: from localhost.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d1b275sm2962034b3a.51.2026.09.17.07.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:44:03 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Rex.Lu@mediatek.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH net v4 1/3] net: ethernet: mtk_wed: skip ring reset in wdma_tx_ring_setup for WED v3
Date: Thu, 17 Sep 2026 22:43:33 +0800
Message-ID: <20260917144335.19466-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_154406_500308_9B61B2A6 
X-CRM114-Status: GOOD (  11.92  )
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

Currently WED v3 tx wdma ring, ring reset happens in a separate code
block unconditionally.

Moreover, v3 has double the size of wdma_desc and has different init
values. mtk_wed_ring_reset doens't deal with that and would corrupt the
wdma_desc.

Fix this by skipping mtk_wed_ring_reset in mtk_wdma_tx_ring_setup for
WED v3.

Fixes: e2f64db13aa1 ("net: ethernet: mtk_wed: introduce WED support for MT7988")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
Changes in v4:
- no change
- Link to v3: https://lore.kernel.org/all/20260724172040.1653-1-hujy652@gmail.com/
Changes in v3:
- new patch addressing WED v3 ring reset issue raised by Sashiko
- Link to the review: https://lore.kernel.org/netdev/20260630144831.1109-1-hujy652@gmail.com/
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 53d3b7e00e1c..d55042ccaff1 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -1938,7 +1938,7 @@ mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_CPU_IDX, 0);
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_DMA_IDX, 0);
 
-	if (reset)
+	if (!mtk_wed_is_v3_or_greater(dev->hw) && reset)
 		mtk_wed_ring_reset(wdma, MTK_WED_WDMA_RING_SIZE, true);
 
 	if (!idx)  {
-- 
2.47.3


