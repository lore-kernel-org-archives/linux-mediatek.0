Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89613C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 07:52:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14DED20709
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 07:52:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SL9NVOPS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KV/YWhNu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14DED20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TUidclGX9DGTkaKQLz/AfdpJDYP9e7PW2jCnHZ/6x6g=; b=SL9NVOPSCeEkhhl2g0Sl0yxOi
	pOYzg2QC3RaisLupO6g/ftqmU1XEp7xNqwVgs71YjYmRq0TnKPXDKqdXvgHW5pIsTtuAaoYQ4VhKa
	wcoDjg2K+ZhnQKeO6dGlHWDAbjPjlOfhq/v8D1wScU0GZivN8SSE2WufjwNlP+HEBmgMbgeyVOzMf
	EchDC1S2PNT/xNgBmEZNqK9pKCbFTpGA6vqmk/SR3+r0yw0XSnkMB3bNBzdtTF+uRdHvIomjL9Blg
	n+NZU60GPyYQCHtLHWemh4BXPJb1nYe6FxnK0nETc/DmzW6PK/2EVRBbSCd7h8ug+N9XEUKTyDyP3
	hjV/aF15Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd7PL-0006gx-0M; Thu, 12 Nov 2020 07:52:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd7PE-0006e3-0Z; Thu, 12 Nov 2020 07:52:33 +0000
X-UUID: a14596b030834839a10822b60f9658fc-20201111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BlQyJfsoHDiF36DcZnxerfEdXSYts1d7WHEQyoPvRxw=; 
 b=KV/YWhNuqHymBsGw+vMku+TD9tk6QYmMOkRULaBKAO0Ftu6Ila2ngOOixcmng+XmQhVUxerfaO+ZofxL6CFfKGHbWnrVcaBOPID8x4GlHz8dIhSBUMUbG1ADF1boEsG/TbMSUP71miwEP5Gmc/OiCsNHCd3gpuJiHW92m3AReek=;
X-UUID: a14596b030834839a10822b60f9658fc-20201111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 916601956; Wed, 11 Nov 2020 23:52:21 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 23:52:14 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Nov 2020 15:52:13 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 Nov 2020 15:52:12 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 3/3] mmc: core: Set cqe off during suspend flow
Date: Thu, 12 Nov 2020 15:52:08 +0800
Message-ID: <20201112075208.28183-4-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201112075208.28183-1-wenbin.mei@mediatek.com>
References: <20201112075208.28183-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_025232_262389_9DEB3628 
X-CRM114-Status: GOOD (  13.25  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Bradley Bolen <bradleybolen@gmail.com>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Baolin Wang <baolin.wang@linaro.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, irq-linux@rere.qmqm.pl,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Ludovic Barre <ludovic.barre@st.com>, Krishna Konda <kkonda@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
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
to the default value, so CQE need to be re-initialized after resuming back.

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
---
 drivers/mmc/core/host.c | 2 ++
 drivers/mmc/core/mmc.c  | 5 +++++
 include/linux/mmc/pm.h  | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index ce43f7573d80..c98486c8fb3b 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -284,6 +284,8 @@ int mmc_of_parse(struct mmc_host *host)
 	if (device_property_read_bool(dev, "wakeup-source") ||
 	    device_property_read_bool(dev, "enable-sdio-wakeup")) /* legacy */
 		host->pm_caps |= MMC_PM_WAKE_SDIO_IRQ;
+	if (device_property_read_bool(dev, "cqe-off-in-suspend"))
+		host->pm_caps |= MMC_PM_CQE_OFF_IN_SUSPEND;
 	if (device_property_read_bool(dev, "mmc-ddr-3_3v"))
 		host->caps |= MMC_CAP_3_3V_DDR;
 	if (device_property_read_bool(dev, "mmc-ddr-1_8v"))
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index b3fa193de846..f5ae1f13a867 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2047,6 +2047,11 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
 		err = mmc_deselect_cards(host);
 
 	if (!err) {
+		if (host->cqe_enabled &&
+		    (host->pm_caps & MMC_PM_CQE_OFF_IN_SUSPEND)) {
+			host->cqe_ops->cqe_disable(host);
+			host->cqe_enabled = false;
+		}
 		mmc_power_off(host);
 		mmc_card_set_suspended(host->card);
 	}
diff --git a/include/linux/mmc/pm.h b/include/linux/mmc/pm.h
index 3549f8045784..3dd1046f2c8f 100644
--- a/include/linux/mmc/pm.h
+++ b/include/linux/mmc/pm.h
@@ -23,5 +23,6 @@ typedef unsigned int mmc_pm_flag_t;
 
 #define MMC_PM_KEEP_POWER	(1 << 0)	/* preserve card power during suspend */
 #define MMC_PM_WAKE_SDIO_IRQ	(1 << 1)	/* wake up host system on SDIO IRQ assertion */
+#define MMC_PM_CQE_OFF_IN_SUSPEND  (1 << 2)	/* cqe off during suspend */
 
 #endif /* LINUX_MMC_PM_H */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
