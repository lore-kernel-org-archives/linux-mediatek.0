Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D98C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 22:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hiD4Ke2N9LU6SCkq4K5xtOszVjDU8myvBHd+iGq33v8=; b=cqBrWYHeUVYKLNcwKVrDxdP7YO
	FKptLMHCJjoZVtBhD5dPKy+SlSKXmp9JFewndrkhyOj6jOfPh113WewpkLtwiEkRfuh8ZNrkD8WA/
	9DKG33qxmW4QUJc4d75xTY3e3WPw60uMKhk3bN7pp/VCfj+9WQ2LG49DNQ3tDGox4Mncc9LsZkqho
	ddWZ3/ze+IgOlIExO4GoBiSvvpEOqXN5Bq5pKTC8YkkmJyuLId15088v8dfunhYoEHcJ6fZjFuzsU
	vRN7srhJC86M3Xzcwewt9nYwDBZ+mVHFaqwzisi8grr/nA4XvJVW5phdbHadOC9wl7x6E2OuljC93
	w5mTJO2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEcvt-000000046Ei-22Go;
	Tue, 04 Jun 2024 22:47:09 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEcvq-000000046CI-1qou
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jun 2024 22:47:08 +0000
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6f93a6d5d70so26970a34.2
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jun 2024 15:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717541224; x=1718146024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hiD4Ke2N9LU6SCkq4K5xtOszVjDU8myvBHd+iGq33v8=;
        b=DgxH6Gn43RNtdjM/d8IHZW8zI6BXPxiJuWeEnN3BwL7Ls4Uuh5o0PiYraSEG5k/QUo
         bc66m9xx+fhZMgNigeUrluDk51Et+Ev4x1ZYZo9/xdkwAqB+OjMBCOZK5Ug7mRC+Upoo
         NH/HsWCh/BLeI8mbcJh3nrUGs/+8GUxjBbuFZ6AS0pfmbYH/ATEpPzoAShSDLtoTUw6P
         nJ3n9IG5LZHGSr1a8Mhy5Iv7G5C6Ck70WF44rC6v+qL96Iq1r/ymesN6GXYNVSxFjzd6
         ronK9eB7fInkQDHcLgSl1TbfVputP5oFZq9Md6P4A/UoqlLWzTxQ5RPNyUdKDjD0ZRce
         x5uQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1AOJ1F4j5lcWbl7WNysqlJjQYdRhuwf7BuD2b3h4pbVVgV+vcaYCxTfk380V5D0rVvFKrNvw96irngXc1Tk/pFptB5L7BI6UdC0ay/A+IAQPP
X-Gm-Message-State: AOJu0YyKuHDn1wlCuiVgN5KTc3Zjlv7GLxiZM6qIpo1RN1Ila0Q3PWfu
	pq9mdm25YnTrcb+vyzNYEQ1UcAnFox6tZ5FPcbIKM2lJ2KvgKSzkK4CPW3Qc5CA=
X-Google-Smtp-Source: AGHT+IHKyQa5YdQiiojcvxDO2Va94udiYdn5BFzckK2TCI7Gu6HfRStiK6xqb7kXnZv03ljFfKylyA==
X-Received: by 2002:a05:6830:20d4:b0:6f9:3eab:145e with SMTP id 46e09a7af769-6f94380cbfdmr902388a34.2.1717541224282;
        Tue, 04 Jun 2024 15:47:04 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f93b4a3e00sm478529a34.50.2024.06.04.15.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 15:47:03 -0700 (PDT)
From: sean.wang@kernel.org
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 1/2] Bluetooth: btusb: mediatek: remove the unnecessary goto tag
Date: Tue,  4 Jun 2024 15:46:59 -0700
Message-Id: <8f809ae0094c89ed99efb4074472edd119db8ec1.1717540338.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_154706_583657_F70010B9 
X-CRM114-Status: GOOD (  10.91  )
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

From: Sean Wang <sean.wang@mediatek.com>

Remove the unnecessary goto tag whether there is an error or not, we have
to free the buffer at the end of the function.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btusb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 79aefdb3324d..fcdd660add19 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2953,12 +2953,9 @@ static int btusb_mtk_uhw_reg_write(struct btusb_data *data, u32 reg, u32 val)
 			      0x5E,
 			      reg >> 16, reg & 0xffff,
 			      buf, 4, USB_CTRL_SET_TIMEOUT);
-	if (err < 0) {
+	if (err < 0)
 		bt_dev_err(hdev, "Failed to write uhw reg(%d)", err);
-		goto err_free_buf;
-	}
 
-err_free_buf:
 	kfree(buf);
 
 	return err;
-- 
2.25.1


