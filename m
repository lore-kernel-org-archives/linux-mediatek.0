Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288AFC71149
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 17:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jIqZLsu+/x5dRvLruSMuPxmHqtGPMhfj7ymBrDEk+WE=; b=wnbjXvwzSZGrxTmBqMuPUa+7mY
	3HtvUKCcUcrqBogl8jlQxqYGLwnW8U1RPrKgtFG34AdR2rnxf3+u0R4bcGW+piSEaVz9yH1faKLDr
	LOKADOkPjhxvnW5NjPlcENqb6gCgfT+Ag2LzSm7nqM6RbWDXMiBH52jRItBMQelHseDRy9ZvOuf4V
	JLlWolBYZ5W26V08xdKiWHnXy5EwumVV3iaEx5kN0gW7T69qkKjmaywtWQZQ1SGUpIxduVSM19H2E
	HQRVHZlBxUimPMnprgMnKiHbCPgarNn8GVeOcMcQNe8A9r6CC9Arg4cl5QxQGh5sM0Da06qJwnnSx
	YvAVVzsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPju-0000000AmCS-1Iu6;
	Wed, 11 Jun 2025 17:59:54 +0000
Received: from l-sdnproxy.icoremail.net ([20.188.111.126] helo=azure-sdnproxy.icoremail.net)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPLii-00000009zSN-3WeL
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 13:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=buaa.edu.cn; s=buaa; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=jIqZLsu+/x
	5dRvLruSMuPxmHqtGPMhfj7ymBrDEk+WE=; b=TQNwUR8tkbjh1dpIlORcRUJ5qF
	Y1byt/FvSSlBwwu31laElZBE4leJVreP37JSr8glFH4H2UT0B21OHrv2jV96M/PG
	nDA6aQqTYiyFSwIA51B4/kE7pFl8Up7EBVBwm8CKEAfbeSWSSw4DzTTBKK8DtX0b
	PnAdKzgz2lSUOTsLA=
Received: from f76011e66543.. (unknown [10.133.16.49])
	by coremail-app1 (Coremail) with SMTP id OCz+CgD3vVOvh0loTAypBQ--.57342S2;
	Wed, 11 Jun 2025 21:42:07 +0800 (CST)
From: hzy15610046011 <houzhanyi61@buaa.edu.cn>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	StanleyYP.Wang@mediatek.com,
	mingyen.hsieh@mediatek.com,
	chad@monroe.io,
	razvan.grigore@vampirebyte.ro
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	houzhanyi61@buaa.edu.cn,
	zhanyihou6011@gmail.com
Subject: [PATCH] Add non-null judgement branch for return value of  mt76_connac_get_he_phy_cap().
Date: Wed, 11 Jun 2025 13:42:09 +0000
Message-Id: <20250611134209.312009-1-houzhanyi61@buaa.edu.cn>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: OCz+CgD3vVOvh0loTAypBQ--.57342S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF1fAryxZw4rKw45KF4fAFb_yoW8JF4xpF
	Wjg34Y9w4UGr4Dta18Aa1vyFWrJ3ZYgry2grn5Xwn8u39ayFn3Gr4IvFy3Ar1rAFZ2k347
	XF4qvry3GrnYv37anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9v1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kE
	wVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x
	0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7Cj
	xVAFwI0_GcCE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II
	8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_JF0_Jw1l
	c2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Aw1UJr1UMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
	W8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbfWrJUUUUU==
X-CM-SenderInfo: 1v1siiaurqmqpexdthxhgxhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_064225_635913_0BE5AAE2 
X-CRM114-Status: UNSURE (   7.06  )
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

From: H-Mole <houzhanyi61@buaa.edu.cn>

Since commit https://github.com/torvalds/linux/commit/f503ae90c7355e8506e68498fe84c1357894cd5b
 showed that drivers/net/wireless/mediatek/mt76/mt7996/mcu.c misses a non-null judgement for the
 return value of mt76_connac_get_he_phy_cap on variable vc, this null-pointer problem may also happen
 on mt7915. This commit added such non-null judgement like what was added to function mt7996_mcu_sta_bfer_he()
 in commit f503ae90c7355e8506e68498fe84c1357894cd5b.

Signed-off-by: H-Mole <houzhanyi61@buaa.edu.cn>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 427542777abc..5dca50d40080 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1184,6 +1184,9 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 	u8 nss_mcs = mt7915_mcu_get_sta_nss(mcs_map);
 	u8 snd_dim, sts;
 
+	if (!vc)
+		return;
+
 	bf->tx_mode = MT_PHY_TYPE_HE_SU;
 
 	mt7915_mcu_sta_sounding_rate(bf);
-- 
2.39.5


