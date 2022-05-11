Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30434C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 06:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FDBohlNXFwIbU0/DgMVqke2aeEMxvKCCERQn5lL72Ro=; b=d4LVref9AVafjq
	jLfagXonWTouZU7lQJYHfa5jaje8jFqjeGgE2tNpHXkBT6ZEfS6oWYHVHtZ4yBdFF+68/AuVAQZSR
	PVUObi3PWmSGzFrzwkEL3cs18sFd52UaLkFymln9DgQPug/6ecwhFkbZYZ3mVCDd6MTEZGsiN/E9b
	csIdX9V+49C1wDDq50TvHiYZ0/ApheCYO1M5A2AFNbhFvnFssP8rqxgivCHDEes8KsPoMAlHpr9L2
	i3p2nBkKd46siL6nFst2SPt7TqOQnsKkcRzKbGaTR0/dhMwaKDkZ4jEu+YRGTfSG5GH+eHKdDJvpT
	sS12+MMCGq6zBG0oZJrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nogFL-005ajr-Bm; Wed, 11 May 2022 06:54:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nogFG-005ahe-De
 for linux-mediatek@lists.infradead.org; Wed, 11 May 2022 06:54:54 +0000
X-UUID: f8e65974e0c04b51bb9e10dba53dcb37-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:bd4eb2a1-5f94-4ee1-af94-2a2d1c41c29c, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:c81764b3-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f8e65974e0c04b51bb9e10dba53dcb37-20220510
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1190331116; Tue, 10 May 2022 23:54:46 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 23:54:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 14:54:42 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 May 2022 14:54:42 +0800
Message-ID: <2537b84fbba82a77ee0a517b12bdcdd5e6ac1503.camel@mediatek.com>
Subject: [PULL] mediatek: Update mt8192 firmware
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <rongchang@google.com>,
 <yunfei.dong@mediatek.com>, <shawnku@google.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <weishunc@google.com>,
 <nfraprado@collabora.corp-partner.google.com>
Date: Wed, 11 May 2022 14:54:42 +0800
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_235450_526794_4A95390E 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
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

Hi linux-firmware maintainers,

Update the MediaTek mt8192 firmware to v2.0.8537.


Thanks,
TingHan

--
The following changes since commit b19cbdca78ab2adfd210c91be15a22568e8b8cae:

  Merge branch '8183-v2.0.2745' of https://github.com/tinghan-shen/linux_fw_scp into main (2022-05-
09 13:59:43 -0400)

are available in the Git repository at:

  https://github.com/tinghan-shen/linux_fw_scp 8192-v2.0.8537

for you to fetch changes up to 86e64fe7c052b85762eeefc258c379331e6b20b3:

  mediatek: Update mt8192 SCP firmware (2022-05-11 13:36:48 +0800)

----------------------------------------------------------------
Tinghan Shen (1):
      mediatek: Update mt8192 SCP firmware

 WHENCE                  |   2 +-
 mediatek/mt8192/scp.img | Bin 309436 -> 327968 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
