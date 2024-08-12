Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205B6C52D7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 12:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QPeEGo1seh8+5FQ6msDUCQJPeQLJt9qdn8t1lvthTLI=; b=BCQAvTOMsOE2VZ
	aHFBfksNxXDHVZ6sjGi1FKssRXo5zitwQZqVyQkmKhYB183nU9JRST4jCIHC2sGfTMzucqnzFmi4C
	WkT0FTK2+uUZLCG5FSwW2kqBBbzozAdtcg7ryPsqa5pWzSyQK3vHoilFAjS1qU82Eofv7jXNb1z/N
	3pEqEykZ9eMNpOSOlmnCORGNs4cxhx2hwGca61+yL0c4FggcPuFcOMjmCbhZ5A7o4+aSkP+0mcSuJ
	4xOnpU9l02rqwlGePJvyUojyCVbExBXBUxT9oAv+5KaV8G7cAJ0uRLhtMgYJn7wGmRhaX1W3L+w+a
	1mGSAuh/VtXlagBObf3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdTuu-00000000EXy-0qdH;
	Mon, 12 Aug 2024 12:12:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdTuF-00000000EKk-1la2;
	Mon, 12 Aug 2024 12:12:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B492B61003;
	Mon, 12 Aug 2024 12:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FECC32782;
	Mon, 12 Aug 2024 12:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723464730;
	bh=qk49YrVSofC+BVzHm+Bp5DXAljOe2s9DkkPbzEpVrcw=;
	h=From:Subject:Date:To:Cc:From;
	b=nR0JxCIvZJldbDSANbm7pjQ2vtDxP/pUsoxenEW1sYbA9ZM/TIuxVNpzR5T541zW2
	 ElLbzeO736JcC7/k++Y1iunzxlWmy19UGlo9pwYSCX96upLnjvdF3BbCMSMMRPEV2B
	 KCug5r+n7NzYYqwNgNOa+Wc6O6sK4m5U59L3bzQP5Xkxf0Y7w6EUDr3Nwx+eodk4A0
	 qlMr+c+2cSjqiV3fVH2cgH22uleIIOubglo0ftuYq5wIrrD7HYDA4Pmq5Tw6eiP4JV
	 FZbFuVnRajVt+PEkDLxDMJv2t0asApMS5Dppf2NoPkwgBtpFA6Lx4b9OA/OP/RN+t/
	 gKmN/U5eMroHg==
From: Simon Horman <horms@kernel.org>
Subject: [PATCH net-next 0/3] ipv6: Add ipv6_addr_{cpu_to_be32,be32_to_cpu}
 helpers
Date: Mon, 12 Aug 2024 13:11:54 +0100
Message-Id: <20240812-ipv6_addr-helpers-v1-0-aab5d1f35c40@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAr8uWYC/x3MQQqEMBAF0atIr22IIYh6lWEQnfxog8TQERHEu
 xtm+RZVN2WoINNQ3aQ4JcseC5q6ot86xQUsvpissc50jWVJZztO3iuv2BI0c+i72fUuzAYtlS4
 pglz/54ciDo64Dvo+zwuPJ57tbQAAAA==
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yisen Zhuang <yisen.zhuang@huawei.com>, 
 Salil Mehta <salil.mehta@huawei.com>, Jijie Shao <shaojijie@huawei.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_051211_573961_3F6B4C7B 
X-CRM114-Status: UNSURE (   7.01  )
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

Hi,

This series adds and uses some new helpers,
ipv6_addr_{cpu_to_be32,be32_to_cpu}, which are intended to assist in
byte order manipulation of IPv6 addresses stored as as arrays.

---
Simon Horman (3):
      ipv6: Add ipv6_addr_{cpu_to_be32,be32_to_cpu} helpers
      net: ethernet: mtk_eth_soc: Use ipv6_addr_{cpu_to_be32,be32_to_cpu} helpers
      net: hns3: Use ipv6_addr_{cpu_to_be32,be32_to_cpu} helpers

 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.c    | 79 +++++++++++-----------
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.h    |  8 ++-
 drivers/net/ethernet/mediatek/mtk_ppe.c            | 10 +--
 drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c    |  9 +--
 include/net/ipv6.h                                 | 12 ++++
 5 files changed, 66 insertions(+), 52 deletions(-)

base-commit: c4e82c025b3f2561823b4ba7c5f112a2005f442b


