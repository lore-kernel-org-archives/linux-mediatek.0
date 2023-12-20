Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A464C46CCD
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 09:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yERtKqeMRnRz8EWKdpgnTZ0HdSoa6D6t6hyWkYUHSl8=; b=nou9WwRK4mS2oQAntEFReGBH4D
	YGj9mpwc3u1imZAc1VRazRH+BTZQch2r3kItNCAnbmA+gkBZA849Zrmnnj6rs40jLcfVbr43QTpIS
	Y8HVClGepHarp2LA0hnU6yDqT2Rbew+iUUFYTu9T4vukWfKCRuX8I1gH23PjYQuCrZmpq4zEhv0uS
	rv+yIqUX5xbNwV6vkSjZVNKEBoDGRoHhLpIjacyAgbR9EFhxoWkai49RoJyrMk+228DGLMhvI6bGn
	iMVHgonJvZ15lhEu1s3/NINbw7YEGUyQGtDNUK+822cY71Y8Q88SNW+1Kx7ICCEqGecY20IQAHAEV
	raLt60Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsmz-00Gj8G-1S;
	Wed, 20 Dec 2023 09:22:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsmx-00Gj6k-0T
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Dec 2023 09:22:52 +0000
X-UUID: 565b75129f1911ee9b09ad09c76753c8-20231220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yERtKqeMRnRz8EWKdpgnTZ0HdSoa6D6t6hyWkYUHSl8=;
	b=NhkpO5169CZ3gBDyflCdn3ZYRoV+C8riUyQu0sKyl/01JUD5j4YdB1gECcr/blxANGukM6VqN3z2gXC1BZGbjcM1L7UzVo0TVlseAPPad4L5qUXhhbvmSs/rVKsefqP25ss+y3xlzM2NedrmfsSwgo/VUA8YiPu++HuuL9XvGpk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:a2cd8f49-1c83-4764-91bb-e66cdd93753f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:54544b2e-1ab8-4133-9780-81938111c800,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 565b75129f1911ee9b09ad09c76753c8-20231220
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1081200247; Wed, 20 Dec 2023 02:22:46 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Dec 2023 17:21:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Dec 2023 17:21:43 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH 1/4] wifi: mt76: mt7921: fix incorrect type conversion for CLC command
Date: Wed, 20 Dec 2023 17:21:35 +0800
Message-ID: <20231220092138.12830-2-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231220092138.12830-1-mingyen.hsieh@mediatek.com>
References: <20231220092138.12830-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.267000-8.000000
X-TMASE-MatchedRID: zfURmU8ZpfG0A65es43yNsFWmsryu9ZfN/BTU5ZfZRIFi3R9x/2qQp7O
	325kkkmthleoxClEaad3ASMeJ378tBdg+HtW3bymnVTWWiNp+v9MkOX0UoduuQNBdqC0PZz4o8W
	MkQWv6iXBcIE78YqRWvcUt5lc1lLgjMejjvPkBr7gBxE/u1mqEiwnOlZD/aCzUx3FFlKt//Pssr
	Rv1LUSc8ORKiRcdxPZV6BJkTJ5zLM6JULy9tmMFNQv8m9xy61E6bVO/2eNXpp5lSmbrC6fdtr/T
	o2FgNrjDLMIOOVTHz2nbLeYgH6K31Zca9RSYo/b
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.267000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A9628858CAE42CA78503249E5CD6113C15647B1935D23998BF7B19D20005686B2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_012251_184920_8F68F298 
X-CRM114-Status: UNSURE (   9.89  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

clc->len is defined as 32 bits in length, so it must also be
operated on with 32 bits, not 16 bits.

Fixes: fa6ad88e023d ("wifi: mt76: mt7921: fix country count limitation for CLC")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312112104.Zkc3QUHr-lkp@intel.com/
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 5fcee178b698..f1145002c900 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1271,7 +1271,7 @@ int __mt7921_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 		.mtcl_conf = mt792x_acpi_get_mtcl_conf(&dev->phy, alpha2),
 	};
 	int ret, valid_cnt = 0;
-	u16 buf_len = 0;
+	u32 buf_len = 0;
 	u8 *pos;
 
 	if (!clc)
@@ -1282,7 +1282,7 @@ int __mt7921_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 	if (mt76_find_power_limits_node(&dev->mt76))
 		req.cap |= CLC_CAP_DTS_EN;
 
-	buf_len = le16_to_cpu(clc->len) - sizeof(*clc);
+	buf_len = le32_to_cpu(clc->len) - sizeof(*clc);
 	pos = clc->data;
 	while (buf_len > 16) {
 		struct mt7921_clc_rule *rule = (struct mt7921_clc_rule *)pos;
-- 
2.18.0


