Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1360FD88D5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 00:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uV7lH3FIJA3CkRWr9ZibC3b+y2jhZmrH7643sTDjV0c=; b=rozKIpHcLQNFH5ZFmQ+kv9YAhu
	Wr3CC5BJCyP5XBjOWSnutg3abx4TxwlMIPd1CPtsnPybzQf7MgC75DMXNM5JVyf5hKoH9mebhlGWt
	N77ZJZmtm5hSsaKQvAZcBo9RZyZ4WiNTqQIbLNd2DLGWuAkODsXnBD1rL+PVNgAoK8HEkBk55YeD2
	xj9YA+wok1USGJsRroup71/nHcjAvxKipJV7F7RMpdTPVO1QTDXKVR8iEM5EbqlUW3DbaYyhKdHo6
	wqdmonQIBdjiNRnHeyfk+OF1ORA0ReKIynwvfrmfDZn9LS45jeQU8TkX6mNDCmRU8fyq+wxltWzsG
	RWNIhcng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07RH-0000000ARL4-21eL;
	Wed, 11 Mar 2026 00:28:39 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07RF-0000000ARKL-1sS3
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 00:28:38 +0000
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-466f1c3c627so2454147b6e.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 17:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188916; x=1773793716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uV7lH3FIJA3CkRWr9ZibC3b+y2jhZmrH7643sTDjV0c=;
        b=B3QgpKYid5NTOWZ18ZQmSDSa9IdVcQz40EKHVPqF7+Qg7lKJWIfe7ZzwV/8hGWQRio
         J3jDwddVKmH9/1P5fRw2L/mWBO+dG68bbX3oMTIMM7YWeygeYki7AZ1ye1fLR4ZYIhmY
         F3fKApDYIGerGR8Dr3WIwdj3XMRILtuA7/8NrOW1Q/b8cgP6hcS4ZBGJEYMd9vIKpCTF
         A0DePHtuFPoeksdbsRq6Y5Jx67qc+1vOKMaN8NdYecEGEdE1kMeMRzM9RXGxrmkz6Rxu
         vxD5amimwhnr+2vhAz4cy9Hhm7PNfAHokDEkcgvw7ZxoF0uC3bK1177tdwNcLfzBDiT1
         jlEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb4huGQgLrguoL8Zm3kgCCafmKWifwxiQdLF45suXMRgiE8u0Dnd+Mseye3FEFcwpyO/fqZ6LMpLasT3SEmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuoGeHAC+CBf8KZ02RnufghZiPsr/ISpAO3kG6h25/KbdwR+/c
	FLe4+JUITVV80Lf8Zebkzoo730Rt4bhL3ihG0jCOcP6Db+6dsY0Bp1Q8
X-Gm-Gg: ATEYQzyStgydv3W1kEFGfC2gWuBRn3T4BxOD4HGnnWqYNDqzLvx/6DY/MA+IGAQSPhE
	3QXBzJNHyxVhryBe6TKf4Bg2fXIIbWIM650GcpgEDOAX2ASQEtOGCaGr6PP6Y38v736gu1vxq+q
	Kor7cQZR/GgHFMImZHrBa5UV+neEkpeGy65chAME6oIhbcZBs1AMRkfLfBHDihBK51a0TwfPPzn
	Ba+juTgVSk+Cn9sF1Xa368h35bV3LxDSBuyKgM2k/FPK1VBIvCvuz1mhvsQOTIPuPxdUSRMLlhn
	y1+JXmufPDog4t4kZL1+VKnHismNu0uPSsguzZdG0zpYpPKMAKa0Kz/By8BVCEgHjKoRTao2v0X
	RY7NwQb4WokJrKWu3TI06kC5hmtAu7oQstgY6+EBU33Q+KxnB4bPrVEpVfmhXM6pbfgs+CaI79Q
	+it3nasVD3FKtE6oL5VuX9aYAzGbRS7Grg0nnvogeEt33zxHg=
X-Received: by 2002:a05:6808:178d:b0:45a:9068:642a with SMTP id 5614622812f47-46733506ea9mr429126b6e.35.1773188915884;
        Tue, 10 Mar 2026 17:28:35 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e72b40asm516497fac.20.2026.03.10.17.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 17:28:35 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] wifi: mt76: mt792x: fix mt7925u USB WFSYS reset handling
Date: Tue, 10 Mar 2026 19:28:25 -0500
Message-ID: <20260311002825.15502-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311002825.15502-1-sean.wang@kernel.org>
References: <20260311002825.15502-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_172837_493778_1274D32F 
X-CRM114-Status: GOOD (  11.12  )
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

mt7925u uses different reset/status registers from mt7921u. Reusing the
mt7921u register set causes the WFSYS reset to fail.

Add a chip-specific descriptor in mt792xu_wfsys_reset() to select the
correct registers and fix mt7925u failing to initialize after a warm
reboot.

Fixes: d28e1a48952e ("wifi: mt76: mt792x: introduce mt792x-usb module")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_regs.h |  4 ++++
 drivers/net/wireless/mediatek/mt76/mt792x_usb.c  | 13 ++++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
index 7ddde9286861..d2a8b2b0df32 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
@@ -392,6 +392,10 @@
 #define MT_CBTOP_RGU_WF_SUBSYS_RST	MT_CBTOP_RGU(0x600)
 #define MT_CBTOP_RGU_WF_SUBSYS_RST_WF_WHOLE_PATH BIT(0)
 
+#define MT7925_CBTOP_RGU_WF_SUBSYS_RST	0x70028600
+#define MT7925_WFSYS_INIT_DONE_ADDR	0x184c1604
+#define MT7925_WFSYS_INIT_DONE		0x00001d1e
+
 #define MT_HW_BOUND			0x70010020
 #define MT_HW_CHIPID			0x70010200
 #define MT_HW_REV			0x70010204
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index a92e872226cf..47827d1c5ccb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -224,6 +224,15 @@ static const struct mt792xu_wfsys_desc mt7921_wfsys_desc = {
 	.need_status_sel = true,
 };
 
+static const struct mt792xu_wfsys_desc mt7925_wfsys_desc = {
+	.rst_reg = MT7925_CBTOP_RGU_WF_SUBSYS_RST,
+	.done_reg = MT7925_WFSYS_INIT_DONE_ADDR,
+	.done_mask = U32_MAX,
+	.done_val = MT7925_WFSYS_INIT_DONE,
+	.delay_ms = 20,
+	.need_status_sel = false,
+};
+
 int mt792xu_dma_init(struct mt792x_dev *dev, bool resume)
 {
 	int err;
@@ -254,7 +263,9 @@ EXPORT_SYMBOL_GPL(mt792xu_dma_init);
 
 int mt792xu_wfsys_reset(struct mt792x_dev *dev)
 {
-	const struct mt792xu_wfsys_desc *desc = &mt7921_wfsys_desc;
+	const struct mt792xu_wfsys_desc *desc = is_mt7925(&dev->mt76) ?
+						&mt7925_wfsys_desc :
+						&mt7921_wfsys_desc;
 	u32 val;
 	int i;
 
-- 
2.43.0


