Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02F5CD5BD5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2026 14:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWgTKavmgNtbnrQrCEy1dI23oxS2X59cmPGG/1Wg2P8=; b=KSDyGW82mlbiAGnUSEiJo+t8CI
	8jHNtsa7xGlq9/r3jilr++8KjfzDoBOckasO/J4Phr88pe5XMaQS8Sdepg2vkBrD+YVQqKOgI3HfP
	tNe3Jq/k5aGOiuHrNmsK7vWAJhu5qxUeSeXEActrybffnY0yYWREs+cYy57Id/otst9VFqXFpPRgt
	TelSqoWiRPjr7WiQuB5B5kXlGBEv7HS7exeQivAttsu6ve9fn/1J3UJ9W8aGEekRq78MPdQ/anaQm
	h5g7o1nBzePlfR5kOJ1aIhT1oV/1H1brS4GyJDfSc0qQZKVIt194ln4mRVzhLzpDvjlgLiFAgVGBZ
	QjJXxVCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFY8-00000004K3n-1dAG;
	Wed, 27 May 2026 14:48:00 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFY5-00000004K3S-37Ts
	for linux-mediatek@lists.infradead.org;
	Wed, 27 May 2026 14:47:59 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1779893263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GWgTKavmgNtbnrQrCEy1dI23oxS2X59cmPGG/1Wg2P8=;
	b=T8jual49eWiH6n70Wjg80rwzRa9xLO2zoFPJtRDmec/4sTvTOmCis49v1DaDBsUUmu9qeL
	dp3xexVjTPtzew4iyeSvUHZFlLEEKPWghyqXnfinDm8FHFYvsaAYnlEyl6rvti5ikL06Tx
	3p/qFRK94OWJEQrFE/WGZs6zj+6vOWZ6KhN2FgrbDizTGkpV7QL2puETMlAuK1rEU8F/eE
	pihoX/m93GlCVxDmo5sn5adCurT8kkewecfU8nHphhzo5YawJiuw0K2MeCFE522qkeDKPF
	NW/zrsfEVoTAqR/qKuCST6qrtvSJtHDmMfQki7GvVz/alz2QZPhM15N9gJeiNw==
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Nick Morrow <morrownr@gmail.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>
Subject: [PATCH wireless-next v2] wifi: mt76: mt7925: add Netgear A8500 USB device ID
Date: Wed, 27 May 2026 07:47:35 -0700
Message-ID: <20260527144735.10254-1-lucid_duck@justthetip.ca>
In-Reply-To: <20260326190346.415226-1-lucid_duck@justthetip.ca>
References: <20260326190346.415226-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_074758_211029_7912A3CF 
X-CRM114-Status: UNSURE (   8.29  )
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

Add USB device ID for the Netgear A8500 (0846:9050) which uses
the mt7925 chipset.

Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
Changes in v2 (Sean Wang):
- Drop the Cc: stable tag.
- Use full name in Signed-off-by.

v1: https://lore.kernel.org/linux-wireless/20260326190346.415226-1-lucid_duck@justthetip.ca/
---
 drivers/net/wireless/mediatek/mt76/mt7925/usb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
index d9968f03856d..e44f0cafde01 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
@@ -12,6 +12,9 @@
 static const struct usb_device_id mt7925u_device_table[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x0e8d, 0x7925, 0xff, 0xff, 0xff),
 		.driver_info = (kernel_ulong_t)MT7925_FIRMWARE_WM },
+	/* Netgear, Inc. A8500 */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0846, 0x9050, 0xff, 0xff, 0xff),
+		.driver_info = (kernel_ulong_t)MT7925_FIRMWARE_WM },
 	/* Netgear, Inc. A9000 */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x0846, 0x9072, 0xff, 0xff, 0xff),
 		.driver_info = (kernel_ulong_t)MT7925_FIRMWARE_WM },
-- 
2.54.0


