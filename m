Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98ABCCF2D6
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2026 10:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7QNTHl222Odz+iuzSYAd8BpJ/jJCkrSI/ZtcNY8a9as=; b=hrmvniKP60ItGUWVTkiL3KxFWX
	JNYehjBwFSoguzcigNe9UIvciZY1K4IJeU8c48iG7nnzr2AvqhD+NmgRrZQWiovgL8Z+RHbrfhZEt
	gqeDvTGoK4Y7zBjdTl4GTqe/QZUNrEbQy26ptH9KBAUNQVW/CfU/gXdL/q8046j22p6bK7TlCFy9y
	Q+o0cJnoeMyjZoKAdC/DR+/ay8PfuRF2oPuhJeNaAHr3FcWM5pr4KeY2yRy1BBDqdrL0BeSS+GRRM
	PbQLCCy7Lu7a6n1RJ5Nl6SnYzMeJU8fvyFd4rlGSvdZ45Oar/pKtqc0daUIYKUXCTsjfw0aEOJpfh
	XM1Ru0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkP0-000000078mS-2fc1;
	Mon, 19 Oct 2026 10:15:34 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkOu-000000078lF-26la;
	Mon, 19 Oct 2026 10:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=7Q
	NTHl222Odz+iuzSYAd8BpJ/jJCkrSI/ZtcNY8a9as=; b=Qj52vq9Zmu0t4qiVVs
	W/TYA7GADVHjycDe94GBdwVKJhDYuKaMKPvsIN+SWiePVOj68GF6ajMJENFWH+ZW
	akHDyk8wF8X3TEBN0qCSs3fqSTH/R+TKVTVjaLwkN+u7Sfdu3kgTi/LnV+puFZbG
	Gx8rbKneDimqsVcRhT0W9AZSY=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3Hxax7dVq4twABQ--.41578S2;
	Mon, 19 Oct 2026 18:15:14 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	YF Luo <yf.luo@mediatek.com>,
	Chih-Min Chen <chih-min.chen@mediatek.com>,
	Money Wang <Money.Wang@mediatek.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 00/10] wifi: mt76: validate legacy MCU responses
Date: Mon, 19 Oct 2026 18:14:55 +0800
Message-Id: <20261019101506.1926943-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3Hxax7dVq4twABQ--.41578S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr47KF43uF45uFyDWrWUXFb_yoWkuFc_Zr
	1qkrZxWr18GF4DKFW7ta4akry8A393Jr9rAryrtr45JwnrArWUCan7Kr45uFs3u3Wxtr42
	yrsrCa48WrnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRK5l15UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRO38WrV7bOK-wAA3M
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_031529_311249_F3EB12A6 
X-CRM114-Status: UNSURE (   5.19  )
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

Several mt7603, mt7615, and mt7915 MCU response paths trust firmware
response sizes before reading receive descriptors, fixed fields, or
arrays. A truncated response can therefore cause an out-of-bounds read.

Validate the common response descriptors and each command-specific
payload before accessing or removing data from the skb.

Jiale Yao (10):
  wifi: mt76: mt7603: validate MCU response length
  wifi: mt76: mt7615: validate MCU response lengths
  wifi: mt76: mt7915: validate MCU response lengths
  wifi: mt76: mt7915: validate MURU statistics response
  wifi: mt76: mt7915: validate EEPROM response length
  wifi: mt76: mt7915: validate free-block response length
  wifi: mt76: mt7915: validate channel MIB response length
  wifi: mt76: mt7915: validate RX rate response length
  wifi: mt76: mt7915: validate WED TX statistics response
  wifi: mt76: mt7915: validate RF register response length

 .../net/wireless/mediatek/mt76/mt7603/mcu.c   |  2 +
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 17 ++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 43 +++++++++++++++++--
 3 files changed, 59 insertions(+), 3 deletions(-)

-- 
2.34.1


