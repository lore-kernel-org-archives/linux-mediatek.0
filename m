Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CFEC001DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Oct 2023 10:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8euwVlW0+neDLtR6WJGOGDQsPFxhlH1MmObbQBtDaA=; b=BK+9QZ6jWmOnqMLzoab4mqI1/i
	DdEjTvrt4Iguf8h694UurdeLQaOsM/qGj/LIAYhYlBlholZvb7JVQfD3HYqFSsh2wSZlggN0CWdqV
	9waC3+EGfBCp280GphR2cNYtWeudwrUiXzTuvO56XFJk1kHy3wevF6clOSOHVHk7uil8K8yuphujw
	kvOuHdT54wRMNQJOM1xo/m/raPxdei0UEjGu7GsMhzfHAsZwW7SyTHYu0tA37T+5yq5DDn8moT9sI
	uji6FiYVgR6B5aC1it0yIUu+hMXLckKcEl42t6zafvpGHirFUefhYzyRl/QicDwpWWnC4w+kiy221
	KV246CVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmnD-001mRf-1E;
	Fri, 20 Oct 2023 10:31:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmnA-001mQh-0p
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Oct 2023 10:31:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B387362008;
	Fri, 20 Oct 2023 10:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B88C433C9;
	Fri, 20 Oct 2023 10:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697797903;
	bh=kov4yMSQdmfTBSDB3yLwqivPB51jrQoms4p5iBEYCZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tueI1HPIHRdUV1YnpRIvUnP/LrYAoyS3hwXUGiHJgVS5TYIDjL+jn8zOl6wyBMkpr
	 I2/68S53afgAbBVd5UmzZcp5JJCk/vzavkXgE2voaqBSYpSw1MSEJFrPhTP9XXjrW8
	 kGHgxBGTIR2N7GphdL2L4JwVtkR5oS50eypaRSHvBTWxt0gOtOmzp9g2WUh/piZeGU
	 YUdit2ey8t56qUQZcBFY1Dsv2cgLWjt/t2iTqB8IaN3uOnDmrqL9F7RW+w18/liEOx
	 AjAUO/pSo+r2ePJehEq/UDai4vxAZZLSCUQGgyr+ExgDtwGzZ806zZQuSyLH1uE+pZ
	 3UdhGbxMkLvVg==
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
Subject: [PATCH v3 06/13] wifi: mt76: increase MT_QFLAG_WED_TYPE size
Date: Fri, 20 Oct 2023 12:30:53 +0200
Message-ID: <8dca673261ac27abfd7f471663abfb45c442803e.1697797423.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1697797422.git.lorenzo@kernel.org>
References: <cover.1697797422.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_033144_340865_3494FA64 
X-CRM114-Status: UNSURE (   8.87  )
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

This is a preliminary patch to introduce WED support for mt7996

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 8fa0440f1686..fa33ecfbf72d 100644
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


