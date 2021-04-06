Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A44C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 14:19:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 971E261382
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 14:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 971E261382
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gq4z+m3/79GXQ/DTNUUvKVh2dvrdq2xiKJoHNyTHuT0=; b=Dd4CmGau4xNcLpsk3pBC7UWds
	4pILkO8jQof6Z5xQEooz60ibNdgFJJfh5mu31YgsmHMZyD2v2jG4xbnUdF7DHgoPiCVbJvV+0dYuG
	CnWyXzmGJFisGo4JA+R+fNr3n/EufyVCnKfbtIagWZxLvrsZalJyrJbOua0Gd8ygugknEX12Ua7E8
	N1eo8zM4Qf/MEJTgtmYxshixzLzZ+i4xf9uijyxhLGCRxmedH5J7500kENvdO0MiepEtRAH0Svu/7
	VKyIfPfGMKe8EarSWj6QDGXdhYACZLZWnFjbysdhxBgSjx+fRURCszCCpIU7X1jlE3/ybzATMfwa/
	zrIfOesyg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTmXg-002ovV-PO; Tue, 06 Apr 2021 14:18:56 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTmXb-002ou3-V1
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 14:18:53 +0000
Received: by mail-pj1-x1034.google.com with SMTP id s21so8024625pjq.1
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 07:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LbWbWwUxe5h4QMRiax70raYE15ondtl5QuCv8uqAlow=;
 b=ozYfLJN+OmcehQ92A311DXwyXKgKpWbY5d0TRISlyhg9Nte0tv+K5rva62BaFJxwfR
 nEDDrZJSZ20Yl9dfTENDC3ZxEQSyDhGNE6QTsCG30QQbpTFJQgcxLUrfUlc54PHEOXz4
 ssfaPg09GQhnaPsLYtwiNvVqf3qtGsMETgiqvkA2NJLlJe86u+K2UIG/WHIll7fF72ny
 4b8aUVgd4/cdEhxg65HkDQzcyISnDG6r0dl5ffjDCJg9d8F7y7VMQ3DaD5Juq17Tb9uC
 0StHqCegFDA/B80U4x0TP1ugQLj6srQtLNKf19HpZnNVcK2a72sWka8kqo9dBrCW2bte
 XiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LbWbWwUxe5h4QMRiax70raYE15ondtl5QuCv8uqAlow=;
 b=HXyzYoz/vikRERCDBCWFEFj0CeqoPp8hJIyizQUiubFb1YRE3BAn+JapZEyOKeEg/v
 xJ8+qSJ7/XnE8oolTwvxkKzfw8H+QIcdvycUAYIeMUCPuN2hzQZDGtyHEdk2Jm2mla0U
 MOlxlfPmzkWKd/+dkTCs7jys8kT3m9RJBGxCzLnDbByUKr8bICw+rOH08tFfmjbbq763
 7Nls80vFLpU6LCxCxwnXNoOvtV4B296OhWKOS36dA+K+IJkGbpnRy2BpYg/0FqYsAEjw
 eENrsaSbFpF5ucvft4wuJgvxqYuQi6o5CG5Fhpr5rClWeQAK4niCQ556BImRnPwNmRaN
 btEA==
X-Gm-Message-State: AOAM530/s8bxldTZ9d/PE4eRMUVlK/BY23gyLS/neIIBPB5ybdJSADGw
 zxOojmG+Nbxf1U0LKhQ81zl5EV8dH9Cx6l+d
X-Google-Smtp-Source: ABdhPJyvnv9mxAiIu1fMH2/T9kEGB97LJFb36KJSG349MAt3DoEWfadAJykz7w6nvv7FZpkb8HNa5A==
X-Received: by 2002:a17:902:9a45:b029:e6:1444:5287 with SMTP id
 x5-20020a1709029a45b02900e614445287mr29150408plv.54.1617718730582; 
 Tue, 06 Apr 2021 07:18:50 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id u1sm18337581pgg.11.2021.04.06.07.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 07:18:50 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [RFC net-next 3/4] dt-bindings: net: dsa: add MT7530 interrupt
 controller binding
Date: Tue,  6 Apr 2021 22:18:18 +0800
Message-Id: <20210406141819.1025864-4-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406141819.1025864-1-dqfext@gmail.com>
References: <20210406141819.1025864-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_151852_081099_9D5136F4 
X-CRM114-Status: GOOD (  11.12  )
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

Add device tree binding to support MT7530 interrupt controller.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 Documentation/devicetree/bindings/net/dsa/mt7530.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
index de04626a8e9d..26b34888eb62 100644
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -81,6 +81,11 @@ Optional properties:
 - gpio-controller: Boolean; if defined, MT7530's LED controller will run on
 	GPIO mode.
 - #gpio-cells: Must be 2 if gpio-controller is defined.
+- interrupt-controller: Boolean; Enables the internal interrupt controller.
+
+If interrupt-controller is defined, the following property is required.
+
+- interrupts: Parent interrupt for the interrupt controller.
 
 See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of additional
 required, optional properties and how the integrated switch subnodes must
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
