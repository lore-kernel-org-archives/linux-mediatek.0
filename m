Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569F8C54E68
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Mar 2024 12:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0KBBL1onSRsP8F7nCOgP7wKfzvhEaVen2DzkFvrrpKg=; b=I2ah6p7McFhTWP3YF/CRYkbm0D
	9um40RpEykKBmDuS37aKdpHG38SHq0eNYle87ac6joXrn16aCybcgrrB1eRkaoytAyrvghN+SVJfV
	5fArL32zX0Tpj9TDj64e7dQyZbsrmDIP1lVkuNqWxiW3zHSfJSGfEKnOLB+opvLnafHMIXOIklBX3
	04Ojukc9x/yNvqkZUNGHN/GCv9Kd9u+DwKNEi4QdoWjXwH+ccitmLcDHSy089wH//rvR3zIGDtuSo
	RloCrUOR4Re44Jz5A/2PfQy/3aC85Joa8naR828x5G7NnypIo0JcAkR5fBzIQChG5osLOBujUZLCD
	9yf7sP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkkI6-0000000EGvV-01Fn;
	Thu, 14 Mar 2024 12:34:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkkHy-0000000EGtX-336p;
	Thu, 14 Mar 2024 12:34:31 +0000
X-UUID: 2e5a9682e1ff11eeacdb61a41848c7d2-20240314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0KBBL1onSRsP8F7nCOgP7wKfzvhEaVen2DzkFvrrpKg=;
	b=HuLE/L1lX/MJDdXEJTWxorU5GXChLdyLQOPHTx6pYkRgUUhMkVcu7u99MFnt/r/Bhh1/bJiUHxP++k4VOSOVMRVdDQgECJ7KuFMoZxPhIMevLIyC7ayIgzIFSyCB7mHGUUirFaWoxvwrbfbl9rPYwLIk2Qraz0Tgbtn14FzUpsM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:4bf2b848-3f98-43cb-87a2-b38f778ac347,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:6959e5ff-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 50,UGT
X-CID-BAS: 50,UGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 2e5a9682e1ff11eeacdb61a41848c7d2-20240314
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 929760456; Thu, 14 Mar 2024 05:34:20 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Mar 2024 20:34:16 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Mar 2024 20:34:16 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<Longfei.Wang@mediatek.com>, <Yunfei.Dong@mediatek.com>,
	<Andrew-CT.Chen@mediatek.com>, <tiffany.lin@mediatek.com>,
	<irui.wang@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: pull request: linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.8
Date: Thu, 14 Mar 2024 20:34:12 +0800
Message-ID: <20240314123413.20266-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.122600-8.000000
X-TMASE-MatchedRID: Zfi8CblT/bykwTZnxyBJ86b8GfRpncAzUXlp1FHYSPWYvYlYOb0cVFPW
	us3yxQNWz6njtD4sDFldkBppXRkyukkjllSXrjtQFEUknJ/kEl5jFT88f69nG/oLR4+zsDTtjoc
	zmuoPCq3uLaTohbTrARkCOy8H3lXqAN3caC3sJSmE5uLIa/M9sGiotolenEk+BRbXnATtZc2Ny7
	f+obnH+UTX7BCxIdUjTjHt7UFpGk7iw6uxviJP8r9tsSiUciBlQ5zsaM5qada/lr1yYih0SzMPw
	dnhe8nZlExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.122600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F047307EB6306AC29730D043E6641621F6A86F4A21EAA8CDDC200DB58A0F756B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_053429_916521_345F6912 
X-CRM114-Status: UNSURE (   6.38  )
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

Dear linux-firmware maintainers,

The following changes since commit 3b128b6069267b60a46a4074c383183177ee6e6d:

  Merge branch 'mt7921-bt' into 'main' (2024-03-12 11:09:41 +0000)

are available in the Git repository at:

  https://github.com/irui-wang/linux_fw_vpu_v1.1.8.git

for you to fetch changes up to 7132c3a7f031e9b0721cda7ef4741308465707ea:

  linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.8 (2024-03-14 20:00:55 +0800)

----------------------------------------------------------------
Irui Wang (1):
      linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.8

 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131380 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)



