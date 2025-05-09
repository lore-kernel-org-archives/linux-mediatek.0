Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D27C3ABC3
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 May 2025 17:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PFGmRG9uFT8h0rwOY2rfHB7eN0T4/XZnbgrYsw/QPSE=; b=yzC1ntqUD9aLMR
	UGkUi8B0ITVyoZuq5kI7AXPMXjp8ey6/uQaKNcnL5TCg+DjgEsFnVUl26gOfFD/jPT6pHpzT1WtJg
	eMnJ1DvseomjrzljbUUh/uu0EqcmL6jdMjRAIbrPoLnHE0uKRKMGQtdtEHbBvcgyhRBklVsvZ7hb/
	bh3EtBCcEJqoBaVyXd/nv3XcAC8jAw3IfK134F8dQUXC3WNY52BOe4fizCtESc0ULAit1VXQAt6F8
	Wr6UoKTYh5ZwVVNE3ZcJWaWfnThx87QXseh3M3xOcrfmqt3qwFsLFeFntmVV+mpXokW8GJJ8h5MEC
	ePVABb8WniN//AJY4FQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRKH-00000004Pkw-0bMl;
	Fri, 09 May 2025 17:15:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDP4q-00000003zlc-2VlG;
	Fri, 09 May 2025 14:51:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3BBADA4C58A;
	Fri,  9 May 2025 14:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B9FC4CEE4;
	Fri,  9 May 2025 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746802310;
	bh=yow+lntSz2MlCtXy+xkWXR8zt8RwshTgTwE/Pdd8ivk=;
	h=From:Subject:Date:To:Cc:From;
	b=roz6jdw9Eo/WA+UOrsBTXcOkhyJ1ts2cW5bv2rzfgwEBWwP/QdZMZv6xuk9depFbj
	 4bEe+0CWE1//8ula1UMj6S6rAhFipyo9mEPVtbkcfgeV/tZLsAvSrs5iM95D1tPkBa
	 4ZAYQQ8gzZ1oXpYPzP6fV6JYgufnPfdh9IK0JsoHGCKfs4x8fPBUNFp113PDC6BQly
	 l56l3E5mE6w0Q/vp2K3tVB+C/iZiX6TkCF0iAT/QHD0IYBdK6ThRC58CT0/HZPQm/O
	 /ySF3MzPIPYLCM0JKM1zieZ0ZeCb7f9a6YRu3K/YOAvOesWeQ6wdKsCK7sgQEX0f1x
	 LLsKMYMSM5TkQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v2 0/2] Add the capability to allocate hw buffers
 in SRAM for EN7581 SoC
Date: Fri, 09 May 2025 16:51:32 +0200
Message-Id: <20250509-airopha-desc-sram-v2-0-9dc3d8076dfb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHQWHmgC/32NQQ6CMBBFr0Jm7ZhSqCSuvAdhMZQBJiolU0M0p
 He3cgCX7yX//R0iq3CEa7GD8iZRwpLBngrwMy0TowyZwRrrjDMNkmhYZ8KBo8eo9MSRuK+YLr7
 3DvJuVR7lfTTbLvMs8RX0c1xs5c/+q20lGhxqa6qmrsp+pNuddeHHOegEXUrpC/sgeyyzAAAA
X-Change-ID: 20250507-airopha-desc-sram-faeb3ea6cbc5
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_075152_703027_EE5C76FA 
X-CRM114-Status: UNSURE (   8.00  )
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

In order to improve packet processing and packet forwarding
performances, EN7581 SoC supports allocating buffers for hw forwarding
queues in SRAM instead of DRAM if available on the system.
Rely on SRAM for buffers allocation if available on the system and use
DRAM as fallback.

---
Changes in v2:
- fix sparse warnings
- Link to v1: https://lore.kernel.org/r/20250507-airopha-desc-sram-v1-0-d42037431bfa@kernel.org

---
Lorenzo Bianconi (2):
      dt-bindings: net: airoha: Add EN7581 memory-region property
      net: airoha: Add the capability to allocate hw buffers in SRAM

 .../devicetree/bindings/net/airoha,en7581-eth.yaml | 13 +++++
 drivers/net/ethernet/airoha/airoha_eth.c           | 57 ++++++++++++++++++----
 2 files changed, 61 insertions(+), 9 deletions(-)
---
base-commit: a9ce2ce1800e04267e6d99016ed0fe132d6049a9
change-id: 20250507-airopha-desc-sram-faeb3ea6cbc5

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


