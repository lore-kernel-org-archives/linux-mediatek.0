Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA40C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 12:07:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DE51610E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 12:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DE51610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQM0Xy0uZI9k1QkUPr04TW9gufmK5ypZrRebK4ZoFlw=; b=SStxJbp70JmBx6
	UeEQs4VH/k6M0Tz202zvyuUU/CClo0LE+x6ME9msruuSrLuMYpqD1vNqo6joAG4NPPnqXHpPPWIp4
	qH9rOQ7J2laVHuUu8puPBSEzdSL7txxr6R3BqxRnxy8LNTEe7WAaNQHH+EIw3PBGp39+v9JJKbuxP
	+vd98GP7nIsCgjM8KYI17ryspsTNiy6SmD65EcoCd3R5mN1btVrvyqS0qLG2ajAMKhOWoTQIPzwB1
	jMJ3eOE/2j7MpYtwOrYT/tKk2lgI0AKvkhywQnWH40FR34FdWDd1C6lc6LFxymEn4vnc29hm+x0+A
	q6977HwJ5zf8wEfVkZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcnuF-0013Rh-K5; Tue, 19 Oct 2021 12:07:47 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcnu1-0013Kq-I1
 for linux-mediatek@lists.infradead.org; Tue, 19 Oct 2021 12:07:36 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so1808232pjd.1
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Oct 2021 05:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FVIQT82jcRb7GPMNtR+z9+ttpCLcsjQyVlSrcNJwXOo=;
 b=EX+vS61JMITPqLH96+nqUjYjcawuaPHoSesPYtZl1n7rBxiwMf2CPx/+7ad2X7WcuS
 kW8kp5lC6ebvYfNylNrL0KzX3tR0lDDDStyiQC9S9qO7CvZAiy/XJN0LaaebFnT+n3Ns
 E1+rykixHr7OAAQVvKS7e6ZQi53IZ5JY05XqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FVIQT82jcRb7GPMNtR+z9+ttpCLcsjQyVlSrcNJwXOo=;
 b=TM69mJEnOehBwTf4bJnpH2gyEO8hYxCeqJCtK/5Z/+8OY+gAZDxL+DeptSjPbTCUL5
 +GK5vrmK8HyYy8GvO0iJ5Bfpa8s56YX22/0i6On9mZPtr51g93mrid4LCZQm1Lp2DOUu
 CmqyIYn0DYvsMYxUVW6jK2oN8S+OqjMD4NUHtxWnk++Q0DYwW4PFw/rHxnPedYOJMjCO
 Jq+zIoKzQEYE+x91pEr5IpildfEN86KTuWAjsYT7mDJSp/nMjzxwHMbd7dgFpr5Z/Qum
 oljQUOeMOt1+n3CMh06wY7zChf6EuxeC75C/KP2yw9c9XTuAEfjj56dbWQ3ggyiF9rbl
 YGaA==
X-Gm-Message-State: AOAM531eXL6LGHnz/I+Hqylz1Tuu3m79FNGZt+N18/BdqPemTLI95vKO
 LHDwHkRzRhJOQrVlpk1AcfNjpQ==
X-Google-Smtp-Source: ABdhPJzjbEBfYj1NJaCL6KZizsoAX8NL57PBxlOdEyuR5fwk5opRhttrYLoodMKKcptVYabTjzO6Tw==
X-Received: by 2002:a17:90b:4f90:: with SMTP id
 qe16mr6333304pjb.137.1634645249158; 
 Tue, 19 Oct 2021 05:07:29 -0700 (PDT)
Received: from josephsih-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1d7c:b745:dee:c8a4])
 by smtp.gmail.com with ESMTPSA id k16sm5236160pgt.57.2021.10.19.05.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 05:07:28 -0700 (PDT)
From: Joseph Hwang <josephsih@chromium.org>
To: linux-bluetooth@vger.kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com,
 pali@kernel.org
Cc: josephsih@google.com, chromeos-bluetooth-upstreaming@chromium.org,
 Joseph Hwang <josephsih@chromium.org>,
 Miao-chen Chou <mcchou@chromium.org>,
 Mark-YW Chen <mark-yw.chen@mediatek.corp-partner.google.com>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v5 3/3] Bluetooth: btusb: enable Mediatek to support AOSP
 extension
Date: Tue, 19 Oct 2021 20:07:15 +0800
Message-Id: <20211019200701.v5.3.I257ac5cfaf955d15670479efc311bbab702397f4@changeid>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211019200701.v5.1.I139e71adfd3f00b88fe9edb63d013f9cd3e24506@changeid>
References: <20211019200701.v5.1.I139e71adfd3f00b88fe9edb63d013f9cd3e24506@changeid>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_050733_614805_D853ABE4 
X-CRM114-Status: GOOD (  10.66  )
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

This patch enables Mediatek to support the AOSP extension.

Reviewed-by: Miao-chen Chou <mcchou@chromium.org>
Reviewed-by: Mark-YW Chen <mark-yw.chen@mediatek.corp-partner.google.com>
Signed-off-by: Joseph Hwang <josephsih@chromium.org>

---

Changes in v5:
- Let the vendor command in aosp_do_open() to determine what
  capabilities are supported.

Changes in v4:
- Call hci_set_aosp_capable in the driver.
- This patch is added in this Series-changes 4.

 drivers/bluetooth/btusb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 87b71740fad8..30c63031592d 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3876,6 +3876,7 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->set_bdaddr = btusb_set_bdaddr_mtk;
 		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
 		data->recv_acl = btusb_recv_acl_mtk;
+		hci_set_aosp_capable(hdev);
 	}
 
 	if (id->driver_info & BTUSB_SWAVE) {
-- 
2.33.0.1079.g6e70778dc9-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
