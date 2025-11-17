Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F937CEBF61
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Nov 2025 14:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=paTh/uzV29JcO52gAfWUROJmLyr2vTU+CHmJgYMQkKY=; b=gutjKvrf+j8uk24w61zhA5C6q+
	V0SOmgPmpmCzNAIK0p2bhjnOCsMeyBsQfQDcAilc5PA2rwfad0Wj+iWjw5uylwbuztsgK3TVKWiss
	UHFOuB/kPA4ue91b3cFxc6nUFOxeecXt5bDFWIfd7vrcpE2qQ2mcVrFgs/SbIVTud+BPx6lkfSl2Q
	zGOygp9ukHTgA/5ypnCxzJUm/oSIfXqCsgJgkFN/ZSJ5WSsTdC+qVFWCoW/41SNnPvV6Yf0wUjDgL
	R7hKdo1617XHJCzYVZ6h2G0eUqrzjfMTXuJ5gmi0Yymx139SvzrCKtOWQsNtb3Bqj+AQz5zhGaG5L
	uFO8H1fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0QG-0000000GGyY-3Sde;
	Mon, 17 Nov 2025 14:41:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0QF-0000000GGyB-0bbc
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Nov 2025 14:41:40 +0000
X-UUID: 82d830aac3c311f0a52f393f94899d25-20251117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=paTh/uzV29JcO52gAfWUROJmLyr2vTU+CHmJgYMQkKY=;
	b=Jvc2N0SSigmNmJ2rv9s9LKJRzAjyZMjPR1oL2tJmLfpKQW5yH9ft9hv5GyF3McKjyr2wFtWyR1pYv4x1uNZy7dy9ooykK+YGYwi7ESxBiVnZaMa9G349VnbXwwVyW3ISaNROjn0kmeQg8ZCyw2/KtGvmH+Gokm8JVLPJxDzwZh0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:9739d3b3-966f-402e-b5b1-92bb6713bef7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:18,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:18
X-CID-META: VersionHash:a9d874c,CLOUDID:898ebd82-b6af-4b29-9981-6bf838f9504d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 82d830aac3c311f0a52f393f94899d25-20251117
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 868751505; Mon, 17 Nov 2025 07:41:32 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 17 Nov 2025 22:41:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 17 Nov 2025 22:41:30 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: linux-firmware <linux-firmware@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>
Subject: pull-request: mt76 firmware 20251117
Date: Mon, 17 Nov 2025 22:41:30 +0800
Message-ID: <20251117144130.2214135-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_064139_190499_433FB07B 
X-CRM114-Status: UNSURE (   8.14  )
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

This contains the WiFi firmwares for MT7996, MT7992, and MT7990 chipsets.

Please let me know if there's any problem.

Thanks,
Shayne
---

The following changes since commit fb0dbcd3011839d85920d1e4aa956f6a84700caf:

  Merge branch 'amd-ucode' into 'main' (2025-11-13 22:26:11 +0000)

are available in the Git repository at:

  https://github.com/csyuanc/linux-firmware.git mt76-20251117

for you to fetch changes up to 05895b31008ae27cc8a8f9a44e014f09595a736c:

  mt76: add firmware for MT7990 (2025-11-17 22:08:46 +0800)

----------------------------------------------------------------
Shayne Chen (3):
      mt76: update firmware for MT7996
      mt76: update firmware for MT7992
      mt76: add firmware for MT7990

 WHENCE                                   |  41 +++++++++++++++++++------------
 mediatek/mt7996/mt7990_eeprom.bin        | Bin 0 -> 7680 bytes
 mediatek/mt7996/mt7990_eeprom_2i5i.bin   | Bin 0 -> 7680 bytes
 mediatek/mt7996/mt7990_rom_patch.bin     | Bin 0 -> 12832 bytes
 mediatek/mt7996/mt7990_wm.bin            | Bin 0 -> 1336664 bytes
 mediatek/mt7996/mt7992_dsp.bin           | Bin 63536 -> 63572 bytes
 mediatek/mt7996/mt7992_dsp_23.bin        | Bin 63536 -> 63536 bytes
 mediatek/mt7996/mt7992_rom_patch.bin     | Bin 20640 -> 20896 bytes
 mediatek/mt7996/mt7992_rom_patch_23.bin  | Bin 20640 -> 20896 bytes
 mediatek/mt7996/mt7992_wa.bin            | Bin 536240 -> 515184 bytes
 mediatek/mt7996/mt7992_wa_23.bin         | Bin 536240 -> 515184 bytes
 mediatek/mt7996/mt7992_wm.bin            | Bin 1712336 -> 1742052 bytes
 mediatek/mt7996/mt7992_wm_23.bin         | Bin 1672256 -> 1701216 bytes
 mediatek/mt7996/mt7996_dsp.bin           | Bin 191704 -> 191728 bytes
 mediatek/mt7996/mt7996_rom_patch.bin     | Bin 23968 -> 37216 bytes
 mediatek/mt7996/mt7996_rom_patch_233.bin | Bin 23968 -> 37216 bytes
 mediatek/mt7996/mt7996_wa.bin            | Bin 516272 -> 509232 bytes
 mediatek/mt7996/mt7996_wa_233.bin        | Bin 516272 -> 509232 bytes
 mediatek/mt7996/mt7996_wm.bin            | Bin 2622816 -> 2655416 bytes
 mediatek/mt7996/mt7996_wm_233.bin        | Bin 2620960 -> 2681656 bytes
 20 files changed, 25 insertions(+), 16 deletions(-)
 create mode 100644 mediatek/mt7996/mt7990_eeprom.bin
 create mode 100644 mediatek/mt7996/mt7990_eeprom_2i5i.bin
 create mode 100644 mediatek/mt7996/mt7990_rom_patch.bin
 create mode 100644 mediatek/mt7996/mt7990_wm.bin

