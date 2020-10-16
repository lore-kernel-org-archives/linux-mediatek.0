Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF8BC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 03:03:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02AA720789
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 03:03:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pcbLw/sf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UG+OFdBf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02AA720789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k+iz8uS54LKOFBQkA3QpJNZBlAknSG1bAjjiQ7kpKDM=; b=pcbLw/sf9bGf2qB+FjyIDlhGCQ
	FxFRWv3/j0cOmZVms5xAo9C5KO5BrbwOtgmwvXFgSnTDJxn1r6LwFb9CMfSrQ8jrDI6+oqB8wsRar
	5wx7Wq3gEn/ZxhxpMHEMMz1S0QqoYX6BO4cWJi2UzLvzKMHouipiXuNNBxd83z8s1j9vl4g+8FgiO
	TMrQNfW4FuSlECknrFM/+rOZIdlniuYQYMQuA60/2X+GpfbwLuhu7LY+3L5GS7fEFdlAHgQRU9rKx
	VvxCZAbHGIMcXvJ8xC91ymjpA5uZbHbmshVjaqhEYWDijLDtnAfsKS1KcN+Pxy9zCV17mCxls0Q/T
	lvpfXO7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTG1F-00062o-EF; Fri, 16 Oct 2020 03:03:01 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTG1C-00062R-S0
 for linux-mediatek@lists.infradead.org; Fri, 16 Oct 2020 03:02:59 +0000
Received: by mail-oi1-x241.google.com with SMTP id s81so810885oie.13
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Oct 2020 20:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=McYZZik4fIHL0VEeWhKi1o+kiNuK7LpqqmBBnYMHOL4=;
 b=UG+OFdBfdcOPb4hcq9ram7HV+hj/jj9uvNXAKIZZktB5iqzxxgpv/p0IMCsDbfV7SC
 KMPz4oQ7hGa8eLYAaKacDgghYC+cI7Zj2kX5BxhM1YMrV0FyzeOqD6TdwLeneqIFXeV7
 hI14EPeM+JgFoAxWq5fDvbYIhqeY5yW3zsLqLU9/x6Au8v03y2XLjZRX9mz1l3jJgpPw
 Y7p91KqZtMbxSVULE+lASrhPJNlC88gUvnzQ0I2ji0YMVeimup1RWBBmH9mEhbCqPIVD
 djme8SgwRz5pItH/9NBTYHS4MdTL77OVDkrhO5DSEBb0wZeGCJMCjIwxgp6a6WKh2o4V
 6D3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=McYZZik4fIHL0VEeWhKi1o+kiNuK7LpqqmBBnYMHOL4=;
 b=XRN6XetQGTSyx7jTxKADtpahp3ySE4+9aqeVQiNW99G6gHPssJ9CrwGcVHG56Tbisl
 GZznSUXBeiXUOxjfPMNblscC+DafEoG4u5hSNN/7nY6lBDX+Q5EI3vu078ntAmq+7Un4
 kAxOtS8NjCjwOX+NmFrMKDK8YY7AgTRHj/pMdnYy7Fg5m7B5LeieDONy1h8tDecIo5wd
 0jBS2nhw8J4kWUT1N8akhBrhKNAv+nENnM6H8hnH7PJgJPqH1gqwx6WyTLRnWrcjRJkm
 FFTdW6LUmoShWpwJPl0GZfhNfXBtIPTo6QWkNvngKtXA/B8HB5dCgYdg/klhKbutVgnT
 NoVQ==
X-Gm-Message-State: AOAM532tjouAu8Rq94CJv+/itSej8tIb9X1gDXPojLvGrxUJ2rAOv8iU
 5BKXRjFWWwohg8Cb/i7gTlY=
X-Google-Smtp-Source: ABdhPJzMbKPMOT8ic7315SSWAFHBV1F39iCs0xE1BAB4TIwDF8Th+O8Mmbc0MCwoFjpr6La5yMAeOg==
X-Received: by 2002:aca:7210:: with SMTP id p16mr1061996oic.77.1602817375546; 
 Thu, 15 Oct 2020 20:02:55 -0700 (PDT)
Received: from localhost.localdomain ([170.130.31.90])
 by smtp.gmail.com with ESMTPSA id x15sm601662oor.33.2020.10.15.20.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 20:02:54 -0700 (PDT)
From: Forest Crossman <cyrozap@gmail.com>
To: marcel@holtmann.org,
	johan.hedberg@gmail.com
Subject: [PATCH] Bluetooth: btusb: Add support for LG LGSBWAC92/TWCM-K505D
Date: Thu, 15 Oct 2020 22:02:38 -0500
Message-Id: <20201016030238.1033559-1-cyrozap@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_230258_954087_D599A43F 
X-CRM114-Status: GOOD (  13.36  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Forest Crossman <cyrozap@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The LG LGSBWAC92/TWCM-K505D/EAT64454801/EAT64454802 (it goes by many
names) is a combo WiFi/Bluetooth module that's used in several models of
LG TVs. It uses the MediaTek MT7668AUN, which is already supported in
btusb, but this device has a non-MediaTek USB VID so to get it to work
we just need to add it to the list of devices to probe.

Signed-off-by: Forest Crossman <cyrozap@gmail.com>
---
 drivers/bluetooth/btusb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 5f022e9cf667..58259b6a43c7 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -366,6 +366,7 @@ static const struct usb_device_id blacklist_table[] = {
 	/* MediaTek Bluetooth devices */
 	{ USB_VENDOR_AND_INTERFACE_INFO(0x0e8d, 0xe0, 0x01, 0x01),
 	  .driver_info = BTUSB_MEDIATEK },
+	{ USB_DEVICE(0x043e, 0x3109), .driver_info = BTUSB_MEDIATEK },
 
 	/* Additional Realtek 8723AE Bluetooth devices */
 	{ USB_DEVICE(0x0930, 0x021d), .driver_info = BTUSB_REALTEK },
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
