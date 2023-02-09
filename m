Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D24CC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 11:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSLtTMF4xX+MGFebbGFlRzwOB0f/lB6ncF8M/CLxVoQ=; b=tnsqsvtZshU+JEx5nh5FC+ImC9
	T584w+nU2yFsIJrOSkc/YvdDX25V8ynXEtfaD/2hboHAD2KNvmhQ1hCuzkxYIoJYc1EWAbI9QYctQ
	6jsETTAC76LWyV0lAoubrlURvEWWPnNiVxNJWuA/+r1l2ptMtFBxwr78uD4j2rPuoRJmbOoEiGgBV
	K7Bwh2LLoo/biEQU5dNIfmMCTuXU6anonfBR45qs7ADDIro8VZjoIsSnTt0EmmsaecT1NpKSDnyEp
	kGVqePGysPJyeJFguezcl5YRLEG2lGNhay+64d8DsiIFIDdtW5ItM/fHH6TCLxdczhUdQf58cP/oj
	lptLn64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ4vN-001ERr-3X; Thu, 09 Feb 2023 11:17:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ4ux-001EC3-Ec; Thu, 09 Feb 2023 11:16:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C9099CE2456;
	Thu,  9 Feb 2023 11:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66A4C4339B;
	Thu,  9 Feb 2023 11:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675941396;
	bh=Ae2pfdwW4VSlK8d73ruXk0NV6JvWEPEEHPJvO/t/3NE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tKTOxqEcOG8vkABw32gcHd2L1uOTERTK65/fjtcpT76blLNmdLioGd1VovWrfODIv
	 XpB2dplYCCEjXQefMFSX2J7wwGmhEYu8MC5UCBng/K+5QZhofz670t2f79e73omYgE
	 J5TGaJrAiwoffsfe8wDkGgK/KwAD0DMKaq8kxc0PcCpsd/nqkgxbP5zMKssas1puOh
	 y5udMESN14u/f8nEKZHK5NQLa64gW6IPu9xR/2hmKPbw2WAR2WlonWsKYVinJPUuzz
	 TFrtHlN0wPRJ3MRmq7p62BmZMVMhm5R4g+Ud9ATt5Dq6jvljEhBGXzvEuucxunqBAo
	 RHE6gDsNIay4g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Felix Fietkau <nbd@nbd.name>,
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
	Simon Horman <simon.horman@corigine.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 6.1 23/38] net: ethernet: mtk_eth_soc: Avoid truncating allocation
Date: Thu,  9 Feb 2023 06:14:42 -0500
Message-Id: <20230209111459.1891941-23-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111459.1891941-1-sashal@kernel.org>
References: <20230209111459.1891941-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_031643_906944_AB069F4B 
X-CRM114-Status: GOOD (  14.28  )
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

From: Kees Cook <keescook@chromium.org>

[ Upstream commit f3eceaed9edd7c0e0d9fb057613131f92973626f ]

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
Reviewed-by: Simon Horman <simon.horman@corigine.com>
Link: https://lore.kernel.org/r/20230127223853.never.014-kees@kernel.org
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c | 3 +--
 drivers/net/ethernet/mediatek/mtk_ppe.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 784ecb2dc9fbd..34ea8af48c3d0 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -595,8 +595,7 @@ mtk_foe_entry_commit_subflow(struct mtk_ppe *ppe, struct mtk_flow_entry *entry,
 	u32 ib1_mask = mtk_get_ib1_pkt_type_mask(ppe->eth) | MTK_FOE_IB1_UDP;
 	int type;
 
-	flow_info = kzalloc(offsetof(struct mtk_flow_entry, l2_data.end),
-			    GFP_ATOMIC);
+	flow_info = kzalloc(sizeof(*flow_info), GFP_ATOMIC);
 	if (!flow_info)
 		return;
 
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.h b/drivers/net/ethernet/mediatek/mtk_ppe.h
index a09c32539bcc9..e66283b1bc79e 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.h
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.h
@@ -277,7 +277,6 @@ struct mtk_flow_entry {
 		struct {
 			struct mtk_flow_entry *base_flow;
 			struct hlist_node list;
-			struct {} end;
 		} l2_data;
 	};
 	struct rhash_head node;
-- 
2.39.0


