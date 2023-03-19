Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2F3C7618A
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 14:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mxfg9kgQ8xTY4kfBNMCHJxuv4+U4pmpKqJi9ZEPAVGs=; b=NNRt1NnTrstKQziEC6u/wXHfxz
	ps0gNHjoL+5IpUhd/8JFg/fLZmTEav5hLlF+m5kSG/cMsJhvj/zYNZ6W8pAkqZcJxm5ikfSKMaTu8
	2sk7fuIO3b4dCiD2mT2tTntahf3fdkijTHukyKuuwwDUvFEhqhNU3e0EfucidaiN+iw58YyPABi91
	YINW+kNNj7kPlzgOgl2CFStEdeimVZm1ksdqP+F/dFsKIR0Rdw4jEtkH4MF0BgO21DxzS5N3VOyXe
	PR4XeWPa1Tgs1829pr3BfiZGD2E+tGHzV6WV8BQK+iigEBUWaOpGsN7N8mUx9WLTfLpWbYSyR3U1d
	s1RTv5jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdtke-006qXp-14;
	Sun, 19 Mar 2023 14:11:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdtkY-006qWQ-2e
	for linux-mediatek@lists.infradead.org;
	Sun, 19 Mar 2023 14:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679235063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mxfg9kgQ8xTY4kfBNMCHJxuv4+U4pmpKqJi9ZEPAVGs=;
	b=Abmfty+6siissClr1knlEe7KVj+Vs+6FG0LlKKYh81uLxWnpOmsqxfEnlx2tI8jfTANl83
	KdMfzggPM722JCixpDBGw1PFJi6YcYWrtKMg9dzhmdbLH8ILIRmfUrXVqRKxTJ9fmkg/X6
	UsdttU3bpiimp4Vjvb224MOrCuTY3BY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-AEol7L_lNmWtD2Ih6QcrtA-1; Sun, 19 Mar 2023 10:11:02 -0400
X-MC-Unique: AEol7L_lNmWtD2Ih6QcrtA-1
Received: by mail-qk1-f198.google.com with SMTP id b34-20020a05620a272200b007460c05a463so4482762qkp.1
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Mar 2023 07:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679235061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mxfg9kgQ8xTY4kfBNMCHJxuv4+U4pmpKqJi9ZEPAVGs=;
        b=72Pp5aKxvKmVdyWt7/ENrFOMN3R848BC6Xf2NDCYxVzYbQM/0lwjONF4Cd6e3k94d1
         kbDT5Kt2EjX0q0gfYC+etXZl3AcAgXeDKowQuFsYooGEAcxmenwmxgd4Yb1JkidpAEuk
         HAAZ4FRGan3P51IV5in4h7K/ixFFjuoBz6eROTcXIjIryJm1R3FVbtbs4qtEZCAdTDgS
         SyyT4rzbyJU/rJRWV7s2apaHqbKQjFUZ3BFk8KML+5ZZFdYqpwYW3ZXgvXNrKRtO1HvY
         gc1gEg1/U7xXBRqm06nSkWQpBcIF9abtGrsF6lZgIbT15Dui7f1QxRImgEiMU+ePWEuB
         2PVg==
X-Gm-Message-State: AO0yUKVSVLkW5jg8EPvofzPVBfTfihf3q79oF5WI08Ltw7SIYUeh1vxC
	3XN15Bi5xkE5OcZ+2qgIBjLm7kxG2JSJCoec3o32M1Yb4AsuzN9GFeCbv9GneiYKDS0vqb/1eUH
	XasjzCFEptLohqVHC/kubTocd1eL8DZgu
X-Received: by 2002:a05:622a:1356:b0:3db:6f27:60b9 with SMTP id w22-20020a05622a135600b003db6f2760b9mr11743884qtk.15.1679235061625;
        Sun, 19 Mar 2023 07:11:01 -0700 (PDT)
X-Google-Smtp-Source: AK7set82QnetAWI+F3gcmRcjmUamYUEWEUr1FY8V21h15oRUvVodbHhYtRBiyrHKXmDFomTxkbB5rQ==
X-Received: by 2002:a05:622a:1356:b0:3db:6f27:60b9 with SMTP id w22-20020a05622a135600b003db6f2760b9mr11743843qtk.15.1679235061327;
        Sun, 19 Mar 2023 07:11:01 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id p11-20020a05620a22ab00b0074583bda590sm5492950qkh.10.2023.03.19.07.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 07:11:01 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: typec: tcpci_mt6360: remove unused mt6360_tcpc_read16 function
Date: Sun, 19 Mar 2023 10:10:53 -0400
Message-Id: <20230319141053.1703937-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_071106_956960_583C12A1 
X-CRM114-Status: UNSURE (   7.33  )
X-CRM114-Notice: Please train this message.
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

clang with W=1 reports
drivers/usb/typec/tcpm/tcpci_mt6360.c:46:19: error: unused function
  'mt6360_tcpc_read16' [-Werror,-Wunused-function]
static inline int mt6360_tcpc_read16(struct regmap *regmap,
                  ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/typec/tcpm/tcpci_mt6360.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
index 1b7c31278ebb..6fa8fd5c8041 100644
--- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
+++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
@@ -43,12 +43,6 @@ struct mt6360_tcpc_info {
 	int irq;
 };
 
-static inline int mt6360_tcpc_read16(struct regmap *regmap,
-				     unsigned int reg, u16 *val)
-{
-	return regmap_raw_read(regmap, reg, val, sizeof(u16));
-}
-
 static inline int mt6360_tcpc_write16(struct regmap *regmap,
 				      unsigned int reg, u16 val)
 {
-- 
2.27.0


