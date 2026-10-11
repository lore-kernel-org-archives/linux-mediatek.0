Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B287CA9ECE
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2026 07:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zZL4B0ufB7ImjZOyPaceFQVkCDsgKxc3VmJ2EdFwwkA=; b=wB4SB/7AYgCC/iySyvUfqtJDqa
	aYRgmW5xbpfULqzvSl2mOEvzh3gt2J7jI+079Tvoa4GOQRMLSoBOHgzVk3FkKNEAH1f5fJHUHFJ8m
	tqpWCjrjNMV3dfD+MFmg0rEbKRG65EWuuF0nmtnPBoT+iML/TgYjLt7RvXV96qiXPDsp4ndyu6gob
	amAxfT5zscMssPT/RZeiBUJ5DqHdTqn298fmSdeMXqfoY7nPu3+VNUW1IiJagS/j2kIMqTM45z6HV
	TJ+xTUp/L8r6nN3IebI7xfoeiVbB2OtUALI0enc/9IWbKSN7aSo58wwEMZg5OCgj/hOihwgZdyozc
	3JBJhxGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFnxf-00000008nfg-2FSJ;
	Sun, 11 Oct 2026 07:27:11 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFnxd-00000008nfF-0XFZ
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Oct 2026 07:27:10 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-144f79153f5so3548146c88.0
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Oct 2026 00:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791703627; x=1792308427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zZL4B0ufB7ImjZOyPaceFQVkCDsgKxc3VmJ2EdFwwkA=;
        b=ERJuUlWondoGMgYQpPafkp3qdiUuFzQVIlF/p1ulcs9xGIVhViKWb4sqPXWLiwSHS1
         zkHX1W9QDHeLBTtewjaIu3Ti3/BlOgf8TTYUSOen0NAa1FFGwdm1I/zju4/CIGbsZNSk
         jNopJBPBh/FfV93NIYP+eUidvhixizMNegWHbCNsOGGsNbzy40k35Kks+8ydLMW2ZFZO
         tvL9GoMhZPMAXtxNoqygTJGG1nuUK7YXxns67N9wn6neLtVL0CfDmKVvIPJrT5kFgzVL
         8b73f9yGCV9ku9o/fXOI5fJwpdwAFWNPzxq9DPgoB0qxHUGYruCIuNds8yePyJwLA7a1
         U55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791703627; x=1792308427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZL4B0ufB7ImjZOyPaceFQVkCDsgKxc3VmJ2EdFwwkA=;
        b=GKFTN1QJIxrXHm9t+jGPpEf40xG0HRfdXAOJPmwybev7GUSkPs9eOpk1kNw12G5f/X
         oS/oyLzYubGaLeL1MW3s6zqPA/kYVC4VFVZCtVSNgGpPQ6mqLubKQD+xzk9kU79sr8qK
         EclBGwLseoKIpzsF4M3/OZXiVl4ah3XzE03kE+XgpC87CsYSnT0lO5hFilqUzvti0FhY
         xKmVsssl3rUikkJ+tJMgGnM5mlRHmbrOWi6BBbSccEhoQTL6JiShRJvW08dzwSO7iPbi
         t4QDFN8ykZlZBXXeKmuIpyazFpdi2TdC02HgV5spzbqO2QaKK6opNJ/Pp2OrAe2u9l4/
         7+CA==
X-Forwarded-Encrypted: i=1; AKwUvBxDakhnaD+9VGQ/HYpYmrD8T3VuQLNX71nus5oYhvF4spiirA6ddLSb9bAUDmEajcWDzwj6rlJ31k7+pSJPDw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIEchPfFOHwsrIQHc+Bm5Y6IW4coeEvVwp6LgqQrenWeyUQE51y
	HBT76tQaUEPfJVtlzQjNsQToEvpcv7LW8oh0kBbhExENNOJr6TdtYpgq
X-Gm-Gg: AYBFou2jDgV/THcHKBhLQPbxmvNfJiXoPIfwDlPjef6dGHUKU4J3edzJNvSgnVU3dHK
	WA4vhVQqyasPT6iteUpSRuocCfRHB4Aj+Fd/DlwvU8LGmQShfwG19oS8C0cjDwiCP3OtHyTpDOa
	XzM4uqqDCUQGt486MKaQ4OyBJn4P0J1Nu/N2axdth7w62+SB/okTjXLggj4VStNV2pjUVdbsn+R
	47n+Xam902+fp7MtnL+WEkbiuxkjt9Yi8dRSNHAFgCTiGL/Cz+Pth945GwOyXaDGaw6of/zWO0h
	ExSZ/7Z9x6ZOBwpAgHgu8A6BTIgKgI3acyIS9IG88wl3L0EvbOhnQfzphYMrFDsX7XjC0grMfiG
	vp0b9EQB4Lu0mSkYVi2j+V1JVmRuIvWBculZ6gaNfGFQAeTOkF1fkj+d3/5jn1n52b48sOs73hQ
	WSsn8YFwUkYIppA9GCKK5ho1nBWmGOoM1sRjdsLGkOvHkOpWfr4rjDpMk6DP1K3oYtfkdDJuCGr
	0lI7+jLX8PfPtE1w04ubhAV6Ae15y3v3wsMfLmZNg==
