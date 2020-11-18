Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB74C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 06:34:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C8F520872
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 06:34:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2WzxLl5r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PeZxh5Rb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C8F520872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vcxxBEHg9sX+gpDfXrFXcFIO1QhfTVSISiASXHjgsJg=; b=2WzxLl5rgzOEWx2UdFzJSXkKkC
	UnQW7DhL9GR24X5/Yga9ogKOTf83B8RysIKHup4Sv8pfvsJM7Noosr0P4JkB7rM4vDUAbkxAhsjIR
	qJn7Pn0BqJ9tTh+cpMusT39ZwF6WLQy8jdYZDPq59D8GTRYFeunlhZFjVzoL6bBOLl2/0srYHyDut
	2zO1XDMxP1y8Lmvp+sJs3/QheifnEcceXiWWLsOR3lbVtxWlpPoLzSXIxHdNHl+ACu8ki/t54cOyn
	1XvBmbefQt9eVDU1+45WsSdGP36Kwaqkxkc0wtfFtZGVcgG05NdDrh16XNTlVFUpq1NQcBl0GiReD
	+u5nFk3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfH32-0002ET-RO; Wed, 18 Nov 2020 06:34:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfH2y-0002DP-1p; Wed, 18 Nov 2020 06:34:30 +0000
X-UUID: 090ae62df99947d4bb3eee170b97c470-20201117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=MHvfVi6kE73HfLdBlDlbjCz2trfqKJ9Oy35igJv7d5U=; 
 b=PeZxh5RbBT69bgKK3ecIOy1ibZbd+1mE8OdcmTYm6Hhv0rRzrWeUD/xM8j3+KmHbRSCajaFqy94zpQD5W+cxRJu8ZZUu5rVQIDLapC8pX479aC7Taomn2Cb03DNZJS33ay3lvDxt26HzdEw8HcE4GWtlewUy9v91vuae1ODIDF8=;
X-UUID: 090ae62df99947d4bb3eee170b97c470-20201117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1652422215; Tue, 17 Nov 2020 22:34:10 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Nov 2020 22:34:08 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 14:34:07 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Nov 2020 14:34:07 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH] mmc: mediatek: Add system suspend/resume interface
Date: Wed, 18 Nov 2020 14:34:05 +0800
Message-ID: <20201118063405.24906-1-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_013428_857467_A40B0F3E 
X-CRM114-Status: GOOD (  15.20  )
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
Cc: Wenbin Mei <wenbin.mei@mediatek.com>, srv_heupstream@mediatek.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Before we got these errors on MT8192 platform:
[   59.153891] Restarting tasks ...
[   59.154540] done.
[   59.159175] PM: suspend exit
[   59.218724] mtk-msdc 11f60000.mmc: phase: [map:fffffffe] [maxlen:31]
[final:16]
[  119.776083] mmc0: cqhci: timeout for tag 9
[  119.780196] mmc0: cqhci: ============ CQHCI REGISTER DUMP ===========
[  119.786709] mmc0: cqhci: Caps:      0x100020b6 | Version:  0x00000510
[  119.793225] mmc0: cqhci: Config:    0x00000101 | Control:  0x00000000
[  119.799706] mmc0: cqhci: Int stat:  0x00000000 | Int enab: 0x00000000
[  119.806177] mmc0: cqhci: Int sig:   0x00000000 | Int Coal: 0x00000000
[  119.812670] mmc0: cqhci: TDL base:  0x00000000 | TDL up32: 0x00000000
[  119.819149] mmc0: cqhci: Doorbell:  0x003ffc00 | TCN:      0x00000200
[  119.825656] mmc0: cqhci: Dev queue: 0x00000000 | Dev Pend: 0x00000000
[  119.832155] mmc0: cqhci: Task clr:  0x00000000 | SSC1:     0x00001000
[  119.838627] mmc0: cqhci: SSC2:      0x00000000 | DCMD rsp: 0x00000000
[  119.845174] mmc0: cqhci: RED mask:  0xfdf9a080 | TERRI:    0x0000891c
[  119.851654] mmc0: cqhci: Resp idx:  0x00000000 | Resp arg: 0x00000000
[  119.865773] mmc0: cqhci: : ===========================================
[  119.872358] mmc0: running CQE recovery
From these logs, we found TDL base was back to the default value.

After suspend, the mmc host is powered off by HW, and bring CQE register
to the default value, so we add system suspend/resume interface, then bring
CQE to deactivated state before suspend, it will be enabled by CQE first
request after resume.

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index fc5ee5df91ad..c5f9cd6fc951 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2758,11 +2758,29 @@ static int msdc_runtime_resume(struct device *dev)
 	msdc_restore_reg(host);
 	return 0;
 }
+
+static int msdc_sys_suspend(struct device *dev)
+{
+	struct mmc_host *mmc = dev_get_drvdata(dev);
+	int ret;
+
+	if (mmc->caps2 & MMC_CAP2_CQE) {
+		ret = cqhci_suspend(mmc);
+		if (ret)
+			return ret;
+	}
+
+	return pm_runtime_force_suspend(dev);
+}
+
+static int msdc_sys_resume(struct device *dev)
+{
+	return pm_runtime_force_resume(dev);
+}
 #endif
 
 static const struct dev_pm_ops msdc_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(msdc_sys_suspend, msdc_sys_resume)
 	SET_RUNTIME_PM_OPS(msdc_runtime_suspend, msdc_runtime_resume, NULL)
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
