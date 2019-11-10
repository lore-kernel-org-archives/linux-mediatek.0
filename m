Return-Path: <SRS0=CruQ=ZC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFE5C43331
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Nov 2019 02:40:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42AE4214E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Nov 2019 02:40:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZabqiAtA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NyltAoac"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42AE4214E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxdJc4p3YMEBhZ3/Az/sLglAxPd1FUZOY2QiJIlSNH0=; b=ZabqiAtA+vRCfT
	wFcB40M73mt2mX9lFUrdgKJwQl71+KDv8HMnuDEP6uAzPquwmSDEe8XZ0WZK8yWo85XfPPvB1BtsD
	dR4hPc41/pYx531NXLK0z5T+tBHq2dnBnFuGnlalapbbKZhHCVW19fGk5y2s17hpGAAxxqqPTyfLs
	MHbOozrtmLDQezLvzx+MipL7ZTtSjNLdBG44t1OitMNagJEXqa0yUkmqwd4+56MD41rcMDWLt1cSv
	RGhF5vFyJdRKaYU7NnKaLMKqUXqqYVeGVwyijNY3EILGymi3KC0cdevBdEKVYqPQTuHICwOPW0ORU
	2cDevZO1CxL6wflerONQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTd9Q-0000dF-L1; Sun, 10 Nov 2019 02:40:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTd9M-0000cN-Ms
 for linux-mediatek@lists.infradead.org; Sun, 10 Nov 2019 02:40:27 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E12FF21924;
 Sun, 10 Nov 2019 02:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573353623;
 bh=o/TOvQIheBmK4/IOoKUhlIn3DScWwrc2sRd+jGer1Oo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NyltAoaciBfm5ddlZwsGAxCOEh8U8735I6GlCmx4d+8DSKJtHPqTR8doth6yzdO4s
 zS/9eFgoH7jk570QZyHvB+np+Q4m+OjFYTpVdtHohnnHyfnbcTOPLt/mSVHTyA8qRR
 qt05YafNZSNAmX9fxwtILOZlHGv3bOidE9O8zGVA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 008/191] PCI: mediatek: Fix unchecked return value
Date: Sat,  9 Nov 2019 21:37:10 -0500
Message-Id: <20191110024013.29782-8-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110024013.29782-1-sashal@kernel.org>
References: <20191110024013.29782-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191109_184024_769848_F825C496 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Honghui Zhang <honghui.zhang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>

[ Upstream commit 17a0a1e5f6c4bd6df17834312ff577c1373d87b8 ]

Check return value of devm_pci_remap_iospace().

Addresses-Coverity-ID: 1471965 ("Unchecked return value")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Acked-by: Honghui Zhang <honghui.zhang@mediatek.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pci/controller/pcie-mediatek.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index c5ff6ca65eab2..0d100f56cb884 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -1120,7 +1120,9 @@ static int mtk_pcie_request_resources(struct mtk_pcie *pcie)
 	if (err < 0)
 		return err;
 
-	devm_pci_remap_iospace(dev, &pcie->pio, pcie->io.start);
+	err = devm_pci_remap_iospace(dev, &pcie->pio, pcie->io.start);
+	if (err)
+		return err;
 
 	return 0;
 }
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
