Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8839EE49BC
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 14:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BeDJbitMR/rHgNLbtzCICYHaqbwBV6Q3Kpd+79Ocnh0=; b=Dd4EvawgvVBn5ronVyaSBWT52l
	/gBUONGQ9v6zaYyNQw0VYnWF2e/qSG9zKIPNIVj0P3zJSlB8hAlSinkRlGYGE4F1QxtbPDxFZdSWR
	aRQ3DJgRYSwpUjQs73+V38sttOzsU7CEQflWPDBrEgMld5wCZ4h0byR76MCqkM/kImJtemPhFPQjG
	Qg6tQ4/sBz69nwie/wAMPZc9VPNsn+p3rwwyr8n2JM5jG7jSAVOtyExJ3BiNzSsxyiZkItHcXDiN6
	0gWPELvKDDU5E0Fw84owu/u/+fZ4BUQ3MeZAzHEFrZph5zlWtrfhtEZhWAruokYbqkFUOX6YpLh1/
	1F83w1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOa6-00000009zI2-0Fkz;
	Wed, 11 Sep 2024 14:44:30 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOOl-00000009vNL-3BJq
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 14:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=BeDJb
	itMR/rHgNLbtzCICYHaqbwBV6Q3Kpd+79Ocnh0=; b=NDmOFM2KsaKH9f366mVWW
	Sf13O3yxeAZTUlhdT1SOVEX4yX7fg5LBaWLARqMF5h1wN/Y57C520cxygDwoJRep
	+GEUdatOmFgswFdsdkZRQ1BYL7EiWb46IpdEpuwG7ZDHX43uFQM8pzzJ+iB9OIkQ
	dep6uYMrgDJ61wH1yb/iQc=
Received: from iZbp1asjb3cy8ks0srf007Z.. (unknown [120.26.85.94])
	by gzga-smtp-mta-g3-1 (Coremail) with SMTP id _____wDnT_r1qeFmmhDyCg--.6633S2;
	Wed, 11 Sep 2024 22:32:21 +0800 (CST)
From: Qianqiang Liu <qianqiang.liu@163.com>
To: ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	matthias.bgg@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Qianqiang Liu <qianqiang.liu@163.com>
Subject: [PATCH] PCI: mediatek-gen3: Check the return value of the reset_control_bulk_deassert
Date: Wed, 11 Sep 2024 22:31:55 +0800
Message-Id: <20240911143154.59816-1-qianqiang.liu@163.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnT_r1qeFmmhDyCg--.6633S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr4xJr43Gr4kAry5tr4ktFb_yoWkJFg_Xr
	Z7GFsrA3yDCry3KwnFyrWrArZxAas7Z3W0kF95tF13Aa48ur1FqrnrZrWDZF4UGF4Yqr9x
	GF1kuw4fAa4UJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjJPEDUUUUU==
X-Originating-IP: [120.26.85.94]
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiLwVXamVOGRDjgwACsX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_073248_268640_48B91351 
X-CRM114-Status: UNSURE (   9.98  )
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

"reset_control_bulk_deassert" may return error code, we should check the
return value of it.

Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 66ce4b5d309b..5b35dc32ad47 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1016,7 +1016,9 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 	 * Deassert the line in order to avoid unbalance in deassert_count
 	 * counter since the bulk is shared.
 	 */
-	reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
+	err = reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
+	if (err)
+		return err;
 	/*
 	 * The controller may have been left out of reset by the bootloader
 	 * so make sure that we get a clean start by asserting resets here.
-- 
2.39.2


