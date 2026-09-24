Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC7AC98314
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2026 13:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJzntUbDfqeoG/uTtpJiDO8MUahdbbleXqqU3yFVq34=; b=eQ3nK5qm2IPXhxVj8Y38AQQfjc
	vmMwKPWtpcaOiCVUc7sVGGkGrXVsrvqZKoha4KXg/4uRJcsHCFCih4u6vGNq9raT3KQo/DUVq+Q0n
	Se/XUVTuq270SN9l9qakbc1MihRoK/4JZ04qkh7DWazbqC1mKEOulYyJMmFZLuUACPOhLHAuA14Kg
	prpd/yi4ScaY+LcAplanWbA45zgVolLRemxLI9UybS1wRI8dHwIXBaykQvwOn6QyZmAOfWqSFfGHn
	SfPO24K9EJYuZg5ejgkGiaOBy3tfHp+qJN/ebYOW9lVP9ZZB1NVVYmwv2MU17E5o14YvlO49wTgvC
	QXJNAUpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jN6-0000000B43d-0QQr;
	Thu, 24 Sep 2026 13:20:20 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jMs-0000000B3v3-0Us8;
	Thu, 24 Sep 2026 13:20:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=nJ
	zntUbDfqeoG/uTtpJiDO8MUahdbbleXqqU3yFVq34=; b=TG0Ulld8Z8QDwbH5zo
	MXu+Gn9XOZp3KOvvoBFf4E8x9IJ1s/osEhLAVkVulolYKVc+Wt0N1o+ahu8ZEz1b
	e7akDDANl10uOOSJv7XQyQq0lzKl7Z2/bk3eiV2Kex5e+lJuTeHVJzLcLFKA3s93
	Y0UuIPpXKTL94Lb9z4qRBw3A4=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3d5ROI7Vqq0FrAg--.32720S5;
	Thu, 24 Sep 2026 21:19:32 +0800 (CST)
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
	Marek Vasut <marex@nabladev.com>,
	Ville Nummela <ville.nummela@kempower.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Deren Wu <deren.wu@mediatek.com>,
	Hao Zhang <hao.zhang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Amitkumar Karwar <amit.karwar@redpinesignals.com>,
	Kalle Valo <kvalo@kernel.org>,
	Prameela Rani Garnepudi <prameela.j04cs@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/4] wifi: rsi: unwind add_interface failure
Date: Thu, 24 Sep 2026 21:19:03 +0800
Message-Id: <20260924131908.950229-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924131908.950229-1-yaojiale02@163.com>
References: <20260924131908.950229-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3d5ROI7Vqq0FrAg--.32720S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr47trWfAr1kAFyxXryrZwb_yoW8Ww1Dpr
	4DK3s0kryrGr4aqw45Ga18ZFyrCan5KrW2kF18G343WF4YvFyfZrn09a4Uua93CFZ5Ja15
	Ar4qv34Yg3srGrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zifHUkUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQXpJGq1I2U2OQAA3T
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_062006_534115_1107EDAF 
X-CRM114-Status: GOOD (  10.01  )
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

mac80211 does not call remove_interface() after add_interface() fails, so
the driver must undo any state it published before returning an error.

rsi_mac80211_add_interface() stores the vif in adapter->vifs[] and
increments sc_nvifs before sending the VAP capabilities command.  If that
command fails, the function returns without undoing either update.  The
array entry can therefore refer to vif memory freed by mac80211, while the
interface count remains inflated.

Clear the vif slot and restore sc_nvifs when setting VAP capabilities
fails, mirroring the state cleanup in remove_interface().

Commit 2fb6480c52f6 ("wifi: mt76: mt7915: unwind state on add_interface
failure") fixed the same failure-unwind pattern in another wireless driver.

Fixes: b8bd3a439f35 ("rsi: add/remove interface enhancements for p2p")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/rsi/rsi_91x_mac80211.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/rsi/rsi_91x_mac80211.c b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
index 3faf2235728b..34ddcbc43fdc 100644
--- a/drivers/net/wireless/rsi/rsi_91x_mac80211.c
+++ b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
@@ -518,6 +518,8 @@ static int rsi_mac80211_add_interface(struct ieee80211_hw *hw,
 	if (rsi_set_vap_capabilities(common, intf_mode, vif->addr,
 				     vif_info->vap_id, vap_status)) {
 		rsi_dbg(ERR_ZONE, "Failed to set VAP capabilities\n");
+		adapter->vifs[vap_idx] = NULL;
+		adapter->sc_nvifs--;
 		mutex_unlock(&common->mutex);
 		return -EINVAL;
 	}
-- 
2.34.1


