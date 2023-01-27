Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A55C38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 22:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q6iBoXpwgGR/ZVf0A5SekY8NMqe2gKVl+e0DSwe8dcg=; b=WLfUErZtSy9fNf4wZMxd9fNZGn
	olNnvpRu1r3163tLQquFeNl39o4RRBr2y/hXmuShNuYdu3qGJP+GM1nMCau1D8/Jznp3IcwweqDyi
	PDeZHfnmzzJzQ78UCHGMtrjUvVaWn8/5mTST0A2tQDUDCf+/kQj9luU/lhzLES+LRVJmUa9AhlMpB
	r/HA1pvtADxbo4czbuHU25kubvxZT61Fskr+pqkCqizZyGxlxDWQhshKdcBRoVd/xBFS4YV4sdqU+
	9V+5AbxZFW45lo8TeCs1qSHcH9Ylrn0qlnbxhrq3ScCOZEkqeO0W3vpKuH0ueczobeMfcrkw7wQOH
	+iGaN9Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLXNE-00Gj1a-J3; Fri, 27 Jan 2023 22:39:08 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLXN3-00Gizz-G7
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 22:38:58 +0000
Received: by mail-pf1-x431.google.com with SMTP id z31so4253543pfw.4
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 14:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6iBoXpwgGR/ZVf0A5SekY8NMqe2gKVl+e0DSwe8dcg=;
        b=cQRXyyWhjENY1EiRP7qhQP3wf+6XMReMMAZnfWe2Kur1YO8bKgprzMVIQHTQs2DG82
         bpmy5tKTm5RBWsUwvT6HOsWbJR1SXZaIP93syx0Y1BvqG10wdKJrUXq/iYPkgUmUS6Z6
         m3DmEvmavq2Fh5cIiGPWYfyC54a7ureEExsJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q6iBoXpwgGR/ZVf0A5SekY8NMqe2gKVl+e0DSwe8dcg=;
        b=bTQ+Z/db7MHd2rtyh5UGwrdRxH1Wy0BKrDF0HIGzvZ+jdjhQQvWUW990kNxshgdMsH
         SxUn+hsrv1mCQ5Zpd1JND4bh4rHg1ANBsYFCQDuO5jfnO6xQd0rNhWuuE9Dfu+xII3ah
         8FCwuwwW7EpnRJ5ixqHM2UKeUjJxzfwNtnHoaIXaXYcOSK2HyhsY0oUc5+mYUfTM1cTw
         M8K4jc88dIDqaK1Th4L6WeobXl/6cmqbS0ViQ1MdBx4xpTO3miksJHa/kBGDVXo1ZQ0W
         rV084qGTbslb/D6PyI+ue1r+S7e1sxtURK17Dvg9GsoWwUlc44sWaZs1SO9KWkqQ4DuP
         n+yA==
X-Gm-Message-State: AO0yUKVNvl+TKFZDNwKeuHXEV1fuh22k7loJaIwGM87G3bcDG60P7HaI
	ZE4U345RoynbzCFw14uX5h4rDg==
X-Google-Smtp-Source: AK7set9nEOp8oJvvITNyqKkOgdNSk+TAokzAcmXTUWbfu3zV7ISgRJfcLKUBqQSOq9XH0hqHE2L/bQ==
X-Received: by 2002:a05:6a00:1d04:b0:592:7341:781f with SMTP id a4-20020a056a001d0400b005927341781fmr35668pfx.31.1674859136095;
        Fri, 27 Jan 2023 14:38:56 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id br13-20020a056a00440d00b00581ad007a9fsm3088755pfb.153.2023.01.27.14.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 14:38:55 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Kees Cook <keescook@chromium.org>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] net: ethernet: mtk_eth_soc: Avoid truncating allocation
