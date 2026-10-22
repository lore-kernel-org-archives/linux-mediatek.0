Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29825606A31F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2026 21:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iEOnanSE;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tCxP9TMg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7J25Ol6OoVWSYnoEuI8c8YQySc1v4KBrwsp24rZ47ZI=; b=iEOnanSE3ltNobDXU9U25iuSb9
	fVbD04Enq1MOwRYwUCD3lqOIyyGiPovVgaxJOEQ7twkvGTRy6W0Fa9VVG+3yHd8x1vNaG9fk+sa1l
	dNpDRz6xpGcaEc62xu5Oe3NpgIIqTUxLh3rmtrpPV/BJLvgzd50Uh5EMvcPYmsRu3uFNRGxv2OimL
	kGr46knqxFab8cBefij9XGxR8+mjo+wNWdZH2xm2zgqriC6taqzgBeD8pP7XhqPsBFXkwzSLVepBP
	qyk+GNNAcQvpZZiDZc0tQrlRgB73Y4EiTwO1mtKOjvPtqanz2QsVObfuaQBqxOAMwGM7o1pqAdskN
	083CNcrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0M7-0000000F0Ph-3U6P;
	Thu, 22 Oct 2026 21:29:47 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0M5-0000000F0Oz-0xsF
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Oct 2026 21:29:46 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2e812e2b31bso1047225ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Oct 2026 14:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792704584; x=1793309384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7J25Ol6OoVWSYnoEuI8c8YQySc1v4KBrwsp24rZ47ZI=;
        b=tCxP9TMg9s6WKJQbniiC9ScHZ9SyDluWgyypluESadzx7+9GEePEXlJptmFTqYtis0
         i9UMwR1APvI34670ym0VgWjqP0TtYSECt/54H3/VcSDYqIIh0ABC30gFntbHNbpINhZV
         h2ZAkn9ra7gYF4qYuy4+R8y/hzgoz07BPWc4xIDiJa0gtq3UvdD7SyYf4v1zGZnHDrvZ
         6jLVCsKq6L5FirilV+ZK0U4/l39UXOOhMjul4hz+2QVbbD5+iTrbX+Beop69IQ7O7hKN
         xwJts6+YRCRR+f6AzPxTTw/2U+dEn7TZm2xdDer0ImzAH9oB/59QAqIUVoEirwGdWQKu
         PPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792704584; x=1793309384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7J25Ol6OoVWSYnoEuI8c8YQySc1v4KBrwsp24rZ47ZI=;
        b=jOihFjxDpo7l4MzvwEirwW16adqGEIBD1Lb8uDq+zhxFynMomCfxcEPuSbNOd2oF+r
         M0poBoizfDGx0IfzNIaAXIudzWFcAF6c4Sgho3vAw1QqlGW/qFbN5DhwFHkYh5AaVerG
         XsegK+L9SDzqfmEz3PyUM7CTK4dpP5JGxjRAq+ouRR00vBNpOqUCtbumgbIMQjHMkTnn
         g1hd6Xirt8sVUEidVRZ2cB+DW199tABmem4TwtCWoxUbfTM8oZZ61emIPkwdW8QU/mdB
         QusZRAvyXwDzoT4FL7mOsll1IEhADF5EAhYrzKupR6Q1Arp2IotgzcwgEPIAFfTyT6bc
         DLrw==
X-Forwarded-Encrypted: i=1; AKwUvBxGWnAPj848klAR0ZPIsj5OmxIvHeKgpF1DD786Ub4kaCR8/3hlH6E8x+7jc6W98QqZgjziuW6pEBMdOnKERQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYK6BhkqDheGrHDJQE/u1TaQkpyapRvFR5qVAHMVQv1mwXcnHKgH
	LQlnm+3h5D4u1i7+jO/SQQyeBGkyV4DB/Q8YvGKTcQhXNJbycCc4e/AC
