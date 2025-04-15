Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CF6C369BA
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Apr 2025 07:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R/Xwq/YuCy3XA1wByMp5BQ+pr92YGZrlAGA2bO7k9aA=; b=AhtF7w1PNHCkxTYcNYLuxknKgJ
	+VmwYF/CNgGqb6Qq+Ua/bANc1lY6k0DZfGJ0aR6L5hT6K42lf2fWDlPrjjWH/JHWGKcXaAfV+oaaQ
	9UblR1jhQhEMON//FzlSZRO5RiZMQOA61XNMuSnmgmC+phD0u7YCTVNaCGOihd3G2ZA0YdEbWA0Rb
	zJxkuhy7La3MqIGmUK0UP+VCNJuHsIKtSItBg/AgQzTe+RBZ3zw8tQkL7LM778KwHAS7XxXT2l6FB
	ifQ9qp8S9JHSosJ/W3Z6imQxu5sZTAbnVpPG4+mlHJDJfodPbQ4oAUBsFZPRPD6KxJe6rC+kKdSVb
	IV/auMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aso-00000004poa-3X67;
	Tue, 15 Apr 2025 07:39:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ahl-00000004nd6-1zBR;
	Tue, 15 Apr 2025 07:27:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2851E4A5D8;
	Tue, 15 Apr 2025 07:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAA4C4CEEB;
	Tue, 15 Apr 2025 07:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744702057;
	bh=dZQ8SDSY3nzADxdIRyPbZ5ANl2eO50k1qUuqFn6sLA0=;
	h=From:Date:Subject:To:Cc:From;
	b=ZIHV8i1W9FGUePD4u+PqfvHLcQbG9YgPnZjc6Z6evvRS4FDVZOJbbn6FxovjxNQmm
	 23Ms2LpW90vehb9IIMoeatWG6U7o4Q0iuP+9FOipsyO6hyABb4y8RoiR/xNdsVtYMt
	 mqltHezMSMb1A74MLAzRZdM0xfOC5ZBnpPqzrf/n3UvXZpMDWhCyrqclS0+Uga9N8+
	 7A0EuiDSqxYWu/vUqw1AssT16yt55qUOdJJvkt5XeWx6pXRzvViVpmP4rtWaA/6Db9
	 sMol9VqDP62m4LECbplj5zLtjQMpjpzxGDGlPEJNpJ5TjsXx7c3NlJtH5SNQUjT8SL
	 U+g9S4K9nqLpw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 15 Apr 2025 09:27:21 +0200
Subject: [PATCH net-next] net: airoha: Add missing filed to ppe_mbox_data
 struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-airoha-en7581-fix-ppe_mbox_data-v1-1-4408c60ba964@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFgK/mcC/x2N0QqEIBAAfyX2uQUVK+lXImKv1msfTkUjgujfT
 3ocGGZuKJyFC4zNDZlPKRJDBd02sO4UvoyyVQajTKestkiS407IYeicRi8XpsTL7xOvZaOD0Hj
 tnPKDdf0KtZIyV+k9TPPz/AFrMhxAcQAAAA==
X-Change-ID: 20250414-airoha-en7581-fix-ppe_mbox_data-2f1880f7486c
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_002737_532160_0D7C6154 
X-CRM114-Status: UNSURE (   9.21  )
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

The official Airoha EN7581 firmware requires adding max_packet filed in
ppe_mbox_data struct while the unofficial one used to develop the Airoha
EN7581 flowtable offload does not require this field. This patch fixes
just a theoretical bug since the Airoha EN7581 firmware is not posted to
linux-firware or other repositories (e.g. OpenWrt) yet.

Fixes: 23290c7bc190d ("net: airoha: Introduce Airoha NPU support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 7a5710f9ccf6a4a4f555ab63d67cb6b318de9b52..16201b5ce9f27866896226c3611b4a154d19bc2c 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -104,6 +104,7 @@ struct ppe_mbox_data {
 			u8 xpon_hal_api;
 			u8 wan_xsi;
 			u8 ct_joyme4;
+			u8 max_packet;
 			int ppe_type;
 			int wan_mode;
 			int wan_sel;

---
base-commit: 23f09f01b495cc510a19b30b6093fb4cb0284aaf
change-id: 20250414-airoha-en7581-fix-ppe_mbox_data-2f1880f7486c

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


