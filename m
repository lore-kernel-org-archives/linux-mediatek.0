Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CF2C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 12:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gbfp03YK9VSL0IlbhAWEnBcuQMqb/+edFTWaMxckzHg=; b=BXUVHl2AXS49Gw
	+LB4KkQxqg4mitfdt3ElOFDynGS5ReJt+YceEG7gkjI1pGDdFq3CcZ0ZVzQspBWQER5SbOo1hXW9a
	cd5KmrpM9KALHrE6eMPn84DrtaSdyR2pTzgAgQSNkBWQ0HGlizSkECXrxQakvmte3wEZI0CmbVJcT
	AO2nsSTzBoJBG6iQ7JmVit1HQJEs+rqxsWY2G+QBseUGm84bTU2fCEnv5yxQD9LvC4oLPHBg13seV
	+j0Ekxb2L7CocIO+UKY/RL/VQuJcbEZIuLQ5tw0U3Qy8lpxKEbRbVsBttbO5CuIXBPKf4tk5KpCrY
	gMhuIaTX6vJONUboEkng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBFqw-00HLDE-WE; Sat, 22 Jan 2022 12:50:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBFqs-00HLCU-6p; Sat, 22 Jan 2022 12:50:45 +0000
X-UUID: 7e2779c15cb84840843322ffec055e3d-20220122
X-UUID: 7e2779c15cb84840843322ffec055e3d-20220122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 85228633; Sat, 22 Jan 2022 05:50:39 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 22 Jan 2022 04:50:37 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 22 Jan 2022 20:50:36 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 22 Jan 2022 20:50:35 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <tiffany.lin@mediatek.com>, <Maoguang.Meng@mediatek.com>,
 <Longfei.Wang@mediatek.com>, <Yunfei.Dong@mediatek.com>,
 <Andrew-CT.Chen@mediatek.com>, <erin.lo@mediatek.com>,
 <PoChun.Lin@mediatek.com>, <irui.wang@mediatek.com>,
 <srv_heupstream@mediatek.com>
Subject: pull request: linux-firmware: mediatek: Update MT8173 VPU
Date: Sat, 22 Jan 2022 20:50:28 +0800
Message-ID: <20220122125029.22195-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_045042_294186_117B95BF 
X-CRM114-Status: UNSURE (   6.68  )
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

The following changes since commit 0c6a7b3bf728b95c8b7b95328f94335e2bb2c967:

  linux-firmware: Update firmware file for Intel Bluetooth 9260 (2022-01-19 11:16:28 -0500)

are available in the Git repository at:

  https://github.com/irui-wang/linux_fw_vpu_v1.1.7.git v1.1.7

for you to fetch changes up to 70390331db03113fd7fe1dff195b135a7f2ad840:

  linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.7 (2022-01-22 20:30:38 +0800)

----------------------------------------------------------------
Irui Wang (1):
      linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.7

 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131180 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
