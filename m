Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3989606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2026 22:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HRdaLktJ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YHPWtqa9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=p/lNXcmee9ZNuCiy3sE8z9e8aCfdm1832qnUnHax1I0=; b=HRdaLktJcFPuBzQWOgdfxIBK7b
	wnRHIPPcbtBbAaxJ7MxACXqY+1SncdFwokxnfYRKxIUzaaNN53nHniU+3s7LusUV0vVTvhs14rrfm
	K+s1Df+wAzT63wK0Pov5xp+iKPoGrydWbI6FXMbJackgDDYwg4eAufwJHGDaN7LthOTnZ/xW6ZPmf
	EYsgpiX8DvUu4MedgexOcLCfaN5Kga9HaNcCZYu4NRWEjnltvNJP2/Xlg3wx22vhQZVropE1pJac0
	Zjm6hkm69/dWvmuyhpnu1dlmmacpEEvw1r27keB7XJL8rXL/11Khkw7/8Ea8K6dSZXuutIKjt8qEw
	4orA8fwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYoT-0000000AULP-20l4;
	Thu, 29 Oct 2026 22:41:37 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYoQ-0000000AUKU-2JXT
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Oct 2026 22:41:36 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so548645e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Oct 2026 15:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793313692; x=1793918492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p/lNXcmee9ZNuCiy3sE8z9e8aCfdm1832qnUnHax1I0=;
        b=YHPWtqa9skmFKlUyR2rMVAFWoxgQAEPH/c2aWeTQKR1ci+fc02vjojpHVKqWapB/jw
         rXv0XmMJiDZfuoFo7U+d9ArzwO7iCQ8QnaMogMJnWXjj1d738Sp8VSkPG6ZciN8ktfYy
         Xg2Hk4Uzs25Kxh88kdN7AQAVFY0OI6om7qnFaFgfgpxlbTPjdu1DW/p74haBy+FHODgn
         LkNlp3eXdWcn0RXpf7pjrL/y2wfddxS5yP5UMngwJw8Yb1uTuNSWenXdjL/Ls7/ijNi1
         yckeRPQRmqFensKrD8jR/2IzeyPXj1AQ6giaLlXA3Zda/00MSvS3JH7kVmwftt/Bs8cc
         VuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793313692; x=1793918492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/lNXcmee9ZNuCiy3sE8z9e8aCfdm1832qnUnHax1I0=;
        b=uV9zLEIufl8rtQYadSci7qO/zE1jpe9Mv7fYLhPiGIfs5NXC6PJoa+Lw/yJJ7+HcZn
         0OGlGqmBFg4P35zreK1+3N0wws4w5D33qcfWMbcaV9fHTUXZHbAShrW8w0Y1d0cfAW43
         7YMGP3VgrW1N303VPrgpLxzKx427zy4k2VpemTmXcPF4Xu6vO6BYfukU14Qh7gr8YPrr
         DTW/xdas/lbAR1a/3c/lXsoXmq+v9oOpzphqQTvD94WNiyhdx9NIUQURaokbK58nHaIA
         CTjsSG+ltmeDbAR45mCnoH775t2++QS3MbAcS093xFcPitlzhRPmFU/ohduWurH0vZ1y
         g6Tg==
X-Forwarded-Encrypted: i=1; AKwUvBx6FKzMTWdmDjSfItlNlZeibocny+wx2Dfqv43Esh9+Ybglhr06O2lDrGJIuLyMiIm1o58xmsrHAhpkedNSkw==@lists.infradead.org
X-Gm-Message-State: AFq9FYL4TqqTerHTYQHae1hkIeH25iubqsJCI6dyNT1vitLTqdRdb+gE
	64kbfPQx+k4oyfqu8tAoaixXzCe9MC2OqiHARK1hkj3JeNUO+MH+Lw/L
