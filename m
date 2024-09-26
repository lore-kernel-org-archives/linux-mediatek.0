Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA713CCFA15
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 03:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Owe6JGbV57Hakcmg6rIXeMQVYrdTrF26LEqeVCxBhWM=; b=1VvZ4DdD74ziURt/y0mr5QhfWO
	sYOObp22dQkcQG3cW2GPKgVxLPaoumhfdDoh6Vg8meMYfryi9g5tJPEE3X04uk9LNJk//YGiCKo8k
	CJaaCMLFT2EE3tBCnQ4E4Bnwkdl3kzkCe/NYojwE56OsVEr14Wd30TfMJyrdGHaLZYpTD46ucqF92
	+1j74+A+jtsVqYVKotVq0/69NKEy59yE54bWC9QzmyGzmzJ5QpsK8QZLJ6wcOb0kKiyGmCNTYK95I
	W+SzQ/PCV7RF7hvg5zc7stzPWv6ai8lhcpUBCpSsExT/CI/x5Oy5HyCaU53uiIi1kFmLiJvm/WeFr
	VPM8+ATA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stfUF-000000077G3-04m1;
	Thu, 26 Sep 2024 03:48:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stfUB-000000077FM-2sBe
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Sep 2024 03:48:13 +0000
X-UUID: 22b967867bba11efb3adad29d29602c1-20240925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Owe6JGbV57Hakcmg6rIXeMQVYrdTrF26LEqeVCxBhWM=;
	b=TAtsoqg7BeQ7ykZVfk3UuSJTBK0d2Fpb2Tkw2GHECcnr5jg/5qsL2mX3ZxbjDgX0xfDzMrhlVbrMHdPFRM8EOvPUzClyi+QiwUy92I2RXgSRNr9+fn++bwzgPiOxrPEolGqlO/TvXuiSrCPHG5pJp0OzcVK2YoLXNgjXvLG1aVM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:84805f31-7bfa-4065-89d4-11914c2ccc21,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:6,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:1
X-CID-META: VersionHash:6dc6a47,CLOUDID:149b949e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 22b967867bba11efb3adad29d29602c1-20240925
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2076641822; Wed, 25 Sep 2024 20:48:04 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Sep 2024 11:48:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Sep 2024 11:48:02 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: linux-firmware <linux-firmware@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Daniel Golle <daniel@makrotopia.org>
Subject: [PULL,linux-firmware] mt76 firmware 20240926
Date: Thu, 26 Sep 2024 11:48:02 +0800
Message-ID: <20240926034802.28294-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_204811_765588_05D624FE 
X-CRM114-Status: UNSURE (   9.72  )
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

Hi,

Here's a pull request for adding WiFi firmware files for mt7996 and
mt7992 chipset variants.

Please let me know if there are any problems.

Shayne

The following changes since commit 8306534b8a7265bee2f4323b45fd2a22a7c8b9b6:

  Merge branch '8922a' into 'main' (2024-09-23 12:36:21 +0000)

are available in the Git repository at:

  https://github.com/csyuanc/linux-firmware.git mt76-20240926

for you to fetch changes up to 85ce6f7afdd3b63398990e53f67c653fc66ad271:

  mt76: mt7996: add firmware files for mt7992 chipset (2024-09-26 00:59:54 +0800)

----------------------------------------------------------------
Shayne Chen (2):
      mt76: mt7996: add firmware files for mt7996 chipset variants
      mt76: mt7996: add firmware files for mt7992 chipset

 WHENCE                                       |  43 ++++++++++++++++++++++++++++++++++++++++++-
 mediatek/mt7996/mt7992_dsp.bin               | Bin 0 -> 63536 bytes
 mediatek/mt7996/mt7992_dsp_23.bin            | Bin 0 -> 63536 bytes
 mediatek/mt7996/mt7992_eeprom.bin            | Bin 0 -> 7680 bytes
 mediatek/mt7996/mt7992_eeprom_23.bin         | Bin 0 -> 7680 bytes
 mediatek/mt7996/mt7992_eeprom_23_2i5i.bin    | Bin 0 -> 7680 bytes
 mediatek/mt7996/mt7992_eeprom_2i5e.bin       | Bin 0 -> 7680 bytes
 mediatek/mt7996/mt7992_eeprom_2i5i.bin       | Bin 0 -> 7680 bytes
 mediatek/mt7996/mt7992_rom_patch.bin         | Bin 0 -> 20640 bytes
 mediatek/mt7996/mt7992_rom_patch_23.bin      | Bin 0 -> 20640 bytes
 mediatek/mt7996/mt7992_wa.bin                | Bin 0 -> 536240 bytes
 mediatek/mt7996/mt7992_wa_23.bin             | Bin 0 -> 536240 bytes
 mediatek/mt7996/mt7992_wm.bin                | Bin 0 -> 1712336 bytes
 mediatek/mt7996/mt7992_wm_23.bin             | Bin 0 -> 1672256 bytes
 mediatek/mt7996/mt7996_eeprom_233.bin        | Bin 0 -> 7680 bytes
 mediatek/mt7996/mt7996_eeprom_233_2i5i6i.bin | Bin 0 -> 7680 bytes
 mediatek/mt7996/mt7996_eeprom_2i5i6i.bin     | Bin 0 -> 7680 bytes
 mediatek/mt7996/mt7996_rom_patch_233.bin     | Bin 0 -> 23968 bytes
 mediatek/mt7996/mt7996_wa_233.bin            | Bin 0 -> 516272 bytes
 mediatek/mt7996/mt7996_wm_233.bin            | Bin 0 -> 2620960 bytes
 20 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 mediatek/mt7996/mt7992_dsp.bin
 create mode 100644 mediatek/mt7996/mt7992_dsp_23.bin
 create mode 100644 mediatek/mt7996/mt7992_eeprom.bin
 create mode 100644 mediatek/mt7996/mt7992_eeprom_23.bin
 create mode 100644 mediatek/mt7996/mt7992_eeprom_23_2i5i.bin
 create mode 100644 mediatek/mt7996/mt7992_eeprom_2i5e.bin
 create mode 100644 mediatek/mt7996/mt7992_eeprom_2i5i.bin
 create mode 100644 mediatek/mt7996/mt7992_rom_patch.bin
 create mode 100644 mediatek/mt7996/mt7992_rom_patch_23.bin
 create mode 100644 mediatek/mt7996/mt7992_wa.bin
 create mode 100644 mediatek/mt7996/mt7992_wa_23.bin
 create mode 100644 mediatek/mt7996/mt7992_wm.bin
 create mode 100644 mediatek/mt7996/mt7992_wm_23.bin
 create mode 100644 mediatek/mt7996/mt7996_eeprom_233.bin
 create mode 100644 mediatek/mt7996/mt7996_eeprom_233_2i5i6i.bin
 create mode 100644 mediatek/mt7996/mt7996_eeprom_2i5i6i.bin
 create mode 100644 mediatek/mt7996/mt7996_rom_patch_233.bin
 create mode 100644 mediatek/mt7996/mt7996_wa_233.bin
 create mode 100644 mediatek/mt7996/mt7996_wm_233.bin

