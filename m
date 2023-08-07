Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ECDEB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Aug 2023 08:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ivUPZKkU9V81XA/9ZzpML9/MoT2AN2Em4Cdug3APMqE=; b=TGYDFOR9FZNvPVMeDDaHrd13ml
	x+ss7y/NE1x+N+EpKiw82Vb4xE72WQ5N7o0RnIXEInDtETfM12jtC/u7WWILqJLF5ShWdbKfiIgvt
	QtghkcQqTw8gBF7KDc8iWdNJpDmGAlhKJo/eDCJzvfE1tNiLTT6JS5qwxpByNLgYfk2GDV3+6iBV1
	5dvRDexVwsCJjRdog7yFZfAQjpGfIrYI4m/c48wFSiUgnO9hmuELLiGhXXR6yMm9TVfx3CK8pQ08L
	9T/GetLa49HRfflXIwQCCqn/1I8oAfQrs3pR5g2WOTNuP0w4/vG5BhYCTARInfncrm4pH4EAluSyN
	xbS8/+gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSw4U-00GW3N-04;
	Mon, 07 Aug 2023 08:58:38 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSw4Q-00GW1n-20
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Aug 2023 08:58:37 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bbf3da0ea9so26762155ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Aug 2023 01:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691398711; x=1692003511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ivUPZKkU9V81XA/9ZzpML9/MoT2AN2Em4Cdug3APMqE=;
        b=k8fdQc/jO9CQK9AMjUVaYJPPF2jGJAozl8L6QG33AYVjHyCCEaGfbC5AIX/6CcLksi
         rkAK2yqBJ9RFvU4SquPBJRCd+ZDPS0HT+mOlMwi6RdyMz/upN9GfrgmN0J9s3PPUdFyB
         E5sLEIa+3V5TvPiqn6O5to+Z1e1f7LyZVUOoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691398711; x=1692003511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivUPZKkU9V81XA/9ZzpML9/MoT2AN2Em4Cdug3APMqE=;
        b=C/78W3C2IcaWKRjZ1lyR9IjeUMSZvltkNLoddRqm2lB+WOL7bS7c+AcityHNsPBkuu
         F/fDZpOk/J9NzrX1MKxNoioGTQUJ8IEdSAVEaOvaSHNkHQ2AbOkkB7SjG9eSu6sWDnYw
         JkAfvkqpNiBHQdArzMMDo0YoIOSrR8GDNXT9r3U10HEtdiGTkNB3bdPYe7720RMCGL+h
         qRmnDUfx6jmyX8V1tO+LELIQ8JYVNnulKTdEChNnTv2oppclG/Q1rsrUtd00FuR7fXt7
         XhM4HX5yl0IIjsv8XkLq9ImgB/GklKD/mo1XJ3Z3L7DlDyEcYkU2QcsgLgeVzAm0svvi
         ohuA==
X-Gm-Message-State: AOJu0Yzz9+xqvJjhKg0OBrLpdP7XUeBgyW5H+RjJpnpyha6BCVoM+Ceb
	7vAWM2BHhHBrA34GFr68UU1MrA==
X-Google-Smtp-Source: AGHT+IFdeJORfRK7L+sj/NaxVhQeqQYdqhFUl6jyK8r0GnET7N4tBUbW1ngbqwX7Pj6YJBp7RXGPeQ==
X-Received: by 2002:a17:902:ec92:b0:1b8:b827:aa8e with SMTP id x18-20020a170902ec9200b001b8b827aa8emr8776343plg.11.1691398710772;
        Mon, 07 Aug 2023 01:58:30 -0700 (PDT)
Received: from localhost (97.176.124.34.bc.googleusercontent.com. [34.124.176.97])
        by smtp.gmail.com with UTF8SMTPSA id q9-20020a170902b10900b001b8622c1ad2sm6286044plr.130.2023.08.07.01.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 01:58:30 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Google-Original-From: Hsin-Te Yuan <yuanhsinte@google.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Hsin-Te Yuan <yuanhsinte@google.com>
Subject: [PATCH] arm64: dts: mt8195: change watchdog reset boot flow
Date: Mon,  7 Aug 2023 08:58:12 +0000
Message-ID: <20230807085811.1.I7d08b8323531c59c0ec247570b2d05a790bfd3d4@changeid>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_015836_222371_75670E11 
X-CRM114-Status: GOOD (  10.01  )
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

The external output reset signal was originally disabled and sent from
firmware. However, an unfixed bug in the firmware prevents the signal
from being sent, causing the device to fail to boot. To fix this, enable
external output reset signal to allow the device to reboot normally.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@google.com>
---

 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 37a3e9de90ff7..5dc4214e1840b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1147,6 +1147,10 @@ &uart0 {
 	status = "okay";
 };
 
+&watchdog {
+	/delete-property/ mediatek,disable-extrst;
+};
+
 &xhci0 {
 	status = "okay";
 
-- 
2.41.0.585.gd2178a4bd4-goog


