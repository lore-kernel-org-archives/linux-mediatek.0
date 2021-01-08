Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAD4C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 02:52:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E3EB23603
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 02:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E3EB23603
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IMWCI1swu4sPYGhRG7N5aaIhoqgjmjCPBnI3+VHy4WE=; b=dO8S5Re94E0/vmZ5r047FA97m/
	quOhFNBkEO6XHh1+64bbMDe93A09m9sWsI3duDC2htmmufx8YC35OY4EgGws5MbQuRD0LNxtlFXBT
	CQ5h4RdbJIemq1z2dfd9sdA4gjG1eAHY4h16NNUezkl9B3Iilb+zcM2QlruLk6SsyObk4u53mlifb
	i8ac8WBqEZ7PTJgiCYvK2RGjOJw2fJ0p21qRB38nevxdlujV6oCz/+44zOB/qoq/i7O8rORDQtkWr
	VymtsV3bgZQcgIZsGr+LUBucnlKncLJNnpyksUOYQKIcZdrngNahujC3r5JpunPo7aMCK9ruk1Fl1
	WslDaKfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxhsu-0007TS-Rf; Fri, 08 Jan 2021 02:52:16 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxhsq-0007Rv-MA; Fri, 08 Jan 2021 02:52:13 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2so5325274pfq.5;
 Thu, 07 Jan 2021 18:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PQO8vJwSx7HHkUDB54L3o6TvWNWFoO4uiodcnxSDlcQ=;
 b=X/AAyuJPU+5BF0P70BENerkQ7fsoiQwBujnVb/DQLxNbz1PPtMezpk5ReCf/OJKQQy
 f4bPc1u3OHv/y4tYs6HpwW77XZvz3oaL8PpNPggwD9t7QroceJRn6aAT0DlpL3fKmt9m
 Kc2eEwKEnuIJFw8ojiF0UiZqJeFc277BnZZPvWXczvmiW79m1x2MqcGq6I8lWYpS91L8
 s3gZtJOUZD/CET29z2o6rPTikBdhxrk+Z3p2zjjQClk91guj9+5j2Oq7QEGLXsVaIwXK
 uVznU6511s/FXwBle7HhugF3yj6NOEB2U6jJRJV8N4XJqnJW4oR7E/hb/gvJy4gDt+8R
 WXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PQO8vJwSx7HHkUDB54L3o6TvWNWFoO4uiodcnxSDlcQ=;
 b=O/TgkMhhebQZLdK1m8PHp0p9r0vb9xB7iL1dc7VtnHI0yNK26wtRU91xfHakmGCUlN
 vX68yjXLG6ZXYme8361mra/Br9BdV+xoIRZWDOBNnyTULid+QwAFJannw90UkbCogIY0
 QzcYW7yrS5SoCRVAYsD3HhQNbnQlpst8bKXY3K8oEv8fMxGDVl8iRgDUBcjsivHPEzhZ
 0mgOcZWZzYYs54MadczwrfQ1dNC7Fxp673tX3OmU8zhg+LOhJYziJKU1Gikncv/w2pWE
 l4X49Z0ljSADefoDgT/9lGNuhrL35zDNaWlTWq/7ADVjspQdaj4hhhTglU1lGzZvLLYW
 Ca9w==
X-Gm-Message-State: AOAM533+tjKGq3GbW2rX9exDHTTEvldc1esQrSMBCFVj0wrn1a7Qagv+
 P0pIrP0I+m5ncPHg9Ph1QDM=
X-Google-Smtp-Source: ABdhPJyh26fX5mM3v76uqsyxr5vX4CHgh1u6pP0ycZZyqGqjd0a30WyALlIup4JtQsrUxrFORhFF2g==
X-Received: by 2002:a63:3049:: with SMTP id w70mr4782475pgw.224.1610074326364; 
 Thu, 07 Jan 2021 18:52:06 -0800 (PST)
Received: from container-ubuntu.lan ([171.211.28.197])
 by smtp.gmail.com with ESMTPSA id z2sm7641230pgl.49.2021.01.07.18.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 18:52:05 -0800 (PST)
From: DENG Qingfang <dqfext@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Chuanhong Guo <gch981213@gmail.com>, NeilBrown <neil@brown.name>,
 devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: mt7621-dts: remove obsolete switch node
Date: Fri,  8 Jan 2021 10:51:55 +0800
Message-Id: <20210108025155.31556-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_215212_736225_4AE2E629 
X-CRM114-Status: UNSURE (   9.34  )
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
Cc: Rosen Penev <rosenp@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This was for OpenWrt's swconfig driver, which never made it upstream,
and was also superseded by MT7530 DSA driver.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 5b9d3bf82cb1..42e8ec72c3cd 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -497,13 +497,6 @@ fixed-link {
 		};
 	};
 
-	gsw: gsw@1e110000 {
-		compatible = "mediatek,mt7621-gsw";
-		reg = <0x1e110000 0x8000>;
-		interrupt-parent = <&gic>;
-		interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
-	};
-
 	pcie: pcie@1e140000 {
 		compatible = "mediatek,mt7621-pci";
 		reg = <0x1e140000 0x100     /* host-pci bridge registers */
-- 
2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
