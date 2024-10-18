Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E996D2127B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 07:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1isxM+T848GFvJvzymmh7gVtU9Db8eItqMO8i4yplDI=; b=qE7Er3aSyO0IRBjFI9/63KRuS3
	kgyHSslWGvNXaD4+7NRn5paeUftk2gs4zYzIguQwyOukmjTT5vOa0u4QHAllpTzVzLhG70HyG0n5P
	Om1r5xAfBmMmB55+/npwS4impgJsBwWbQUCfXGCCZYz9FNEasp6mK8kjRwFDOJQ6BkAAhQyYQUzgp
	0r0d7k6NoGFc29SvMkUM0c550eyqvaXYTLzuY9E0T3Rfrn8Yz+Fp/8skRpvc9pmAtMPZZiWD93XJr
	0TV4ymFWxJDgsndYpw5cgYIpVarIqhpFYnvl/U7jDzgccpds35tJw0ArM3QpyvWw7b9dWDT9Gi4/E
	mn1TOJ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1hoI-0000000HPEv-0iLU;
	Fri, 18 Oct 2024 07:54:10 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1hjr-0000000HOYo-12qa;
	Fri, 18 Oct 2024 07:49:36 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7ea7e250c54so1274772a12.0;
        Fri, 18 Oct 2024 00:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729237774; x=1729842574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1isxM+T848GFvJvzymmh7gVtU9Db8eItqMO8i4yplDI=;
        b=ZWlnA3otFWcKv5UJmRCxcTcaVk5Pd3qRVdQAKDmQ3tLUO1mUuhZCb/J+phsfMaKzkP
         8hlXzUmXonGqqeuIgO3ewBYk02G/mmLI9GWx4zb9VLQyKT9xavdVbq0Fhvc3/w6Ai/zS
         pXSmEFygrgDEkZl4WOnunIhPypXzobDvefHRttSynrnENwr4VYM6vqpo9dfS9RhJIccF
         OjfMGyzVP7UX7lfWVS2lzXdBN4LQ8Hp14ZaPLAWZlpaVIAYe7PhfaSrZnf4o4p0tT3tT
         DuB8T7avlR+yaj0Z56GsQr/JuQ+3Hp/zpz31A7G3Wi0JX7b/1RBF6uAP2xsbKrsp4/9o
         0NfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729237774; x=1729842574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1isxM+T848GFvJvzymmh7gVtU9Db8eItqMO8i4yplDI=;
        b=sn8hxtPBuM/wy8ep3s8Gw7Owcw5MdJNphWLBFJjLs3AhtJP8OuHwkrCilYmChKgkbF
         2E74dEkM7iigY4C5rBcCUM+uGBG5g9AcysrZ3RSCzny9u9UH3D+5J2G7St/gV4FHk+xJ
         V+m+SZrD+T+f6Xi4dD9cQGnmB7skr9AsyfWmbcPR2E4WYhwvXLyEC9Usd5eHpckp2Vcj
         pSBbHBiGDA7/jF/o4PuN5gVQSxatF5YNvO3uEKj1EiqCDarwZXVD7aJUobKfNy3KOU6M
         BOMqfbT/AODpmBLWAHnYSsZP0z9g5KBVnquHzhmBfor0PEUypUW3OuvAHj3J2RNWFudj
         XZ/A==
X-Forwarded-Encrypted: i=1; AJvYcCWJBb/lkUNUD65RKze7Gcbx/JqL8t3umjfjvuqYDhT28LzR6DMDxvv0OKhpAF6Da22x/a9s5NojHekMQiBc4EDj@lists.infradead.org, AJvYcCWe6XQI8QsBIjENtHAlVKFnGszaeKOPHOwcOHQZz3HxO9xg/gLtoQcHkUI3JTEPyXJac2wW/LWvuwpiTFF/C7A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6wGIa3dofUx4kGfyT/a7y8gmaMPAUPSsxXMSUWQBVfSCtilDE
	GE4fvplAFJ1mjfxACWQHZQys3zMCg0XNyn/uFBOx5NfPiMszilOq
X-Google-Smtp-Source: AGHT+IGq9xXBjZ7B+bmpZuX1zHoZ3akorwGczXJzcLA0dPqp+H4yvzKs0UT4OCM9H+bsNsIXFm5osw==
X-Received: by 2002:a05:6a21:3a94:b0:1d9:282f:3d16 with SMTP id adf61e73a8af0-1d92c56cad7mr2315018637.32.1729237773888;
        Fri, 18 Oct 2024 00:49:33 -0700 (PDT)
