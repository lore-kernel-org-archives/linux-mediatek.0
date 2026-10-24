Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D07606A31B
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2026 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zuwJkskf;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SM8RNjts
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FM8GNQ21z2tofnQ9HAGS228+B6GKkzHToThuxWl3/VM=; b=zuwJkskfXoMhnO
	TYBsuliPkbJ+LYKeC2L65+M2KwLL3mlEVGsbSwwGbWmVpmht2PIrEjyBfkwWZIGszK96zHfED13bL
	shsIMtXNtXRZLGUNhoPG6O7caKlFD+IUpoTq26W8Iavhq1SVZAecQmxhHnDzctN7Xx62KvHB41Ao2
	v6of7/mIRhh67CPb71dS4cseW3+vaLk403aJl3NPiD8S+2C6hHeQtpij+PfHjqVloyYAolqouiL3J
	fy7VqhMoNdTm3J0F/SSZ+RcP7LWd5gw5+WiTYTJHZA4NiE73J3Z0eZs1VRESw4KrgK2hensuWzTH7
	fADWrIsTY7ivz+GLuQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKbe2-00000000DF4-02E4;
	Sat, 24 Oct 2026 13:18:46 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKbe0-00000000DEI-02aK
	for linux-mediatek@lists.infradead.org;
	Sat, 24 Oct 2026 13:18:45 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c468bd799ecso219051466b.1
        for <linux-mediatek@lists.infradead.org>; Sat, 24 Oct 2026 06:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792847922; x=1793452722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FM8GNQ21z2tofnQ9HAGS228+B6GKkzHToThuxWl3/VM=;
        b=SM8RNjtsCmR9cSIeRCtzH18AZpEO5Nl3KfOsx6AAaFIzWGbey7yNfzjo/DbzJgoVfd
         vGkS/DRJnDEkn+09mkUcXQ0nXaL7s21VDCeSpsE6q1yDtpFwW7f/SaeWK6f/DVJveXQo
         edYTSfpSKdfoAtSMC/EYFx34VBD6iTrC7uQPk/Z10rILUS8ZUg9/2IpVGCdDlq62l+Lv
         2XPO/ukQQvIvABTlQ0uSdGMyuJ4If4ssNj50ffDNqAoKEO47or5MwHt+RL5d9R3UX/Z2
         LXv3RkZVuR9sXDXkHEsEA0YaGI0fl9DS2cO6S7L3ZWp56ZhtHdwjG6Sj0Rmsy4YP6M2+
         VMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792847922; x=1793452722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FM8GNQ21z2tofnQ9HAGS228+B6GKkzHToThuxWl3/VM=;
        b=Uq3jk7K23Jd+IjH8CifjzAKGy67gX8PGn0UFDxpGRHXN0G56EcXIo6gsWKEkA6Bwx+
         phms1PEIyyX7Z3QSKPtDbckRiKNHLz4HwqWygxVAtMZurKlOTJB4Pn3y9jzc+s67YSzP
         x9SHy9t1H6BGlIBCHdXrmE0Y7zlTorUuP5Kons2Ek+2RlF573H9BSZZf/VnRCs6rV5ml
         RP4AtA7uLccewzKYPNlpNemyfKgySgr4sxOM6Ki3XikzoRppDFZfaST+XmExwjQWxIBu
         4rBiqeuVaxGH6d3tRA8t8Gs2ug/VomOJwJS9MtEdgploPC045moZjvQpOdln7GYkJ1IK
         55ew==
X-Forwarded-Encrypted: i=1; AKwUvBxKjZgqv+gtj+t38aLd+Cd62bUpqfRohHAy/QK27YkWZSUOLAkJ2ctyPMbBn+Q46B4Pik5hF0M+l6jRZC8sEQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKqCrcYfKGnMXWhvvrXXgKhikaMbF39GUnQcCQa9V9yZs36Fe++
	GKq/xWzAUXB0vfudwi4tGYWiGtWPJLAmWgILn339npYPThYUF+2p4ZTm
X-Gm-Gg: AYBFou105aFHXJYnR9c4bLCLXo3obo3I+c/l2nXxOljC7oiox8S8xKGGwt40mCUSTNg
	L9OlGdw3Mrce6AjZWhwgoGOTUNObF7abydoSg4LLpA7k1bagLsdo+Ux2Fch7ybIsvzG8NZNKuQI
	eSDMiyIaV3uoVvmC6+fyYXGgJm0l9vPcjrp5L/+OwQRwAdyv3svJtgTps0Hc6xY2Dc4PCgARt9h
	isG8bSY0eXhbGC0hhMrTnL+7920Nr3TpsxyJ6rMyQh6XnypVDfjxh97OszbeikG97U7/DuoDHLC
	S3RctZ19q8zPv3+GAFubZXODJnS9dr+Bl4qwGc9DOBb4hHD334LX7g5lHigpzLkV8AKjMu7cw/b
	SuwBfSbVvZafp0nCxo8elws2OBOUO2yUZYMwmYzPdpLeQNgBR6SP6K8IjQ9see631pEDWxf/2bD
	35BzxvzeHhJScxzR2THQGDXSWHPIBbd7Evog2A/n9aQeuDZxsqmzN1LMcOO03g5P54LkXaCSrI9
	3XDRnAIuNW9kGyMLhKF2CSbMw9io6wclDGcKBbvReNzwxCTNerTzO0p279lwqxlJ/ycMTij4Lk8
	LzTlRJIfxuFFY7AEig==
X-Received: by 2002:a17:907:d649:b0:c33:392f:7ca1 with SMTP id a640c23a62f3a-c46bddce42cmr186626466b.17.1792847921987;
        Sat, 24 Oct 2026 06:18:41 -0700 (PDT)
Received: from localhost.localdomain ([185.65.135.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd6276d8sm87306666b.41.2026.10.24.06.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:18:41 -0700 (PDT)
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
Subject: [PATCH v2 1/2] wifi: mt76: mt7921: add pci restore for hibernate
Date: Sat, 24 Oct 2026 09:16:52 -0400
Message-ID: <20261024131715.64435-2-hedihamida096@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024131715.64435-1-hedihamida096@gmail.com>
References: <20261024131715.64435-1-hedihamida096@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_061844_062000_0F82569A 
X-CRM114-Status: GOOD (  11.94  )
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


