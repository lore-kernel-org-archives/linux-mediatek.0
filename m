Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AB1E7070E
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 10:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCehOfGmfh1LaNqk9CTrvcD/Xwe14DN53pxk+6PmZEw=; b=pJlHba1iaYNKwu0sycnVD/8DS7
	Qj9SRoY/HYPTVRTkX31G/xVVT/7m1dHi2VwXyNvetpHBtvRSVxRq4SYKngyK19jeIg1lKkqHDQ/4U
	SxcwTlp85yXHTdMC0DpawTHSKXPaAOYFMX81+65g5patHDN4XLmPA7ezEyHOdzkFhlT9HVs9xfLto
	6RPwlOhR9/WelL81LSD9DEyzR1juOTTmQjvhawILUIcBq4wtaVg92DX2knpz4duuLG60sedwc4wfo
	/nrcBwjochaOjYLqofBsa99htZbg2fNMB8Masiril/sIbcox/pOJ6jDwyPHJ4KRVyTyDVoFmklnRp
	B+fOMipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjHAL-005qjO-1w;
	Thu, 21 Sep 2023 10:44:13 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjHAJ-005qhW-0o
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 10:44:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 634C3CE21B0;
	Thu, 21 Sep 2023 10:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1C5C36AF1;
	Thu, 21 Sep 2023 10:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695293047;
	bh=IPe5TSQAv2UTclbOLSu6Yjl5/f+ADH5J1nd/VG0Qoco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HIWE7Dl2M/tiP0mXI7MYPKuxD5eDoaHESu03PQoqbwLfCXgSXsn6zNUpKvCG0PNRU
	 rQPH86vs2oC9hNjjI5AJqK7A0R0RUPmYmnhgz5R+BEBOBzRKhA6pGWvOI8vaoSpqsV
	 uK3aX2RKkfoyjNjxz4DaB4n/RKcKDW0wUb3FsMTPoFlv2Gf49kB+c5caN/t+5BhJAa
	 Y6yO8LMg5txm+km/W+jmjggUCLZjsvcAfTWUuqe18KDILvllBanEubAEGkW1UYZg9o
	 7CaUFHrhsX79Xmv+bkkfmskREGAE+TuKjrLQJIqVQmCdjR8Z9MUKsKpx+2d1oS4MtW
	 yvONxdSqZzJfQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: lorenzo.bianconi@redhat.com,
	linux-wireless@vger.kernel.org,
	ryder.lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	shayne.chen@mediatek.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 6/9] wifi: mt76: increase MT_QFLAG_WED_TYPE size
Date: Thu, 21 Sep 2023 12:43:35 +0200
Message-ID: <75d8f3f75ef86fdf37feeb4ce1c6d5c6d2f2a741.1695292502.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695292502.git.lorenzo@kernel.org>
References: <cover.1695292502.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_034411_464738_5C797416 
X-CRM114-Status: GOOD (  10.25  )
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

This is a preliminary patch to introduce WED support for mt7996

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 61b8d082cd0c..b49a0ed5d23f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -29,8 +29,8 @@
 #define MT76_TOKEN_FREE_THR	64
 
 #define MT_QFLAG_WED_RING	GENMASK(1, 0)
-#define MT_QFLAG_WED_TYPE	GENMASK(3, 2)
-#define MT_QFLAG_WED		BIT(4)
+#define MT_QFLAG_WED_TYPE	GENMASK(4, 2)
+#define MT_QFLAG_WED		BIT(5)
 
 #define __MT_WED_Q(_type, _n)	(MT_QFLAG_WED | \
 				 FIELD_PREP(MT_QFLAG_WED_TYPE, _type) | \
-- 
2.41.0


