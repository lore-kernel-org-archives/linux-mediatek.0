Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0795EC56202
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 11:54:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 849E520857
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 11:54:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3UR8MBHv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxZnp9EE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 849E520857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2k0SsK140AqktlLMh8IyIydyWrbR5Rhlo5iJePVshR0=; b=3UR8MBHvaQN2wHp1Vwws+Q3/nc
	qALUxU/QKJgqqHlpZoFtUKSJfRZURuVBya8grda/UYHpGB6A7wGGhy1x6h1yCK2N1/H0ITEH6Xrrt
	vr2LIoGh+RVIOU3TDeTmfZdZujK2CrmGIp6YPXazFdNZpWD8wVSPx+OLiQD4EGeXHlusYgS5G3zYr
	81kDKSNdS7pz6MwP0g93rcbsR/Sm/Y/FI4samrFSm4gSF6ZS10B16lzM8iAcxBNAEAbrzmPWXR/k9
	bGdb+Dy1FuXxIFR3758SP1dUXhMlzHF/h9W+FjIA4DYpkQteT0QWXTxcAdzh/lAty5LLONZd+uUIj
	dDRdgr0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiFqy-0003v0-8H; Thu, 26 Nov 2020 11:54:24 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiFq1-0003cP-0Z; Thu, 26 Nov 2020 11:53:27 +0000
Received: by mail-pg1-x532.google.com with SMTP id t3so1546201pgi.11;
 Thu, 26 Nov 2020 03:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tYTwl9UyzE7O08dqCyL0rs00lmC5U5Wi10EjecyWl6k=;
 b=TxZnp9EEKj1GWsDhJ5bzUL1FFWUksdJ07SGVOVtK+eUCdtflTx0DH0HP7AKZo1xXge
 /TCVIn0JjeLSjRTE1QKN9PjjisDUtrnX2vJqr31endeGW/DnYhKCBbNk9X5uMt/51mQf
 Pgz5XuYSOJRvFbpNu3sqUj2sYiZlifdvH3iGlPGUKbKp3mFY6kEZliIkrE1sOBba53vd
 OV0fjKiZlW8HIsadc7Apus3je37TVR5KfDrJxsrTB7whvI9hS6QC8i8U503vGBxKsxHa
 hC0HNy6DiOo7g5RN2KL6qz7g32MNtbnEpB+whrpbXWcvhMKIAyEdxV+StiW2M7Nw+jEp
 1ukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tYTwl9UyzE7O08dqCyL0rs00lmC5U5Wi10EjecyWl6k=;
 b=P3lCR3YEb+9//GWzfKv6x5URdB0hGgICrXlx5ZXzss5DKGYbKF3Mv74Lx7XcKNPcpn
 DgQkVKMN4jPJphtif/L9pyCrG3igVzjnBG0kOVhJ7s7Rxo5eSz93bqWM77biSwZLl9gp
 s/9zioxm/GMqYfEzOtnyOp0VcfEYJf5C8WNQSPUz5pUH3YOw3VG8Eig2N6kNOHJtC6Vf
 GOUaqoRhpvhCeYJSsFKD5qHgj3C6nLmAeA1ph1dEBWpb4lZiokbbS/40mKaPqYcPgfDO
 LkEbALvznhvzUQ05qV6oZOxkmFgHpPUVgvpu0PPHCbjuBN0VHE/GZKSbMoUU8UowO+rb
 WiWQ==
X-Gm-Message-State: AOAM5303Bp55B3qTuuV30uK9dgnB+6SIY9FNRshf1QfmqK+lsr9csLip
 jrSY3+RWSACgdakZ7hfg/Xw=
X-Google-Smtp-Source: ABdhPJx+KiR9rXRtoRf1/iQ/w47KqjvKuGz+YtSpLuqMd2uSMB9voMZ/xGsHYbw/ayXrIZchFpysTQ==
X-Received: by 2002:a17:90b:1918:: with SMTP id
 mp24mr3135741pjb.45.1606391602773; 
 Thu, 26 Nov 2020 03:53:22 -0800 (PST)
Received: from localhost.localdomain ([101.10.31.14])
 by smtp.gmail.com with ESMTPSA id r4sm4721617pgs.54.2020.11.26.03.53.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Nov 2020 03:53:22 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v9 4/6] dt-bindings: leds: common: Increase LED_COLOR_ID_*
 maximum size
Date: Thu, 26 Nov 2020 19:37:32 +0800
Message-Id: <1606390654-6075-5-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_065327_111592_888017E7 
X-CRM114-Status: GOOD (  13.50  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Increase LED_COLOR_ID maximum size for LED_COLOR_ID_RGB

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 Documentation/devicetree/bindings/leds/common.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index a2a541b..0c9f912 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -43,7 +43,7 @@ properties:
       LED_COLOR_ID available, add a new one.
     $ref: /schemas/types.yaml#definitions/uint32
     minimum: 0
-    maximum: 8
+    maximum: 9
 
   function-enumerator:
     description:
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
