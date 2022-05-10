Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7BAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 01:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nw+XWNrxauQaGwgTVQ+8t5ZC0TFm6nkqiKJqXknUDY4=; b=sjO4qUvp329bSx
	FGxAwOwNUdzguYoM4QpSjcEgH9YrNRTbh8+JHQCI44MGjfnFx3fu+ZHoSvdi96EBqicvVMMAYQNsI
	f/D3h/WJ3Zr9+rqwXNFlNvwJJiXtqboIYY/wVb7dfTRPAYjEDzm1HfqsUcJmraIw3RhkyTQCIsV3r
	lYPPFPEtT+ACakkuADPwX3wzOrY+s72zWXpYhJj19AMUxt4LasDLXfMeh+TvUzQxCH0SbOMaPB7RV
	4iiblx9eyrsqLX1xxWmcY1zVR9atTX+RHFvakRLC9LGOk5NlpxrswDZvPjg0KwihKoM9enpFogFJp
	TnoLmntsPRHtGCestdhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noEw8-00H2NX-Hw; Tue, 10 May 2022 01:45:16 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noEvx-00H2L5-I9; Tue, 10 May 2022 01:45:06 +0000
Received: by mail-pf1-x42d.google.com with SMTP id v11so13714742pff.6;
 Mon, 09 May 2022 18:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=nP61nKy/ZPvS3vrbOJaB+tc2rmY8ROtm0Xppu8VLlno=;
 b=DCH/WQHYliiBOM5qtU28mWlxYWa0xEhfYgyUf43q9BDAmCFxHJfCZi/pZarlHfGJoY
 UqhtZdkilfcKTzRuNdpO6n1i3LHWiGKt6FNX6KLh6Ec4/grUGWdpmjoYWt9+OrJrcK3o
 rAIYDZlGzNFBsbpO5VdnE8SIjw484E7uyIEp92r/rXF2UolFc3Tx3Ua0lpEeJyGBV4dP
 /E+RJI0tEyvx/20IPKLFFEvwzGtU+wr/E1lxfdIXjc81WiXHEhpLjv4CE4lJvMgDtANJ
 sFSjwA9ttKUKEn96X8v4eQgkvHx2NiZvnt8OLaPF2SC14/6kfZxcPWPHUXmFzDod0zYt
 E0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nP61nKy/ZPvS3vrbOJaB+tc2rmY8ROtm0Xppu8VLlno=;
 b=FZW5uZGfbYjJKmDPCTbemw+OqE6+Q5qNqFCV8tVeyrKnEEdBeBOwgoHyhE6tJVwBhx
 qmurbzKWfNapBsiZxilZ0PmlVCNAoBiM+pahIzXn44E9r0ZyCza5/pVdL5pbAjZCy2Ug
 S0P/EqIvlodJaqA65rlcc2L760SBcQw+Ps+tTz7I5LwLC6zF6YtYStPjXH9dNGjPCFqa
 LnPGfbzeSe1Cz1rUrxjOfvjvf3pB19WHMQcof2f0dwNMKRp1m8q4UVZg4vc7B88mFgu1
 p6PVZaa9oNOV9ABb0AUD1hYeOQgnXKsWmr1VRUvIfpWymXZa/a4BCv0pCq8xAlQPdCb1
 Lmiw==
X-Gm-Message-State: AOAM533L/E4HeBbl+siJ2Ciki4vAo95HHc0EH+mOrkV4SGAocDPVI51/
 NPFGcXLOiVB7FExowJvdTO8=
X-Google-Smtp-Source: ABdhPJwzT/+uJ2WTtLY2nkbyUT0PnbYSh7AqMNOP0QKEmBYONx6/3TFc58YIa9s0ov22A+8PSn8wnw==
X-Received: by 2002:a63:68c4:0:b0:3c6:c9a6:e316 with SMTP id
 d187-20020a6368c4000000b003c6c9a6e316mr5139838pgc.399.1652147101507; 
 Mon, 09 May 2022 18:45:01 -0700 (PDT)
Received: from localhost.localdomain ([49.216.43.238])
 by smtp.gmail.com with ESMTPSA id
 x186-20020a627cc3000000b0050dc7628134sm9590075pfc.14.2022.05.09.18.44.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 May 2022 18:45:00 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: linux@roeck-us.net, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org, matthias.bgg@gmail.com
Cc: cy_huang@richtek.com, bryan_huang@richtek.com, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: tcpci_mt6360: Update for BMC PHY setting
Date: Tue, 10 May 2022 09:44:52 +0800
Message-Id: <1652147092-19255-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_184505_643802_42588218 
X-CRM114-Status: GOOD (  10.93  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

Update MT6360 BMC PHY Tx/Rx setting for the compatibility.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Hi,

Recently, there's some USBPD MT6360 IOP issue from the user.
From our RD's comment, BMC PHY Tx/Rx setting need to be updated for
the compatibility issue.
---
 drivers/usb/typec/tcpm/tcpci_mt6360.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
index f1bd9e0..8a952ea 100644
--- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
+++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
@@ -15,6 +15,9 @@
 
 #include "tcpci.h"
 
+#define MT6360_REG_PHYCTRL1	0x80
+#define MT6360_REG_PHYCTRL3	0x82
+#define MT6360_REG_PHYCTRL7	0x86
 #define MT6360_REG_VCONNCTRL1	0x8C
 #define MT6360_REG_MODECTRL2	0x8F
 #define MT6360_REG_SWRESET	0xA0
@@ -22,6 +25,8 @@
 #define MT6360_REG_DRPCTRL1	0xA2
 #define MT6360_REG_DRPCTRL2	0xA3
 #define MT6360_REG_I2CTORST	0xBF
+#define MT6360_REG_PHYCTRL11	0xCA
+#define MT6360_REG_RXCTRL1	0xCE
 #define MT6360_REG_RXCTRL2	0xCF
 #define MT6360_REG_CTDCTRL2	0xEC
 
@@ -106,6 +111,27 @@ static int mt6360_tcpc_init(struct tcpci *tcpci, struct tcpci_data *tdata)
 	if (ret)
 		return ret;
 
+	/* BMC PHY */
+	ret = mt6360_tcpc_write16(regmap, MT6360_REG_PHYCTRL1, 0x3A70);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(regmap, MT6360_REG_PHYCTRL3,  0x82);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(regmap, MT6360_REG_PHYCTRL7, 0x36);
+	if (ret)
+		return ret;
+
+	ret = mt6360_tcpc_write16(regmap, MT6360_REG_PHYCTRL11, 0x3C60);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(regmap, MT6360_REG_RXCTRL1, 0xE8);
+	if (ret)
+		return ret;
+
 	/* Set shipping mode off, AUTOIDLE on */
 	return regmap_write(regmap, MT6360_REG_MODECTRL2, 0x7A);
 }
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
