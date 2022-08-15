Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3372C25B0E
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 22:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F2rGFENzHI0E3i8mswF35hHoUMszy0CZxP2MWQKHpBQ=; b=boVWCDEOec94MPRPGztPwk7Ijy
	8dLM/LOItY9utuOzKjUrcJz/Gw4l08yp/C7Mr/WxF6kpaCO915czO6Gmupei9ogzsPu79XSUM7XHX
	gbc+X8JQfDLSScdOH6ecFMabWt90eMQJzfltkWrFzKJ9xaaoSlOVTztp49o7g+93AVbihrFpieB0p
	P8mhJkc8RY4gNY/5Nex+EQ2JewE+yHK+gHJwhRENdhYPSsJvKTkj9+jZJC8xu3rb7gwiKevTnFVQs
	r2y9KebmyC0Jar85jHaHyZgun32qAWaB7M8AjHtjhJxfJCaN7IgdmNKZROwFVcAfNxPXJDSDVW6iC
	EXTXp6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNi89-006LM6-Dc; Mon, 15 Aug 2022 22:00:17 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNi85-006LFd-Df; Mon, 15 Aug 2022 22:00:15 +0000
Received: by mail-wr1-x435.google.com with SMTP id j7so10514491wrh.3;
        Mon, 15 Aug 2022 15:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=F2rGFENzHI0E3i8mswF35hHoUMszy0CZxP2MWQKHpBQ=;
        b=SwigwelJnmy5DhbwCbX4EIFty2vdJVo6HL901+2tfj45cuM+Dm4xSkjCK5i5aB1ucr
         BogTShuXqf9zG5AWFiFvUfiIYTKNG+Gg/fdYxyYjBA0kqyQujK08eirJUAS6pF40YghK
         QHw3mHBtJLp0EJC/vs3bl/khLlZXi1+zp6i+VlHNGVUbEaOwZUEaJpRNj+e44esGtT3J
         IY6Ljvy2jvT6QOjEJwNIM3fhCw4sSXWsNBGueBXZvsWAf8E3OQ4Q5LdITTsM15uvvpFT
         oJGa+TnZX7IzahqmWQDHMWYfb701XbLihdRlnBqtunzTIdlATyWMi9NKr58jl2M0mYLM
         sl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=F2rGFENzHI0E3i8mswF35hHoUMszy0CZxP2MWQKHpBQ=;
        b=U81+9ICSUS1C8o51l/1Sffs/5cuGMYbilJLbthfTZjnvjkVx/zJvAZEl2Dtce7yKEp
         aZ5AEck2i4xsqK/Lv1uT94SWRHRzAkYVRIUHM7q3owpgkfQC0QKYigwbDlId1LTjMZR9
         Qntgy1VFWBdCLpw/SwCeP9BjbKlW2NNz8LUtbCwaj3dXQNdycXnTKPbwKJXfpfuNyLHE
         mYyUIkOCriUvboaX5pxlyECbAuRcuyXRr8e8l6276m49YzNgsn6flhnQgU8tpvrocX+k
         fD4tdHE9KibW618HrNV/rtSgW5fGG4dlgemf9RppuEkUEQuCfrQr4e22U/igUv30FWio
         ymcg==
X-Gm-Message-State: ACgBeo2AfQa61eMzUKh6n3r0uFYrMdCOXscFJu+vTx/W+S3MHiFOig3V
	UHKhFDg1iAeVGu9EtaN3G40=
X-Google-Smtp-Source: AA6agR7uQBKz9p2RoPuPctiBHIoYB4Qu2te8eOPpUxlusmYdKqLIHMU/LCxGvX4St+OzDGJl/1h/uw==
X-Received: by 2002:adf:dbc1:0:b0:224:fc61:fef7 with SMTP id e1-20020adfdbc1000000b00224fc61fef7mr4956247wrj.312.1660600810584;
        Mon, 15 Aug 2022 15:00:10 -0700 (PDT)
Received: from localhost.localdomain ([105.235.130.28])
        by smtp.gmail.com with ESMTPSA id y10-20020adfee0a000000b00223664ab3a8sm10195480wrn.90.2022.08.15.15.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 15:00:10 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] phy: phy-mtk-tphy: Make USB PHY work on MT6735
Date: Mon, 15 Aug 2022 22:58:59 +0100
Message-Id: <20220815215859.253962-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_150013_507302_9429EA5E 
X-CRM114-Status: GOOD (  20.86  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The USB PHY on MT6735 seems to be a TPHY V1, but the FMREG base
here is 0xf00 rather than 0x100. Since it is definitely not a V2
or later as it has shared registers, would this mean that it is
an even earlier revision, or one between V1 and V2? Or is the
address used currently in this driver wrong?

Furthermore, there is one additional step needed in the power on
sequence to make USB work on MT6735, which is to set the 10th bit
of U3P_U2PHYDTM1. This was found through trial and error by adding
the power on sequence from the downstream driver then stripping
parts of it until a critical part is found. This specific part[1]
was found under a comment saying "force enter device mode", but
there are other bits that are cleared/set under the same comment,
some of which are set in the same write as this bit, so it is
unclear whether this bit is the one (or the only one) responsible
for "forcing enter device mode". There is no documentation on this
register (or any port registers for that matter) so this bit's
name and function are unknown. Does anyone have more information
on this? And if no information were to be found, would leaving
this as a magic value, or with the placeholder name currently used
(P2C_FORCE_ENTER_DEVICE_MODE) be acceptable?

[1] https://gitlab.com/Tooniis/linux-samsung-grandpplte/-/blob/master/drivers/misc/mediatek/usb20/mt6735/usb20_phy.c#L404
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 8ee7682b8e93..f54b8a9872bf 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -23,7 +23,7 @@
 /* version V1 sub-banks offset base address */
 /* banks shared by multiple phys */
 #define SSUSB_SIFSLV_V1_SPLLC		0x000	/* shared by u3 phys */
-#define SSUSB_SIFSLV_V1_U2FREQ		0x100	/* shared by u2 phys */
+#define SSUSB_SIFSLV_V1_U2FREQ		0xf00	/* shared by u2 phys */
 #define SSUSB_SIFSLV_V1_CHIP		0x300	/* shared by u3 phys */
 /* u2 phy bank */
 #define SSUSB_SIFSLV_V1_U2PHY_COM	0x000
@@ -119,6 +119,7 @@
 
 #define U3P_U2PHYDTM1		0x06C
 #define P2C_RG_UART_EN			BIT(16)
+#define P2C_FORCE_ENTER_DEVICE_MODE	BIT(10)
 #define P2C_FORCE_IDDIG		BIT(9)
 #define P2C_RG_VBUSVALID		BIT(5)
 #define P2C_RG_SESSEND			BIT(4)
@@ -579,6 +580,8 @@ static void u2_phy_instance_power_on(struct mtk_tphy *tphy,
 		mtk_phy_set_bits(com + U3P_U2PHYDTM0, P2C_RG_SUSPENDM | P2C_FORCE_SUSPENDM);
 	}
 	dev_dbg(tphy->dev, "%s(%d)\n", __func__, index);
+
+	mtk_phy_set_bits(com + U3P_U2PHYDTM1, P2C_FORCE_ENTER_DEVICE_MODE);
 }
 
 static void u2_phy_instance_power_off(struct mtk_tphy *tphy,
-- 
2.37.1