Date: Fri, 27 Jan 2023 14:38:54 -0800
Message-Id: <20230127223853.never.014-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2447; h=from:subject:message-id; bh=yfJ1UtZNOwTETD8Al2XTKq5PIE5VchaJolozWYUefHY=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBj1FJ9hMXYGB04Nb8fnZvQFD8SaUvBjTtQlF3d5mZ8 JQnQwBqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY9RSfQAKCRCJcvTf3G3AJuk7D/ 98s7Y81Xj52PumgZDzo42yrLNHSRGuvMRYB0A/Q4Zt7FebJnq8KJmO1UKXey36nsJXuwoxCuFJw6VQ WoGAcBv3Xd6q2yO8GzMzPv/2JSTc8ATaSQaljNkd8bAbGvtpLTMwzLNW/JXYovBqgZzMRVzRvSogMF fA51JTFGlNoiZQjfsVIfnV9yVf0MeOJXx58PbH2hPftHeA63ZMVVgGZCzyWqrXqrPeiYtJ/oybWxhd X++53/jblEmlKNyhcpGxEmMnLtk7whId4NiXn+TECSGFOfGy/uwip6rvRdKSrjufQ0iNCHMQtN4L0Y t7Rrm+ldNKiGr2RfYhfk78//8keWFu7lfOEt7WcSsx+e07aSWGIYFxb3t99JktWxVGztvciwIE5irP bQos//ov2Bi7hRrZjt5mZKfpBlfB5MyparOnAE9nf3Wc4jRi9eYaPNg+9XAFAhO8oNCw5YEHsluu2i sCzLo3iPw7Se47jNfjm5JyIIu1rmL6M6w4E3jDDqyMPGsQ5Q4obMjaZJAuEicR5KpoTlcnLp3CJohC AChj0Z0ugQJ77+9dAAXUzahg5vmgs0HkmTqMtgaV3QmOvsla5A7NR1DYyvl18aAZJo9n4bcscCV850 5Mud8wqUAhE+EHIBq1qNLVa0ksoN2cUcOyVcYwv3IdiqilS9ndN263ArKt8g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_143857_543643_9D32A6A6 
X-CRM114-Status: GOOD (  12.23  )
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

There doesn't appear to be a reason to truncate the allocation used for
flow_info, so do a full allocation and remove the unused empty struct.
GCC does not like having a reference to an object that has been
partially allocated, as bounds checking may become impossible when
such an object is passed to other code. Seen with GCC 13:

../drivers/net/ethernet/mediatek/mtk_ppe.c: In function 'mtk_foe_entry_commit_subflow':
../drivers/net/ethernet/mediatek/mtk_ppe.c:623:18: warning: array subscript 'struct mtk_flow_entry[0]' is partly outside array bounds of 'unsigned char[48]' [-Warray-bounds=]
  623 |         flow_info->l2_data.base_flow = entry;
      |                  ^~

Cc: Felix Fietkau <nbd@nbd.name>
Cc: John Crispin <john@phrozen.org>
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Mark Lee <Mark-MC.Lee@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c | 3 +--
 drivers/net/ethernet/mediatek/mtk_ppe.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 451a87b1bc20..6883eb34cd8b 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -615,8 +615,7 @@ mtk_foe_entry_commit_subflow(struct mtk_ppe *ppe, struct mtk_flow_entry *entry,
 	u32 ib1_mask = mtk_get_ib1_pkt_type_mask(ppe->eth) | MTK_FOE_IB1_UDP;
 	int type;
 
-	flow_info = kzalloc(offsetof(struct mtk_flow_entry, l2_data.end),
-			    GFP_ATOMIC);
+	flow_info = kzalloc(sizeof(*flow_info), GFP_ATOMIC);
 	if (!flow_info)
 		return;
 
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.h b/drivers/net/ethernet/mediatek/mtk_ppe.h
index 16b02e1d4649..5e8bc48252b1 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.h
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.h
@@ -279,7 +279,6 @@ struct mtk_flow_entry {
 		struct {
 			struct mtk_flow_entry *base_flow;
 			struct hlist_node list;
-			struct {} end;
 		} l2_data;
 	};
 	struct rhash_head node;
-- 
2.34.1


