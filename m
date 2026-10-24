Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C3E606A31F
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2026 03:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bKFoheaJ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d2YaLTeR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FM8GNQ21z2tofnQ9HAGS228+B6GKkzHToThuxWl3/VM=; b=bKFoheaJK2xK6oCnBgNZlFvRzN
	dtR7nwOBWyaoMZcde921/RUPDB6w9Pg5CjSgxHVsIF4tutguQkWBlyOdBtCZ6EArADWDfn/sKRUNw
	aOGuM0DKcKvHydRccHJxi7xZzNregJvJ1+v4Sp13Keulv+xfe9yDPB/QYQX7AUWNUc04qBz7H1iV4
	iZED8uTVzLkJeD3U7zHhJpzskkPQGQXZdpuT3jKq77ZCq0XlCKO0xlElkbKNzxEY1iyfi3vwuNqYd
	NEP5yrDtmRcAykkAboKLzkoH2lu8SEwpDTAolqFXXXbvUpbcL8BLtY+zRFGxJPGf84O6iXaMkwoea
	u+rWeRzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKSLi-0000000HNue-0dQm;
	Sat, 24 Oct 2026 03:23:14 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKSLf-0000000HNuE-1YD7
	for linux-mediatek@lists.infradead.org;
	Sat, 24 Oct 2026 03:23:12 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c2acc1e170cso209497666b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2026 20:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792812189; x=1793416989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FM8GNQ21z2tofnQ9HAGS228+B6GKkzHToThuxWl3/VM=;
        b=d2YaLTeRxxY+/fmsVEi2HAe4Nu+raEnAlOTAcRrgRaN6Bli5rT3gN0QyuC4bbi7Sqx
         KtMQLaMfVLQnl+wnBrY3aTJgq2eumKIHa/XRr6U7HQrylhytCYso83ygvtc8nJEp7v2A
         qCZOiQ7dvD8SyscMiTFmAh+c3SrhdMeq5j17c5qkIdZXCvXVrYoUnRoVxZQubdz5ArT7
         plpjUGVG+8cPdl8hDMTlQkdHfG075C314aomdAaKTK5jvnfU5kYIWCOl6ECHu37w4bHH
         6JBeUvgNTsNoiDhPZvkcnNooh0s4OtCyVHAw7ID2DTXLVDVJiYDE4hxnRWI2+/doAcFb
         WyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792812189; x=1793416989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FM8GNQ21z2tofnQ9HAGS228+B6GKkzHToThuxWl3/VM=;
        b=k6+WugXoc+6t1N4sE0h9sJnxoaeG5L9mxqGyC7vvuxu5nZLxglanj463cah6/V13ix
         DCVzLqMSNK6sX+ScoZQY9Xr60Ok4SqZ31f2OIeopYEaerVZOKYj9Ey45K/4MhhHmxsFw
         E6CVhSN+G45LtCfwnaEziYu/sl3fKZGXfDlNKgHscKPe4HI7hBS/ZfT6bKwTkj971T5j
         Y/ql9M+yZbhZ44wk1qq2fR4P+Mu39LSgQS87Ad7qcV1CgroKWPOQHoGfKWcVs7ga3sAP
         iA96ki3eetm1QbE5oMNio2MqED+9A05CnaAG44cL8jAV3iG+xNYzZyzU57oqvJm9UtT9
         idjw==
X-Forwarded-Encrypted: i=1; AKwUvByxSS+59ao2WjdDm/bYP1B8+KLb1IifiRQBOZTRPnf4IerTlWQzDlZD2W50r6LTgfFMZWKjVQ37i7HKh0FZHw==@lists.infradead.org
X-Gm-Message-State: AFq9FYImIi/rbAuuzEoT59C/Y2ADlzExhXUhiKupUc5FaV+q01bFNRhE
	qdICej6RVPiCUAU7kkBcXrQYqdiEfTXlBNVyXpL0l1EWVJ3QiMkSfu1H
