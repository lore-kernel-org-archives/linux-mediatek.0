Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530EFC98317
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2026 13:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aH522iYrBWel5jUV2dQMkekOyxwAP46HVzh5gq/6fUQ=; b=vcpPCU0icBABr/Y5Vjk5LcNqUE
	l2AtRjUZOggLXr+X1wVV58VEljAoW/LsD7YWIS4HPL+N7kMNLppMDVpwkOzBLJPFgb/sMDlvHYcgf
	H1WY0bZzygz14ed+nsHExW9Oa8Pq/I5HpbKFjnfXcrJ2xbdzuCmxdqWe0pFCGwuRd8XhVE5UNVLsQ
	m8YdbdsEVW5ORjIEaOV2UlGvOkyPBo+BR5cAGSvSRezKmCE1Sd3YU74dnNMhajdXPeoFmIIBl7Lc2
	77D06SjcfyxKlIN07jMAAdLIr2f3TSlseEQ7XcgsEWS5IB9X2P7mPQirzKyrEUfbd++wS1ZCAfaTQ
	+LIUZ1Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jMq-0000000B3vs-33Dv;
	Thu, 24 Sep 2026 13:20:04 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jMi-0000000B3rt-1SCj;
	Thu, 24 Sep 2026 13:19:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=aH
	522iYrBWel5jUV2dQMkekOyxwAP46HVzh5gq/6fUQ=; b=AviqJg6Po4eDyI0rSA
	sM22jazysuvF+piZcFyY/oqxAtAtzBlKTkilD2+fRUW7HW03xDsZzRqcmNYM934F
	5pfDHC2IM06N+1mYKe+7NErSkRe2G7I8P09WIgYbyd2PoQHm0+5DUDmEPwa5/r2h
	+Rhuj7E0cbT8rXEbfjSxIrK4A=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3d5ROI7Vqq0FrAg--.32720S2;
	Thu, 24 Sep 2026 21:19:13 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Javier Tia <floss@jetm.me>,
	Leon Yen <leon.yen@mediatek.com>,
	Eason Lai <Eason.Lai@mediatek.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Marek Vasut <marex@nabladev.com>,
	Ville Nummela <ville.nummela@kempower.com>,
	Nelson Yu <nelson.yu@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Rong Yan <rong.yan@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Amitkumar Karwar <amit.karwar@redpinesignals.com>,
	Kalle Valo <kvalo@kernel.org>,
	Prameela Rani Garnepudi <prameela.j04cs@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/4] wifi: unwind state after add_interface failures
Date: Thu, 24 Sep 2026 21:19:00 +0800
Message-Id: <20260924131908.950229-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3d5ROI7Vqq0FrAg--.32720S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4rCw13Xw1DurWUAF4fZrb_yoW8Gry7pr
	s2g3yYkrn8Gry3tw43A3WxAF95Wan3Gr45Crn3Jw45Xr1UAryfZr4qya4UZFn8C392k3WU
	Zr4qyr98WF9rCFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_YFAJUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8BHkH2q1I1FJdgAA3I
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_061956_734120_BBB96092 
X-CRM114-Status: UNSURE (   7.38  )
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

mac80211 does not call remove_interface() when a driver's
add_interface() callback fails.  Drivers must therefore unwind all state
they published before returning the error.

Four wireless drivers leave vif pointers or resource reservations behind
when a firmware operation fails during interface creation.  Depending on
the driver, later RX, interrupt, or testmode paths can dereference the stale
vif, and leaked mask bits or counters can prevent subsequent interfaces
from being created.

Unwind the state at each failure point, following the approach used by
commit 2fb6480c52f6 ("wifi: mt76: mt7915: unwind state on add_interface
failure").  Each patch is independent and addresses one driver.

These paths were reviewed against the driver state transitions and their
remove_interface() counterparts.

Jiale Yao (4):
  wifi: mt76: mt7615: unwind add_interface failures
  wifi: mt76: mt7925: unwind link BSS add failures
  wifi: rsi: unwind add_interface failure
  wifi: mm81x: unwind add_interface failure

 .../net/wireless/mediatek/mt76/mt7615/main.c  | 19 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  4 +++-
 drivers/net/wireless/morsemicro/mm81x/mac.c   |  9 ++++++++-
 drivers/net/wireless/rsi/rsi_91x_mac80211.c   |  2 ++
 4 files changed, 31 insertions(+), 3 deletions(-)

-- 
2.34.1


