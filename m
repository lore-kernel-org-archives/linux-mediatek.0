Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B15C98338
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Z0I4HTCyvJd+H+GNxUVvWWAhv5GfqRxaa8myeYI1+g=; b=yO1Q6WUjhq85ubnJVE7SWcuebI
	5rj2tuKJS+46jEqDmobTWhPPaxjo3tl17VgiqD7fVI2ywVbrp9motDTC/5ZM82Dkm/oti+u4rVNxi
	+jCkgrbvqoqghR/yoUOMZf2J+QNftlgz7hhQU9zgvAg1rY/IlYO3jow9NpWNKP3gu4oyXhy5XwH9i
	tBh3F/iJLFdBJq0nqwga+aQqDmgMx75k45wvioLajC1xL77EjnM7CbHIblSApfi9I6S1u8xYNzCUQ
	w2ZM5lDQOPMtbU0UG+t39diDau3R5H1ikfM+d+ZImz0jbC9lnmfVfAC2YCcRpJF6WWQ+FsnGiR4al
	kvAMcAIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw8w-0000000GsAr-0FhQ;
	Sun, 27 Sep 2026 21:10:42 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw8u-0000000Gs9Z-0H0R
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:10:41 +0000
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c9e33d3f52so1700148e0c.1
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543439; x=1791148239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Z0I4HTCyvJd+H+GNxUVvWWAhv5GfqRxaa8myeYI1+g=;
        b=B8c4paWfcqHQ4xmyBfqbmJRaAjH7lwDsxBye94UyuPSBCa2e/gnl4esm/Yy935e2GM
         O4V9puogJ1iOmX0TDBrFs2gFvqmVLECtd1VwCgfMIEp5WqD71yfxKSR3Kcxn7XF0ZAyV
         RekvuKvXHi1zZOHw1THWRRM0d6zWsRM/48eClgqFRSGZ2sV7d/YSbOBejuKBQ2aRsNjk
         2Gttnl2HB1mHTmqiHKDYrUZrGiLYW8lRgd0wGhcKaMpBRUm1DthUgrfSpDuz3JEyY9Gq
         Iac50phpaJLnRvV+lVZjG1gkb8vbMMJ1YPhVHfAHMYAQU6qFcYlNH2l1YJS2+0xmKDM/
         VxiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFqlsQY3EJvhW2+6vnwDTkIHzV4Z5TBEP+nhQINaNN9Ckf+T3N3U0rp02wykKoFpjKcmgrAJ949i92FyaP3A==@lists.infradead.org
X-Gm-Message-State: AFq9FYKnQRwyJIdDT/Qg7vkGhDkeWVAvoqReRoeNfGQHbLOHKmR0tpfp
	oKFSj02CTaNh5uDpcmv1L2rrG5Uoyvdp/etydsGqKdtTBafqNhggpuIVJyp5x3dF
X-Gm-Gg: AYBFou0MAaaxnIlmUov82SE1DvdiWqo2GktcgL6y39Y2euvoM1CUhjzTA49G2Gpx74Q
	6X7Qy/iytYNpIkmyA9bxtYBNmeFExe//zUjcz4dyw1HTjJmRDfvZKQsxLapH5io1YilJ8ib7i9u
	6hRq1VFY2TQILuWiPnJ4Zo3aEe76LHBGh5sJhkqxh3o3hsOAZoRAdPW00zbWliWPkL4AJ+nQY/z
	G0notFEdxG+LO3fPUow4Cy5ZPs0qyxgb5PG5h7JLzxRPWcE0cTDfB1e2+3iFSQGhBydwQBA+i2S
	+f5b92Nkd8xX25T8QjZaOXDsFh3nnPd7jr0s/qw32XDblqfkM368c7lAbdmvyTEwuLnGYQntgcy
	FhCex1pYMz37Cfi3/r53wwbHjpUqxODd3aN2s9/JesAk2lZz17q/Ra+wJmkQU81BBcwhswDjFI1
	ILgxZkQzfr0kn8eSbNcAV0AuS2yc4RmzyL5IExPKfmPVxI1854ybVJ66GwwcEQXmcr381cCfurc
	kkSoAdsuIP6m4KdNmshURt0GQe6ov7CxmV/SXNPn1rOZNVOLGj323aZMUjuIqzJpuuGCaE=
X-Received: by 2002:a05:690c:c425:b0:8a8:928c:b9a6 with SMTP id 00721157ae682-8a8928cc891mr17437187b3.34.1790543046172;
        Sun, 27 Sep 2026 14:04:06 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:04:04 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Jacobs Wu <jacobs.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 13/23] wifi: mt76: mt7925: do not deactivate shared NAN BSS on peer STA removal
Date: Sun, 27 Sep 2026 16:02:55 -0500
Message-ID: <20260927210306.737669-14-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_141040_104657_F4C9456E 
X-CRM114-Status: GOOD (  11.77  )
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

From: Jacobs Wu <jacobs.wu@mediatek.com>

mt7925_mac_sta_remove_links() sent BSS_INFO(active=0) for every vif type
except AP when a peer STA was removed. NAN (nan0) and NAN_DATA (ndi0)
BSSes host multiple peer STAs like an AP does: removing the NMI peer on
NDP teardown deactivated the shared NAN sync BSS in FW, after which FW
dropped every host-initiated NAN mgmt frame (TXM: An MMPDU for an
inactive BSS_INFO) until the next NAN_START. With partial availability
bitmaps this made every NDP re-establishment after a teardown fail
(unicast NAF TXCNT 15/15 no-ack); full bitmaps masked the bug. It also
tears down the shared data BSS while other NDPs on the same NDI live.

Exclude NAN and NAN_DATA vifs like AP.

Verified on 187/235: teardown no longer emits the BSS disable cmd, the
FW drop flood is gone, and half-bitmap re-establishment after
nan_ndp_terminate succeeds repeatedly (was 100% fail).

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 64853fc7f60e..08a5bdcf1094 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1489,7 +1489,16 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		struct mt792x_bss_conf *mconf;
 		struct mt792x_link_sta *mlink;
 
-		if (vif->type == NL80211_IFTYPE_AP)
+		/* AP, NAN, and NAN_DATA BSSes host multiple peer STAs; removing
+		 * one peer must not deactivate the shared BSS. For NAN, doing
+		 * so would kill the sync BSS and the firmware would drop all
+		 * subsequent host-originated NAN management frames. For
+		 * NAN_DATA, it would tear down all other NDPs sharing the same
+		 * NDI.
+		 */
+		if (vif->type == NL80211_IFTYPE_AP ||
+		    vif->type == NL80211_IFTYPE_NAN ||
+		    vif->type == NL80211_IFTYPE_NAN_DATA)
 			break;
 
 		if (vif->type == NL80211_IFTYPE_STATION && sta->tdls)
-- 
2.43.0


