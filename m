Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8BBC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 11:45:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2F9B20657
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 11:45:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oq+raAri";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="G2HzL5rd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2F9B20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mm05YctDaTKfxhzeAi5RFa5kwKELVnbSMnJaDiTpAWY=; b=oq+raAriMBBemT
	03692dovvqr5RAT1i/fGm8P4DOmXOqJT/OjzTDB6X+IkfK31qMJxhkFpwnezwSjBvmiqCtp4UXPxW
	kVL1xDPG1mcFhI80IfsPMnAMEf3sovYaYYR5XCxk42abEYfg4KVe3Ln3dPS4Q4Dg3MiNVL7DXNEeo
	TKVuk/NyzbpycdbPgvmLrIAYnjycK17psl+ZYQ9TNCWTEJ28DNscOyyIxMqMZ9pu5JrqDgKtXHupr
	ujxjGuJ3gxay1JhwjgjCHT39r6Afc5+ssGGVnS4NaL+8OTDNEAkLD4d0mqRV1bsJok0JCbg0pdPWf
	3S5XFRjlGZ5M875eoF1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbNA4-0007AK-R4; Wed, 20 May 2020 11:45:24 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbN96-0004D1-TO
 for linux-mediatek@lists.infradead.org; Wed, 20 May 2020 11:44:26 +0000
Received: by mail-wr1-x444.google.com with SMTP id k13so2830997wrx.3
 for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2020 04:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v4BoYkqJ2NsZ2nSSjChgUqJJCyqhbfFRrbuVJ3n7szg=;
 b=G2HzL5rdxl8gOOIQV4qlZMw3KWQcZxPW/z+oED1akrqOkokebIn2QxctEc0qMGDENR
 fnBBgU7agpoX1odvaMiQMUaCWrKwE3w7DwOPyGoM5q07zcNglYB1JReA7BQ9Lnf7Ho5N
 X+dwG8oPPExdKj/4jVBNByIeraaDXpT0uVTtEvtSUeuC6Pe7J47V/bSYcOkQD87Jaqdo
 gvrlYFLb2bO/N5ysRqcO1/aOVVirM77Zra0to9qgOQxKpGhC/2rl6GcazkmeCMmjTo/U
 ofBPPKGz0CMTClSICNtkP+NiGp4om1xqGgOZGmUe6v7G9i3pjDQcnm4Hty7lEAXw6smR
 10vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v4BoYkqJ2NsZ2nSSjChgUqJJCyqhbfFRrbuVJ3n7szg=;
 b=roF98d4RlMRIpim6U6EGc7YP0AJbnT9I2t2JkDRtyFMWu1QwxIm/A9X/7gfXCoxMRW
 KOT+b4gG3QNKpShgfIJjyYrR5hk5fs4n3MgyglgThmi88iD0vxVEBBuhzi72c7k2fRxI
 ThEVIDtyBrtOfQiNFMeA2lnx1uhf/952FCI3xZA3xqhKAhN/rzyozHer6JZqHsot3U6l
 jXdP+hhb/VnilIlutn3RGWZB3ARl488aBJ0tbTjXuA8/6/e7jyc5zZf50Y/0wlSTogOF
 AxqXl5MsP6mn37xRlgERtVjPJFH3ER20JyCPN+A6XhcaEiD6ZLjL+TDY9ToMBrPOwqt4
 G4uw==
X-Gm-Message-State: AOAM532J52Y6T22zwY40d3Qzo5O4iZgb1+bVNaUK6ydye/pTivZaxs5m
 SmyIPFJJRgAjwx0GkYKsfqTrvg==
X-Google-Smtp-Source: ABdhPJwCKG6qiFzuF7aH6jSWA6csbzJ8395j7lIhL5oX0eAbSe/2g9fc+9TJo6lUPU9TiTHyfgaB9g==
X-Received: by 2002:adf:afe9:: with SMTP id y41mr4193800wrd.56.1589975063620; 
 Wed, 20 May 2020 04:44:23 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id q2sm2530782wrx.60.2020.05.20.04.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 04:44:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jonathan Corbet <corbet@lwn.net>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH 1/5] Documentation: devres: add a missing section for
 networking helpers
Date: Wed, 20 May 2020 13:44:11 +0200
Message-Id: <20200520114415.13041-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200520114415.13041-1-brgl@bgdev.pl>
References: <20200520114415.13041-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_044424_944446_5AAB7781 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org,
 Stephane Le Provost <stephane.leprovost@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a new section for networking devres helpers to devres.rst and list
the two existing devm functions.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 Documentation/driver-api/driver-model/devres.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 46c13780994c..50df28d20fa7 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -372,6 +372,10 @@ MUX
   devm_mux_chip_register()
   devm_mux_control_get()
 
+NET
+  devm_alloc_etherdev()
+  devm_alloc_etherdev_mqs()
+
 PER-CPU MEM
   devm_alloc_percpu()
   devm_free_percpu()
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
