Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148F3C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 11:28:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEC0C20758
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 11:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hx304OBu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="jJl7EHkS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEC0C20758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sngaemU/3Se52h6KXqzr83WluU8zngbXFcsvHfUmVk=; b=Hx304OBu+rG29a
	SeBbw52BRv5m2iNctZoFRfJt3DKAv1h4exVO63ZT/UMBBUIMxPUsKKH+Wpn+JMAQALLDwxbhkEMyt
	ElF3T1pWrISGzjATQ975L9v9/hOHKvZt/JWm/WrUvOCuCcOMkk97fdglRcX+Mh30VkeZLK1Kn0UPX
	6ZqX4b9iYfKUTXYbR6z9UD1M0BvljklXhoyPRlQYuBYxaHp+kXzXwOIUJonrpXRM+o34apMWcBklE
	0Xg8ccq7/z82uXqz9NuNiMFApQKr+1gbSIl1+V2jko8x0TFNQbpkkKtN8om8VMsk2wYUZuyMKYken
	/VfOfH5hDO4h8GaYNuxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbMta-0000mP-EF; Wed, 20 May 2020 11:28:22 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbMr2-00070Q-4W
 for linux-mediatek@lists.infradead.org; Wed, 20 May 2020 11:25:52 +0000
Received: by mail-wr1-x444.google.com with SMTP id l18so2757422wrn.6
 for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2020 04:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A3BhZ5w2nZuK3+ZudhXc+00fKQMrXVNQ6trbR5U2M5Y=;
 b=jJl7EHkSHE5L7ug2e+7FfE+evIqe8FKm47gAqTsQFBuvFJOM8IIH5d9Fr2EtT/MaCB
 5KT//LxD+XfnIEQReE/Kr7rJOmeWFP88We0dpLukbXgBAFcGzypmoSX88T/OJQOaIGEv
 2SC9e4wIybK+5hpkTyAcUIRjX2eRhmH9wd6W75ENaIsw0+hhonRpNAAeGFMGY8iY9U3W
 3d4urm5PcTJ2zwCp3VXAFL0IJd7ShIZAOntvZ+RRFTSJAfIQ/FAzOGPVN0f7qUnrbVSU
 I01DyocLppKyZ5eYXdc8QXZahAujUNoTgzmT7MSB6jzqf1RiwRNb9+CAj0Sw0iktkKBZ
 teHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A3BhZ5w2nZuK3+ZudhXc+00fKQMrXVNQ6trbR5U2M5Y=;
 b=RnGoUHJmvdVP2c/Ml2fgTo9tKUl4kdYCf8BJnMv2M4kQJTUg4+IZAZ0Ylfqbk0v7zk
 uaV6AZ4vFT8Y1tG/NNVWxpjHe4UA30Tspc5ZZxFzQwQNryrsaZAp73hJv4SQ6zWIzvW0
 EpOFkFEk3MSIp+u9g4SWOHMUhfhHViUdk7zWR5slT7h7tWs7/omWygFu9GD8TaDv5cSY
 Xm99c2+SKluaL3xvtmW5pyhlFX+yvCIKPGQpu71W+O/G2BXXvS5hkY+2cxn6iCQExRzv
 3Ha+FGetGi1bmjXoowC/woHlVGBcwMynmExplyiocRgjwy6sqJiIxD9VQVh2mybLKJGJ
 f3ag==
X-Gm-Message-State: AOAM531NtndqOXIXJSEZ/TzV9cjat3i4ZFYqWwDvNn5gDx6pkkoWkc72
 NgL+dR7f2I2HxR4jY8xrFtheWw==
X-Google-Smtp-Source: ABdhPJxslAZNVwy7HZ5hGhld1CSn0uUyQGP3dufDHtakdC9Fg9OluxTSArW0nOyzO5SoIp0Y/JM9eg==
X-Received: by 2002:adf:e5c6:: with SMTP id a6mr4058394wrn.180.1589973942051; 
 Wed, 20 May 2020 04:25:42 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id v22sm2729265wml.21.2020.05.20.04.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 04:25:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v4 07/11] ARM64: dts: mediatek: add pericfg syscon to
 mt8516.dtsi
Date: Wed, 20 May 2020 13:25:19 +0200
Message-Id: <20200520112523.30995-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200520112523.30995-1-brgl@bgdev.pl>
References: <20200520112523.30995-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_042544_300997_28C60664 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org,
 Stephane Le Provost <stephane.leprovost@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds support for the PERICFG register range as a syscon. This will
soon be used by the MediaTek Ethernet MAC driver for NIC configuration.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index 2f8adf042195..8cedaf74ae86 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -191,6 +191,11 @@ infracfg: infracfg@10001000 {
 			#clock-cells = <1>;
 		};
 
+		pericfg: pericfg@10003050 {
+			compatible = "mediatek,mt8516-pericfg", "syscon";
+			reg = <0 0x10003050 0 0x1000>;
+		};
+
 		apmixedsys: apmixedsys@10018000 {
 			compatible = "mediatek,mt8516-apmixedsys", "syscon";
 			reg = <0 0x10018000 0 0x710>;
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