X-Gm-Gg: AYBFou2nOT3PXUaX7hSrAxPlycDOHhl0kxxDB7ULWILr1o2vDjvOxJ1QbU0QuDT7sT2
	HXSzgK3mr9z2fVL7xeFZDfewL9cRuD386Ujnh8kxR8nGBvlhQzucInjPT9s+S0HikfW4bwcZb1+
	Tse5aV5W1SKbXzfDS+VtL1ue/4lIsOw0DQBp+YAwCQrANGzyGrY/pBU8zan0ibAj/uMBAa+egfS
	NfNuWuHVGBPGjbVPEWeIHrvf7VR/8UaVjSLPaIwBEjmlnUkynglzeMmMHbeEq4wVAw1yJBZyhaW
	wH1qBO9vBjXGrW7RBSyMSE3nIW2ID6NsCm5joZogRYr5BzJ+zocs31IyE0tLtv1IBuFAgQLQtiW
	oxGSgM70fgZQyj3lAffAi3cXDvDv6xT6aI2MGhGrFhcmdA2hwQZLMZLvPmUnVQ7hXVCyWvBeXLP
	sxIpL+A37nTdjmQ6cfJNgGVjWWvUSQp9YfI1k47U6VeBqPBRfbc7XdUIxiHO02F43wddLfQlxi9
	fAOvk9IriQRyXn/nFODvU4t2t3bYM47U9et44aiUJjjw5b7KxDmuDlVSEL++tTY9QsoK/8qA2G2
	NimlVNrhNwAttqAIGkpT1FcVrmLE5QCWdjKbMw08s09XLK7zNcZCA1vBFzKR3c1X/YzAZbc82Mn
	hpcRspDRj3w9D5SmXRoZac/c=
X-Received: by 2002:a17:90b:3806:b0:3ac:7842:bd50 with SMTP id 98e67ed59e1d1-3adcdfdb688mr169990a91.15.1792704584283;
        Thu, 22 Oct 2026 14:29:44 -0700 (PDT)
Received: from ryzen ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca08e785sm606547a91.0.2026.10.22.14.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:29:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH wireless] wifi: mt76: mt76x02: restart mac_work after a channel change
Date: Thu, 22 Oct 2026 14:29:41 -0700
Message-ID: <20261022212941.3666724-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_142945_335089_5F55CDF7 
X-CRM114-Status: GOOD (  10.53  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since the channel change code moved to the core, mt76_set_channel()
cancels phy->mac_work before calling the driver's set_channel op. The
mt7603, mt7615 and mt7915 set_channel ops queue mac_work again, but the
mt76x0 and mt76x2 ones do not, and they only queue it in their start
op. After the first channel change, which happens on every interface
up, association and scan, mt76x02_mac_work never runs again.

mt76x02_mac_work calls mt76_tx_status_check() to time out frames that
wait for a TX status report. Without it, frames whose report is lost
stay in the wcid pktid idr until another report happens to sweep them.
On an MT7612U station sending 25 Mbit/s of UDP, 48 such frames piled
up within seconds. They kept their AQL airtime and their socket memory,
and the sender blocked on a full socket send buffer for up to 30 s
until a connection monitor probe swept them. The work also collects the
survey, A-MPDU and EDCCA statistics and checks for MAC errors.

Queue mac_work again at the end of the set_channel ops.

Fixes: f4fdd7716290 ("wifi: mt76: partially move channel change code to core")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/main.c     | 2 ++
 drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c | 2 ++
 drivers/net/wireless/mediatek/mt76/mt76x2/usb_main.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/main.c b/drivers/net/wireless/mediatek/mt76/mt76x0/main.c
index a5c40d350612..a2763cf648b5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/main.c
@@ -26,6 +26,8 @@ int mt76x0_set_channel(struct mt76_phy *mphy)
 		tasklet_enable(&dev->dfs_pd.dfs_tasklet);
 	}
 	mt76x02_pre_tbtt_enable(dev, true);
+	ieee80211_queue_delayed_work(mt76_hw(dev), &dev->mphy.mac_work,
+				     MT_MAC_WORK_INTERVAL);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c b/drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c
index 550644676201..ab4d0e3f79bc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c
@@ -49,6 +49,8 @@ int mt76x2e_set_channel(struct mt76_phy *phy)
 
 	tasklet_enable(&dev->dfs_pd.dfs_tasklet);
 	tasklet_enable(&dev->mt76.pre_tbtt_tasklet);
+	ieee80211_queue_delayed_work(mt76_hw(dev), &dev->mphy.mac_work,
+				     MT_MAC_WORK_INTERVAL);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/usb_main.c b/drivers/net/wireless/mediatek/mt76/mt76x2/usb_main.c
index 66b06a493d95..57550ab3b7da 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/usb_main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/usb_main.c
@@ -45,6 +45,8 @@ int mt76x2u_set_channel(struct mt76_phy *mphy)
 	mt76x2_mac_resume(dev);
 
 	mt76x02_pre_tbtt_enable(dev, true);
+	ieee80211_queue_delayed_work(mt76_hw(dev), &dev->mphy.mac_work,
+				     MT_MAC_WORK_INTERVAL);
 
 	return err;
 }
-- 
2.56.0


