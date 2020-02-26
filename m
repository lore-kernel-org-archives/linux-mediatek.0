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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98641C4BA0A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 03:37:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6945F21744
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 03:37:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jwrAF3gj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SxQOgIVO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6945F21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UCMV/WwlkceC00WMaAKDp9GJVqvq3WMZLX+19qPr1Sg=; b=jwrAF3gj0CidOf
	z/N9I4xp+zGUT5rs1q2d7wrGlfkBqj8oHDoc22cKZlnDkjtDriXk6asA82sOUEI1yyCyzGEP8iRwM
	utLlygxGo1JO0+H+lG4MzM8AwVoNIicwdu0bG/9wbtXWfPe6aUTcWplFAZ2gT+E3BGyR9q8HanqQ1
	ZFvMjuEnXDEXQmlQf10GW6EKrmmQl21SOmZDXLKLN+oSvTwH6BIgoI95x29AI9ilrib/KzKOK3OO/
	ZKdDspB3I7OflEjHURZpLXsodd7O1DgW632REFHpl1hAEzBD+SB4Hf+V2dAt9ZdSfkqp1w2m8kjqD
	nL2ziqOvFQT2W3eRQmSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6nW4-0005De-1J; Wed, 26 Feb 2020 03:37:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6nW0-0005Cv-VU; Wed, 26 Feb 2020 03:37:42 +0000
X-UUID: 7f55703d4e334b648e6988c1aa81e03e-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=cgYMAr+8MfT+9oQtPueYQelaIVbakgIZFZ6xAha24GI=; 
 b=SxQOgIVOLRjIF+gK7VXGEwRNrXa7ujVEynNqJRvggUXr3PxzQQAQRHoBN8v9NHpM0A4jqhaiNUyDyJRY68gYviAlBVeTT9ULT6vZ1YFbKPVVgj/V/69s3l89/MH0cyRVuPKDrkHG/TA/NmClrKtRNBEmhui6cYvxB8oXFqFerMQ=;
X-UUID: 7f55703d4e334b648e6988c1aa81e03e-20200225
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <gtk_ruiwang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1215638783; Tue, 25 Feb 2020 19:37:35 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 19:38:38 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 11:36:43 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 11:35:09 +0800
From: <gtk_ruiwang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: pull request: linux-firmware: move MT8173 VPU FW to subfolder 
Date: Wed, 26 Feb 2020 11:36:45 +0800
Message-ID: <20200226033646.20949-1-gtk_ruiwang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_193741_022220_A9A93129 
X-CRM114-Status: UNSURE (   6.66  )
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

for you to fetch changes up to e5caf7b0f56350704836ec63845d398a9faca506:

  mediatek: move MT8173 VPU FW to subfolder (2020-02-26 11:02:00 +0800)

----------------------------------------------------------------
gtk_ruiwang (1):
      mediatek: move MT8173 VPU FW to subfolder

 vpu_d.bin => mediatek/mt8173/vpu_d.bin | Bin
 vpu_p.bin => mediatek/mt8173/vpu_p.bin | Bin
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename vpu_d.bin => mediatek/mt8173/vpu_d.bin (100%)
 rename vpu_p.bin => mediatek/mt8173/vpu_p.bin (100%)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
