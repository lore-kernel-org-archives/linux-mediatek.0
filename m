Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAF2D7496E
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Dec 2025 09:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMnbsBDys3Q5ALCY69G8Tp1FxSfr5hlJBitMcGmH9sY=; b=Kfb0Z148m6BM5ab3kYxTOH1cZA
	DNiN6e8Q5IJvgTS4YZ9bl2m/UHM5FmZ9/xHIku1bJAkcIfsRgiNLVYB0G7/ddVvMlbHV6+OneKMCN
	bKEwaS7f1Cgst82XWDuT1fPMsvP35Pc0JgUBCdci8XgQyYXKHwYPVMQPIWtXHTgXv9Vk3B1Go0lkV
	Khwbn7rWGX2TWIgC+hs0ToW12+QxC7APmgtTcM3gcbwXzwozX/x9nSVemeDhL/DHSNnEwOMivrR6C
	eqF8svvPzI/IKkgyQrQ3zfzzbs878Wxltf1u/QttOFmRrBdQLH0hfbF15R829DR/jEsl+PMxaPsYy
	5eCmwD0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWkW-00000009wH3-1MAV;
	Fri, 19 Dec 2025 09:26:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWkU-00000009wEV-0Tp8
	for linux-mediatek@bombadil.infradead.org;
	Fri, 19 Dec 2025 09:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sMnbsBDys3Q5ALCY69G8Tp1FxSfr5hlJBitMcGmH9sY=; b=g6+3H2QzYNjayqSpfKd6rrYKGX
	e2b+c8clyJyPhnWJ8A9NKbw2g4rVzJFKqHp2vF4VTaX1phx9HKw45VyecAZ4A5+XyU+rAqNvjNh41
	GNo/1mq+0bgrdP6XsuAugFhmcuGXQp+jJ52GbWGpuYhGInMT42zZ0jSRZx5YcFqL2QEhT5KIuoNBD
	+ld9RJrG9pgo4cVm3Z29lz72sWIfE1sSEL1ll5ecGwzJoNdfjmojW8QFTIuwkBGG6VxzmrGBj+HeN
	Ej0EWLgwl1MLLWOwOIDTRogsnJX3xKqKiQuLSUDjbIytc2vWwePkPY2wBMdlyH6bYkeXGnXcK8ehv
	QrRKaivQ==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVsy-0000000ATWB-0a85
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Dec 2025 08:30:54 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47789cd2083so8868065e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Dec 2025 01:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766136363; x=1766741163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMnbsBDys3Q5ALCY69G8Tp1FxSfr5hlJBitMcGmH9sY=;
        b=shViOWkhjVuDFDXS2fSQfv5d9Xtn+NqY1tVYXorxtkAoESqv4bi8G9l5/zVR1Hv8Fj
         GxJqqhy7FBt1rfhM16pDQzAdJ4ne23jozypxp/4WcUVo4be7J9V9zw5i1Ng70jiP6HBy
         0rdPPrsk+bTdRmT/uFvHW0Mwcjxp8m+GGTH1Zz4/7yuUXGpgpNRRGD2Hi0N/o3Mp/24C
         ej2AYmxvcbw40J7CfL9ztGfWyrFmUfBq2we+WD3Mnil4RgnI83ldggrbsVCgcjKcOeCj
         jls7aCiGosOd2U60ldOQ2+kJvliwpHaoK7Qss7nGpZHiiXLn8c+NmNiitLs7SUCa6uFo
         Sqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766136363; x=1766741163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sMnbsBDys3Q5ALCY69G8Tp1FxSfr5hlJBitMcGmH9sY=;
        b=BnNEqqny8ruxOsGLAA9crVrmQ3v4UYSRQazw8ZqDE7B/B0x2P15XgZcrHjW2apsOw7
         ifx2Zu6XPST32QHGApOsL2pqQaIveE2cYhryai8hSf2Q4LyZmTp0j8x/Ibh/WGgvao9X
         kCCdgVVj93CAHARJA1xqoqKPj0evcfMRJFzwJk4lTzsyWZ0FPL03ofghsSAkUBmuk+5q
         2ZH1KxfjVrAqURKFp15XTsUPqkNnv/JUUimQDeCW62WMIl2a83TIGUWQ25GVM1QmIAqC
         OtExV7g/Kv50SgYa4lr816MrhL/FjFbYJCmfNJ2R9/R842AmGrRoWzp6C2H/iwGX7c6J
         jRiw==
