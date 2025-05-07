Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32912C3ABC0
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 May 2025 17:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tp2Nhwg0YUadjd14cdUo5k3/FrR3T5bmhH/RJB54VBo=; b=p9HBptvTNbkVus
	RXCv1LpM2A/tChQastbrkOg4ns52UoR0HZDg+H+d4QMLGVcUSkibSaGo0IVDmYp9DZzqBeQyh7rG1
	4eEEPjVpuM1LpHmegr6Jxz18GVGhQ4rpUr0nQczcXSoMtJKNahnZ7eHXh+WEnCfY2LLEtQqrCerbE
	OOKhieZlZBJG/gVr7/9iY53Ns+Q7YqCtcX338jdvxN/7sQlG02aaEF8GACM39Rk8NyjSpT+93IkG2
	2S6ixczRVISkkGFvFyB08BX99WJZ7IyRY1o8R7/MGXFGq6GOCAv0kOPIN2tY2WcTK6c27JsXvyEDQ
	zdfrjkq+HuU43pcJjPRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCj3Z-0000000GPrm-0tKe;
	Wed, 07 May 2025 17:59:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCitI-0000000GOTq-3ytR;
	Wed, 07 May 2025 17:49:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B9BC629DA;
	Wed,  7 May 2025 17:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D88C4CEE2;
	Wed,  7 May 2025 17:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746640144;
	bh=e8m12oB+PAXHw9PasXT8ldfd3ooHEH1qA/KyTNGeaYo=;
	h=From:Subject:Date:To:Cc:From;
	b=ea9sJqjBQWfoh//KVPojoXUqTxI1pc+dRs0r45XMVo07QYuXKL/wd8KupbatWPnGU
	 mV2k45f1QoHZmhEf+9XK7OQJRpzO0KGD8zGYxP7ibBihwzncOMZHWvYe4msCoKoWqP
	 +fmfd2Dku8m2bp5nb7UJfQvntVzGZb1/3B+puppBVhJ6z8hVciTXuJ4eprk/ni1EtK
	 ZMbt5gdhxGeq/geqaYAWokdBCRnPlOYtFCrLhENWFqij5a/Ez3Lo7B7hfoT/yDAbl1
	 wEm6dY1fJZmkQR7nQS1k6HGv4lmXJogOs6ErvHdOygaDgnra1C8cHLKBuRAx5gssNJ
	 iLbPZfTXPZE6g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/2] Add the capability to allocate hw buffers in
 SRAM for EN7581 SoC
Date: Wed, 07 May 2025 19:48:44 +0200
Message-Id: <20250507-airopha-desc-sram-v1-0-d42037431bfa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPycG2gC/x3MPQqAMAxA4atIZgNVqYJXEYe0RpvBHxIQoXh3i
 +M3vJfBWIUNxiqD8i0m51HQ1BXERMfGKEsxtK71zrsBSfS8EuHCFtGUdlyJQ8fUxxA9lO5SXuX
 5n9P8vh/6t3GrYwAAAA==
X-Change-ID: 20250507-airopha-desc-sram-faeb3ea6cbc5
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
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

In order to improve packet processing and packet forwarding
performances, EN7581 SoC supports allocating buffers for hw forwarding
queues in SRAM instead of DRAM if available on the system.
Rely on SRAM for buffers allocation if available on the system and use
DRAM as fallback.

---
Lorenzo Bianconi (2):
      dt-bindings: net: airoha: Add EN7581 memory-region property
      net: airoha: Add the capability to allocate hw buffers in SRAM

 .../devicetree/bindings/net/airoha,en7581-eth.yaml | 13 ++++++
 drivers/net/ethernet/airoha/airoha_eth.c           | 48 ++++++++++++++++++----
 2 files changed, 52 insertions(+), 9 deletions(-)
---
base-commit: 9daaf197860055aa26c06d273d317c18c6e3621a
change-id: 20250507-airopha-desc-sram-faeb3ea6cbc5

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


