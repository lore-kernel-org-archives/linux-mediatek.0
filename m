Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C35AC52D7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 08:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jFrBrIEhRH5fr64Lmwlk1FGGgzIMKQ4ijTse+z7ETwE=; b=yqui6aHaYECa4M/DAImLsHE3b+
	8+u9h2et85Qh1UJEnmOhn04XJs3vC8f+NbRZ98jextb2L+0J3vcinH0LytRL5Cu5NL+LWq4aUdA9I
	YEgEySq6bAzPR/LVCqgbIXSFgSf1BU7SVfrgmrYmUOXqu6PUXPBMy3amtq7r/QyNPuV+A8TDmL/Zr
	oFip6pdTXCEyqX5NtRjfjk1RXwfMa0cn4HvTvXVdpn8VKEavxK8d6c+uRVL1lemJ7wxb0LHgFRTP0
	2moszqVohsIxBoL218Ki5W1HZEZ0lgvxzlHQ1pkRSl8L4ewhTj89rcnSwUqooLfoDRK0oatb0HEhk
	sQkYZywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfyBC-00000000qpl-0IFi;
	Mon, 19 Aug 2024 08:55:58 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfyAT-00000000qkH-42w0;
	Mon, 19 Aug 2024 08:55:16 +0000
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-03 (Coremail) with SMTP id rQCowAA3XQBaCMNmOqISCA--.43879S2;
	Mon, 19 Aug 2024 16:55:00 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com,
	howard-yh.hsu@mediatek.com,
	StanleyYP.Wang@mediatek.com,
	benjamin-jw.lin@mediatek.com,
	allen.ye@mediatek.com,
	chank.chen@mediatek.com,
	meichia.chiu@mediatek.com,
	Bo.Jiao@mediatek.com,
	evelyn.tsai@mediatek.com,
	Money.Wang@mediatek.com,
	akpm@linux-foundation.org
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH RESEND] wifi: mt76: mt7996: fix NULL pointer dereference in mt7996_mcu_sta_bfer_he
Date: Mon, 19 Aug 2024 16:54:49 +0800
Message-Id: <20240819085449.1013279-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAA3XQBaCMNmOqISCA--.43879S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw4DZw1UtrWxKF1xJr13Jwb_yoWDXrXE9r
	n29FnIqw48Kw48Kr429wnxuryay3ykZF97Gay5tayfta97J3yUZF1IvFn3Ar13uFn7ZF1U
	J3ZrJFy0y395WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbS8FF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRNAwsUUUUU=
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_015514_393160_B41C95EA 
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

Fix the NULL pointer dereference in mt7996_mcu_sta_bfer_he
routine adding an sta interface to the mt7996 driver.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 2e4fa9f48dfb..cba28d8d5562 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1544,6 +1544,9 @@ mt7996_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 	u8 nss_mcs = mt7996_mcu_get_sta_nss(mcs_map);
 	u8 snd_dim, sts;
 
+	if (!vc)
+		return;
+
 	bf->tx_mode = MT_PHY_TYPE_HE_SU;
 
 	mt7996_mcu_sta_sounding_rate(bf);
-- 
2.25.1