X-Forwarded-Encrypted: i=1; AJvYcCUgWmUVQzV6AhnUVKLj7xEcUCwxF7PL2Q5vC0zCwfB3ejw3HNxc+FESgOJZEpPEXidQELKt1S49IsD/1Gs8mA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmVuqwECWJKEUv9pAf3r6XuJ3OAjYyZY8Xvz3+U9Dg1C0nHgPN
	rCMy+4yxi1aowcBGl6oZHSnNRH7MQSaHwaAZOGCcgAedHO6wWqO/M66+8Awl1YnekGU=
X-Gm-Gg: AY/fxX7Qo1IN5XWi/Uh8t094H2A0aFg/bH0cWf2jnNm3WjQLJ5FwyljazqTguX8XDrW
	AlD0dkeA496Dl3ewf7ASwlPCX+QrNlhFYqHyZp3pspLmlSdB8VpPv/XbVgZGTDlCEd5bAXHcgeF
	vQAkEOAuLeLSUuhZXCQafDb7KGuVKkHl4xVtYV5oeeWId6pjustsxyUQ4EcRc4yr4GI2DXPHlZQ
	JD2BHD7AF5uIO8Tyw0QyX5He5lpm0Uhf78C6EnUXTZrhZ4yCjf7JS38iXGOfZr9ZLAYIPDJbX2X
	kQszHRumWK39lh5R3/hZJcxjADiJfjGqJcgI9zyJL2bErpIidMTMgibIaqoKsl5Ct/RX47iQ6Ex
	QwhhsI4DAeFDhpsMK565PP7LUgzp87SsfmTrK8BSq1IK55Z0j8p0rAwGZPdgWMZ6ZmHSjC8Ft25
	d08ln54UO5WT4M4cjtXWunTIaw72Mz9NtL4c3YT737guv0N2ycyd4GDZaFHjy5jDedQ3H+IdFJy
	Kg=
X-Google-Smtp-Source: AGHT+IFmYQWz6L1SzUM2nXiY7KJqgf22XIvvvf4Np23ibdDNNhvtpV68GA/JG623TG5sdemIb6dcqw==
X-Received: by 2002:a05:600c:3486:b0:477:54cd:200a with SMTP id 5b1f17b1804b1-47d19549631mr17568935e9.6.1766136363134;
        Fri, 19 Dec 2025 01:26:03 -0800 (PST)
Received: from localhost (p200300f65f0066087cf387e078e1a5dc.dip0.t-ipconnect.de. [2003:f6:5f00:6608:7cf3:87e0:78e1:a5dc])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47d19352306sm34503295e9.5.2025.12.19.01.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 01:26:02 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	=?utf-8?q?Kai_M=C3=A4kisara?= <Kai.Makisara@kolumbus.fi>
Cc: linux-scsi@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Bean Huo <beanhuo@micron.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/8] scsi: Make use of bus callbacks
Date: Fri, 19 Dec 2025 10:25:31 +0100
Message-ID: <a54e363a3fd2054fb924afd7df44bca7f444b5f1.1766133330.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1766133330.git.u.kleine-koenig@baylibre.com>
References: <cover.1766133330.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4030; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=AHT26kUpMF4b7G1QPxCgxDWPcHR2tE/G5ZSM+TI0a0M=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpRRoTuOkvwoPMSOYtESOOgiv6oZfT0xdqbse/N jAOhYZgWmmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUUaEwAKCRCPgPtYfRL+ TrsfCACNqbNGpjownpLGZtSSMrJmbFfGRDYqSoEmO49EXbu2sgihlNoaZAk5hoSKoiUC1r9Ch1n 3ADQ+ZxDYAl97Af3cII2dD+Z7pDDr32KbMx4btjW9SPY1Cjlptm520rdW1/dCseaJawHYvq5dAS mqRlv7yYybysepVq2up6L92cVk3BDUbbqcgmf4dvYJabdhhjQy2dDUEB3QPpSr24oG4ow7ymGRs 5i/0X5x8SkT2jbWs91x+wH9Olj0QgUATt2P/bgJDCHVhswi7HoM8zmB5JlsMCifEk3mmX1r4m5j VVfOj+epeU2jDE4CcL8/G2j7zSF70I3dNhkdE4I8g4+BROFe
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_083052_269693_B47FCEA7 
X-CRM114-Status: GOOD (  18.74  )
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

Introduce a bus specific probe, remove and shutdown function. For now
this only allows to get rid of a cast of the generic device to an scsi
device in the drivers and changes the remove prototype to return
void---a non-zero return value is ignored anyhow.

