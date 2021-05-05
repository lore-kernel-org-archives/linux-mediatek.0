Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02608C43460
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:50:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A939D61424
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A939D61424
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pqi64ag9K9wl8zKXEwuCePZoh0zJn9JclNj+v4/Tm3E=; b=kerKTLKhw6XIlHR8+IOX3nmw9
	ItduVBAPuZiXLfyWvo4/Xqb3AiqUzzZ2pcNgciKUmbEnJipiyyIxMQtibXsElWc0ek6VnD3kKuoFm
	+/NO1M34tUTbh5ug/w959ZS8yCLu/LKsGDJkJkOrL5/UwEGclvGfMbPElxkT3oHeGP+uvu7EIogrW
	q3E02/FoWBtop0l5+hCJ6OvgWVncCF8cDdvfR/vj6dKGav5VT4M9DvBhGueY48qDoVyRTWG1lxX0L
	bOWD086s3bFxBFwAoX3ByILCUOddv6QWWjggWbOLj43bbxXquyYvNeI8d6C2XtKxFe5hJp6ebFY41
	0CS/VAGkA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKjL-001laE-1W; Wed, 05 May 2021 16:50:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKWo-001ga6-Qh; Wed, 05 May 2021 16:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=iUXUGv63KzRBmswG+Ddb2+Z3x3MUCGKQaoh11PhcjaA=; b=itSyQAtavWKlhWOXxCCHTDGKQs
 mfemJ/t3uz7gag57Qf403g37PFlmEAQj6VpPQKzZ7FUJbJLqYFNLiVopaG7cPhQ945BK1Fz3aofmv
 HOBRrosDDZ+rpbVWWD3DuaZP/+AKXx9/id+djlNkwy25w3lM5eFEV1prsrbUUqGBnigaxc7pVu/FV
 Pf3+k2KB0FHOF3TH6/zRMnjzbVuMQ/Zuq5ov9fxKeIRiFNUOvvs9jwAA5SEkAHC9MwHnqUvTtu+fn
 vLXD9ntR1E6tNUQ24B+F/BaG3PRG2JTTsXsNMxu/Eu1TtOejdjcHXB379Cyxtm+CckeuNEyzVlW4z
 WYUnWNpw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKWm-004xVK-9w; Wed, 05 May 2021 16:37:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D276B6195E;
 Wed,  5 May 2021 16:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232655;
 bh=KCjB9enV4AE4OEYByO7y+YDqkSX5uicmLY/QjLm9rog=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CxU+eOeImqnkVDNljkHpYr0cOPo1XGRDAFek06Et8tgMoUc8W13jLk3aSYaqR137L
 ea2nQgdy2VEzcZ/loD8UI80bU3gMrF9XWcn4S4mf5V2GI87W0xXN2FDX+cjtK2Vb09
 wn3EVzg7i/YqY62o2clb1QjE3JvW83n0Un06Nk6UHKSxa5Q9pDFfDV9EyXCEWBHU+T
 GQTEXkcaOxtso8kQ3hJvSOBHpa9Vxwg/7Mx3+dHYw8+wK9yvrbbSeI/xPPV93czKkT
 hcAid5jTfZoe1Rdnh3kUiKj/f07huu6/8QJolVG8injcmsCu13X5sKND0ijXUYPknb
 f2s5vUohKXd6A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "mark-yw.chen" <mark-yw.chen@mediatek.com>,
 Marcel Holtmann <marcel@holtmann.org>, Sasha Levin <sashal@kernel.org>,
 linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 32/85] Bluetooth: btusb: Enable quirk boolean
 flag for Mediatek Chip.
Date: Wed,  5 May 2021 12:35:55 -0400
Message-Id: <20210505163648.3462507-32-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163648.3462507-1-sashal@kernel.org>
References: <20210505163648.3462507-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093736_406121_B781EE71 
X-CRM114-Status: GOOD (  10.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "mark-yw.chen" <mark-yw.chen@mediatek.com>

[ Upstream commit 27e554a4fcd84e499bf0a82122b8c4c3f1de38b6 ]

Adding support LE scatternet and WBS for Mediatek Chip

Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/bluetooth/btusb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 2953b96b3ced..175cb1c0d569 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -392,7 +392,9 @@ static const struct usb_device_id blacklist_table[] = {
 
 	/* MediaTek Bluetooth devices */
 	{ USB_VENDOR_AND_INTERFACE_INFO(0x0e8d, 0xe0, 0x01, 0x01),
-	  .driver_info = BTUSB_MEDIATEK },
+	  .driver_info = BTUSB_MEDIATEK |
+			 BTUSB_WIDEBAND_SPEECH |
+			 BTUSB_VALID_LE_STATES },
 
 	/* Additional Realtek 8723AE Bluetooth devices */
 	{ USB_DEVICE(0x0930, 0x021d), .driver_info = BTUSB_REALTEK },
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
