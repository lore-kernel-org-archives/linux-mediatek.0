Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B658F89256
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2026 10:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f+ooAKgHIuKcQdMInfKY/BCUWonIks5RSqvPScUktgk=; b=n5p4PelKgkHzwsP4DMZoQ9DtPX
	bVDOoZl4ik8Qhnm10ihB3uhKgDK6rvRy04C2M4cuCiPWE4e/aH1ZuXZiLHX+m9C9gwAWqy6RjVqPj
	v+fMDRxBPTk+yvREMhWBO6YW917C5Qil13q208lxoJu9Ytoe8Xd9gnyTVnW96MZbUw+txTnXP7CoS
	j7xFBvBAx+RcW/b9fCaKdxKGJGLOioOO1qdEnkcI80r05N48Iv5vWmE0Dcv54PTQFiwsB6yQsfBnE
	tM8X6tOWxsHCHKTG0pTvngSz+jKFiwkf8ip/m8y17iTs4G9fTmOpl77eOl368YyuWvK8h6KfQvJ8O
	kL1s0vpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8ea-00000008Syx-2R2W;
	Tue, 21 Apr 2026 10:48:28 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8eY-00000008Syc-2AvU
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Apr 2026 10:48:27 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43d77f6092eso2777216f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Apr 2026 03:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776768504; x=1777373304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f+ooAKgHIuKcQdMInfKY/BCUWonIks5RSqvPScUktgk=;
        b=J7Bb3wZHyiPT214asuCFfM3dZPGrGWfbafg5FGR0aMbkyFGbR10sHGs3BKdCzUTSl7
         9TdUPZMxdUF7DcX6RZNC94J+2X2eD9VjizCgGoiEnzlp7NSKWhEI0RSwFrsjG2uA6Ivo
         CeUwSJEXiCdJmt9XxzQby/7AiVlFDdgkNxwWnttPlkREpRqkqQ72DEYPDQAUh56L9k2f
         01vg6koSmAZGOErjYRl3/o0aAcqBZZWyj+1P5E676Pxl9/+o9/M2t7DtRA8ypqNUwzJI
         ASgIZfr4rqPfBpBC21I3ZeuTNOnuJoeoH6DzNMyFJ3obCLHxhPs8rq1ofkw4IJ6YXxfw
         W/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768504; x=1777373304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+ooAKgHIuKcQdMInfKY/BCUWonIks5RSqvPScUktgk=;
        b=WkDTqf8khcRg8sP8sZi9pNhlCbLoC14kbqsp7Zoy3vDJoEaQu3XyY6I0JFj0t1NEQA
         gYWk1XKoY7tJmkZqd6FTQTt+eUFdz9RygiFzDr4u0tX0oSNOuLjD/1RzstcU10gitWQE
         8qLV/J32GI5YKozawxJPMjsJLP1GZA7qC7+95NSCM4Q5pk46tZtySuF9duuDH7V9YU67
         Th8DL3Vme4rk5Xp2xC7nHtGEHLQ/THFxZWB6AyCJdLKEuzUz5eWRJzNA4KLX7Qx8JgK8
         FCeavs0+yUmZAZrKZg+B/QnemKRDINRPpvg2c30k3Va7p/5rTvYanFQzKQ48fgbSz8TV
         HfEw==
X-Forwarded-Encrypted: i=1; AFNElJ9Xg2Wm7+OnmegNtBlUhsMMfqZl1cwjWJe9E05SGS25NzXEF+ZbRP0+qQn+we9XnPkzC8mOThNmoxL1sN1ubA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlZbQGGqx7akedz8UIm9WCrTxsYIGINwOmUJMa9CF+jvzrr+7Y
	w2nN6eI6l5c5PbUAcI2RqvbX572C47a7HehEIRt08Ua1hDIYYYLoHd4=
