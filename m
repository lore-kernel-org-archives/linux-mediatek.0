Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1435D2F7E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 03:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xEZ+LwBUCV79LCq35La2F6jUeHl/a28MFnYkiN7pkkQ=; b=fdhkZ1zNADFSfMvPuUvHcdZRUE
	VMkJnS3Jj4wrtHhSl9i2NKzcIdVjJZsdk2Eoyxt/8zAGp7ZSsSXDIOd6tvdp9B0OnXFnVGp3uI6tC
	7AuJFEJw/lHy/I03pBNOOOHxZ4hSAl9kIR7RHOifkNCDCHX1wklHLvmqHWapUhHEGD9wQ8m8u73np
	iY65pnreKVKv1pM/BbCkSjPCHWMGeaCGmjWVi0pg7e4GH5NxkGMd0SaHhbhhwQqXJyvhz1w2YoRyY
	DcLyS+XunlQeIXNyvl4UXghaNRS3t/pAQslfohcpB4lHvpHlwz5tK2kJ1Fv2TQlgtTYL61Kl0Y3Uf
	eKlx7rnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1H5w-0000000DeLQ-2WAi;
	Thu, 17 Oct 2024 03:22:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1H5r-0000000DeKO-0ncO;
	Thu, 17 Oct 2024 03:22:35 +0000
X-UUID: 04fe39aa8c3711ef82ff63e91e7eb18c-20241016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xEZ+LwBUCV79LCq35La2F6jUeHl/a28MFnYkiN7pkkQ=;
	b=A9tS89uKRi1DuY0tMXKh5a4818i3z7gSqxPJUzNXAZ2HgrREmYEZ+JfUuC7J3qG4Jo2BJF4hmFy5JR6SfXGskdDrLgP2bUodabWbq2LOkxBdRkdNeoiR8qN2sYvTeSeIHn3Cm7Qrw1ie5KgiocXtBkP8nVdk4QmlPlYMhv9gAgg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:2e0c031b-94b4-4c5e-8a32-c22fbbeccf4c,IP:0,U
	RL:0,TC:0,Content:41,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:41
X-CID-META: VersionHash:6dc6a47,CLOUDID:3d7aea06-3d5c-41f6-8d90-a8be388b5b5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 04fe39aa8c3711ef82ff63e91e7eb18c-20241016
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1378682502; Wed, 16 Oct 2024 20:22:20 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Oct 2024 11:22:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Oct 2024 11:22:15 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Simon
 Horman" <horms@kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, SkyLake.Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next v2 0/3] net: phy: Refactor mediatek-ge-soc.c for clarity and correctness
Date: Thu, 17 Oct 2024 11:22:10 +0800
Message-ID: <20241017032213.22256-1-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.424900-8.000000
X-TMASE-MatchedRID: NJitR9TboxyxxK6sBu9wbjPDkSOzeDWWpmFKNfn3zvqvloAnGr4qhgsp
	V4Rw6UcDTyYk6EbjbakrQIMF24cmclxxDx5qbkR9FEUknJ/kEl5jFT88f69nG/oLR4+zsDTt9xS
	3mVzWUuCMx6OO8+QGvo0CcEBNsKjT7Jh/mb/5GwpZ2gLfD/Jnn00q3uacyXFBeAj59SFC260HRR
	KnqfqqUZkyQcsvHZ56x8NgR4aMEWtB+RoVxwyzrnmVKZusLp922v9OjYWA2uMMswg45VMfPadst
	5iAforfVlxr1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.424900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DDE2CE34B4A85491DA0C020F95E0AF2C4B528F136A20B9556CB3D39366A7E3E12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_202231_280919_587833FC 
X-CRM114-Status: UNSURE (   7.55  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "SkyLake.Huang" <skylake.huang@mediatek.com>

This patch is derived from patch 8/9 of Message ID:
20241004102413.5838-9-SkyLake.Huang@mediatek.com.
This patch does some simple clean-ups, however, this is necessary
because the rest patches in
"20241004102413.5838-9-SkyLake.Huang@mediatek.com" rely on this.

Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
Changes in v2:
Split into 3 patches for reviewing.
---
SkyLake.Huang (3):
  net: phy: mediatek-ge-soc: Fix coding style
  net: phy: mediatek-ge-soc: Shrink line wrapping to 80 characters
  net: phy: mediatek-ge-soc: Propagate error code correctly in
    cal_cycle()

 drivers/net/phy/mediatek-ge-soc.c | 169 ++++++++++++++++++++----------
 1 file changed, 112 insertions(+), 57 deletions(-)

-- 
2.45.2


