Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92925C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:33:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 538D9613C9
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 538D9613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nrAfwxT1EcXs9IYQxuoCOv4vhRAjoPj38N2UI56L5oo=; b=RdwQa2m5d1iIPn6pJVnSlVOal
	wbk0G+RkB/jjaVDSRxOCopT4FynTPqetbHJY6bLAVN+OCjabN+9YTwqJUmggjielvcont9evRP5sO
	cobmt+D7abbGagjiGO+/VM0aenJTdhS3fqBY02M7P6U0RqrRMR8bVg94Y0w//bb3GEJTEhV7VQnxt
	BoRSt4V7pHuEpy6zh69sP3B9yURbzE4t0epLhe+6WN1Io0aiG5jJKwJSU5C9pv4mCueTpE4SdueE5
	VMrwDzK3FyN4O/TyFkd87tdPMksnXRhUCyK6n9u5U8NkH4UBQo1pxXbqwFkOHTu+IwxSMoprNKX9f
	pD1AQnSvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKSD-001eXz-EZ; Wed, 05 May 2021 16:32:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKRk-001eT2-89; Wed, 05 May 2021 16:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=kigjhY/W4D6PkvJIBQmLjY6vBcm7ZaM1Ooddhxi91JY=; b=FxAhz/MxUa6RuFCGrsPmxW+G6b
 2oZZCsDYagL7OjXnQokA/5UG0dpRc6ncK4gXUczcwxYcBzGjpMBKY6zlDc0SnLMYrDjZev3qA3voF
 zx8VQ1WXRtt9f1qPRdyQrV1b2DBErMevpwH7RIZdLjMrm1mtiM9k8mmNYEHWX0Uzf2ZqXOpijTAaZ
 e55a1PHlE+XMd1DHJSQbkFFRtQK2VBC5CnpjIeQ1BvD8o/fFVmNLfdlvZ6pyA+/pIH1ifEm2/y9VO
 aoD/z2h6Ppu9fvG9VjadpJqOALHaiuhJvvPeH0Ps3peHADYEaO2RTmT1cWe06zn6rluWvJNruA8uM
 7AJ4U3bA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKRh-004wKG-Qe; Wed, 05 May 2021 16:32:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91F4B6140E;
 Wed,  5 May 2021 16:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232341;
 bh=M8zuBxLrA0vWx8Ky/9hlYUJL/Fo3+UCk3ey4IvlmNhI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AxXY/5yI/115QO/sWqjQkDj8sNRrYNtL0KOSYzkoo41+I0fk/RitWGdK+yqOg5lj6
 0iGgdQkCj23ugnv8bMLKLmwSMC+VaUn/SMhq9TieVJRCTfsZGzD7HhH6L94evmsRmm
 fZuncp6yHqdS00P4msi/IKXgqsgE2jGYNv+rWhEyVxP63aCzDyUMn8HkoLNeTPSUNS
 ZjpSApLOrSLZb/fuMGahob7Hes3SFv+MFf52v7r9Zcgs/e20xvI7W1RdhyBubuLY8u
 QILJsvmRIGzMQD+pQDyy3eQCvig5wQhYz69dkC0vEDORaBeS4Ygf0ceW35jvrUmPP4
 n1E/B/NQjq8vQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "mark-yw.chen" <mark-yw.chen@mediatek.com>,
 Marcel Holtmann <marcel@holtmann.org>, Sasha Levin <sashal@kernel.org>,
 linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 041/116] Bluetooth: btusb: Enable quirk boolean
 flag for Mediatek Chip.
Date: Wed,  5 May 2021 12:30:09 -0400
Message-Id: <20210505163125.3460440-41-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163125.3460440-1-sashal@kernel.org>
References: <20210505163125.3460440-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093221_900666_6C6EAC40 
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
index 5cbfbd948f67..4a901508e48e 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -399,7 +399,9 @@ static const struct usb_device_id blacklist_table[] = {
 
 	/* MediaTek Bluetooth devices */
 	{ USB_VENDOR_AND_INTERFACE_INFO(0x0e8d, 0xe0, 0x01, 0x01),
-	  .driver_info = BTUSB_MEDIATEK },
+	  .driver_info = BTUSB_MEDIATEK |
+			 BTUSB_WIDEBAND_SPEECH |
+			 BTUSB_VALID_LE_STATES },
 
 	/* Additional MediaTek MT7615E Bluetooth devices */
 	{ USB_DEVICE(0x13d3, 0x3560), .driver_info = BTUSB_MEDIATEK},
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