X-Gm-Gg: AYBFou2FERgd3O5RsMnRPTj6NTYb1OgyIbr/6oqAvCLV671iK58fhH7cdCDQ4tOor+j
	x8iDp4uOHbLAp3GGgIrmzVnAYP3oexjRmFyYwz3KlwXDq7M0Cau8MjUCScTsAHYh848oIlmc+Ss
	D1v92G/V9/Q8YeLbfZhEhwibqpdt1VutDSZ9hk0HO6BcdnurSZNMnRXxcXiT6EDinntKBz8p8Go
	/Ua4AlZHIux03+ziEeT6n1pWJxd6bjhDliTY9OwvtyTlYxUFZBmsZuXpeKQ8Akazb7FRQZ3X1XM
	DGuTyEahJab21/WVK9RHiH63o2pPOo/85bBZdGpt2aUK02Z9R05R9vNL9qYhXSjM/+rv78F6J/A
	VN603fPNrD9YHRKkM7ckxzFaDXwjuABbkABXjKpzwdUi/bMswkVEmLv6BfBEp9APdQkf1r3LT9o
	0bOvcUXcZbSkmbX8CJbo8EgrxiPbv1tt0uaopxDhxOJxpXB4nLG25e09qLiwQW6lWcol4As7Trs
	PHvNfV55/T/8Hz6+GmNaBYBtRWnN1uKrnQTdvKsySw68c4yqRm4b0TSF94eJ9N5Io9fiDPpJoUf
	0WF+iY12VxfQhoUSomzXaIHK+efdwR7t4I1eP98WMUTNxl1lFUd0USIm74qO1rJnJ0WOSKVWq/j
	4MtTz5nmxwVf5UkMgPIWN7qqY0YwZM0Qa7n3Swi+3wCpCOGsUF5ELzPHyyX0h6SyQUFRAKWXNBH
	S22ogC3Sfv+zQV
X-Received: by 2002:a05:600c:811a:b0:4a3:5d5d:48d9 with SMTP id 5b1f17b1804b1-4ac187a80a7mr6995185e9.35.1793313691567;
        Thu, 29 Oct 2026 15:41:31 -0700 (PDT)
Received: from archlinux.tailbe3ea7.ts.net ([185.19.153.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm89557405e9.2.2026.10.29.15.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:41:31 -0700 (PDT)
From: Ismail Tarim <ismailtarim7@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Chris Lu <chris.lu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Bluetooth: btmtk: fix error handling in btmtk_usb_isointf_init()
Date: Fri, 30 Oct 2026 01:40:15 +0300
Message-ID: <20261029224022.1233751-1-ismailtarim7@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_154134_680851_514B7052 
X-CRM114-Status: GOOD (  15.52  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

btmtk_usb_isointf_init() submits the ISO interrupt IN URB and then
sends the vendor command 0xfd98. If that command fails, the function
returns an error without killing the URB it has just submitted. The
caller then leaves BTMTK_ISOPKT_RUNNING clear, so the driver treats the
ISO path as inactive while its RX URB is still in flight, and
btmtk_usb_suspend() skips killing it. Kill the anchored URBs on this
path, as the URB submission failure path already does.

The return value of __set_mtk_intr_interface() is also ignored: a
failure to select the ISO alternate setting or to find its endpoints
is logged, but the function goes on to submit the URB. Return the
error instead.

Fixes: ceac1cb0259d ("Bluetooth: btusb: mediatek: add ISO data transmission functions")
Signed-off-by: Ismail Tarim <ismailtarim7@gmail.com>
---
Tested on an MT7902 (USB 13d3:3579) with 7.2.11 by forcing the 0xfd98
command to fail once with -ENOMEM through a local test-only module
parameter. Right before the function returns, usb_anchor_empty() on the
ISO anchor reads 0 without this patch and 1 with it; the rest of the
controller setup completes in both cases.

 drivers/bluetooth/btmtk.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 6a48ff0192cf..1b3dab0d10bb 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1741,7 +1741,9 @@ static int btmtk_usb_isointf_init(struct hci_dev *hdev)
 
 	spin_lock_init(&btmtk_data->isorxlock);
 
-	__set_mtk_intr_interface(hdev);
+	err = __set_mtk_intr_interface(hdev);
+	if (err < 0)
+		return err;
 
 	err = btmtk_submit_intr_urb(hdev, GFP_KERNEL);
 	if (err < 0) {
@@ -1753,6 +1755,7 @@ static int btmtk_usb_isointf_init(struct hci_dev *hdev)
 	skb = __hci_cmd_sync(hdev, 0xfd98, sizeof(iso_param), &iso_param,
 			     HCI_INIT_TIMEOUT);
 	if (IS_ERR(skb)) {
+		usb_kill_anchored_urbs(&btmtk_data->isopkt_anchor);
 		bt_dev_err(hdev, "Failed to apply iso setting (%ld)", PTR_ERR(skb));
 		return PTR_ERR(skb);
 	}
-- 
2.56.0


