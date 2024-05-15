Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82447C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 23:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ze1QygMwN68meqo9PDmwz469IrrkJxaffJS5Hm7aDfQ=; b=aCGzLjAzGDQyZrXtyjnROGRTl5
	I8Fz35mFSrfm3aUHkhyC4hz5jkEzhoHw9dmogN2Y5dnb4XUUg5idKKPWAw+IX2+wot+ou4Mu4R+1s
	KImUDKHOWArPYKjJErQ9zw12MNuSGDyBciqoZIt0J7yywuaCk4iWL85O1VouLxaW0n20vlqf1QU0R
	5JVxQ8FnUD4Zg4219sNu/JFshA7zX+wm2KWvIfZ/y+MZvhMelYn1nDFnmzgElSLN7H5mF4AxMNVGq
	1PJUtcwgsKgrdkfdoJhh0kiwVSovGBCRnuxX0lpXLkKTAITfFUJk8y0MAuN9KTdDXjDgGhZ44aZ0H
	QjLByyfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Nqg-000000038Ab-46dv;
	Wed, 15 May 2024 23:15:51 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7NqX-0000000385h-38Ts
	for linux-mediatek@lists.infradead.org;
	Wed, 15 May 2024 23:15:43 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5b282c5fe88so366705eaf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 May 2024 16:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715814941; x=1716419741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ze1QygMwN68meqo9PDmwz469IrrkJxaffJS5Hm7aDfQ=;
        b=HDr3DpZnKaWPWlOo0OwXyo5kpllNCnxMziDHzMl+YyPcA61Mc2wSdDb11Lg5RAvEM6
         Of8NlMCzwzpx80YpvCTk94a20jYxPsfnYbMu54SIxAYHR+yLFUdT2R7TIHYxhHx3cz2P
         MJrOh99kdfsElarhYz4zE5SQnAcY8EhPXGYMBkV8wnfnwYqJ9cYWUzUclghLzHXC7CZp
         Zw7CoZG2uwgnlRYowsdvkHde2xCK/+27OYPkhNd8Rb4yzFbVOuRLLZVhSifOCyC/fJYW
         VHMUaDBhxvXLv4VYZqkl3Ubb4czRxmg4BnucfTPaf97beuwObXaziB9+YZgCD99IjBqQ
         estA==
X-Forwarded-Encrypted: i=1; AJvYcCXmeekkAgoiAXqsnQdOxtZr8lUNel+R/BeU87PK+aygAwExCVMwo2wJu361CfsrgdREL7TKR2HcwT/g7VQL8PjInlg8SafTwNyVfuyY4P4NREAT
X-Gm-Message-State: AOJu0Yx/IAARlyLnGqULKZ+Lynxbc+abJ1JhUTD6QZk6n5DshU+FkR77
	tziM9sDMaw6eNNldp4vCUwONlsWNltnvF4N9xUAve+sr1iMsnpSE
X-Google-Smtp-Source: AGHT+IFeY6IBOmS16l1KarBie8GoRXUZtYtFiMESabNjNgeh9/aF2ykz5OpkEZWWolf+VV2rf5fl6g==
X-Received: by 2002:a4a:de14:0:b0:5b2:7aa7:7b29 with SMTP id 006d021491bc7-5b28193d5e7mr17763186eaf.1.1715814940930;
        Wed, 15 May 2024 16:15:40 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f0ec2e566dsm2032159a34.15.2024.05.15.16.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 16:15:40 -0700 (PDT)
From: sean.wang@kernel.org
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hao Qin <hao.qin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 5/5] Bluetooth: btusb: mediatek: add MT7922 subsystem reset
Date: Wed, 15 May 2024 16:15:21 -0700
Message-Id: <90f8b0663933990ed1bf47dd6698d8ff69f1a948.1715813148.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ce0337178bf617d52ff320a36837d75bf537df2d.1715813148.git.sean.wang@kernel.org>
References: <ce0337178bf617d52ff320a36837d75bf537df2d.1715813148.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_161541_937854_5B1B3844 
X-CRM114-Status: GOOD (  11.47  )
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

From: Hao Qin <hao.qin@mediatek.com>

Add the support of MT7922 bluetooth subsystem reset that was called the
auto revert to self-recover from the fatal error in the controller like
the host encounters HCI cmd timeout or the controller crashes.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Hao Qin <hao.qin@mediatek.com>
---
v3: split from the v2 to make the patch do one thing in a patch.
v4: rebase onto the latest code
v5: no change
---
 drivers/bluetooth/btusb.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index ddd5ca7596e5..79aefdb3324d 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3039,7 +3039,16 @@ static int btusb_mtk_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 	u32 val;
 	int err;
 
-	if (dev_id == 0x7925) {
+	if (dev_id == 0x7922) {
+		btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
+		val |= 0x00002020;
+		btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, val);
+		btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, 0x00010001);
+		btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
+		val |= BIT(0);
+		btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, val);
+		msleep(100);
+	} else if (dev_id == 0x7925) {
 		btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &val);
 		val |= (1 << 5);
 		btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, val);
@@ -3079,6 +3088,9 @@ static int btusb_mtk_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 	if (err < 0)
 		bt_dev_err(hdev, "Reset timeout");
 
+	if (dev_id == 0x7922)
+		btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT, 0x000000FF);
+
 	btusb_mtk_id_get(data, 0x70010200, &val);
 	if (!val)
 		bt_dev_err(hdev, "Can't get device id, subsys reset fail.");
-- 
2.25.1


