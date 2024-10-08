Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE15CED27C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 08:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wxe7XEN1LHMGd0Oyi47FAyf7OZba3eA58SL3i+FereE=; b=vyCsl3bta9JzJbexBpFLag6FBX
	IyOwFGQTgoyMRrKoKPUmLcMmkgSeLggiFYVoVWlawCFrmJoDZgxDeBFRfGzrWVoFG0CqYatXkid5z
	bc6a5nA9If9BB5TUQNRfj6yq+tnKgjAqnmauUlge76v4+TqangzI/8Z9kG2kBXRPUMWRt4k4dqsUK
	b4oITL88CcLQUzsmgRIMUrvenmvzkA0+TQX0/4Wbq7i99JIJQ3L94SP5lF5McklS8UdPo4Cc4kEwc
	NUq6QfsY4sxc5QmUtL5pd8rgtKlvVpzx/V6oWhM3JgtquFMn7bInKofYu24D2q6K7wFVC9c0fjbit
	s3dN4N4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5h4-000000054dm-0oZO;
	Tue, 08 Oct 2024 08:35:46 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5Si-00000004zu2-0m11
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Oct 2024 08:20:57 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so4002383b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Oct 2024 01:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728375655; x=1728980455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wxe7XEN1LHMGd0Oyi47FAyf7OZba3eA58SL3i+FereE=;
        b=Uxc54BevdkTaMTzXI2GHoCS3kbQlczVtPykRKj5dXBGRWHZ+bMMSKgkR0IGMoxeKrz
         yiwqPlCoyYtWteSRXMi1aeiRZLtJ3216ncgW/YINXUU7iLKaVFI7ZuGNXppk+mSlWRS1
         /bq5cwwZ0o/SlGwnmCThODDWKTx+QqgQVhKuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728375655; x=1728980455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wxe7XEN1LHMGd0Oyi47FAyf7OZba3eA58SL3i+FereE=;
        b=eHV3KTPSxgTTQpC/RoNlYzDI6DGU7JljTsYW5rsRTKiOYUveDN7joqeoaWktRjPecI
         9j5laDjPqu9ATZEVIIe7P3Pub2q7CW+S1P0nbLmVkaau+fUzBceos/ouqxSGstxase+w
         nLjpFFRL7kgd3YD2ViaskABZmAPIkXQT0mkClIrCJwoaOCwpj4MDmeIFEffJcuZRlc/K
         UrxBcVQifgwj5/5jo1tE2vPxNBZJjrq1VaSP/Ta+J3Zal+rrCDRtD4ct/FWXZZ4z7WT+
         sEGeN5QWsdBx6W5Qfw6a64VncF2SjmPlYJjgth1pSdgZpCM221Cxe58QLJPBsL/Yoz0g
         pTPA==
X-Forwarded-Encrypted: i=1; AJvYcCU/3nLqnDGx75MdKfLPcbLrdffGPMClfOdv95oib7bPl6sSnKsd9WsfwbnAcYnme2BeESK+d1ZQtf6Z4fOmlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ3vdow+HNYxD6IfbEtcH4pIPtcX+us3QEhDda6wT06ZX2BiOd
	1AAH6dg3ZxMz6E6g5xblo32LFd8INlIo7IgK4rA32XAiR9ZTG4Q07eLbGsUinQ==
X-Google-Smtp-Source: AGHT+IFJm0IcwI0CWnxra5LbX1O3mroQEd3t+K9JaisETjqWwQD9tUxGolk9e7WrRGrqYhb2Ata5Fw==
X-Received: by 2002:a05:6a20:258a:b0:1d4:fb97:41b9 with SMTP id adf61e73a8af0-1d707459d68mr3493318637.22.1728375655445;
        Tue, 08 Oct 2024 01:20:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:10df:d27e:8d4b:6740])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cd0ad2sm5672184b3a.63.2024.10.08.01.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 01:20:55 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8173-elm-hana: Add vdd-supply to second source trackpad
Date: Tue,  8 Oct 2024 16:20:49 +0800
Message-ID: <20241008082051.4002438-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_012056_262057_02B1D5E5 
X-CRM114-Status: GOOD (  11.44  )
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

The Hana device has a second source option trackpad, but it is missing
its regulator supply. It only works because the regulator is marked as
always-on.

Add the regulator supply, and the required post-power-on delay.

Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 8d1cbc92bce3..e03474702cad 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -49,6 +49,12 @@ trackpad2: trackpad@2c {
 		interrupts-extended = <&pio 117 IRQ_TYPE_LEVEL_LOW>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
+		/*
+		 * The supply is always on. Adding the delay here
+		 * needlessly delays the readiness of the trackpad.
+		 */
+		/* post-power-on-delay-ms = <100>; */
+		vdd-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
 	};
 };
-- 
2.47.0.rc0.187.ge670bccf7e-goog


