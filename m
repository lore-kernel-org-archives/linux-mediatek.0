Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70A4F3D603
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Mar 2026 13:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q7CjPLtBI/CIQ0PlW+ZKhSC5pu1E0l0TDhHmbHzg3EU=; b=tbfOPsVo2pcMuM
	juHRrnfoyTV8THaxVNKxo2+ojwDl2jyz1nmXKJcVxiKVXpH0OMPj2RtLdDCVZAGonKILgsbFA1/QT
	Lw0V4659TxFRB2lyBJDucHY7XdGAqdvEjH/7OBAyNBu9hNVw/NtuV5wnwfQyMBTlQT3owrMhRttBe
	Cz8ycFoZnQuD9eRFi8HpdW2biI0s4wSlW5KvkPCSKbiJSIz9w6CQy8pBBf0XbsqKVB8tQ4dGhRPly
	UKhj4H76n1kd0r32xwbCR1/v7M0CtgyNMm5EHXvz+m65w3oj+7HMPI2JTQxJZH6MTMukk1mhRJGsV
	2oAKfLknJqjCi8i6TCIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6psI-00000009wjR-1CSe;
	Sun, 29 Mar 2026 13:08:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6psG-00000009wjD-38tl;
	Sun, 29 Mar 2026 13:08:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BEF9760103;
	Sun, 29 Mar 2026 13:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3131C2BC9E;
	Sun, 29 Mar 2026 13:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774789695;
	bh=bBfbGJ9mJcA+NBsd5zGoJk2uB8RFGVX/pg5sGKGq6AU=;
	h=From:Subject:Date:To:Cc:From;
	b=kmu95NbKHUXOmKZo/46eKzQtteubfnWSS7xD5MRWilH4gJmVoXX7oQJYb12czgEDM
	 ifA/taz373k6tZm+GyxKgfJECqO7CEdWUjBoUNZByYC+S5xOqDJEIcD5ubutfU06zh
	 9N2VZe6d6O0HRJWbUl+ISfe2pfGkfvx++yR/lu3LaFQaWIJx/I0Q1QjnZ884bjH7Rl
	 OM+FftzF463t/D97NESwGmtJ8YHWl4fAgtwtdb4hydJnpENoqdNzFdc226eWR3e+/T
	 sRJs9cHXM4YQKuNdue6PR9RDdUeFVXqhrHzkv1p3R6tMOqi9DZP7F8wNQCIFty1Xf7
	 qz7hYcFh4UHyw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 00/10] net: airoha: Support multiple net_devices
 connected to the same GDM port
Date: Sun, 29 Mar 2026 15:07:50 +0200
Message-Id: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMBAF0atIr6dBo4ngVYZZRP2aBo1DEkUQ7
 25w+RZVF0UEQaSuuCjgkCibz6g+BQ3O+hksYzapUpmyVg1bCZuzjOR43ZcknAcjIk9902ttgFY
 byvU/YJLzPX/JI7HHmeh33w/VT7PCcwAAAA==
X-Change-ID: 20260324-airoha-eth-multi-serdes-fb4b556ee756
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>
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

EN7581 or AN7583 SoCs support connecting multiple external SerDes (e.g.
Ethernet or USB SerDes) to GDM3 or GDM4 ports via a hw multiplexer that
manages the traffic in a TDM manner. As a result multiple net_devices can
connect to the same GDM{3,4} port and there is a theoretical "1:n"
relation between GDM ports and net_devices.

           ┌─────────────────────────────────┐
           │                                 │    ┌──────┐
           │                         P1 GDM1 ├────►MT7530│
           │                                 │    └──────┘
           │                                 │      ETH0 (DSA conduit)
           │                                 │
           │              PSE/FE             │
           │                                 │
           │                                 │
           │                                 │    ┌─────┐
           │                         P0 CDM1 ├────►QDMA0│
           │  P4                     P9 GDM4 │    └─────┘
           └──┬─────────────────────────┬────┘
              │                         │
           ┌──▼──┐                 ┌────▼────┐
           │ PPE │                 │   MUX   │
           └─────┘                 └─┬─────┬─┘
                                     │     │
                                  ┌──▼──┐┌─▼───┐
                                  │ ETH ││ USB │
                                  └─────┘└─────┘
                                   ETH1   ETH2

This series introduces support for multiple net_devices connected to the
same Frame Engine (FE) GDM port (GDM3 or GDM4) via an external hw
multiplexer. Please note GDM1 or GDM2 does not support the connection with
the external multiplexer.

---
Lorenzo Bianconi (10):
      dt-bindings: net: airoha: Add EN7581 ethernet-ports properties
      net: airoha: Rely on net_device pointer in airoha_dev_setup_tc_block signature
      net: airoha: Rely on net_device pointer in HTB callbacks
      net: airoha: Rely on net_device pointer in ETS callbacks
      net: airoha: Introduce airoha_gdm_dev struct
      net: airoha: Move airoha_qdma pointer in airoha_gdm_dev struct
      net: airoha: Rely on airoha_gdm_dev pointer in airhoa_is_lan_gdm_port()
      net: airoha: Support multiple net_devices for a single FE GDM port
      net: airoha: Do not stop GDM port if it is shared
      net: airoha: Rename get_src_port_id callback in get_sport

 .../devicetree/bindings/net/airoha,en7581-eth.yaml |  44 +-
 drivers/net/ethernet/airoha/airoha_eth.c           | 626 +++++++++++++--------
 drivers/net/ethernet/airoha/airoha_eth.h           |  30 +-
 drivers/net/ethernet/airoha/airoha_ppe.c           |  42 +-
 4 files changed, 497 insertions(+), 245 deletions(-)
---
base-commit: 68bb4adb58e114336826e2ecc15ecf62e2890d3e
change-id: 20260324-airoha-eth-multi-serdes-fb4b556ee756

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


