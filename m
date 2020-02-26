Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE57C4BA0A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 05:26:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E02C6222C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 05:26:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eQ8u87S3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jQpMKKDn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E02C6222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=biNyaaWHH0uIgKGkFIAN3FdvQYTZ9t6Rt+28W2FULzk=; b=eQ8u87S3RgDBbV
	8GsydZbHKPqQ/QFZfKyS6e67ti1yTTBlqkHOVvakdccm8CGRlu+7iAMQ0zfhtt3QZ0DgelxSaAM0d
	NwcG3BHY+8EOqODKG974XXBANeRFa7LF79i8BFfqBLpf8XbDSJbKiuB0GTXRVUze0uBypcJfJ7gAO
	ZwpgaB841KcUXNJCMIptq0oysVe/UODVYxy7JBEpH23Qs1vekzbeIhVKbR8y4t6jvE6P2uMzTEaRL
	2JjmztkZTxUHDSgAxKgm8cp/4vmYg7bYObSiZcPreTO7vg7MQVj9tjUy8ufBqVVb6AOLycdTPlzeu
	rc6zxspWRUuyeVdjk3LQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6pD7-00006J-S9; Wed, 26 Feb 2020 05:26:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6pD5-00005s-Pi; Wed, 26 Feb 2020 05:26:17 +0000
X-UUID: 5d6a6ce6beb7430d928efd602da2ab9a-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=49qv1PxTKA63h58GMIBjrRHNQLNwM95yAfup8dmCDng=; 
 b=jQpMKKDnON1BIjVmK8G3Gvz0Q+xcannVAC/8pxT34o/1hrQiAeL7OWetAvP3v9EuOa303HdR3ezVOUWIKo/X/C/RethaZrh/CZptLwtZBBLR1RhefiDdJSHDxzhDqyPDXJUK4JDx/KTigbj1e2mX7jJ9jVm+lc/3pn/89tzoKco=;
X-UUID: 5d6a6ce6beb7430d928efd602da2ab9a-20200225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <gtk_ruiwang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 21920225; Tue, 25 Feb 2020 21:26:14 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 21:26:11 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 13:25:18 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 13:23:53 +0800
From: <gtk_ruiwang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: pull request: linux-firmware: move MT8173 VPU FW to subfolder 
Date: Wed, 26 Feb 2020 13:26:02 +0800
Message-ID: <20200226052603.22768-1-gtk_ruiwang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_212615_840005_589B8A5F 
X-CRM114-Status: UNSURE (   7.84  )
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
Cc: gtk_ruiwang@mediatek.com, Maoguang Meng <maoguang.meng@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 PoChun.Lin@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi linux-firmware maintainers,

The following changes since commit efcfa03ae6100dfe523ebf612e03c3a90fc4c794:

  linux-firmware: Update firmware file for Intel Bluetooth AX201 (2020-02-24 07:43:42 -0500)

are available in the Git repository at:

  https://github.com/ruiwang-mtk/linux_fw_vpu.git

for you to fetch changes up to a8a18d1ce5920bc0cfcf320747163cf13806b568:

  mediatek: move MT8173 VPU FW to subfolder (2020-02-26 13:08:15 +0800)

----------------------------------------------------------------
gtk_ruiwang (1):
      mediatek: move MT8173 VPU FW to subfolder

 WHENCE                    |   6 ++++--
 mediatek/mt8173/vpu_d.bin | Bin 0 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 0 -> 131180 bytes
 vpu_d.bin                 | Bin 2977184 -> 25 bytes
 vpu_p.bin                 | Bin 131180 -> 25 bytes
 5 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 mediatek/mt8173/vpu_d.bin
 create mode 100644 mediatek/mt8173/vpu_p.bin
 mode change 100644 => 120000 vpu_d.bin
 mode change 100644 => 120000 vpu_p.bin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