X-Gm-Gg: AYBFou0imoWQwE0tPC6CjrFEiC+Jw8Yrecyd6ESrfdvkd0fPMwdqHY3SrEUf6XsFllV
	cd/658K6KkyjNS5Rgjp1rce6+Yjw4MOB+Vd8okQfgv3mAdtcD11JEw2go0Y6+eRFIEJnQj8H72J
	BTzNogTZsZou1ZRz7J/0LAZnzQWVp/a4LbtS1wQ0PMTwFPovaAb7Of3X22fSfhIVEwdjTCL1EIC
	cXVKQ3G28cfv7Nmv9R3jSgWmLIYQ0L6f6PCMjOYbhqfI+0ps91NkZVNGHA/a90GuXoPHKAtWPmc
	4xuiGo+zAfsRSotkYSq0P9pCzpl8HXd7HVr5Gf0YtJFUk9ukS5sZkfrRtg233wPI1m5Gmx8CvJQ
	CvcHZ0jV1Byu9BVBlu34qNqkXIKAngNfGpkZepPc4MLWXMvUD7eKlnrOMonqbrRRrsvUsgxfbcP
	WQCujnazUFOIhK4P1G2BatSecrmDvanquG8MQin6GGGr03MJMu9xWSVcM59F6HiRYLxPXQ+xjpE
	X1jlehLv7meid0/Q0dBjRLULDKvMg7orSKQXTg/JcX5Hz7f65rmRK1tFtg6Hx1v9TV4f8u+
X-Received: by 2002:a17:906:f59c:b0:c46:7ec3:fde7 with SMTP id a640c23a62f3a-c46bde62669mr89622066b.31.1792812188826;
        Fri, 23 Oct 2026 20:23:08 -0700 (PDT)
Received: from localhost.localdomain ([170.62.100.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7a7c2esm38164666b.80.2026.10.23.20.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:23:07 -0700 (PDT)
From: Hedi Ben Hamida <hedihamida096@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Hedi Ben Hamida <hedihamida096@gmail.com>
Subject: [PATCH] wifi: mt76: mt7921: add pci restore for hibernate
Date: Sat, 24 Oct 2026 04:22:37 +0100
Message-ID: <20261024032246.53918-1-hedihamida096@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_202311_429798_7D1B813B 
X-CRM114-Status: GOOD (  11.26  )
X-Spam-Score: -1.9 (-)
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

Hibernation powers the device off and on. On resume the generic restore
path runs the normal resume sequence and can time out waiting for the
hif-suspend MCU handshake:

  mt7921e 0000:03:00.0: Message 00020007 (seq 12) timeout
  mt7921e 0000:03:00.0: PM: dpm_run_callback(): pci_pm_restore returns -110

Add a dedicated .restore callback, mirroring mt7925, which skips the
handshake, resets the device and returns it to its pre-hibernate state.

Tested on MEDIATEK MT7922 (14c3:7922) on kernel 6.12.113.

Cc: stable@vger.kernel.org
Signed-off-by: Hedi Ben Hamida <hedihamida096@gmail.com>
---
 .../net/wireless/mediatek/mt76/mt7921/pci.c   | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index f87c44f2a..00532b29f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -549,7 +549,7 @@ static int mt7921_pci_suspend(struct device *device)
 	return err;
 }
 
-static int mt7921_pci_resume(struct device *device)
+static int _mt7921_pci_resume(struct device *device, bool restore)
 {
 	struct pci_dev *pdev = to_pci_dev(device);
 	struct mt76_dev *mdev = pci_get_drvdata(pdev);
@@ -589,6 +589,9 @@ static int mt7921_pci_resume(struct device *device)
 	napi_schedule(&mdev->tx_napi);
 	local_bh_enable();
 
+	if (restore)
+		goto failed;
+
 	/* restore previous ds setting */
 	if (!pm->ds_enable)
 		mt76_connac_mcu_set_deep_sleep(&dev->mt76, false);
@@ -602,7 +605,7 @@ static int mt7921_pci_resume(struct device *device)
 failed:
 	pm->suspended = false;
 
-	if (err < 0)
+	if (err < 0 || restore)
 		mt792x_reset(&dev->mt76);
 
 	return err;
@@ -715,7 +718,24 @@ static void mt7921_pci_shutdown(struct pci_dev *pdev)
 	mt7921_pci_remove(pdev);
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(mt7921_pm_ops, mt7921_pci_suspend, mt7921_pci_resume);
+static int mt7921_pci_resume(struct device *device)
+{
+	return _mt7921_pci_resume(device, false);
+}
+
+static int mt7921_pci_restore(struct device *device)
+{
+	return _mt7921_pci_resume(device, true);
+}
+
+static const struct dev_pm_ops mt7921_pm_ops = {
+	.suspend = pm_sleep_ptr(mt7921_pci_suspend),
+	.resume = pm_sleep_ptr(mt7921_pci_resume),
+	.freeze = pm_sleep_ptr(mt7921_pci_suspend),
+	.thaw = pm_sleep_ptr(mt7921_pci_resume),
+	.poweroff = pm_sleep_ptr(mt7921_pci_suspend),
+	.restore = pm_sleep_ptr(mt7921_pci_restore),
+};
 
 static struct pci_driver mt7921_pci_driver = {
 	.name		= KBUILD_MODNAME,
-- 
2.47.3


