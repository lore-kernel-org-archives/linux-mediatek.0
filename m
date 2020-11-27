Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7DDC63697
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 03:30:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9319520782
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 03:30:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N3CNz+oH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXm4xFIH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9319520782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlZFYrRcf1yvE16jjLKc04sb1sp6mDfUaah22JF7/H0=; b=N3CNz+oH0w9J5zKH7pwxs0evWe
	XbZlfT4c3WkH0amJ1KiYsS+rY/PfoNMhGsRpxoiwuLzAU7Fl/H6Gpg8+Zz9TMvHrjHfpR2/bGMY9i
	ELIauLN9Oa8HE97KV0XmG5BVt3goRV2Xm5s5GPlCr+pyE0vuM1hHfBQ0MF47djggLgjBpZnNmMhzk
	sFyvMauECYWGn7EE0ZzWC702Wbf0/dWAsj/eGE53qa9fzF7mjer1eivfNh4jZ35Xfu9uFNDMuaMSe
	GkngjU5EBDBuTM7jzxxiW/lcgLbIHeO5VtrUmgRjfUh4Z8sb8IX3JjYuu+yRr9L0mNHv6BDfcH4k+
	1vTnIWUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiUSR-00024B-UM; Fri, 27 Nov 2020 03:30:04 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiURl-0001rD-Rw; Fri, 27 Nov 2020 03:29:25 +0000
Received: by mail-pf1-x443.google.com with SMTP id b63so3247766pfg.12;
 Thu, 26 Nov 2020 19:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=u27cmgElzByD9jBdabnceyA3iNbSV5QTjACW/k5nwHo=;
 b=fXm4xFIHdwcdMtvxr89NGvdeVIhpQRN3GeHL22pvKRJAntZtwKKkNJpesqZCZOjx3m
 np65TuSEcp0/Jz/lr1DFy8eGsdR1VnfOWbHv9JeH8NnBqWPxelpQi3H8oeU3Xl6YMSHG
 iaCaJkr8TeOG850w+RaYNbZrkYd9EVd5IUadWNtgwwy/1ecGI42mMe1Glgn+tX+51epG
 kEP2osm1qxzOSxN1IoybQUyD3UJHQSRmAzE/zS8vekscBhRciqb5slU6/EXWbYuI4yNI
 M/nG4LgGKTwmwgq8WvGXU22Kbk+lu6f8t+vxpPOZEinU56uZXFkYy+P7GtSHaLWE6a5P
 wrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=u27cmgElzByD9jBdabnceyA3iNbSV5QTjACW/k5nwHo=;
 b=AoKYoPJTXLRNFkcdnSmiZ9ioCpHjoAkz5xDndCiZc5i9z/qLU0836iNBwIovv0i76F
 imMtIF39PJsFFaAunFNRZ8CsOUO9bCNnz+QW9S1bGDjgLkDOTDHoEovJFWL64H2IKYm8
 Ey4zl7lRkj8SPwWJGi8NUDPRUJJyLUD8VPfDxuS2TqC/VXPmHCI8NI8HzE2BihYnDuxc
 tmaH+wt9oHD6i0ZKv94h61xEJfK+08e8/V9FFQBSEQEWVIoU6TuzvLH7OOBcLBK1IuoD
 LXxvIq0NvIbtvCfkG0vHv8n6LHOH4wecY16TTqna+BFUANttKtyYYAhoKR5CLHS+dDXn
 gHpg==
X-Gm-Message-State: AOAM531wFOPtgIxt2apOOgvIDcb8ObCLk3t9hebxBXupaXCCax7sqi8K
 gyJ25HWDEZNjhfZvYho1QfM=
X-Google-Smtp-Source: ABdhPJw21pCcsmVQlLorPRAbz0QycKLe+GyiIW6goHtRMOD339aLc4XGL7UVDGC6T4wqJBKzOFDuoQ==
X-Received: by 2002:a63:fc5b:: with SMTP id r27mr4950162pgk.100.1606447759860; 
 Thu, 26 Nov 2020 19:29:19 -0800 (PST)
Received: from localhost.localdomain ([101.12.27.127])
 by smtp.gmail.com with ESMTPSA id m73sm6063962pfd.106.2020.11.26.19.29.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Nov 2020 19:29:19 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v10 3/6] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
Date: Fri, 27 Nov 2020 11:28:53 +0800
Message-Id: <1606447736-7944-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_222924_633494_6F99CADC 
X-CRM114-Status: GOOD (  12.53  )
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

Add LED_FUNCTION_MOONLIGHT definitions

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 include/dt-bindings/leds/common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 52b619d..843e65d 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -78,6 +78,7 @@
 #define LED_FUNCTION_INDICATOR "indicator"
 #define LED_FUNCTION_LAN "lan"
 #define LED_FUNCTION_MAIL "mail"
+#define LED_FUNCTION_MOONLIGHT "moonlight"
 #define LED_FUNCTION_MTD "mtd"
 #define LED_FUNCTION_PANIC "panic"
 #define LED_FUNCTION_PROGRAMMING "programming"
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
