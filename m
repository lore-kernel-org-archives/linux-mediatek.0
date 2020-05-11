Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8EBC54E8E
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:13:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70F3220736
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:13:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GDy1OzqO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="yQRdWTUU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70F3220736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sngaemU/3Se52h6KXqzr83WluU8zngbXFcsvHfUmVk=; b=GDy1OzqOySXgKu
	VM+BdeM55pllkYqUZm3poyOSVMfDm4G2SSeZstAz6ZEddHqAISeyb9KIFgrlRvI3rJ6+3LzaiZWMJ
	fa9kbtmSUYeTYUhwzSG6tzDHcUOs0EPyBAz8nnf6/tBsqoT3HYobMVOmZdbJ0yPMHy0ubZqeriNLh
	TgrGrLe0Apkz1kgKRKyyUU1gSngyArKVwIbcNz9Atq/HCjo6OEh8nspj0/aa7bKxVIjzSGj/0/7W8
	0KY5c9kqE428g0y8Hxk2eRE8sZyOb60DCIJJhRIFKmrN14aAqQxtbAs5m/F2GiOeVWZKe3QbPf+ZF
	JS+8DpX18S7vBlopwvlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYA71-0000uZ-EU; Mon, 11 May 2020 15:12:59 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYA2m-0002eu-GQ
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 15:08:42 +0000
Received: by mail-wr1-x443.google.com with SMTP id w7so11418289wre.13
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 08:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A3BhZ5w2nZuK3+ZudhXc+00fKQMrXVNQ6trbR5U2M5Y=;
 b=yQRdWTUUY8BtpgYf0O6+JxCpTQQ7YY5DMoBHZh8lfcBtgFmcmYRFvaqU5qMeGhFDWm
 CDpXAd4jp+N5aZunI52e7jbDLHpfUyC9o5by8J/55R1jm0qIu1qYfQvBHJO+tNsKWB1p
 AolpfCzCBQBM2ESWJvao6fiQ/CS9fG2NadGPhDtw4J3JQ2dJL7QuxIM/MknGHbUu5wIv
 wZY8Yr8s+nmwW5TODaI1j7Uq9uLSRlxnSfYy5+qg50Ah1fgmd50NMNW6QYL9yX70K7E/
 yGbZ1CcIgQcQCmmebj6kZ2+Yp5FhiwtSlR45BZow7MfGMl2dI+79rr2j+m0UEUkUaGdI
 +pjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A3BhZ5w2nZuK3+ZudhXc+00fKQMrXVNQ6trbR5U2M5Y=;
 b=GYYOXkAa3K84EAN233UKIlJjs2uVyaIPuVU2adiv75o3PFNU2lPbq9Y3SUPAl/jFDp
 mPP/tbrdHkc4iLP2hjChgPPy5fC+PT699q/0VAGgzAhb6creU55e5intPXa2ZeEMt7Zs
 DuaCdW8A2ZZ0SgZa6ITidG69te6XXE0795Idt1s7Y5Vh44jlyEFvHIEBUjY16VjfUIqj
 LZJO2dCxINoNXYHouHOFIXyuFuTyCv0gnVwzUUODx3AARF+1wzVM02SM526nT8KdRn13
 IvkUCuduNNNOyH+nM+CrqYlwU1tT71TJPQVhyDuEwwsAEebSUIe8PAHgk9i0AvMjIlBl
 W6eg==
X-Gm-Message-State: AGi0Pua++kE+ilGvdLThT9PabnftIVlmRXRaEqWmP/PfwDa3tsDFHdN9
 IukAXfCqLaYhupEO6rESq6MbRQ==
X-Google-Smtp-Source: APiQypLYCrKbbP67ZuW6k/GvCnVZzqnJrj+rFWSiKDfJIOmzuY0m86IY8Y+0AfqHvjKqDVcpGVV22Q==
X-Received: by 2002:a5d:4f06:: with SMTP id c6mr20552983wru.12.1589209714391; 
 Mon, 11 May 2020 08:08:34 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 94sm3514792wrf.74.2020.05.11.08.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 08:08:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v2 10/14] ARM64: dts: mediatek: add pericfg syscon to
 mt8516.dtsi
Date: Mon, 11 May 2020 17:07:55 +0200
Message-Id: <20200511150759.18766-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200511150759.18766-1-brgl@bgdev.pl>
References: <20200511150759.18766-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_080836_807240_0E85C5BC 
X-CRM114-Status: UNSURE (   9.40  )
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

This adds support for the PERICFG register range as a syscon. This will
soon be used by the MediaTek Ethernet MAC driver for NIC configuration.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index 2f8adf042195..8cedaf74ae86 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -191,6 +191,11 @@ infracfg: infracfg@10001000 {
 			#clock-cells = <1>;
 		};
 
+		pericfg: pericfg@10003050 {
+			compatible = "mediatek,mt8516-pericfg", "syscon";
+			reg = <0 0x10003050 0 0x1000>;
+		};
+
 		apmixedsys: apmixedsys@10018000 {
 			compatible = "mediatek,mt8516-apmixedsys", "syscon";
 			reg = <0 0x10018000 0 0x710>;
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
