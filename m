Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88458CD37AE
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 20:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TMX8N3hln4FDYjVh8tiCfcoH/PjAlTnThetlpoSa9V0=; b=itCHdNP+Z+hfQwV5GUavetY0t1
	oA1SxOz3xcF4geqKV8uRkbAzRBJV3oMMguScqE0+1olRfnwvKHfzQAe2bIUgr27zCtW/siufYREH4
	ZQq9WZPzPM04EJNbtTrpXLMjYNgI8yzNf25Scn+jxpc0WQVy0bW+zavUVlqg6mu9ncMgt19zEib1j
	RFztdcBXSMwFiRSToBAtbqaCXr8xeF20u9lkXFcX9sjgoly5JBbVQ+Fu7zgXcrWSPS37Jiozbw3Nv
	QlMqYv7yBxYY7WbZpPgH3Z4A8xvlfdwl2C367ay1uij344bd6AB57cUfvjBbq7wYnk4T3eFVOq+v3
	tjoY76Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slaOZ-00000001pZp-3Jee;
	Tue, 03 Sep 2024 20:44:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slaMa-00000001on1-0QGb
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Sep 2024 20:42:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C48675C571B;
	Tue,  3 Sep 2024 20:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA7AAC4CEC4;
	Tue,  3 Sep 2024 20:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725396174;
	bh=d801y6XH8hFE9wgCwtbQSx82WgeDTt/xspUlIH18n/s=;
	h=From:To:Cc:Subject:Date:From;
	b=cZHsAacW5oua4a+e86S7lSKccbfqUCqyT0nd8Lko3tAexYMrQPct3f3K+iPc7XI3F
	 dkUWd6Jc9VrbKZmMTpNkauhdUftj4ZoBHX/52MEEldwxWYGmS9M8w0nN9kqrEIZKvp
	 k/zhsg4nV/N/Q1CbM1yT/frG73xVBmejTd2L8ywtnS8+S5qF8LgJi+qS3uYPuG98J8
	 cZqMunZtm8vh4sw6JQ2kvgSml+m9uh5AIgGh7Y488R7aZqZD5s3bCYCPMWEtmKgRHH
	 hDDOtwL3kauZYvfxBob3b2Z6MDBnuWXqifQyG7IY2Hot1BxpTpR+zUYK7BicUcidpd
	 jlQS2N4mvs4aw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] PCI: mediatek: Drop excess mtk_pcie.mem description
Date: Tue,  3 Sep 2024 15:42:44 -0500
Message-Id: <20240903204244.276482-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_134256_228000_30FF75A1 
X-CRM114-Status: UNSURE (   8.11  )
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

From: Bjorn Helgaas <bhelgaas@google.com>

Struct mtk_pcie.mem was removed by 8a26f861b815 ("PCI: mediatek: Use
pci_parse_request_of_pci_ranges()"), but the kerneldoc was left.  Remove
the extra kerneldoc.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/controller/pcie-mediatek.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 7fc0d7709b7f..20c638ca532e 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -211,7 +211,6 @@ struct mtk_pcie_port {
  * @base: IO mapped register base
  * @cfg: IO mapped register map for PCIe config
  * @free_ck: free-run reference clock
- * @mem: non-prefetchable memory resource
  * @ports: pointer to PCIe port information
  * @soc: pointer to SoC-dependent operations
  */
-- 
2.34.1


