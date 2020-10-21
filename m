Return-Path: <SRS0=VhZj=D4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CB5C388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 16:42:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F67521D7B
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 16:42:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dPtPqO/W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="i0gAa5X6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F67521D7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MAD9w8Jf4rwYtl2RJpIEFreXUHm2/0idVH9vPHS/Bno=; b=dPtPqO/WLun1AIuVZoBOK65aPB
	R2cL45C7phXCNAAh/wcL+01sDGrBk1zBdOo8lEK4ojYf7rSz1jOjd4pu0KzJDHfXu+9OQoDTCffcW
	j8gfktRex2O8HWb5cAGGGWuc/zvt1TX5NtoTxp4oHGyp+aZRBaVk6D4Xm0O3KbrPw4BdHD9Z6diY4
	pN3aQovX1g5i1A8QHhzoIriYMbUjTYFBXLN2T5IANdSoVIkicZhAS7kXkb9qwg+Mem8l1X4gfbOoE
	Ht17Ydk8021Ncitq4paspg4iiBxlEm1CJ8RuAi24G5Z/7jtLbjNyLk2K+tByYjGHk2U74v/moqpDc
	NT5TelJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVHCD-0006Tt-Ih; Wed, 21 Oct 2020 16:42:41 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVHC8-0006RI-Ki
 for linux-mediatek@lists.infradead.org; Wed, 21 Oct 2020 16:42:37 +0000
Received: by mail-wr1-x444.google.com with SMTP id h5so3820165wrv.7
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2020 09:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ktOQBsIi43nG8a2/21JQPeKNNuRP5PqTvkBAgWAn5tg=;
 b=i0gAa5X6lQdX9PQRLe+laWerY6VMaJl4dmiT6eFrLnTc2mxLVLmiMvAWGcvAnHcwx4
 bRRsAi9yCpLOP6i5M1k46oXGtRSSFG50d2yRDnM3GpTKGjzsmZvi7RnjDvWU2vWQGe88
 VzaMuPFNaxqlgjy5VXrpkhLGdYnX69HqlTMRgJg5VQF5t+OFCOFypTyytbfPIkrfxBFZ
 vJaqstRk6Qz7v1TQbN5K9qy2e8WBPScm5gEmXD4E8l1cRPGg0z1g9OLSdD82DY5g2/aG
 9OuQm9Oo2M2Ul/rHhjpM3jLh4xOq+/ZhBLk4gBZ+oG6iFNcRpdJzO3+nMhM1u3bR6dhA
 GdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ktOQBsIi43nG8a2/21JQPeKNNuRP5PqTvkBAgWAn5tg=;
 b=aBY1HiqtCtNx0hNnqgad67aG9iFj/Efsf93r/uoSQP+Zu7EjKU6ggScRQASC6FtXU5
 Mlctrl20hzLAj/gN77I4ah2Q+/P3Woj74l9kRvSdEJQsNYEA6rQBDrUseVjbo7kwKd3E
 Iy4ZOr1Pkav29Zr9+Wl1bnPNt4Lf694HSEwhuVjsmyxXB+YE0YL6OvpEyGZVXbLDk0IW
 wA9z98e1XRD+7KLfSHb3349xxQ4ESJ7bzrrsWY2HUIAAVg9iQbatf+UNhkQre1EvyLOQ
 IfR4cQfgJhk11mDoYc4QOAS5WK80l2/qOBfED/od83TUsQSVtgejTbfruiDYynVuCZcW
 Po3g==
X-Gm-Message-State: AOAM532UuCpZvs58FoBEGxOTCCcBUAMQFnmAF8BKn+mXx3Uvw8KyXCPJ
 NnuS7iT7fo3u8y/MrMX9Xl+PxSQOAYOBbQ==
X-Google-Smtp-Source: ABdhPJwSC4b6Zp3WR/gk387RdiJewfMgrjpTyShE4TGDBNY3p53Pb4FZAnNyTZ++ZiVCeZuokVyJVg==
X-Received: by 2002:adf:de91:: with SMTP id w17mr5681928wrl.84.1603298555294; 
 Wed, 21 Oct 2020 09:42:35 -0700 (PDT)
Received: from localhost.localdomain (58.164.185.81.rev.sfr.net.
 [81.185.164.58])
 by smtp.gmail.com with ESMTPSA id a3sm5321724wrh.94.2020.10.21.09.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 09:42:34 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: thermal: mediatek: make resets property
 optional
Date: Wed, 21 Oct 2020 18:42:29 +0200
Message-Id: <20201021164231.3029956-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_124236_706417_7A3370DC 
X-CRM114-Status: GOOD (  13.58  )
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
Cc: amitk@kernel.org, daniel.lezcano@linaro.org,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com, rui.zhang@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8516 Thermal IP does not support reset. Make the resets property
optional in order to be able to support MT8516 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
index 1e249c42fae0..2d20f6b0dca0 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
@@ -20,12 +20,12 @@ Required properties:
                        clocks are:
 		       "therm":	 Main clock needed for register access
 		       "auxadc": The AUXADC clock
-- resets: Reference to the reset controller controlling the thermal controller.
 - mediatek,auxadc: A phandle to the AUXADC which the thermal controller uses
 - mediatek,apmixedsys: A phandle to the APMIXEDSYS controller.
 - #thermal-sensor-cells : Should be 0. See Documentation/devicetree/bindings/thermal/thermal-sensor.yaml for a description.
 
 Optional properties:
+- resets: Reference to the reset controller controlling the thermal controller.
 - nvmem-cells: A phandle to the calibration data provided by a nvmem device. If
                unspecified default values shall be used.
 - nvmem-cell-names: Should be "calibration-data"
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
