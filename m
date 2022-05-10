Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D04C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 05:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q15YG9xHDAXDy6Gq3dhFgbNib+Kb3hj6pdPOqUBESK0=; b=lTb9YoQx4Qlk3l
	MzPKSx33/eJjVbbWdBR+nM4fa+FnGBcd/oLACC/ECoSSjaiI9BLmTpzT3q/k9UZCW39XeFGZ7rJsn
	bdmrnYgHuWI+cplBjSbkvOFJK8tzEkG5lHAY0GkSVZvjXLLPuSWxh7ugvEsl87XYa4hL+H8gye5ia
	NzgnQbbkcyRVH10a6zoufItnjIrXhJvJ4mK1XAntUl6Neau4Gt1W0W7KdUYAsWTXoCWlm1GdO7SaR
	Eif4cUrvhKNETdOpitQ0nhOmqtdCVNgutQqNIJI2SJZrOgZPBngqxR4SZXMgNhsOnhREgRveLb1IF
	yhsnvw/xPnYYF9dhYLVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noIBY-00HYto-P8; Tue, 10 May 2022 05:13:24 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noIBL-00HYpQ-VT; Tue, 10 May 2022 05:13:13 +0000
Received: by mail-pj1-x1034.google.com with SMTP id e24so14931899pjt.2;
 Mon, 09 May 2022 22:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=KtIfa3pXmMCsw1ndxle9kWD29wJ61e87LoCR/dA6Zjw=;
 b=kZW03ctlltheN0OFN/VkaKZZjiRbkxHbA+M5QOhanQ8yuV5j8bdMzH1H0QKexpeosq
 g2DJXM9XZWLIdStomhoFvXgczz9PmpOWcFTpIDgO3CVLxu+0CBUPBh2gvfwLx04EyRBr
 UekTXgxA383iF17n3gPiGDYihgfi1F+5yJxxPdFQ2N+KuSpnRa7U/Ifc+THA2FIK1cyG
 Rfl5i79ThLIs0mA6P7QCdD3ea8WATGPe4cqoFEyQ9LlP5ZR36bFTIJIGsZAGkDtiXm6h
 T7AbJR+ETbrhHUZX5yt/cVSUz+f5UnINlxLLBHg/HGqRNBZ7Xyrf4PiOewtal4Gc4Wpc
 HdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KtIfa3pXmMCsw1ndxle9kWD29wJ61e87LoCR/dA6Zjw=;
 b=3IXtj5pgxXpAByTcTXTjVTcyPKDg5NEPj6ZFnxxAIGXslSvW4Im7e2uZw70F1mnA/C
 Ty8h9m+zz4FUDrTs9Qe/GCSdv/5hixeWgnemEanlG6ROclHkHuBn/lbTZBFuT6CcSdlK
 oHUbc/rS1VMKByHKh9jJOVsFHtOYun1mVrxQBQ1uD1s8jRFUW9C4iCabt6ajPGVviy6r
 IjsFU3ICj7qJjFRos/I7VwValErPloBubgAf9qA1izNL3Hl5aIm2DYlD8fn8jFrgbn6B
 Yo62k9GJA0SO+VDpCll1yxv5fXEekwHhJHIwo22BP/f9SKCzV+W6X1YaFq5YqVh28h7n
 Z/TA==
X-Gm-Message-State: AOAM531G+w1rgZLH6bjQ4cpPVbRbkRbYgePZ4mg+DoYpOesP5BOjksrl
 +JPjRe2y+3Jb/hm5UdyKjKg=
X-Google-Smtp-Source: ABdhPJzcRUiMEzDnGQApgkNDSwOqgx5S/RaxVfDYfmLnMKr+k+v2y5OZWM0Ycjcy40ZkESNiAe0Umg==
X-Received: by 2002:a17:90b:4d12:b0:1dc:741f:c6af with SMTP id
 mw18-20020a17090b4d1200b001dc741fc6afmr28760672pjb.91.1652159588742; 
 Mon, 09 May 2022 22:13:08 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:477:5568:d4ca:c13b:4cc5:5a2f])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a17090aa50400b001cd4989feecsm687649pjq.56.2022.05.09.22.13.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 May 2022 22:13:08 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: linux@roeck-us.net, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org, matthias.bgg@gmail.com
Cc: cy_huang@richtek.com, bryan_huang@richtek.com, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 stable <stable@vger.kernel.org>
Subject: [PATCH v2] usb: typec: tcpci_mt6360: Update for BMC PHY setting
Date: Tue, 10 May 2022 13:13:00 +0800
Message-Id: <1652159580-30959-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_221312_054781_7AA70C75 
X-CRM114-Status: GOOD (  11.82  )
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

Macpaul reported this CtoDP cable attention message cannot be received from
MT6360 TCPC. But actually, attention message really sent from UFP_D
device.

After RD's comment, there may be BMC PHY Tx/Rx setting causes this issue.

Below's the detailed TCPM log and DP attention message didn't received from 6360
TCPCI.
[ 1206.367775] Identity: 0000:0000.0000
[ 1206.416570] Alternate mode 0: SVID 0xff01, VDO 1: 0x00000405
[ 1206.447378] AMS DFP_TO_UFP_ENTER_MODE start
[ 1206.447383] PD TX, header: 0x1d6f
[ 1206.449393] PD TX complete, status: 0
[ 1206.454110] PD RX, header: 0x184f [1]
[ 1206.456867] Rx VDM cmd 0xff018144 type 1 cmd 4 len 1
[ 1206.456872] AMS DFP_TO_UFP_ENTER_MODE finished
[ 1206.456873] cc:=4
[ 1206.473100] AMS STRUCTURED_VDMS start
[ 1206.473103] PD TX, header: 0x2f6f
[ 1206.475397] PD TX complete, status: 0
[ 1206.480442] PD RX, header: 0x2a4f [1]
[ 1206.483145] Rx VDM cmd 0xff018150 type 1 cmd 16 len 2
[ 1206.483150] AMS STRUCTURED_VDMS finished
[ 1206.483151] cc:=4
[ 1206.505643] AMS STRUCTURED_VDMS start
[ 1206.505646] PD TX, header: 0x216f
[ 1206.507933] PD TX complete, status: 0
[ 1206.512664] PD RX, header: 0x1c4f [1]
[ 1206.515456] Rx VDM cmd 0xff018151 type 1 cmd 17 len 1
[ 1206.515460] AMS STRUCTURED_VDMS finished
[ 1206.515461] cc:=4

Fixes: e1aefcdd394fd ("usb typec: mt6360: Add support for mt6360 Type-C driver")
Reported-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Cc: stable <stable@vger.kernel.org>
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
