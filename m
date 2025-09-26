Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD49DCAC5B8
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Sep 2025 15:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DLez7ZSV6TyDztKlIUL1NndgYoVTL8lTqwL79D9Xc48=; b=IoBSZWTfCC7YwY
	JXu+c77a9rtV+yCs9a5FWn3odMq/aAJlJRePH+Hbb8aXLqru0dB30BWydNmFHakESn55ycFf9AFE0
	tPueLkORqoX2BcXf+w2UeqqNcsG6h40prFXvgEI4szrTeApQGTdnnpeNuv0uUROpHMa5QGT9jC2tP
	heFjTKbsuYfW6b+9C/SBVcfJ1BfwZVBGtLwH1LtYeqx9asLU026jO7QflFstZXHtyZd+IJGPangdJ
	Tvi5LS5MjO+TBpb08OlEwhnx4HElaFUq8XxWG5f394MStAwPxFkc0i/KneaCOB7BPJcMWWHA7qrmB
	LKwNwCDYN9gKwJus/L8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Abh-00000002XBK-1oWR;
	Fri, 26 Sep 2025 15:43:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Abf-00000002X9i-2Zbr;
	Fri, 26 Sep 2025 15:43:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 24E9961EAA;
	Fri, 26 Sep 2025 15:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D37C4CEF4;
	Fri, 26 Sep 2025 15:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758901413;
	bh=kiQw1h1Bhq5/hBehSmba5mkf1vpWGZs7wBgPUjiAOwc=;
	h=From:Subject:Date:To:Cc:From;
	b=tNPR4TfNmex+GgVpRuaQwhJGpQVmEF2UwUhVjOQyTLK+XU8wrCimu8rdWzNMrv9bj
	 LrYHFZbuA7cuFGzOb5raIB+L4Mdl2/kQPmZabAoBhzFcxmBVDHKfwYsSgcxFHqS9Bj
	 wSPjZaW2ZZZoKGCDRUhs+8d+PAw14qzBlqU24MInxa2lzqRLQiINhEIKHuXp+N9CiN
	 ejEN4QOMaT1UF+a8rqMxkCJ3Y2t6NU/nbNGQ5Nil/EKWGuLEgh9kPMwuq4+0oCy23a
	 eNvpf6T18/2KP2Lxzkr/ZUxxJnS0XSCaK/mbkUysMiimBKtWOQy+nKTqjawzmo69v6
	 IYXE8FVWwCK7A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/2] net: airoha: npu: Introduce support for
 Airoha 7583 NPU
Date: Fri, 26 Sep 2025 17:43:21 +0200
Message-Id: <20250926-airoha-npu-7583-v1-0-447e5e2df08d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJm01mgC/x3MOQqAMBBA0avI1A5kd7mKWAQdzTSJJCiCeHeD5
 Sv+f6BQZiowNg9kurhwihWybWAJPu6EvFaDEsqKQTn0nFPwGI8TO9trdJqM1EI6Zxao1ZFp4/s
 /TvP7fpwh/41hAAAA
X-Change-ID: 20250926-airoha-npu-7583-63e41301664c
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

Introduce support for Airoha 7583 SoC NPU.

---
Lorenzo Bianconi (2):
      dt-bindings: net: airoha: npu: Add AN7583 support
      net: airoha: npu: Add 7583 SoC support

 .../devicetree/bindings/net/airoha,en7581-npu.yaml     |  1 +
 drivers/net/ethernet/airoha/airoha_npu.c               | 18 ++++++++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)
---
base-commit: 203e3beb73e53584ca90bc2a6d8240b9b12b9bcf
change-id: 20250926-airoha-npu-7583-63e41301664c

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


