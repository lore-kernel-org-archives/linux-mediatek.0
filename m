Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C466CC43460
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 03:42:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33E7C61399
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 03:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33E7C61399
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iyeM0f9kQgvI7ypvMDrLw4RnZ98aQyDfTx9IKqZPAhk=; b=BLZaQvKszNoNeDo4+ro7/3xSP
	vb9drT8XqcDVOvInTXnVuW5W013RL0dxtTyoqrKEr3ORopq2WjmsTNTgF+A6gUDZvvXLP2qJSYa8d
	1ELcDedr03CnfmxdTju0jWug1IYYSjm05OTVcNFzOtdlr+ceEVeYdojm4IdfjsuEv7ViT4cCX4/6i
	mUSfjI8KONWtQbEJi9FZPImj0Y/F9yuN59u/uX51jWiiyk6o0Z0E5RREUoxohwPT2HQQt8GSo+T9T
	ibLYqk5Lok3EYaHPLg27j1W127srOJJM4oxzU8Y+JiwQiuuq4KehFuP1H0QAwh44ojxuq6Lop2mQ6
	auJdNxoUQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTcbR-001MVW-LQ; Tue, 06 Apr 2021 03:42:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTcbN-001MUc-BE
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 03:42:08 +0000
X-UUID: c1049f7cb79f4cc6ae46804c1ba41ba2-20210405
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3f+Gh+bmV1XSGUO3Mh8/2LDwSFLxkRDJS9EIRzeeoZ4=; 
 b=HtpalNUdQgmyMCj+YE7iUd/7TlBeLGX36mPezzOLHzl1H9ZmQYCZ8soks/ohhcGav9OtSk6RYatpK5El6fLzFDMDEXyYD61amRrxv2+5czR9jx7UxyhCQLAL1U7qPjxPWLCT/OfD51x46uV6bF3bc0cYuuFPMjdmK1rs7w61vBc=;
X-UUID: c1049f7cb79f4cc6ae46804c1ba41ba2-20210405
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2042639650; Mon, 05 Apr 2021 20:41:58 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Apr 2021 20:34:49 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 11:34:41 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 6 Apr 2021 11:34:40 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 3/6] mt76: mt7921: fix kernel crash when the firmware fails to
 download
Date: Tue, 6 Apr 2021 11:34:36 +0800
Message-ID: <06be56a930d2193d5e1d064dcb89607fb54bd894.1617679693.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4c5666ad0683e467f11ca4a4abb5be335be25696.1617679693.git.objelf@gmail.com>
References: <4c5666ad0683e467f11ca4a4abb5be335be25696.1617679693.git.objelf@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: BBB26D2DCE0268E088B86110D2F8E501C413A37B06129375DB2A0A43696EB9A92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_044206_137220_CE2D550C 
X-CRM114-Status: GOOD (  11.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Fix kernel crash when the firmware is missing or fails to download.

[    9.444758] kernel BUG at drivers/pci/msi.c:375!
[    9.449363] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
[    9.501033] pstate: a0400009 (NzCv daif +PAN -UAO)
[    9.505814] pc : free_msi_irqs+0x180/0x184
[    9.509897] lr : free_msi_irqs+0x40/0x184
[    9.513893] sp : ffffffc015193870
[    9.517194] x29: ffffffc015193870 x28: 00000000f0e94fa2
[    9.522492] x27: 0000000000000acd x26: 000000000000009a
[    9.527790] x25: ffffffc0152cee58 x24: ffffffdbb383e0d8
[    9.533087] x23: ffffffdbb38628d0 x22: 0000000000040200
[    9.538384] x21: ffffff8cf7de7318 x20: ffffff8cd65a2480
[    9.543681] x19: ffffff8cf7de7000 x18: 0000000000000000
[    9.548979] x17: ffffff8cf9ca03b4 x16: ffffffdc13ad9a34
[    9.554277] x15: 0000000000000000 x14: 0000000000080800
[    9.559575] x13: ffffff8cd65a2980 x12: 0000000000000000
[    9.564873] x11: ffffff8cfa45d820 x10: ffffff8cfa45d6d0
[    9.570171] x9 : 0000000000000040 x8 : ffffff8ccef1b780
[    9.575469] x7 : aaaaaaaaaaaaaaaa x6 : 0000000000000000
[    9.580766] x5 : ffffffdc13824900 x4 : ffffff8ccefe0000
[    9.586063] x3 : 0000000000000000 x2 : 0000000000000000
[    9.591362] x1 : 0000000000000125 x0 : ffffff8ccefe0000
[    9.596660] Call trace:
[    9.599095]  free_msi_irqs+0x180/0x184
[    9.602831]  pci_disable_msi+0x100/0x130
[    9.606740]  pci_free_irq_vectors+0x24/0x30
[    9.610915]  mt7921_pci_probe+0xbc/0x250 [mt7921e]
[    9.615693]  pci_device_probe+0xd4/0x14c
[    9.619604]  really_probe+0x134/0x2ec
[    9.623252]  driver_probe_device+0x64/0xfc
[    9.627335]  device_driver_attach+0x4c/0x6c
[    9.631506]  __driver_attach+0xac/0xc0
[    9.635243]  bus_for_each_dev+0x8c/0xd4
[    9.639066]  driver_attach+0x2c/0x38
[    9.642628]  bus_add_driver+0xfc/0x1d0
[    9.646365]  driver_register+0x64/0xf8
[    9.650101]  __pci_register_driver+0x6c/0x7c
[    9.654360]  init_module+0x28/0xfdc [mt7921e]
[    9.658704]  do_one_initcall+0x13c/0x2d0
[    9.662615]  do_init_module+0x58/0x1e8
[    9.666351]  load_module+0xd80/0xeb4
[    9.669912]  __arm64_sys_finit_module+0xa8/0xe0
[    9.674430]  el0_svc_common+0xa4/0x16c
[    9.678168]  el0_svc_compat_handler+0x2c/0x40
[    9.682511]  el0_svc_compat+0x8/0x10
[    9.686076] Code: a94257f6 f9400bf7 a8c47bfd d65f03c0 (d4210000)
[    9.692155] ---[ end trace 7621f966afbf0a29 ]---
[    9.697385] Kernel panic - not syncing: Fatal exception
[    9.702599] SMP: stopping secondary CPUs
[    9.706549] Kernel Offset: 0x1c03600000 from 0xffffffc010000000
[    9.712456] PHYS_OFFSET: 0xfffffff440000000
[    9.716625] CPU features: 0x080026,2a80aa18
[    9.720795] Memory Limit: none

Fixes: 5c14a5f944b (""mt76: mt7921: introduce mt7921e support)
Reported-by: Claire Chang <tientzu@google.com>
Co-developed-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index e94523bf19be..40e2086d075c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -146,10 +146,12 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 
 	ret = mt7921_register_device(dev);
 	if (ret)
-		goto err_free_dev;
+		goto err_free_irq;
 
 	return 0;
 
+err_free_irq:
+	devm_free_irq(&pdev->dev, pdev->irq, dev);
 err_free_dev:
 	mt76_free_device(&dev->mt76);
 err_free_pci_vec:
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
