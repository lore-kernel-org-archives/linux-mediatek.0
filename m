Return-Path: <SRS0=cpQ6=JW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2E6C433B4
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Apr 2021 01:53:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32A7261490
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Apr 2021 01:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32A7261490
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNLnBO5TSr2twcQje+6OLIu0KzoHaoVIo8/SjXeP04E=; b=oGyubqcSSbC9YwsdXtRFPw/7cU
	n+gEROcICejgAPw0mevmwKA+TsHmRA2xIGhFqO6rWPKpdrM+AjLsfhVXALqjg1TS5Z06yeIZGJ0qR
	am0S/VPn8RzMz7xUKiryX6OpghaIN1XYu91+Q4PTUWH54XbjnT0yXw71KZf9r2SpExS/ir+Lcw8so
	uQtufs4AWztLhZivql78/gzZ89QgRp/ShUrbbz0/79SmEb+ewkMvf2htgxMHEMm84myDcW0S1SphK
	7vXHCP9lWKnr45SIhdJmC+1Eq3/zo1BwACHntFr7YHQuWPdtKZYtpyfY9/ONjcG4BtSSebOGVO7IN
	X1lHdJrw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laTxH-004ocu-CH; Sun, 25 Apr 2021 01:53:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laTwb-004oZk-9N; Sun, 25 Apr 2021 01:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sF3TYttvqDC+eXilc/crk4dkuMmLh17J6dvFL/UUtGQ=; b=nqNBXMOxcJN1vh3gcp9H5XnNWe
 Bue3iVov4W2gVs9jnWuSuhALdUS1Z9nGRlU9b8teSwbbmKnpboeeggUNnaMtyjA0XUrcFtcAc5K1e
 L8o86rQmDIBfv5eqvUjHJ6Tjzm8qvuuMMc7N4Mecx9g/nNJB7JxR7cUK7DTUaoRm8dgxqVZShzWGs
 BhAR/rWTxOKgy1kC4uuFSrOwT73lOmeQFuvFzGMOANQmw1oBPsq3eux13O4zaxNKwxxO1qK7mM7Q5
 DW0cnOa88/fB9SVuMzEouwYIVmdF1UAeRXb3XdqjLpojio6/EvccpTA/q26kw+99Y6i93SBzx9RhB
 RZxTwflQ==;
Received: from mail-m17640.qiye.163.com ([59.111.176.40])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laTwY-00FECQ-N0; Sun, 25 Apr 2021 01:52:20 +0000
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
 by mail-m17640.qiye.163.com (Hmail) with ESMTPA id 1065E5401A0;
 Sun, 25 Apr 2021 09:52:16 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>
Subject: [PATCH V9 2/2] doc: mtk-wdt: support pre-timeout when the bark irq is
 available
Date: Sun, 25 Apr 2021 09:52:07 +0800
Message-Id: <1619315527-8171-3-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619315527-8171-1-git-send-email-wangqing@vivo.com>
References: <1619315527-8171-1-git-send-email-wangqing@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQkNOQ1YYQk1MHh9OH0odTRhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PAg6Ojo5Mj8XHgNDIh4jVg0D
 Ey4wCjdVSlVKTUpCSEpOTkhNTE9OVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISVlXWQgBWUFJTU1KNwY+
X-HM-Tid: 0a7906ba320ed995kuws1065e5401a0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210424_185218_921588_888F4E09 
X-CRM114-Status: UNSURE (   7.88  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add description of pre-timeout in mtk-wdt.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index e36ba60..8e27777
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -1,5 +1,8 @@
 Mediatek SoCs Watchdog timer
 
+The watchdog supports a pre-timeout interrupt that fires timeout-sec/2
+before the expiry.
+
 Required properties:
 
 - compatible should contain:
@@ -17,6 +20,7 @@ Required properties:
 - reg : Specifies base physical address and size of the registers.
 
 Optional properties:
+- interrupts: Watchdog pre-timeout (bark) interrupt.
 - timeout-sec: contains the watchdog timeout in seconds.
 - #reset-cells: Should be 1.
 
@@ -26,6 +30,7 @@ watchdog: watchdog@10007000 {
 	compatible = "mediatek,mt8183-wdt",
 		     "mediatek,mt6589-wdt";
 	reg = <0 0x10007000 0 0x100>;
+	interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>;
 	timeout-sec = <10>;
 	#reset-cells = <1>;
 };
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
