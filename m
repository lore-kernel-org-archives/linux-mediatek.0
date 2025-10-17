Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D2ACCD1A2
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Oct 2025 09:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6MjxArMkWMeTxanHNNOjWJ2kQgrr088o6qcDc7ThuT0=; b=ekBBC+rENTfy4t
	c8QD5UBRMhceDjdlg/S2oGFjtDHyrpk5u0c1/JZhH/o2aTTIt8UVWT6cgmdFVpZRM9HgfgYnFJRzO
	XeGPnY6WrGIVxmKZrhX6lSchTKZINkuSn3UY0/6AGvPhStatZRSt13qfDMtFSnpTrO5FQRzpU5gKd
	znnZ3wqxh775kmJA1cbnE7zhOXST+nQR1IzCc2ZId7Ud/ZLQ7MPCX//c8gOjR2F54MTf0dbKKPEPq
	cBkaf1uxJDWb1CjM+YtX+dHb2nOV/gs9zN5Scgxtvzm+zQQxHXx3XXmwJlTk/jbOnOZlUqrbSwcWM
	llpg6CzCCamBRPVkjZPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gQ0-00000007BjN-2VfJ;
	Fri, 17 Oct 2025 09:06:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gPw-00000007BhE-0Liu;
	Fri, 17 Oct 2025 09:06:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7334261438;
	Fri, 17 Oct 2025 09:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648AFC4CEE7;
	Fri, 17 Oct 2025 09:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760691991;
	bh=KV5DmgyqFakOTVbuIKJ6b4T9d5atMUomV8W9aWsMh6I=;
	h=From:Subject:Date:To:Cc:From;
	b=tzaJkJEUBeZ1QXa46ol3Fc5KIZ53kYMEbiqp7CsIkmHTh1knTvpHCfguF0LRol+oN
	 cJfqoMdTPD+0j8EzEJ+8NxsiU3Q3JkOXwP43jOik4Yi77nKhC1F6C0JTH7ZvR0ASlx
	 vE3DuBMGwWVlUrmvhF4okObfg6lAtXdt7NstYEZuwiPgHFR7o0NAk1WTKI+UGQbnoi
	 0WymbAoKhwOORJK39Poq2L1mfi/++vza+7hGUYVwA+3BTMHbq92dRvSPT6yhAWZ2hx
	 Q4U47fexN0UcoeaSuLJ0FImSXamb2O8Ewss5cZP5HbQaHv0ExqPOKn7Qfzc3a0/jhx
	 m33xvLf8bDYEg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v3 00/13] net: airoha: Add AN7583 ethernet
 controller support
Date: Fri, 17 Oct 2025 11:06:09 +0200
Message-Id: <20251017-an7583-eth-support-v3-0-f28319666667@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAEH8mgC/23NywqDMBCF4VeRrDslFxMvq75H6SLqqKElkcSGF
 vHdG6WLFlz+B+abhQT0BgOps4V4jCYYZ1OIU0baUdsBwXSpCadcMkpz0LaQpQCcRwjPaXJ+BqZ
 5zzuVV6KkJB1OHnvz2tHrLfVowuz8e/8R2bZ+OSaPuMiAAlV5KWVPZcXF5Y7e4uPs/EA2L/JfQ
 x0aPBmoFRZY6bbpmj9jXdcPdq/39fkAAAA=
X-Change-ID: 20251004-an7583-eth-support-1a2f2d649380
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Simon Horman <horms@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>
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

Introduce support for AN7583 ethernet controller to airoha-eth dirver.
The main differences between EN7581 and AN7583 is the latter runs a
single PPE module while EN7581 runs two of them. Moreover PPE SRAM in
AN7583 SoC is reduced to 8K (while SRAM is 16K on EN7581).

---
Changes in v3:
- improve device-tree binding
- rebase on top of net-next main branch
- Link to v2: https://lore.kernel.org/r/20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org

Changes in v2:
- rely on IS_ENABLED(CONFIG_NET_AIROHA_FLOW_STATS) instead of ifedef
  CONFIG_NET_AIROHA_FLOW_STATS in airoha_ppe_get_num_stats_entries
  routine
- return number of stats_entries from airoha_ppe_get_num_stats_entries()
  and airoha_ppe_get_total_num_stats_entries()
- remove magic number in airoha_ppe_foe_commit_sram_entry routine
- improve code readability in airhoha_set_gdm2_loopback routine adding
  some macros
- improve commit logs
- remove magic numbers in airoha_ppe_foe_get_entry_locked()
- Link to v1: https://lore.kernel.org/r/20251015-an7583-eth-support-v1-0-064855f05923@kernel.org

---
Lorenzo Bianconi (13):
      dt-bindings: net: airoha: Add AN7583 support
      net: airoha: ppe: Dynamically allocate foe_check_time array in airoha_ppe struct
      net: airoha: Add airoha_ppe_get_num_stats_entries() and airoha_ppe_get_num_total_stats_entries()
      net: airoha: Add airoha_eth_soc_data struct
      net: airoha: Generalize airoha_ppe2_is_enabled routine
      net: airoha: ppe: Move PPE memory info in airoha_eth_soc_data struct
      net: airoha: ppe: Remove airoha_ppe_is_enabled() where not necessary
      net: airoha: ppe: Configure SRAM PPE entries via the cpu
      net: airoha: ppe: Flush PPE SRAM table during PPE setup
      net: airoha: Select default ppe cpu port in airoha_dev_init()
      net: airoha: Refactor src port configuration in airhoha_set_gdm2_loopback
      net: airoha: ppe: Do not use magic numbers in airoha_ppe_foe_get_entry_locked()
      net: airoha: Add AN7583 SoC support

 .../devicetree/bindings/net/airoha,en7581-eth.yaml |  35 ++-
 drivers/net/ethernet/airoha/airoha_eth.c           | 254 ++++++++++++++------
 drivers/net/ethernet/airoha/airoha_eth.h           |  65 ++++--
 drivers/net/ethernet/airoha/airoha_ppe.c           | 259 ++++++++++++++-------
 drivers/net/ethernet/airoha/airoha_ppe_debugfs.c   |   3 +-
 drivers/net/ethernet/airoha/airoha_regs.h          |   6 +-
 6 files changed, 439 insertions(+), 183 deletions(-)
---
base-commit: 7e0d4c111369ed385ec4aaa6c9c78c46efda54d0
change-id: 20251004-an7583-eth-support-1a2f2d649380

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


