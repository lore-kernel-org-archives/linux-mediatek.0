Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4953CD4F2C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 09:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mXbZalzcxo6/TsrxZQxu5oks4UtJk6D2CPv/MBaaCkM=; b=w+w+Miq9iFU78JKBNsDr/disCs
	dulYmgUO2QoOuTgG75A8Tjf1zJBt++eYHwWFUp8wSlCi1JnySTAFSs0LrLR2kQ0UqF1OgpS9klCgt
	7jrddQ+4GRetQ3u4o3grikJQy5XIN24C7CX+B/dP8yTNg8px+NXHvhI57mKVvrwLY2U1aCcCo/1/3
	4hnFktZ6Y2mc8fC7TGAFQ3zmghkS8GP4O8NY1BZms8KS8Q5tZa9PIMjUYRyP7zXyoteMruZSVbJVN
	r81nFoND7vrJUpZtfbhEfZiQTbTz02RC51mVhh2Kojb1RHgaQzgkvVntohdDNPqJKugxMHc0JDLXC
	RcxT7Ibw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyL2-0000000AgMO-2Rg5;
	Fri, 12 Jun 2026 09:38:08 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyKx-0000000AgJv-1wWX
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 09:38:05 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-842848fd613so770199b3a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2026 02:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781257082; x=1781861882; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXbZalzcxo6/TsrxZQxu5oks4UtJk6D2CPv/MBaaCkM=;
        b=k2Mn0P/uUC9ed2mETbi3bhZABZUXOdqtG+gu4dKTv0TlXGaJzHbbH4PZJEAilf622f
         xBTiUQW4Rzklw8Q8MrFzhWXU/DlRw0LESMxw/C3b7cpj6rysbaMBsLNZv/X2zD0I00XD
         uEutpbgkhlfysriPphR866zaf3BPBio7AhCcrirpGde0+C8Uebyp3O6rnTsf4t/vElX2
         ycxad0ab+tq21EbkL97pOFDc8az/zTiF9zId8SYMQ5cnVaNpz8uFM7QRcZqu0DBd97i8
         NfN4PkkWSSRL2//p6VsB/cbvZm5ZGaRqF84SicsjvmjgsriTZOmQ5hHU0uJRbhOoA04M
         WNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781257082; x=1781861882;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mXbZalzcxo6/TsrxZQxu5oks4UtJk6D2CPv/MBaaCkM=;
        b=m8nLbWPKw43CuvQV4slyf9vk2T5wLQVoqy0aALYz9FEzYYwzvC43J7cvE5//JquYa4
         BgAEQzhFkq8ad17z3RErPga13T+rUaPMqdvmLTufjCjGZF/xNG7MvYUmFAG+q2ZznGHM
         A0oZCND/0dbWztHK0zCCA/bdwtSwC5H6Jlb+pD+IKfbstvhbucGkzi0GV6lH9X4BDGe8
         dqkGGLmAwa4/qDO+0j9ZwD7vKAsv0kJ3mESc3aeiZh2dl+RDHGHVIIwE3JrDrnuy4K3H
         0/TvyFrjSdaI/zgRJ1nG1xfdrgBQbWRVMWZ9Wtcs2pFca09Kvfs2kvVjbdgAsO7RpdDY
         UpOw==
X-Forwarded-Encrypted: i=1; AFNElJ8yt6A8cDoniscJNHrZ4aj3CoSqJkn/O+niBcO3LVWP2p6H8DyuI9PwnRlpMIyXQUC9jWZviuEH/X/NKKQcMw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDG+fv2IBTKUHNQ/EifaPhxnUOeRyB2rbeA6eLlAmE2W3YK8nw
	2Wj8cvWuhzHPVpnV/pI5UyweAd8z4jv0U4T0x/7dy4BqxjN6onap+/Cz
X-Gm-Gg: Acq92OFvZVkUOimUfHGs5IrwuCWItVI8SHQPzyEExGRy+9Sg2/MPTMYRcOsP0vwSGm4
	6JNKu1hcRTEv9a8aA2IV3pUjrEo9G1tk2kzHFMvg3P3gROBRTU44YDQX89CdcimWeMJFdrsTQZp
	wVAlgvb3x99o7whFt+NFieyNWBWcgdFpx2cWQ0LDUJQjXX8Ycu7vWGx5PNdRc/xvk1ukTmYtPz3
	4c4miooWboLqLznxwinrz+wppMaG64hgGN1amA5epsBc7CifF4uaihWjIzwMoZ4Q8jG2KYsR9JQ
	0ru2DoJicd2dEWrpnVXnH3roJ/DfeMqYBape6SaF8EPAHG994LD1CgJRIzbIOhE7J2zrQ9sHcX2
	3rnkFl9/qRUToTDnvyFzaMDOkDjJkyhzDxHskpXpOpr2JAPHfVXFT9Nd1mXyfgvqvJMantiAyPE
	Q8CTGU+h0cAsLVCVNM
X-Received: by 2002:a05:6a00:12cd:b0:842:3801:47f with SMTP id d2e1a72fcca58-8434cec2dc3mr2271540b3a.17.1781257082521;
        Fri, 12 Jun 2026 02:38:02 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b04b6bbsm1724054b3a.56.2026.06.12.02.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:38:02 -0700 (PDT)
Message-ID: <6a2bd37a.4034e349.1b41bb.1caf@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Fri, 12 Jun 2026 17:37:00 +0800
Subject: [PATCH v2] net: airoha: Fix error handling in
 airoha_ppe_flush_sram_entries()
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_023803_521945_815DEF25 
X-CRM114-Status: GOOD (  10.85  )
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

In airoha_ppe_flush_sram_entries(), the outer "err" variable was never
updated when the inner loop variable shadowed it, causing the function
to always return 0 even when airoha_ppe_foe_commit_sram_entry() fails.

Drop the outer "err" variable and return directly on error, propagating
the error code from airoha_ppe_foe_commit_sram_entry() correctly.

Fixes: 620d7b91aadb ("net: airoha: ppe: Flush PPE SRAM table during PPE setup")
Link: https://lore.kernel.org/netdev/6a2b40e4.4dd82583.3a5c46.e52f@mx.google.com/
Signed-off-by: Wayen.Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 5c9dff6..a124f15 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1330,7 +1330,7 @@ static int airoha_ppe_flush_sram_entries(struct airoha_ppe *ppe)
 {
 	u32 sram_num_entries = airoha_ppe_get_total_sram_num_entries(ppe);
 	struct airoha_foe_entry *hwe = ppe->foe;
-	int i, err = 0;
+	int i;
 
 	for (i = 0; i < sram_num_entries; i++) {
 		int err;
@@ -1338,10 +1338,10 @@ static int airoha_ppe_flush_sram_entries(struct airoha_ppe *ppe)
 		memset(&hwe[i], 0, sizeof(*hwe));
 		err = airoha_ppe_foe_commit_sram_entry(ppe, i);
 		if (err)
-			break;
+			return err;
 	}
 
-	return err;
+	return 0;
 }
 
 static struct airoha_npu *airoha_ppe_npu_get(struct airoha_eth *eth)
-- 
2.51.0



