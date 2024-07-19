Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A91C3DA59
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 10:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xuh9iSd8KxGWV5lYYqQovERWPmUSNDBEH/i46diZXw8=; b=bDCy2pkKsUCDs1R0ZczZR+JLEd
	E2zkEMlr9RqEWRrpbiPoZhKjY2miN2pUWTS95qggy10jCy5X/e2MTIJHNA2jrSC/QzDzCKDyp4HBr
	RQe18wBZp02EhMIJnHJAgsmhZAnM/BEx3igh59gOQBR7XkJrA8RhNJVpLdDDWaNyrUNvCbx4ZqrZz
	dU96NTrEBgpn8l/YvSNen0R6EeTYi6YqWbVb2g70rw6xORIWylyYyxSGIcfdULD0sfI+0ajksN5kT
	HXAbv+gBNKVfZneMW3RsqkM2C9IDMSAKF/k32spvikv9WzNO0MSu0ucA0w3++zIThCqh3tlld18Wn
	gHJ4yFaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUkVN-00000002MM7-1eBa;
	Fri, 19 Jul 2024 10:06:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUkV0-00000002MFm-3rxW;
	Fri, 19 Jul 2024 10:06:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3A872CE1AF9;
	Fri, 19 Jul 2024 10:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64EC6C4AF0A;
	Fri, 19 Jul 2024 10:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721383560;
	bh=sINWgXxddUzYRyDAErofwiMxBkh6XLtJM46yfDgg1vQ=;
	h=From:To:Cc:Subject:Date:From;
	b=rLJEqbF7yRdgk3+DvdhBj0jFTmQH5lU4E6NnWFT8Xn4RiQrzAYWYSvQQ5TTPWzU87
	 KvLfofiV3SwTPEHCXXNWAK8+FI5PQQwQZN0KlxCdmk+KY0XfixtrUYRkR7iLtwIzkY
	 KDAwSz/N8oJVcKvc/oZaE0eufN+QqAP2k3AEqKEl7XwuWxaSQOcRIpOrHiDYy5kbjD
	 Wv+/+fp4HX8N/KqCgbogF2RYX8/Oca8rjRlLj4xZzjzkXl8Z9WbzjDzEce7WSf1U64
	 niy6ly2P7gNixlrbMPvdBZGDLtBo6Sv1w+89+jif75ZymxalL6hVm6nGvywrMykCo0
	 0J6JwddhXXKfw==
From: Arnd Bergmann <arnd@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sven Peter <sven@svenpeter.dev>,
	Tedd Ho-Jeong An <tedd.an@intel.com>,
	Hector Martin <marcan@marcan.st>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Bluetooth: btmtk: add USB dependencies
Date: Fri, 19 Jul 2024 12:05:45 +0200
Message-Id: <20240719100554.4183635-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_030603_163717_1CEA95DF 
X-CRM114-Status: GOOD (  10.94  )
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

From: Arnd Bergmann <arnd@arndb.de>

The mediatek bluetooth drivers have a common portion that is now used for
all front-ends (usb, sdio, uart) but that internally relies on USB
interface functions:

ERROR: modpost: "usb_alloc_urb" [drivers/bluetooth/btmtk.ko] undefined!
ERROR: modpost: "usb_anchor_urb" [drivers/bluetooth/btmtk.ko] undefined!
ERROR: modpost: "usb_submit_urb" [drivers/bluetooth/btmtk.ko] undefined!
ERROR: modpost: "usb_free_urb" [drivers/bluetooth/btmtk.ko] undefined!
ERROR: modpost: "usb_unanchor_urb" [drivers/bluetooth/btmtk.ko] undefined!
ERROR: modpost: "usb_kill_anchored_urbs" [drivers/bluetooth/btmtk.ko] undefined!
ERROR: modpost: "usb_set_interface" [drivers/bluetooth/btmtk.ko] undefined!
ERROR: modpost: "usb_control_msg" [drivers/bluetooth/btmtk.ko] undefined!

It would be possible to split this up further, but in practice anything
that uses this driver will have USB enabled anyway and it only matters
for build testing, so just go with a much stricter dependency.

Fixes: f5c3f98946e3 ("Bluetooth: btmtkuart: rely on BT_MTK module")
Fixes: 3a722044aacf ("Bluetooth: btmtksido: rely on BT_MTK module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/bluetooth/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index 44a2de58337b..2894a345562c 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -21,6 +21,7 @@ config BT_QCA
 
 config BT_MTK
 	tristate
+	depends on USB
 	select FW_LOADER
 
 config BT_HCIBTUSB
@@ -413,6 +414,7 @@ config BT_ATH3K
 config BT_MTKSDIO
 	tristate "MediaTek HCI SDIO driver"
 	depends on MMC
+	depends on USB
 	select BT_MTK
 	help
 	  MediaTek Bluetooth HCI SDIO driver.
@@ -425,6 +427,7 @@ config BT_MTKSDIO
 config BT_MTKUART
 	tristate "MediaTek HCI UART driver"
 	depends on SERIAL_DEV_BUS
+	depends on USB
 	select BT_MTK
 	help
 	  MediaTek Bluetooth HCI UART driver.
-- 
2.39.2


