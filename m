Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916B7CCD19A
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 10:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ds1UTcU64DKXei20pLCjh7v3Cn6U9aSh7jl7ZY6Auas=; b=voR3REZ2or48oGW2j/Pn957T2o
	3Wct6xhidaZPMSqASCf2oMdUFLQf8ZtbFxFaRSlI08rYjX42HP8IYFRl+CqZlssz7zlTt86vq8s0h
	bYWS9RkefXwd8G3zna5T3uTupbWv4hg5W8Abc6OOvQIKFWOS7EXdBrHOzQYCbHWKZYgG5iE+b9NpS
	e8EU8INXfoZtkU9ZkoXIUaEnfv2nfsMnDU3qX7a1pwhbMp8lmwwJhCX1FFdYPvsmsGEih90serWtj
	g+Y5Fr8RzKA1mogQpYFIuCDim+skcVOR4nNzMYCb3fQ/zkyvzjOR9lkLylMdcaFIate8t45Gx51gr
	/Dv/lQPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LEg-00000004QXE-0Ix1;
	Thu, 16 Oct 2025 10:29:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LEN-00000004QGl-04BI;
	Thu, 16 Oct 2025 10:29:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42BD563EC1;
	Thu, 16 Oct 2025 10:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9014FC116B1;
	Thu, 16 Oct 2025 10:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760610549;
	bh=y7mp34c4cvhNC7n/Cqbxu2EAzAT00JK69b6Y7WsgNfk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EFiYwv7iOZAE3GZri8hIBXNMnJ3pGK1U9PABapZmIadfG0jA4E2y4ziQ8kiygrKVV
	 IwV2ib27UnEIXbrFLL/p/CE5RWJNakOqp4hsQSteZNFu0CYTt74/FZFSxRm09TTNy1
	 o1WOO9tpKOANTA2B8+pmOwjUT2hWru410zTlNX0SZbOMBiYr9NSUNm/HWfjUpZM2CP
	 QQqxpVsilFSMNW3cqkEwmrAa52ZSVMUk75LdNtaX6pRIzZvzftCxKUOEkZDmy3CYS/
	 RgzN39xqJsnPGBNnz7qrKraXUJpsDBLy22qC5QI5TrpzbrZxH0+sjJDbB6Rq0Dj3JT
	 xTVckbXxrlHdw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 16 Oct 2025 12:28:26 +0200
Subject: [PATCH net-next v2 12/13] net: airoha: ppe: Do not use magic
 numbers in airoha_ppe_foe_get_entry_locked()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-an7583-eth-support-v2-12-ea6e7e9acbdb@kernel.org>
References: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
In-Reply-To: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
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

Explicit the size of entries pointed by hwe pointer in
airoha_ppe_foe_get_entry_locked routine

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 4b038673cefe20b47c42dd1419c05b57d4d6c64d..eda95107cd1daf6ff00a85abc72313a509ed67e9 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -619,7 +619,8 @@ airoha_ppe_foe_get_entry_locked(struct airoha_ppe *ppe, u32 hash)
 					     REG_PPE_RAM_CTRL(ppe2)))
 			return NULL;
 
-		for (i = 0; i < sizeof(struct airoha_foe_entry) / 4; i++)
+		for (i = 0; i < sizeof(struct airoha_foe_entry) / sizeof(*hwe);
+		     i++)
 			hwe[i] = airoha_fe_rr(eth,
 					      REG_PPE_RAM_ENTRY(ppe2, i));
 	}

-- 
2.51.0