X-Received: by 2002:a05:701b:454f:10b0:14e:5e6b:e6e2 with SMTP id a92af1059eb24-16a13a7b96emr8442345c88.18.1791703627110;
        Sun, 11 Oct 2026 00:27:07 -0700 (PDT)
Received: from DESKTOP-1E7V4GR.lan ([190.177.187.3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a32eb7ebsm22855431c88.12.2026.10.11.00.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 00:27:06 -0700 (PDT)
From: Cristian Papa <pcristian292@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt76x02: sync the group key PN before a restart
Date: Sun, 11 Oct 2026 04:27:02 -0300
Message-ID: <20261011072702.2535-1-pcristian292@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_002709_172539_D16FC95E 
X-CRM114-Status: GOOD (  15.44  )
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

mt76x02_key_sync() skips keys without a station, including the GTK of
an AP. The hardware advances its TX packet number without updating
key->tx_pn. When mac80211 reinstalls the key after a watchdog restart,
mt76x02_mac_wcid_set_key() writes that stale software value back to the
hardware IV table. Peers retaining the GTK can then reject group frames
as replays.

On an MT7612E AP, saved snapshots show the hardware PN of the same active
CCMP GTK falling from 6412 to 0 across two watchdog restarts, while its
software PN remained zero. The PMF pairwise keys continued to advance
their software counters.

Use the interface's group WCID for keys without a station. Keep the
key-index check so that, when two GTKs are installed, only the key
programmed into that WCID is synchronized. Also retain the sw_iv check
to avoid overwriting software-generated packet numbers, including those
used by PMF pairwise keys.

Fixes: 004960423fe1 ("mt76: mt76x2: implement full device restart on watchdog reset")
Assisted-by: LLM
Signed-off-by: Cristian Papa <pcristian292@gmail.com>

---
Reproduction: MT7612E in AP mode on an XR500v, using a locally patched
OpenWrt kernel 6.18.44 and mac80211 backports 7.2. The key-sync callback
has the same omission in the upstream base used here.

Validation:
- MIPS build against that kernel/backports: W=1 and the mt76 Makefile's
  -Werror, 11 modules built, no warnings or errors.
- Host tests compile the actual key-sync, key-install and PN helpers
  with emulated registers under ASan/UBSan. The baseline fails the
  captured 6412-PN regression; the candidate passes it and 12 test
  groups with 363 assertions, including two GTKs, PMF, two interfaces,
  repeated resets and rekey.
- On the router, with this change on top of the board's local patches,
  three watchdog restarts kept the hardware PN of the active GTK
  increasing (404 before, then 418, 421, 443 and 544 afterwards), and
  after the first restart the client still answered a ping to ff02::1
  without reconnecting. Without the change, the same PN went from 6412
  to 0, and no associated client answered ff02::1 until it reconnected,
  while unicast pings went through.
- After the third restart the client did stop receiving, for another
  reason: mac80211 kept it marked as asleep (WLAN_STA_PS_STA) and
  buffered its frames while it kept transmitting. That is a separate
  problem in the restart path and is not addressed here.

This change only includes the group key in the existing PN snapshot.
It does not change the watchdog's snapshot-before-MAC-stop ordering;
whether hardware can still advance PN in that interval is a separate
follow-up. It also does not change group-key selection or power save.

AI assistance was used to review the captures and source, draft the
change and message, and develop the host regression tests. No key
material or raw packet payload is included.

 drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
index dc7c03d2..ce4e0086 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
@@ -377,12 +377,13 @@ static void mt76x02_key_sync(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			     struct ieee80211_key_conf *key, void *data)
 {
 	struct mt76x02_dev *dev = hw->priv;
+	struct mt76x02_vif *mvif = (struct mt76x02_vif *)vif->drv_priv;
 	struct mt76_wcid *wcid;
 
-	if (!sta)
-		return;
-
-	wcid = (struct mt76_wcid *)sta->drv_priv;
+	if (sta)
+		wcid = (struct mt76_wcid *)sta->drv_priv;
+	else
+		wcid = &mvif->group_wcid;
 
 	if (wcid->hw_key_idx != key->keyidx || wcid->sw_iv)
 		return;

base-commit: 2e6968e9286f3573016b9f804d4945373a21c489
-- 
2.47.3


