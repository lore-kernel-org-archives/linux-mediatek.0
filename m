Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5AFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Nov 2021 08:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/OCC1G+V4BFiJDFjRL5ROzam0u/Ef0TdSRTpDWU+3r0=; b=2mLlPf7IGHJIdh
	QxWg6Srgm+9HSacU2vhQnoiHcSW2U/0QhrVJXqt4yv/S9iHj9N2fKht89i6QboOQGTFtkfnaHo++w
	IJF/T8Eq1T3BGsd5K0YsKt5slPKvpEivgSB1mUJ7qjv0qP5w0MABP3c5bRVpzwlkcwVT6PgS5qsf5
	hhKMI587MYMGlMpEu5X5051chIf4WPLSCJ8RPcgrjFjhNG0kpSo+cuCKxfMMaaSFCYk8alKFVP8nK
	LKBmqj7hckOsJbgdKow+HvF2s26S3UN4dJV9snOykRtyixrcqS+fqnyaKrPLYYVI/stx5Sznu3jhk
	Ijm06ei+fhp1vKXEAqFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpo4j-004J6x-RN; Wed, 24 Nov 2021 08:56:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpo4M-004J3o-1S; Wed, 24 Nov 2021 08:55:59 +0000
X-UUID: 606572278c2f4ba3b5dfa4bbf28a48dd-20211124
X-UUID: 606572278c2f4ba3b5dfa4bbf28a48dd-20211124
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1318841904; Wed, 24 Nov 2021 01:55:54 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Nov 2021 00:45:52 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 24 Nov 2021 16:45:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 24 Nov 2021 16:45:38 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Linux-ALSA <alsa-devel@alsa-project.org>, <tzungbi@google.com>,
 <cujomalainey@google.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, "Mark
 Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <sound-open-firmware@alsa-project.org>, allen-kh.cheng
 <allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 0/3] This patches provide ADSP IPC support for MT8195.
Date: Wed, 24 Nov 2021 16:45:11 +0800
Message-ID: <20211124084514.28002-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_005558_097511_2DCA9756 
X-CRM114-Status: GOOD (  10.64  )
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

Mediatek ADSP IPC is used to send notification or short message between
processors with dsp. 

It will place the message to the share buffer and will access the ADSP mailbox
registers to kick dsp.

Two mailboxes used to send notification or short message between processors with
dsp

Add changes history from series

changes since v2:
- seperate adsp_mailbox into two instances

changes since v1:
- fix dt_binding_check error

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
 drivers/mailbox/Kconfig                       |   7 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/mtk-adsp-mailbox.c            | 187 ++++++++++++++++++
 .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  72 +++++++
 10 files changed, 465 insertions(+)
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