X-Gm-Gg: AeBDietxi1hyOB2WkthJwz61uFHUlXap6x5qJCcOeoRu1PVyT0JMsguKO8teffh4jv4
	tcV76CkSH4wae0RbbZ0yNYSrm5tnKYzZGQT4HQvC6a/iJ3OCJrU71+aACP3fv9Q1QUUf/vGPYTU
	k73sJ+H43Difgkf3+zap1WiA7kZC4Nhlhss9pv+4uhwD8MhRad9lp2N89qXP5VVUuSoHYh7L50J
	TIBnNAZcNfo06iTdd53h/+8ST7soppsStpjNX1nNrnJIjgUtprhfBD6Cs7Fs9+JY/Fb8aGorD6A
	xrJN9taucO2WrYgHU67mDlbUf834oiPTVb8PxsxhbcrQItOZDb2/XJY7ImOhwlh2buJyv0SYqsM
	CURhnrT8qGz2zcqCDFT8jhRfYStBGI1AOtiCQ2OGmpNmAdxw/z+h7CvOdKxgU7wfBhqCHpEh99W
	HAC49uaZc4FG4Lcg==
X-Received: by 2002:a05:600c:8207:b0:485:3193:6ddb with SMTP id 5b1f17b1804b1-488fb73cf74mr265162525e9.3.1776768504275;
        Tue, 21 Apr 2026 03:48:24 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc14a61asm332563105e9.15.2026.04.21.03.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:48:23 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Chen <mark-yw.chen@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v4] Bluetooth: btmtk: validate WMT event SKB length before struct access
Date: Tue, 21 Apr 2026 10:48:22 +0000
Message-ID: <20260421104822.2498025-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_034826_656978_B839B74E 
X-CRM114-Status: GOOD (  11.35  )
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

From: Tristan Madani <tristan@talencesecurity.com>

btmtk_usb_hci_wmt_sync() casts the WMT event response SKB data to
struct btmtk_hci_wmt_evt (7 bytes) and struct btmtk_hci_wmt_evt_funcc
(9 bytes) without first checking that the SKB contains enough data.
A short firmware response causes out-of-bounds reads from SKB tailroom.

Use skb_pull_data() to validate and advance past the base WMT event
header. For the FUNC_CTRL case, pull the additional status field bytes
before accessing them.

Fixes: d019930b0049 ("Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to btmtk.c")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v4:
  - Use skb_pull_data() instead of manual length checks, per
    Luiz Augusto von Dentz.

Changes in v3:
  - CI all pass (CheckPatch, BuildKernel, CheckSparse, etc.).

 drivers/bluetooth/btmtk.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 6fb6ca274..b1a96ebae 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -695,8 +695,13 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
 	if (data->evt_skb == NULL)
 		goto err_free_wc;
 
-	/* Parse and handle the return WMT event */
-	wmt_evt = (struct btmtk_hci_wmt_evt *)data->evt_skb->data;
+	wmt_evt = skb_pull_data(data->evt_skb, sizeof(*wmt_evt));
+	if (!wmt_evt) {
+		bt_dev_err(hdev, "WMT event too short (%u bytes)",
+			   data->evt_skb->len);
+		err = -EINVAL;
+		goto err_free_skb;
+	}
+
 	if (wmt_evt->whdr.op != hdr->op) {
 		bt_dev_err(hdev, "Wrong op received %d expected %d",
 			   wmt_evt->whdr.op, hdr->op);
@@ -712,7 +717,13 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
 		status = BTMTK_WMT_PATCH_DONE;
 		break;
 	case BTMTK_WMT_FUNC_CTRL:
-		wmt_evt_funcc = (struct btmtk_hci_wmt_evt_funcc *)wmt_evt;
+		if (!skb_pull_data(data->evt_skb,
+				   sizeof(wmt_evt_funcc->status))) {
+			err = -EINVAL;
+			goto err_free_skb;
+		}
+
+		wmt_evt_funcc = (struct btmtk_hci_wmt_evt_funcc *)wmt_evt;
 		if (be16_to_cpu(wmt_evt_funcc->status) == 0x404)
 			status = BTMTK_WMT_ON_DONE;
 		else if (be16_to_cpu(wmt_evt_funcc->status) == 0x420)
-- 
2.47.3

