Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99252C43460
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 16:08:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17A1361363
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 16:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17A1361363
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z4sM+GgVJOM81RSL+uzPnvQixTaw+5jQEiQoMwAra1I=; b=F+ZUllw76ruergEBkCi6+MbfRP
	U2LUU/nGCGxcJAwI2GwdcvLSzrr6RN1JU3YPei4XBaugtvbblmMGrVl1BYLxr+3bIvgvc1lutDXVG
	nz4t79By7qhNaIwAt3mRlmyLFuMJ0SGdx9g9c6ouM6NzVJEfErgDG9K3FqvP4ejMRzKpysFib/q/C
	YFQxo5pQ8Vc0daPRMj9FSUAcS7bCIy0X3SSWzPqshm9sRom9/SayP9dxnQ+rkpgtDjdIfpf7kTOk1
	c4AMrmW+2zwVZtAg+8c8i0Pl+woUIWosLgzIkIT3PYIkcZR78Tqs/OemCnXKnuAiXaV3Ie/Jc2A/P
	6XIDoasA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYWRr-00AF6l-8W; Mon, 19 Apr 2021 16:08:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYWRo-00AF6b-37
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 16:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=HE2dZAZDw49epdZf7bvGNkhNOC5Nam4jxs0izRkbgVw=; b=OqU+WdNtuXqEDtgAQT9U5FM2fA
 uu7UWu9+j7MclHGDwTQFZ2BPy5CJYS6z8wVnKqtHiCOoZA9Hmdrb+4Esz0o/q2Nr3ui0n8uswX5m1
 HGROhyDThmJefvoMoIv/om35CU88LCX7bkcKrQmqsPHg0+pLW5WnfPMMnNsFqT9rhcYs4IzgZjY24
 V9UBSfOLpRbGxJ8OoFILgf/dGAqWmmkomXIklhGXfar97z9jAdukjN8t49WnCFMDzE59MEnqLpAqS
 7p+xCEwC5sg4jxx1pFAWsUX3BP5o/4HT313rYjFMmvXjiEBP9VvbAEiEbz6Mk+gUAOlp74uRshCPi
 Xj0e2gvQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYWRk-00BVqB-Eq
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 16:08:26 +0000
X-UUID: 051818d61cfb451c8ab72a0f1b91b44d-20210419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=HE2dZAZDw49epdZf7bvGNkhNOC5Nam4jxs0izRkbgVw=; 
 b=nZxW0uEzzYK5goy+DA3TaUSC7ToYTY44lSiJVsVCoOwvBrUJqm68NCyDEii18C8A6nn1S1AAFdrQVEcJ1xbRFiSPcZa4U7cdxj91w3QyWdoZdBcO7tmLEO0+hrJ0TX1gkRJlrpHwjlCm8sYoRNne40vGFt+oPowf4p50csqnsxQ=;
X-UUID: 051818d61cfb451c8ab72a0f1b91b44d-20210419
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1351463200; Mon, 19 Apr 2021 09:08:16 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 08:58:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 23:58:07 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 19 Apr 2021 23:58:07 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
 <km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH] mt76: mt7921: fix possible invalid register access
Date: Mon, 19 Apr 2021 23:58:05 +0800
Message-ID: <1618847885-10680-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_090824_529124_8340F071 
X-CRM114-Status: GOOD (  11.98  )
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

Disable the interrupt and synchronze for the pending irq handlers to ensure
the irq tasklet is not being scheduled after the suspend to avoid the
possible invalid register access acts when the host pcie controller is
suspended.

[17932.910534] mt7921e 0000:01:00.0: pci_pm_suspend+0x0/0x22c returned 0 after 21375 usecs
[17932.910590] pcieport 0000:00:00.0: calling pci_pm_suspend+0x0/0x22c @ 18565, parent: pci0000:00
[17932.910602] pcieport 0000:00:00.0: pci_pm_suspend+0x0/0x22c returned 0 after 8 usecs
[17932.910671] mtk-pcie 11230000.pcie: calling platform_pm_suspend+0x0/0x60 @ 22783, parent: soc
[17932.910674] mtk-pcie 11230000.pcie: platform_pm_suspend+0x0/0x60 returned 0 after 0 usecs

...

17933.615352] x1 : 00000000000d4200 x0 : ffffff8269ca2300
[17933.620666] Call trace:
[17933.623127]  mt76_mmio_rr+0x28/0xf0 [mt76]
[17933.627234]  mt7921_rr+0x38/0x44 [mt7921e]
[17933.631339]  mt7921_irq_tasklet+0x54/0x1d8 [mt7921e]
[17933.636309]  tasklet_action_common+0x12c/0x16c
[17933.640754]  tasklet_action+0x24/0x2c
[17933.644418]  __do_softirq+0x16c/0x344
[17933.648082]  irq_exit+0xa8/0xac
[17933.651224]  scheduler_ipi+0xd4/0x148
[17933.654890]  handle_IPI+0x164/0x2d4
[17933.658379]  gic_handle_irq+0x140/0x178
[17933.662216]  el1_irq+0xb8/0x180
[17933.665361]  cpuidle_enter_state+0xf8/0x204
[17933.669544]  cpuidle_enter+0x38/0x4c
[17933.673122]  do_idle+0x1a4/0x2a8
[17933.676352]  cpu_startup_entry+0x24/0x28
[17933.680276]  rest_init+0xd4/0xe0
[17933.683508]  arch_call_rest_init+0x10/0x18
[17933.687606]  start_kernel+0x340/0x3b4
[17933.691279] Code: aa0003f5 d503201f f953eaa8 8b344108 (b9400113)
[17933.697373] ---[ end trace a24b8e26ffbda3c5 ]---
[17933.767846] Kernel panic - not syncing: Fatal exception in interrupt

Fixes: ffa1bf97425b ("mt76: mt7921: introduce PM support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 40e2086d075c..c2c8ff979e6e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -195,7 +195,6 @@ static int mt7921_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	mt76_for_each_q_rx(mdev, i) {
 		napi_disable(&mdev->napi[i]);
 	}
-	tasklet_kill(&dev->irq_tasklet);
 
 	pci_enable_wake(pdev, pci_choose_state(pdev, state), true);
 
@@ -210,6 +209,9 @@ static int mt7921_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 
 	/* disable interrupt */
 	mt76_wr(dev, MT_WFDMA0_HOST_INT_ENA, 0);
+	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0x0);
+	synchronize_irq(pdev->irq);
+	tasklet_kill(&dev->irq_tasklet);
 
 	err = mt7921_mcu_fw_pmctrl(dev);
 	if (err)
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
