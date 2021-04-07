Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C06C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 04:51:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEF1F613A7
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 04:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEF1F613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pO+aK7t8iKDvqWhKjDETXPvVugKdN1HeLKSNZank2DE=; b=DrrmM4rnMGXDjvSkv3c56AK5H
	XL2eLawQcQxZZoTEOutFpFkBKMGPDmsrkdSLM9YFG7aKYpOFhwO054rJxEXQVfXJGl3CzA6kwtujj
	3GEk+7y5OsbbA0Nitgzf/7Nxm1YnD/TNMcDxBPkexOKJuK76ztvmBEEN6nEJOixXrA1CwvZ2UrYhI
	wO732++ZJaAw3mU63cVIcPhUjy7HMck8iGkTeDXE3SOQPQ4YL7+Rvo1VndEb4b4AQpEoIHf8YrvbQ
	pxE7Mdr9D6WS4tYoWcUGDD5bSete0IxAqEoS7h9a1hQJt2dnerEtaK4cDizEzxrI4JeK6TCFuvu+q
	G9rw/x9iA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU09x-0043rq-Ob; Wed, 07 Apr 2021 04:51:21 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU09r-0043pX-Ug
 for linux-mediatek@lists.infradead.org; Wed, 07 Apr 2021 04:51:17 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 z22-20020a17090a0156b029014d4056663fso665723pje.0
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 21:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V+6L2oYqEs/QSzIuajaQppBr7eHY4K1Hd4WvlAlIz/c=;
 b=UeAdH92teKX9nqcjZrk6pjPXGRY/rZBLvzZum7GHe0oWmKCSm4tAQ4eAOvRQAT5pgy
 PF7nSdVhu89VA+F1sjXLLRN9YSm8CeaAXQm/HThDqjJ/5qxZTBR0FRr4iPTXGv44eaAh
 mn32RaEya6zyckqOH+zEUfmh1v7kWe2tPpGev7txR5rly1tFsWI0fsbXkxy2kYwdtN6n
 rJEZFeVZV7hA743py53NBrlmr/2FAbsMfrg0Y+ugHTzfLkphin/HBXO1pEkySxvaYL3O
 Ma86/uJ93tkIAFC9A8krTtyTUfP5xZ9R/ZuHxTfrbv7ljpg4SB2C+Y4kOLzRpAWdVssR
 rg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V+6L2oYqEs/QSzIuajaQppBr7eHY4K1Hd4WvlAlIz/c=;
 b=WtQ8IFb8I8btcWy9jIPkajsaGLxM5nQe/KgY5G30088u2etetuMy8CPnfFiVC77nOh
 yU8rUiHP6q/Y8SczqrH8J6cwTEbP6/mj+Ptd26klXgkXpTWll57HQNX0XDUAcr5scSOU
 GMLhXzxD8CWfPdrZ7lUzdv0OadpHPD53m/o6KpD4eYuqEfk+CduaP+Y7zJgHeJBFnM+P
 l2ahno+AmY5e2xRNR3fUBSGcA8xRvcHAAzq7kiUWIsPFC0hnxkjHf8/f+1RlWQIymzCu
 IgR/Tq3H631HUfNvXVDmNeiE8uwiFGTeMv2JcFfqQIOUotCHTPnFHIpgyPAW0Ey1jeJq
 +3eg==
X-Gm-Message-State: AOAM530Xh34vNtQk3lo3FtlZBrvuJ48hbjq0zXCAJTr5kuU+phFQonTG
 vU9PvB3/jmw5t0t8iijTFSQ=
X-Google-Smtp-Source: ABdhPJwwV7+KRnS4AYoBBARd+AzL4vj5vm1mLsxuvTDRCFHHfrgCqfllBL734AbDkmtPtKYUoSdcVA==
X-Received: by 2002:a17:902:ea10:b029:e8:e2e9:d9a5 with SMTP id
 s16-20020a170902ea10b02900e8e2e9d9a5mr1414313plg.22.1617771074590; 
 Tue, 06 Apr 2021 21:51:14 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id n52sm882679pfv.13.2021.04.06.21.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 21:51:14 -0700 (PDT)
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
Subject: [RFC v2 net-next 4/4] staging: mt7621-dts: enable MT7530 interrupt
 controller
Date: Wed,  7 Apr 2021 12:50:38 +0800
Message-Id: <20210407045038.1436843-5-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210407045038.1436843-1-dqfext@gmail.com>
References: <20210407045038.1436843-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_055116_170592_F3D901F7 
X-CRM114-Status: GOOD (  10.05  )
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

Enable MT7530 interrupt controller in the MT7621 SoC.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
RFC v1 -> RFC v2:
- No changes.

 drivers/staging/mt7621-dts/mt7621.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 16fc94f65486..ebf8b0633e88 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -447,6 +447,9 @@ switch0: switch0@0 {
 				mediatek,mcm;
 				resets = <&rstctrl 2>;
 				reset-names = "mcm";
+				interrupt-controller;
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
 
 				ports {
 					#address-cells = <1>;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