Received: from localhost ([2402:7500:479:5c7a:4a5c:7794:109d:58b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a8d674asm7346715ad.169.2024.10.18.00.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 00:49:33 -0700 (PDT)
From: wojackbb@gmail.com
To: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com,
	haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	johan@kernel.org,
	Jack Wu <wojackbb@gmail.com>
Subject: [PATCH 1/2] [net,v3] net: wwan: t7xx: add PM_AUTOSUSPEND_MS_BY_DW5933E for Dell DW5933e
Date: Fri, 18 Oct 2024 15:48:41 +0800
Message-Id: <20241018074841.23546-1-wojackbb@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_004935_337126_0AF6638C 
X-CRM114-Status: GOOD (  18.23  )
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

From: Jack Wu <wojackbb@gmail.com>

Because optimizing the power consumption of Dell DW5933e,
Add a new auto suspend time for Dell DW5933e.

The Tests uses a small script to loop through the power_state
of Dell DW5933e.
(for example: /sys/bus/pci/devices/0000\:72\:00.0/power_state)

* If Auto suspend is 20 seconds,
  test script show power_state have 5% of the time was in D3 state
  when host don't have data packet transmission.

* Changed auto suspend time to 5 seconds,
  test script show power_state have 50% of the time was in D3 state
  when host don't have data packet transmission.

Signed-off-by: Jack Wu <wojackbb@gmail.com>
---
V3:
 * supplementary commit information
V2:
 * Fix code style error
---
---
 drivers/net/wwan/t7xx/t7xx_pci.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_pci.c b/drivers/net/wwan/t7xx/t7xx_pci.c
index e556e5bd49ab..ec567153ea6e 100644
--- a/drivers/net/wwan/t7xx/t7xx_pci.c
+++ b/drivers/net/wwan/t7xx/t7xx_pci.c
@@ -49,6 +49,7 @@
 #define PM_SLEEP_DIS_TIMEOUT_MS		20
 #define PM_ACK_TIMEOUT_MS		1500
 #define PM_AUTOSUSPEND_MS		20000
+#define PM_AUTOSUSPEND_MS_BY_DW5933E 5000
 #define PM_RESOURCE_POLL_TIMEOUT_US	10000
 #define PM_RESOURCE_POLL_STEP_US	100
 
@@ -174,7 +175,7 @@ static int t7xx_wait_pm_config(struct t7xx_pci_dev *t7xx_dev)
 	return ret;
 }
 
-static int t7xx_pci_pm_init(struct t7xx_pci_dev *t7xx_dev)
+static int t7xx_pci_pm_init(struct t7xx_pci_dev *t7xx_dev, int pm_autosuspend_ms)
 {
 	struct pci_dev *pdev = t7xx_dev->pdev;
 
@@ -191,7 +192,7 @@ static int t7xx_pci_pm_init(struct t7xx_pci_dev *t7xx_dev)
 				DPM_FLAG_NO_DIRECT_COMPLETE);
 
 	iowrite32(T7XX_L1_BIT(0), IREG_BASE(t7xx_dev) + DISABLE_ASPM_LOWPWR);
-	pm_runtime_set_autosuspend_delay(&pdev->dev, PM_AUTOSUSPEND_MS);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, pm_autosuspend_ms);
 	pm_runtime_use_autosuspend(&pdev->dev);
 
 	return 0;
@@ -824,7 +825,13 @@ static int t7xx_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	IREG_BASE(t7xx_dev) = pcim_iomap_table(pdev)[T7XX_PCI_IREG_BASE];
 	t7xx_dev->base_addr.pcie_ext_reg_base = pcim_iomap_table(pdev)[T7XX_PCI_EREG_BASE];
 
-	ret = t7xx_pci_pm_init(t7xx_dev);
+	if (id->vendor == 0x14c0 && id->device == 0x4d75) {
+		/* Dell DW5933e */
+		ret = t7xx_pci_pm_init(t7xx_dev, PM_AUTOSUSPEND_MS_BY_DW5933E);
+	} else {
+		/* Other devices */
+		ret = t7xx_pci_pm_init(t7xx_dev, PM_AUTOSUSPEND_MS);
+	}
 	if (ret)
 		return ret;
 
-- 
2.34.1


From cd3c4bb25637348806e92e2fe9d51a05c5ddbafd Mon Sep 17 00:00:00 2001
From: Jack Wu <wojackbb@gmail.com>
Date: Fri, 18 Oct 2024 15:44:11 +0800
Subject: [PATCH 2/2] Add support for Sierra Wireless EM86xx with USB-id
 0x1199:0x90e5 & 0x1199:0x90e4.

It is 0x1199:0x90e5
T:  Bus=03 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#= 14 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1199 ProdID=90e5 Rev= 5.15
S:  Manufacturer=Sierra Wireless, Incorporated
S:  Product=Semtech EM8695 Mobile Broadband Adapter
S:  SerialNumber=004403161882339
C:* #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=500mA
A:  FirstIf#=12 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=qcserial
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=qcserial
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
E:  Ad=85(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:* If#=12 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
E:  Ad=87(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:  If#=13 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
I:* If#=13 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

It is 0x1199:0x90e4
T:  Bus=03 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#= 16 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1199 ProdID=90e4 Rev= 0.00
S:  Manufacturer=Sierra Wireless, Incorporated
S:  SerialNumber=004403161882339
C:* #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=  2mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=10 Driver=qcserial
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Signed-off-by: JackBB Wu <wojackbb@gmail.com>
---
 drivers/usb/serial/qcserial.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
index 703a9c563557..bd0768e61b26 100644
--- a/drivers/usb/serial/qcserial.c
+++ b/drivers/usb/serial/qcserial.c
@@ -168,6 +168,8 @@ static const struct usb_device_id id_table[] = {
 	{DEVICE_SWI(0x1199, 0x90d2)},	/* Sierra Wireless EM9191 QDL */
 	{DEVICE_SWI(0x1199, 0xc080)},	/* Sierra Wireless EM7590 QDL */
 	{DEVICE_SWI(0x1199, 0xc081)},	/* Sierra Wireless EM7590 */
+	{DEVICE_SWI(0x1199, 0x90e4)},	/* Sierra Wireless EM86xx QDL*/
+	{DEVICE_SWI(0x1199, 0x90e5)},	/* Sierra Wireless EM86xx */
 	{DEVICE_SWI(0x413c, 0x81a2)},	/* Dell Wireless 5806 Gobi(TM) 4G LTE Mobile Broadband Card */
 	{DEVICE_SWI(0x413c, 0x81a3)},	/* Dell Wireless 5570 HSPA+ (42Mbps) Mobile Broadband Card */
 	{DEVICE_SWI(0x413c, 0x81a4)},	/* Dell Wireless 5570e HSPA+ (42Mbps) Mobile Broadband Card */
-- 
2.34.1


