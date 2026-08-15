Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9081BC5AD5A
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2026 11:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/9+rmVvmvs6s8dnr8ttRWG5a1oyP8FaGHhemcTL1GA=; b=KcBnZXnaiz6/mIf33VfLpO5WXD
	qhxeWC1e60xTp0B4ptOv5MqocwTJX+Bt3uxtKCyAxP+V47fBpdjS4BgiOs2W/U1dbZFIWIKnnCorn
	ChVJ3lE/2Es4YvNb17qiEg8aqPuWalPoeiyYIMyADaiPh7MWSCunaAsNW7bhQLCTNUxo9pNxl1LVM
	SuyryG9kc1BwObUDWbaBAYsV7C4l19v+3ouKl2UYhzuY0ju/gr8qkfSbLZSyFcvNTNCvRgOB4QzIk
	IfLDQujXrkV1ZQYDbSh7bgXHb5E5vO1Ya1kBqB1eRKfU6RE84UoeIc6Ph3nmo/cnFYzlp9/PHhVVH
	q0Mw6VhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvC98-00000003lhT-2DsZ;
	Sat, 15 Aug 2026 11:01:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvC95-00000003lgb-36ps
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Aug 2026 11:01:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso9600345e9.3
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Aug 2026 04:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786791706; x=1787396506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/9+rmVvmvs6s8dnr8ttRWG5a1oyP8FaGHhemcTL1GA=;
        b=W0Rio0iBFyW1I7qFsFO2aujts6Hdksfylx4tA8AytfPCNmJW87MK2LDxITSdk4snul
         81xem3px5TGKfvL1aZgBYyLCjOkLEnJNCXswnYfnLXskI/tb2paNmqOrZKh22SrChxXB
         Ga+mM8ojmVbokeYGCQPy5hCuDacnHfFe8tnkqEHesHCtdGCCzYD3f8zdJt19qLrbKHTu
         dekmibUg2jIMD+1WxsYUvp5oYtmgGGPhL9cxwVdSn8hyhYWoEvUkPrE0XFWXmq/++nKM
         42IlwbGFKk6l0dX1CPdv203ePCIAf6u2MiogLeyIhWrGJy0wafZELNRiUdmLZQEYF24u
         rhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786791706; x=1787396506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9/9+rmVvmvs6s8dnr8ttRWG5a1oyP8FaGHhemcTL1GA=;
        b=NdJACa88EWIN671R7BYYGhJorVZSYsR/iB72+NlW6Y4WoezlSy/Vh4zRlEBhzHIjJQ
         ky9+aBhxW6C1yxhwj4U/uj4HnuhQy9WkPK6VfEGbNFxsMg5CLBBc+eu0QmQj/Mk24xFj
         KqvhRQa0B8d+mKgEqH3RCPLmgvq7S0fbA06pXJ0TsFuK/TwAtmQdRCTjJCBqvH4PiQBH
         un/aAc7bzYjrs1bAm+wCZUT8Mtro/0gCNxfCzfYhM63PJX0nJ2Twt+Koa37uLbHxdAlw
         7ojA4XTYOGJexA0DMRJ+bmX+ptZN1UjaWgwRud9OMx75Yo4DYlD7Ly0FM+RZyx6+ce1v
         dk+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqSJAj+w1vGwC4secJjXNFZQQjt3hNVQyxdG/dCHBrp+pRwgOi+AxGdsE9mcDIFytLSCoABOxqtN0/hJSlwoA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1ndIkzSQNOSShx69yPRCSCRFp3h3spppfnGK3jiO37+DsfE2S
	qMxIoWgUX3Jydal/uzg0nzsArtDMTTkXM4IIWE/oJxZJd3DAPRTu5NRi
