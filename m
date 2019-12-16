Return-Path: <SRS0=XFYx=2G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4203C43603
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 03:59:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ED3D24679
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 03:59:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jr9C7X0B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="M6/3IUhk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ED3D24679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NxbZGv+lLeoYQ+QXE7gIRrjX5wjSs4uix/lGW/d5INs=; b=Jr9C7X0BZqCCH7
	TgU/oA2T4xEFwczKUISc9uHFshQSl3xeovzU4XzDm7dubi4TqHwtJCSedCP6wDbyUDd8EruZgsa/x
	Pq4GmhEnkrA+yPTzVlZybdoxGVpIphQ4aYRSt5R9EMTBWi2Lt9+mEn0vhtV+dWxETm7cuFgSkbYgz
	OILeHeyD+ooKN2TE5hoRk6KoszXJ65BAWLBpvlbZr2fJmLyjI9QkxPETMvjxO5srDPHzdFeAX/YG3
	NGfgDe6dLxvIMTbi6pPf1lSLbTkn8TG8N5L2yPUzaBLhVWO3kDeksPDFqGV4WqCeySxePi+CtVkzf
	Idf1soP2fasEi65JeE1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ighXD-0002qG-AW; Mon, 16 Dec 2019 03:59:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ighXB-0002pC-AL; Mon, 16 Dec 2019 03:59:02 +0000
X-UUID: 63490d0359344efb8c4343d7672f902f-20191215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0oTM8ec49riGzkXqbh5sFdhXmjjCrTrpNmENYdE7F7s=; 
 b=M6/3IUhkmECZ4Xvqmv88gWoAUjact28Lub1Z3ZJBDYZZaEKvj5rgW9rxFYTj+oPkv0AGVoJtv4s4m6U10FMtsATlU4dzgQ8dpUetHlnCmAdD3loID7HEAtjhKXmJbTT6KfdB62o6f8MNBskVQUDPdoYzZbYFTMVpq+aJC/BHgZQ=;
X-UUID: 63490d0359344efb8c4343d7672f902f-20191215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 42826778; Sun, 15 Dec 2019 19:58:59 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 15 Dec 2019 19:50:21 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Dec 2019 11:48:28 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 16 Dec 2019 11:48:58 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>,
 <pedrom.sousa@synopsys.com>, <jejb@linux.ibm.com>, <matthias.bgg@gmail.com>,
 <f.fainelli@gmail.com>
Subject: [PATCH v2 0/2 RESEND] scsi: ufs-mediatek: add device reset
 implementation
Date: Mon, 16 Dec 2019 11:48:55 +0800
Message-ID: <1576468137-17220-1-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2C63DA52B94AD84F64F4F77477A7075DBF46997BA5D1D4C0C62BC6CC6F9402E72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_195901_365137_813691E8 
X-CRM114-Status: UNSURE (   4.66  )
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
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset add implementation of UFS device reset vops in MediaTek UFS driver.

v2:
 - Use definition defined in include/linux/arm-smccc.h instead of "magic definition" (Florian Fainelli)

Stanley Chu (2):
  soc: mediatek: add header for SiP service interface
  scsi: ufs-mediatek: add device reset implementation

 drivers/scsi/ufs/ufs-mediatek.c          | 27 +++++++++++++++++++++
 drivers/scsi/ufs/ufs-mediatek.h          |  7 ++++++
 include/linux/soc/mediatek/mtk_sip_svc.h | 30 ++++++++++++++++++++++++
 3 files changed, 64 insertions(+)
 create mode 100644 include/linux/soc/mediatek/mtk_sip_svc.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