The objective is to get rid of users of struct device_driver callbacks
.probe(), .remove() and .shutdown() to eventually remove these. Until
all scsi drivers are converted this results in a runtime warning about
the drivers needing an update because there is a bus probe function and
a driver probe function. The in-tree drivers are fixed by the following
commits.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/scsi/scsi_sysfs.c  | 73 ++++++++++++++++++++++++++++++++++++--
 include/scsi/scsi_driver.h |  3 ++
 2 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
index db0ba68f2e6e..6b8c5c05f294 100644
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -554,10 +554,48 @@ static int scsi_bus_uevent(const struct device *dev, struct kobj_uevent_env *env
 	return 0;
 }
 
+static int scsi_bus_probe(struct device *dev)
+{
+	struct scsi_device *sdp = to_scsi_device(dev);
+	struct scsi_driver *drv = to_scsi_driver(dev->driver);
+
+	if (drv->probe)
+		return drv->probe(sdp);
+	else
+		return 0;
+}
+
+static void scsi_bus_remove(struct device *dev)
+{
+	struct scsi_device *sdp = to_scsi_device(dev);
+	struct scsi_driver *drv = to_scsi_driver(dev->driver);
+
+	if (drv->remove)
+		drv->remove(sdp);
+}
+
+static void scsi_bus_shutdown(struct device *dev)
+{
+	struct scsi_device *sdp = to_scsi_device(dev);
+	struct scsi_driver *drv;
+
+	if (!dev->driver)
+		return;
+
+	drv = to_scsi_driver(dev->driver);
+
+	if (drv->shutdown)
+		drv->shutdown(sdp);
+}
+
+
 const struct bus_type scsi_bus_type = {
-        .name		= "scsi",
-        .match		= scsi_bus_match,
+	.name		= "scsi",
+	.match		= scsi_bus_match,
 	.uevent		= scsi_bus_uevent,
+	.probe		= scsi_bus_probe,
+	.remove		= scsi_bus_remove,
+	.shutdown	= scsi_bus_shutdown,
 #ifdef CONFIG_PM
 	.pm		= &scsi_bus_pm_ops,
 #endif
@@ -1554,6 +1592,30 @@ void scsi_remove_target(struct device *dev)
 }
 EXPORT_SYMBOL(scsi_remove_target);
 
+static int scsi_legacy_probe(struct scsi_device *sdp)
+{
+	struct device *dev = &sdp->sdev_gendev;
+	struct device_driver *driver = dev->driver;
+
+	return driver->probe(dev);
+}
+
+static void scsi_legacy_remove(struct scsi_device *sdp)
+{
+	struct device *dev = &sdp->sdev_gendev;
+	struct device_driver *driver = dev->driver;
+
+	driver->remove(dev);
+}
+
+static void scsi_legacy_shutdown(struct scsi_device *sdp)
+{
+	struct device *dev = &sdp->sdev_gendev;
+	struct device_driver *driver = dev->driver;
+
+	driver->shutdown(dev);
+}
+
 int __scsi_register_driver(struct scsi_driver *sdrv, struct module *owner)
 {
 	struct device_driver *drv = &sdrv->gendrv;
@@ -1561,6 +1623,13 @@ int __scsi_register_driver(struct scsi_driver *sdrv, struct module *owner)
 	drv->bus = &scsi_bus_type;
 	drv->owner = owner;
 
+	if (!sdrv->probe && drv->probe)
+		sdrv->probe = scsi_legacy_probe;
+	if (!sdrv->remove && drv->remove)
+		sdrv->remove = scsi_legacy_remove;
+	if (!sdrv->shutdown && drv->shutdown)
+		sdrv->shutdown = scsi_legacy_shutdown;
+
 	return driver_register(drv);
 }
 EXPORT_SYMBOL(__scsi_register_driver);
diff --git a/include/scsi/scsi_driver.h b/include/scsi/scsi_driver.h
index 40aba9a9349a..249cea724abd 100644
--- a/include/scsi/scsi_driver.h
+++ b/include/scsi/scsi_driver.h
@@ -12,6 +12,9 @@ struct request;
 struct scsi_driver {
 	struct device_driver	gendrv;
 
+	int (*probe)(struct scsi_device *);
+	void (*remove)(struct scsi_device *);
+	void (*shutdown)(struct scsi_device *);
 	int (*resume)(struct device *);
 	void (*rescan)(struct device *);
 	blk_status_t (*init_command)(struct scsi_cmnd *);
-- 
2.47.3


