Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B9EC2D0C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 05:33:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11DEC20718
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 05:33:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JG+mK+pl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HWn4hhCu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11DEC20718
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PvAKFyqdYJFPFiqph3q2ieaAgcl2qr8eLqqU2UBXiV4=; b=JG+mK+plHLIjE9
	NMu+d3Mdv3htcG29gf/Qyq4Fqw1O0trZHY4c712uHKFDGBHLhJMG3Cz/PZE6j52u6FXedmM43bgTH
	VvUAm5N3faeXmeptPVl8ncdzgBaky7conVMaCIPZCDl/PEJGHSqEfvF+0FvrLOqPDPHGd29F+cgvt
	niVdiyI3ymaAmNpYdP8eXamTg9AO3bfQHKaJ9kd7krI4qUJAsKiPtvMm4ZKHwKdv7LXOzuEuv7RI2
	qINUsgDnLxdpvN8pFdkSlQbkEfTA51VFWQPNGe9BbACF5GQdDTpMlgvnmG4eMhtOzmt1VOYGom8+y
	IQpioHrk2AM0zvdGjtNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilng0-0007J4-Cg; Mon, 30 Dec 2019 05:33:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilnfl-00074n-0i; Mon, 30 Dec 2019 05:32:58 +0000
X-UUID: bc64d4b4dd274b7780d4497286b8e31d-20191229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=HtNPM7dejlWJWxW/NdMu+8iY5acDOzc1HLly9BYlNdw=; 
 b=HWn4hhCug2hcx21ztIaXlaCdem8ep5vNZF7ZoR9AMj865rrJOn+2YcuRwu79jA6SQ5UZ1Q80HZ5M+bi8LZ4Qw4soBYb83xo94mYolG9mOuktkXuu1I1eFJ+ZcWJ0QYD23buqaACME98TE44pxQ+KPHfPCCv9aFfX/5artdlHNd8=;
X-UUID: bc64d4b4dd274b7780d4497286b8e31d-20191229
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2060566474; Sun, 29 Dec 2019 21:32:49 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 29 Dec 2019 21:33:02 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Dec 2019 13:32:02 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 30 Dec 2019 13:31:24 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>,
 <pedrom.sousa@synopsys.com>, <jejb@linux.ibm.com>, <matthias.bgg@gmail.com>,
 <bvanassche@acm.org>, <f.fainelli@gmail.com>
Subject: [PATCH v2 0/6] scsi: ufs: add MediaTek vendor implementations
Date: Mon, 30 Dec 2019 13:32:24 +0800
Message-ID: <1577683950-1702-1-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 40A6531EB29FBBF407E2838E26378FC5BE786B18504C9DBB6B363B6E8C47BAF92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_213257_068110_290B5B82 
X-CRM114-Status: UNSURE (   5.97  )
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
Cc: leon.chen@mediatek.com, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

This series provides MediaTek vendor implementations as below,

    - Device reset
    - Reference clock control
    - Auto-hibernate enabling with customized timer value
    - Clk-gating enabling with customized delayed timer value

v1 -> v2:
    - Move MTK_SIP_UFS_CONTROL to ufs-mediatek.h and make include/linux/soc/mediatek/mtk_sip_svc.h has common definitions only (Alim)
    - Remove dummy "line change" for MTK_SIP_UFS_CONTROL definition
    - Refactor UFS SMC calls in ufs-mediatek.c

Stanley Chu (6):
  soc: mediatek: add header for SiP service interface
  scsi: ufs-mediatek: add device reset implementation
  scsi: ufs-mediatek: introduce reference clock control
  scsi: ufs: export ufshcd_auto_hibern8_update for vendor usage
  scsi: ufs-mediatek: configure customized auto-hibern8 timer
  scsi: ufs-mediatek: configure and enable clk-gating

 drivers/scsi/ufs/ufs-mediatek.c          | 125 ++++++++++++++++++++++-
 drivers/scsi/ufs/ufs-mediatek.h          |  27 +++++
 drivers/scsi/ufs/ufs-sysfs.c             |  20 ----
 drivers/scsi/ufs/ufshcd.c                |  18 ++++
 drivers/scsi/ufs/ufshcd.h                |   1 +
 include/linux/soc/mediatek/mtk_sip_svc.h |  25 +++++
 6 files changed, 192 insertions(+), 24 deletions(-)
 create mode 100644 include/linux/soc/mediatek/mtk_sip_svc.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
