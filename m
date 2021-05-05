Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECF7C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:42:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B61AD61C37
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B61AD61C37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BlLLTh7NPx4MAPFoWbSEtz50B8Xhf3hrVAJNXKeEZek=; b=a0g+5MFUG1ksCmfGONrddJ3O3
	OiiR1uUeOYx8ilFK+M6Wj8XZAzxfqsddK9VyAiDKBnycdPU+1cdZUzuetCVzRWaGDoZyDIkwmMfX1
	mvm8ErqPldamj8kKjZH4jkwqxEM5ysnnKibze1NTqJYWCR6bNQFzxGI/B3UELndlyMiw+ehu2LrfX
	d+ivEzAUPsWQJmYwePoMAlWSa2V8TJOjX97Po1LDtQASnJ1oXByPS/gqn8Cm4i9w8p6mpTpOuyaKz
	ctKn0qTZtRkjVLKWOtW6BZjs509Qo1ccsG6Qxw12AfnpmbuuPVKBfRUiD5M+wACqBD4hVFUDq4u+g
	prLKoNnWQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKbE-001iSN-Ia; Wed, 05 May 2021 16:42:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKUR-001fTD-3h; Wed, 05 May 2021 16:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=uSTkBofPllV6hUKjRnj9dvrBd7/Azr6JAzINs/ToxRw=; b=MZZVzrFxdOSa79arjjlPA8WKEd
 gqBAo/gwDarTYE9YMNPaVBe97s56wZ5oPE1bKrkAw/IAZwenYYYAYb/C/60TpMGNMzrmM5X3WamO5
 i8t17UgSLOmApp2NAYCqtbEOywGImNxC4ALESCwhTCwkJqquDy+LlEqKu8ady5YeWJnRq0y0ah0zJ
 0KlVqm5rHgmSc7FVUb20IcO9k3o++hfW/75z+ooy/ai/whXhPTfz7nTX0Gy2yDWhLFXyJG0A8TeGm
 76+vg722Tu4rdDjYgGiWYg5qlYYzJUP+XLgTQx6hBdd+9dTRKAI+q/YbJSV1PRjcuoQPZZWfQlbNe
 w20CTH3Q==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKUO-004wyp-M9; Wed, 05 May 2021 16:35:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 625AE6191A;
 Wed,  5 May 2021 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232508;
 bh=8MqLuJRpRtNfNTz+zPiLQpJ1Jfnmn5DyqkueYbf3VKw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fnszEe34mb8HCNinhtxXSwyMITuQOJtKWJVpXHGLcETbSgaHO+jgQoyD5zEweJUbm
 m64hpv9OANgPJLxcTzuhoy9KLTWRw/owX4/HT2SvkNlrsP5Cj0BVWYdfeqtD4+yoXH
 VXZkDPA5xsSnx2mlon4L4jycdFW7oKYaauCIFROSxncVpUeUiBxIj7Ie2yDBwjEj54
 7eDpTALbG2HBZ4uMYJWDJOZTGnlRWfFV1f5kqbIJbzEjKr32cEuQN8SLeuHjJjf1rt
 CztGHNTmWdl0mYgTzWiPSA0WV8g29TOihqFvjaCLXLzXzaGNAwxg0vFTv4OlE7K+hp
 UApirn6AcjsBg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "mark-yw.chen" <mark-yw.chen@mediatek.com>,
 Marcel Holtmann <marcel@holtmann.org>, Sasha Levin <sashal@kernel.org>,
 linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.11 038/104] Bluetooth: btusb: Enable quirk boolean
 flag for Mediatek Chip.
Date: Wed,  5 May 2021 12:33:07 -0400
Message-Id: <20210505163413.3461611-38-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163413.3461611-1-sashal@kernel.org>
References: <20210505163413.3461611-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093508_768683_415FBF25 
X-CRM114-Status: GOOD (  10.03  )
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
index a4f834a50a98..3620981e8b1c 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -397,7 +397,9 @@ static const struct usb_device_id blacklist_table[] = {
 
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
