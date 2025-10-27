Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1354DCCF9E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 11:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lKOBSb5QX4VrNquz+dxI5NiKAxDsYKH/pxf6fpROs3A=; b=XrzNRTPaRbMu90nlKzmPpa1dYs
	/oGV+sDFxzjFXlMrhkUTgtKcEXz0RtihKEXzsDtLCeJCUXSyyYIKulIT57FnnGFpGfHK1TE9EKYgd
	ldNCzJxgu7TXJxg0/r7PDjTdO3EBuHrE0L7hV/jESTaRaoDuGy6vZzwmwgQ177dpGL43Edtw3VU+G
	cHI/BhHg4zgMhmKhZG74tnCNBFVIevUmt65wlrqBx9+H8hn9Dq3u4FOEUVVokS9IrcJOXADoDrRbV
	6xDSWYWl7sh65iBx1XSQJJ5uawj8x+qzoPqdHfjoBAH0aPvn+ysWCbuDouhlLiYmbpZSlTurKSBW3
	yO1FBSpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLGh-0000000Dl0Y-0l7C;
	Mon, 27 Oct 2025 11:20:07 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLGd-0000000Dkyj-2v7u
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Oct 2025 11:20:05 +0000
Received: from debian.intra.ispras.ru (unknown [10.10.165.19])
	by mail.ispras.ru (Postfix) with ESMTPSA id 8072B40777A0;
	Mon, 27 Oct 2025 11:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 8072B40777A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1761563996;
	bh=lKOBSb5QX4VrNquz+dxI5NiKAxDsYKH/pxf6fpROs3A=;
	h=From:To:Cc:Subject:Date:From;
	b=lXFVNCPHHbyperB7SeuC0y6a5FeWyKJqjV6/gdWrKstFnqjuMqqzfAPO77gGPFOXW
	 jeJ5qBGTRu5TkTZQQzVwl1cbEbvXFnyQNfcMh5DF3IPoxzGWQaOLCJZmqH69nIQCRw
	 e6whrZ+GEwRSd4U/lIIbIVveaCfcEPq/qP96wjBM=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Matvey Kovalev <matvey.kovalev@ispras.ru>,
	lvc-project@linuxtesting.org
Subject: [PATCH mt76 1/2] Revert "wifi: mt76: mt792x: improve monitor interface handling"
Date: Mon, 27 Oct 2025 14:18:39 +0300
Message-ID: <20251027111843.38975-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_042004_234251_CDB180AC 
X-CRM114-Status: UNSURE (   9.08  )
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

This reverts commit 55e95ce469d0c61041bae48b2ebb7fcbf6d1ba7f.

mt792x drivers don't seem to support multi-radio devices yet.  At least
they don't mess with `struct wiphy_radio` at the moment.

Packet capturing on monitor interface doesn't work after the blamed patch:

  tcpdump -i wls6mon -n -vvv

Revert the NO_VIRTUAL_MONITOR feature for now to resolve the issue.

Found by Linux Verification Center (linuxtesting.org).

Fixes: 55e95ce469d0 ("wifi: mt76: mt792x: improve monitor interface handling")
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---

Can't answer exactly *why* the capturing doesn't work after the patch:
probably because the driver is just not prepared for NO_VIRTUAL_MONITOR.
The feature isn't too obvious, especially that for some reason it was set
in mt792x alongside WANT_MONITOR_VIF.  With a quick glance I might
conclude that NO_VIRTUAL_MONITOR overrides WANT_MONITOR_VIF, they don't
look compatible.

 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 5b50bf94996e..f2ed16feb6c1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -688,7 +688,6 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 	ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);
 	ieee80211_hw_set(hw, SUPPORTS_VHT_EXT_NSS_BW);
 	ieee80211_hw_set(hw, CONNECTION_MONITOR);
-	ieee80211_hw_set(hw, NO_VIRTUAL_MONITOR);
 	ieee80211_hw_set(hw, SUPPORTS_MULTI_BSSID);
 	ieee80211_hw_set(hw, SUPPORTS_ONLY_HE_MULTI_BSSID);
 
-- 
2.51.0


