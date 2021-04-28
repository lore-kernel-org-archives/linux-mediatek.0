Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D366EC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 17:05:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E7656143A
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 17:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E7656143A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FiOUDYcMxMkt6CX8Q/opm5xcJ7TE7HqO4oHitrnBMl4=; b=giSLu1W7dG9zcvuu/pVQwc0Gb
	q0XXtze5BpUhoxq+a5pLSZPjKgxeNSybHTUuV9NMg4ttq8miZOxO+HbAG6T8tqoKjL1/KBS8dIVWX
	gjZLK0gCXzxC9TbIRZ/kUv4n0oML260+5KCF5nDFBd9sYd6Kmr6+48zHN1pQrY+qmxn9LV/jnkB6i
	iFVWjpip49GZfaQVoM5UsidnSw21LPIDc7EkJUa763lU84GRo0P+FWYB9FqzUhvqgG1vpYFsckdw5
	IqtDoztLzHPJnCNfAwFTpRLoyibMiAz8TCJnLF3QzRWFmug/rQeOSg1navsdatEDeMQ9R91m2ruxS
	hudagiibA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbncZ-003xAq-Ae; Wed, 28 Apr 2021 17:05:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnc0-003x40-M1
 for linux-mediatek@desiato.infradead.org; Wed, 28 Apr 2021 17:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=; b=pH1fYJ9eOrVxKoj3cTp0RGQWq4
 61CiK5DQxsbl3b88TcxLLrSUUmwudZ6D0Q9a074SvCdwhsLp8HGr9tu+507uHnLwe5wYYCgQOLmif
 lw14TVa4QyRpJu9kyRGIsb27zjhTkP+5SVezO5vy+9DBc4tbWmvTLK2tqt82HYMPXWB+yRrqM6gpd
 dncmnr/1ngqnH65g66nmt+jCPH/6Kjmqs2feJQrZv6w7cakmbdCK7l89DD3wsEqeT4GFJF/NW6ivA
 DrmiyUFNXR68ZX/txJrEM1TM6fEhMDDOuN11uIyx6+q/N66ikpM23Y2RYAYRHBnokG6/XBPMUlw0t
 3yeFn9GQ==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnby-0002ue-8U
 for linux-mediatek@lists.infradead.org; Wed, 28 Apr 2021 17:04:31 +0000
Received: by mail-pg1-x534.google.com with SMTP id y32so45174147pga.11
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 10:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=ZBABP32kAKUkL73RzLrs/VZTLUwl6tRRR4kreJjVivIQnqrLTx++PGkZdghCv6A51h
 i5wfgs4sj08UJWCJZAhmuB1UPJXH2+qBGrDT9VrYMuWAyEi9ipQ4WYYmOIrBtCW1JSTT
 xZT0g/d1wPha/HFRrZyfSi4R5Ae53TxzQP2kU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=Q7DbCdxdP9NUrx5pxiMxDZ5+DH/mQfgPVLNskJqQzE8d/gpTuDTMhG2XA8YNlr8ZAd
 DoRpM9XCdUKVu/7YfWCxnEO4lkTRpbF64TwMBbuiAwQc3NZMQJhKHfDrcg+XaN1tc8H+
 qahwwAbaNXyfQCk2Y/oTLTH8lhR+8PmB5bonarq03bU4iXZB++fSeGcfamzZPJO6m6jT
 3CyyiiY+yLdYidKmMxmwrQ7P8CBCidc4Tt14uKX2kiHbC8yoEfve1myb1blXpBZ44+1v
 YLo6o4LakexNTBuUCeJG5SYqxTJaWAzeO+aal8/pcCae9naGuqn03gk67XOPMKJG804O
 q+Vg==
X-Gm-Message-State: AOAM533RQD3gYfT9OcLDVYuBKHp+DuExZsaxYQ+UozqFxghZrghYrbsR
 sHolt+d09lAgNVQ0wA71SKBxmw==
X-Google-Smtp-Source: ABdhPJxmrYhCyqvJ9YcpCKMIp11Js7eA8QUCI7vGyyUeKC4ER8oO8PiDoUeETkQrLQ/8pN+UBHWhJg==
X-Received: by 2002:aa7:92cb:0:b029:1f1:542f:2b2b with SMTP id
 k11-20020aa792cb0000b02901f1542f2b2bmr28418795pfa.31.1619629469280; 
 Wed, 28 Apr 2021 10:04:29 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1faf:c32e:8742:d913])
 by smtp.gmail.com with ESMTPSA id c8sm244351pfp.160.2021.04.28.10.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:04:28 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v5 4/4] arm64: dts: mt8183: Add panel rotation
Date: Thu, 29 Apr 2021 01:04:16 +0800
Message-Id: <20210428170416.1027484-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210428170416.1027484-1-hsinyi@chromium.org>
References: <20210428170416.1027484-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_100430_316102_B8FC8ED3 
X-CRM114-Status: GOOD (  10.14  )
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

krane, kakadu, and kodama boards have a default panel rotation.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ff56bcfa3370..793cc9501337 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -263,6 +263,7 @@ panel: panel@0 {
 		avee-supply = <&ppvarp_lcd>;
 		pp1800-supply = <&pp1800_lcd>;
 		backlight = <&backlight_lcd0>;
+		rotation = <270>;
 		port {
 			panel_in: endpoint {
 				remote-endpoint = <&dsi_out>;
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
