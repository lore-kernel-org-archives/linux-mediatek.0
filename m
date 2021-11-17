Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEF7C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 13:22:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 606F2611AF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 13:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 606F2611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=diOkvB9b7MPGelScEATlC2fh+nb1FLIgYMDFS+WODuI=; b=ZdPW/9vLE6n6iE
	qgsqbHDOvNhy6IdeRbditOkzYz/lHxkPCnYL8pGVBkrBL3W565auwu8Ikq2KRdG5MtoDMLap+AcOq
	TXJ3RgeOnMW3VYk8SoFmqtPYZdjbyzibf6aBSsoHF8pPQecMsHzHfDx9lKUJ2hpRMpHlSsEqi89PU
	Ng7nbLOOrgkT3u/XbL5ngn4gN5AY3Lem4Fbcx2p7ltuknS2pFBSSFfBBt8Pft0ftVSyel1/EAkrCZ
	F0MOAa96obAM2JK5RZA/rX5gw5Gb0hPomNIqKLk4DnGGWG6sL3MV+9bZotWRs4/LS9l5DQ/Ye1qJQ
	BoGRkuv9Y8/236rlukXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnKtg-004qE2-11; Wed, 17 Nov 2021 13:22:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnKtS-004qAj-BZ; Wed, 17 Nov 2021 13:22:31 +0000
X-UUID: 658906b23011467196878b2f9499a7e2-20211117
X-UUID: 658906b23011467196878b2f9499a7e2-20211117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2040359371; Wed, 17 Nov 2021 06:22:29 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Nov 2021 05:12:27 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 17 Nov 2021 21:12:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 17 Nov 2021 21:12:25 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Linux-ALSA
 <alsa-devel@alsa-project.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <sound-open-firmware@alsa-project.org>, allen-kh.cheng
 <allen-kh.cheng@mediatek.com>
Subject: [PATCH 0/3] Mediatek MT8195 ADSP IPC support
Date: Wed, 17 Nov 2021 21:12:19 +0800
Message-ID: <20211117131222.30541-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_052230_424646_F2F6CD2A 
X-CRM114-Status: GOOD (  10.58  )
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

This patches are providing support for ADSP IPC support
for MT8195.

Mediatek ADSP IPC is used to send notification or short
message between processors with dsp. It will place the
message to the share buffer and will access the ADSP
mailbox registers to kick dsp.

Two mailboxes used to send notification or short message
between processors with dsp

Allen-KH Cheng (3):
  dt-bindings: mediatek: add adsp-mbox document
  mailbox: mediatek: add support for adsp mailbox controller
  firmware: mediatek: add adsp ipc protocol interface

 .../bindings/mailbox/mtk,adsp-mbox.yaml       |  53 +++++
 drivers/firmware/Kconfig                      |   1 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/mediatek/Kconfig             |  10 +
 drivers/firmware/mediatek/Makefile            |   2 +
 drivers/firmware/mediatek/mtk-adsp-ipc.c      | 130 ++++++++++++
 drivers/mailbox/Kconfig                       |   8 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/mtk-adsp-mailbox.c            | 187 ++++++++++++++++++
 .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  72 +++++++
 10 files changed, 466 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
 create mode 100644 drivers/firmware/mediatek/Kconfig
 create mode 100644 drivers/firmware/mediatek/Makefile
 create mode 100644 drivers/firmware/mediatek/mtk-adsp-ipc.c
 create mode 100644 drivers/mailbox/mtk-adsp-mailbox.c
 create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