X-Gm-Gg: AR+sD12qE1+SeUXKno6rhfLuiuXp2rUMJKpGLIWySgI+ENe5CRh0HfM0hhdZOdfoyNR
	67t8aikCCaxSrzBMKzP1iMTx6Rz+Wid4j4n1CdJG83jAkGDS2SvBpE9ZHxHoncWYdWYVxao+QwK
	4bXwB0Ak9gVcAlff8jcNceqYltiMp07DZlbEortyUG60tgAtKov5duXA7bQa6rpYeL0PRBwytrM
	D0C4cYPKzDzfsnEAEbO7bww99TWBg4rFfGcUt6h/tjzsBv4FxpIBU/BmarXNq3L0zDp0uxsv1iO
	BzYsNOjMpTrrYhFMQ2yRdVETL4af19hJB1Lg0Q8Z9KPKdSnDwxJ2tk1AUALIEA0g8SJfmudRwEf
	tHF4m7Uv7y+mWAqOpy1KoNfFUktUMMIZi+XuJf4MNBtJPfT1J/sYqB8JkkYDgm8E/mtaoBfI6Fu
	T/E4o9lR5qiCQsnv1i/JQK/xbf7bgoVXzueaxZZKzAAAS88gKKRL0jbsTQZHs6RdCVJpZp9Ph+d
	gJRQzNNiPxJ
X-Received: by 2002:a05:600c:3b1d:b0:499:87b6:f3c0 with SMTP id 5b1f17b1804b1-4998807e4c9mr165228545e9.14.1786791705919;
        Sat, 15 Aug 2026 04:01:45 -0700 (PDT)
Received: from archlinux.tailbe3ea7.ts.net ([185.19.153.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49988b1d8f4sm133728035e9.11.2026.08.15.04.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 04:01:45 -0700 (PDT)
From: Ismail Tarim <ismailtarim7@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org
Cc: Jing Cai <jing.cai@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Chris Lu <chris.lu@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ismail Tarim <ismailtarim7@gmail.com>
Subject: [PATCH 2/2] Bluetooth: btmtk: Do not discard the subsystem reset timeout
Date: Sat, 15 Aug 2026 14:01:19 +0300
Message-ID: <20260815110119.11301-3-ismailtarim7@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815110119.11301-1-ismailtarim7@gmail.com>
References: <20260815110119.11301-1-ismailtarim7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_040148_006054_6C858133 
X-CRM114-Status: GOOD (  13.03  )
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

When the MTK_BT_RST_DONE poll times out, btmtk_usb_subsys_reset() logs
"Reset timeout" and keeps the error in err, but err is then overwritten
by the return value of the following btmtk_usb_id_get() call, so the
timeout is never reported to the caller.

Commit 25b6d7593a3a ("Bluetooth: btmtk: introduce btmtk reset work")
discarded the return value of the chip id read, so the function returned
the timeout error as intended. Commit 3dcb122b3064 ("Bluetooth: btusb:
mediatek: return error for failed reg access") started assigning err at
that call and silently dropped it.

Keep the timeout in a separate variable and return it, restoring the
original behaviour without changing the control flow.

Fixes: 3dcb122b3064 ("Bluetooth: btusb: mediatek: return error for failed reg access")
Signed-off-by: Ismail Tarim <ismailtarim7@gmail.com>
---
 drivers/bluetooth/btmtk.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index dc702c0a6034..c0ed51567ed4 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -860,6 +860,7 @@ static u32 btmtk_usb_reset_done(struct hci_dev *hdev)
 
 int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 {
+	int reset_err = 0;
 	u32 val;
 	int err;
 
@@ -958,8 +959,10 @@ int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 
 	err = readx_poll_timeout(btmtk_usb_reset_done, hdev, val,
 				 val & MTK_BT_RST_DONE, 20000, 1000000);
-	if (err < 0)
+	if (err < 0) {
 		bt_dev_err(hdev, "Reset timeout");
+		reset_err = err;
+	}
 
 	if (dev_id == 0x7922) {
 		err = btmtk_usb_uhw_reg_write(hdev, MTK_UDMA_INT_STA_BT, 0x000000FF);
@@ -973,7 +976,7 @@ int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 		return err ? err : -ENODEV;
 	}
 
-	return err;
+	return reset_err;
 }
 EXPORT_SYMBOL_GPL(btmtk_usb_subsys_reset);
 
-- 
2.55.0


