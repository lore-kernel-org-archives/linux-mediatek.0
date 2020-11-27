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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46174C63697
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 03:30:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB71D20782
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 03:30:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X4q4++RH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smbUOLEN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB71D20782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2k0SsK140AqktlLMh8IyIydyWrbR5Rhlo5iJePVshR0=; b=X4q4++RH+T2sV1s7/GlvygBOEz
	7aU9XtBE4DBYM+TyK9CHx8hHXKxohp9bu/N6UyrZvyW62/wPDY45cCQFqaCAUinlBjfjFEVUm+mSt
	Kp1NnY33la1j3OEF0wqKgYCOwBhRinc0rm+gYbf635lqw2fJYyhUDuLvmgor0BTMWoeXXDbOWEnDg
	TdAl03udGhXOoWODRF4nTdRGDlC6YGMSZ8qGlVzJ4pjbh9rYfgx10G8UjaKXmMxn11TZaJwNJX5Ru
	9X+uf0/vM3W0j1Vm0XqBxsLSMZUuo1gRb3CNK3UOhHOGjS6h3y0+NtkH5dPYkfBBMR2SycLXze2W5
	VxpgzFSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiUSm-0002Dq-PM; Fri, 27 Nov 2020 03:30:24 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiURq-0001sM-Jb; Fri, 27 Nov 2020 03:29:28 +0000
Received: by mail-pf1-x435.google.com with SMTP id q10so3295321pfn.0;
 Thu, 26 Nov 2020 19:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tYTwl9UyzE7O08dqCyL0rs00lmC5U5Wi10EjecyWl6k=;
 b=smbUOLENdjxCXbV0m17KXUVQhGYwCjoW20xk+63OI+k9fDoSFz05dZoYU4cC+AmiH+
 yCi7p/PevJvHYi+RsbR7xSNZmWxFX5YjAc7oJf9GiQMlGpC5i9cs9D947L+ui1r7i5N5
 weHg69bTym00c8JFgw9+ciDFHapieXs3H4U5DCuIJkdezszMJlpjmRNA2yMPRszwpNkE
 JPYKUxmD9FQ5JQHNiNRe3MFIqyQtcUZVc0h7kKyRrKBPILIFuNBVib8rypaJZZcghXtR
 HuFDl5tIlgGSCW0m6IQQyYYrRUtUA3EUGYYj9efX3mGsogScEo5AMd8wrk4YJ29nxWXy
 wP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tYTwl9UyzE7O08dqCyL0rs00lmC5U5Wi10EjecyWl6k=;
 b=FKH1cZUhobelQbgskThbMgeR/iAQfCMv5NdE5HH0XKT01Pn3swEvyzL89KYXkyUAqz
 rp/Y0M7Cs8+AYj9UyzNNzAA9weg3bLHTmv/GZ0EUZ0dExELmujQKpHWrRdI02QnnaUEp
 0SfF6vJsr9XtzyK3rSwKbN8Z3EB9L0ufy5VYGbXrQHFHNXWiCm+Yi1aBn+X9YegWvxiC
 1r5LS2cHP7zeGjxclAxiq4TjWaBV34lixeFc6G+8iCpYrRiUxlBgVAErTc/EuIOK8x72
 BmdYVAEHukEzZh2YDU1EX+woZLqBA7HGB/cfdhw+1HGETXyoVAqNKR8RcBXPKjtle+JW
 jJqA==
X-Gm-Message-State: AOAM53309AmKsM/YZlYalIWT/giO5vY7DICWxJaD90A/jHh/OGCFxy6D
 2bK1ohz85FGL+LCwJp164b4=
X-Google-Smtp-Source: ABdhPJyOCcwfhFklQ2azHbtb9rQzNHUGo//zFgzf94EtkPv7coAzdKgY+XglsBB5MYpGcOUDhvp7SQ==
X-Received: by 2002:a17:90b:1009:: with SMTP id
 gm9mr7342196pjb.84.1606447764644; 
 Thu, 26 Nov 2020 19:29:24 -0800 (PST)
Received: from localhost.localdomain ([101.12.27.127])
 by smtp.gmail.com with ESMTPSA id m73sm6063962pfd.106.2020.11.26.19.29.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Nov 2020 19:29:24 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v10 4/6] dt-bindings: leds: common: Increase LED_COLOR_ID_*
 maximum size
Date: Fri, 27 Nov 2020 11:28:54 +0800
Message-Id: <1606447736-7944-5-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_222927_960052_709C9188 
X-CRM114-Status: GOOD (  13.35  )
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
