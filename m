Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B9CC64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 12:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UL2ps8yaPj+oovF7HkNPRUPm6/ExhIXpUcFA+LZV1i4=; b=RFmuCTb9L/AnDB1PMnwaPmPVsU
	r7sRczRrHjoJzcqGsl2cQ+VcLIWOSbD5AGMeJcx4k4nBTevfi2YPWC3JCo8jAE3zefzu0wmRjy8qt
	rP3X9HvV5RpUlPPzsakc8ex/SdptsRJllv5RZN2oyT95aTa0iy7LTcMqNYcgV7iPNbBR3ad8TS82A
	2tAs+y1dKZRDxPX2GQwiAwM8Pb++xwD0RTfrBGUpa7Fj/yndvkdYP6du4uSxdl5A6kFA3vaOvRjLW
	DUgimi8Ulfcc5fzpjjF/RJN/dXL/taMVh6pxo9AELNuuoVzX2c1VstkOs0joEM4bxJN9rBdAokPTv
	lPP2AnVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWcAs-009VFu-Rc; Mon, 27 Feb 2023 12:00:10 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWc8D-009UKs-Vl; Mon, 27 Feb 2023 11:57:31 +0000
Received: by mail-pl1-x636.google.com with SMTP id i3so6421600plg.6;
        Mon, 27 Feb 2023 03:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UL2ps8yaPj+oovF7HkNPRUPm6/ExhIXpUcFA+LZV1i4=;
        b=mX8m8PH4kwuZFOdGmAjNOVMEHyrxdN+oHDHiDLndFYfPmKmlIQhlaWu9lodb+RDDWK
         BBTuTnw6joramjEwLl/njhxU83ctQyLqjN80SFFTjyIoCoLMLcY8wR/L7rJOijEWvRLa
         R3sMCrvfp7mjceLiUNf7vrSJav+7KnfFumfqaZsGnoV9PL9UkfIEDMBkS4nnOO4VW54k
         ewDp0dBPWg1etRzldVARQFFBq+nqNnIzCDrEWjMRPnzb9Pdx6thP2X3UbFjl0E/YPogi
         /9r4l+XKyjih1CK8zSpb1HaEXKe8e0UPyEYWKYl27KP/gxM9J+b70QmrIgNKkFlyP8kv
         u5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UL2ps8yaPj+oovF7HkNPRUPm6/ExhIXpUcFA+LZV1i4=;
        b=2Xrz7DKjtY6IDHbV0nco0j7Cb2pTR0LjnfRRtAU3HJecpI6oVXBiRV+tWSqucZ0xul
         YWPJ3jjm8GovyRAWWHkITfqiseYFvdH10vOWSs0mko9KeymmQs69QGa0Nmut40ybRPiH
         0E291j3Oe2/EuCdEg/BPaHqaVy4Zmw19XjfTkqsJ7Tjoyl65zTzW18c/twDOOENDLf19
         e1ubW8FYT6sMkPyXwkUlEn5i/nbM407LHmmfps78fYeKIuXg8/cPmxTP0J4W3Ej1ip/g
         v1R7ueb75wnpC8XDZq8svPDBAu0ufJeLpHnTveBzIQTBXQwr2wQFVyk86ZU7T3pkS/lh
         iqFA==
X-Gm-Message-State: AO0yUKXweR58fkrR20Ninsvlu9cPHkezvE3Beq3zBNvFbr7ezSMpEN5v
	obJCgYiGin7Xceub1nPW0jE=
X-Google-Smtp-Source: AK7set+BLyzHJFtVSyKmZHTYpge+3sc6hQOxe+auHdzmUX0POIcjrnIIsYgxojEj7pDzaw4Rr1Gc8g==
X-Received: by 2002:a17:902:bd89:b0:19d:1509:5848 with SMTP id q9-20020a170902bd8900b0019d15095848mr2419219pls.29.1677499045263;
        Mon, 27 Feb 2023 03:57:25 -0800 (PST)
Received: from passwd123-ThinkStation-P920.. ([222.20.94.23])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902d70d00b0019aeddce6casm4390573ply.205.2023.02.27.03.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 03:57:24 -0800 (PST)
From: Kang Chen <void0red@gmail.com>
To: shayne.chen@mediatek.com
Cc: sean.wang@mediatek.com,
	kvalo@kernel.org,
	nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Kang Chen <void0red@gmail.com>
Subject: [PATCH] wifi: mt76: add a check of vzalloc in mt7615_coredump_work
Date: Mon, 27 Feb 2023 19:57:17 +0800
Message-Id: <20230227115717.3360755-1-void0red@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_035726_302332_C6CD6C46 
X-CRM114-Status: UNSURE (   8.29  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

vzalloc may fails, dump might be null and will cause
illegal address access later.

Signed-off-by: Kang Chen <void0red@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index a95602473..73d84c301 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -2367,6 +2367,9 @@ void mt7615_coredump_work(struct work_struct *work)
 	}
 
 	dump = vzalloc(MT76_CONNAC_COREDUMP_SZ);
+	if (!dump)
+		return;
+
 	data = dump;
 
 	while (true) {
-- 
2.34.1


