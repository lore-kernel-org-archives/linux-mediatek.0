Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB3ECA0EE6
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Aug 2025 15:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BCxm8hP2GfHWz3xnxP0rrau+zktn6B/K0RUTv4riUy0=; b=kTbCxUB33rUGga
	EESHKoI9h7dEtEgBHWwILMhvQLccwV71MKEJhPzf8J+8QOpt4n2D0KHAb0gtQ7cHTEkDX8hG8nQM5
	X44XBRQM3FvuNdEcd+Dh6/hrIOeNA6LzrFsoqq5YR7yQ/yln8t2ArzMduS+H1/2fz9WfcTEoqH3Cn
	0EqSjW8WbCYnJyjttMS0RuW8mvenv1pQXpClyh2gJW8Ykcn0TAQVt1VVdbvzQnmnFb9pajA6VGejS
	GRsLYP9B5UTIwoEQ3au7/oDEDPc9hRTilLgjrKZR9jEUMg00d1gFxJ7zKsxzvQT0spn9Ae8JWdNdr
	qeYiCrzLByIbif3nVATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNpj-0000000ApdG-14Z8;
	Tue, 19 Aug 2025 15:01:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLL9-0000000APpQ-2wsh;
	Tue, 19 Aug 2025 12:21:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1944D61427;
	Tue, 19 Aug 2025 12:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7205BC4CEF1;
	Tue, 19 Aug 2025 12:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755606082;
	bh=kXp8GWA0rgI3EgE6rlfYCc10wvDZVs53PRBwMH6HPlU=;
	h=From:Subject:Date:To:Cc:From;
	b=ZV7UHce/2o7Aawu1yMkCXiy9gdcDEVS6mjdvLFJBxjQOCT3clfOyIIbpeoMQ0QVIO
	 Z176ti1kidYT5aVWIsu60Cik6ProTOpJlZEpxAAO1qa8qy88VHD+QrdQLU5MHFIs6/
	 fuUMLjNuYbDXYmfkSLe5Q/oFBj85i+TXbOj96y9yU76Es8GtFfosedV3GSA6q2xwMN
	 ri1MPS+latxWlqJow9jfvHXMYNyp7xgfFlTvqXNY1atXimMYYr6o4B+RN29+Ybqskw
	 xz8Uc5Vs4GfviE9Rdf9OIYUfE9FmzviNKtSYjLgl5tCiHNE8Kye2joy263BWWhISzg
	 UaFBY3FKJ2KMw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/3] net: airoha: Add PPE support for RX wlan
 offload
Date: Tue, 19 Aug 2025 14:21:05 +0200
Message-Id: <20250819-airoha-en7581-wlan-rx-offload-v1-0-71a097e0e2a1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADFspGgC/x3MSwqEMAwA0KtI1hOw9TtzFXERNNGAtEMKKoh3t
 7h8m3dBYlNO8CsuMN41aQwZ7lPAtFJYGHXOBl/6puzdF0ktroQcuqZ3eGwU0E6MIlukGZ1nkba
 dxFc15ONvLHq+/zDe9wMZrtlAbwAAAA==
X-Change-ID: 20250819-airoha-en7581-wlan-rx-offload-12eff66cf234
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
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

Introduce the missing bits to airoha ppe driver to offload traffic received
by the MT76 driver (wireless NIC) and forwarded by the Packet Processor
Engine (PPE) to the ethernet interface.

---
Lorenzo Bianconi (3):
      net: airoha: Rely on airoha_eth struct in airoha_ppe_flow_offload_cmd signature
      net: airoha: Add airoha_ppe_dev struct definition
      net: airoha: Introduce check_skb callback in ppe_dev ops

 drivers/net/ethernet/airoha/airoha_eth.c  |   7 +-
 drivers/net/ethernet/airoha/airoha_eth.h  |  12 ++--
 drivers/net/ethernet/airoha/airoha_npu.c  |   1 -
 drivers/net/ethernet/airoha/airoha_ppe.c  | 113 +++++++++++++++++++++++-------
 include/linux/soc/airoha/airoha_offload.h |  55 +++++++++++++++
 5 files changed, 151 insertions(+), 37 deletions(-)
---
base-commit: a8bdd935d1ddb7186358fb60ffe84253e85340c8
change-id: 20250819-airoha-en7581-wlan-rx-offload-12eff66cf234

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


