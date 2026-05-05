Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A63CD342F
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SwJxrTaXr1qkR9Kq861LT/XLSkQTjOpjDiqJ3gweEA=; b=DjXPrRNppbe91e+9v0ykHEp3tw
	DZKXrAUQljpHBvg/pKeWI9pHp3W0Ux/aJkPb3+MqzSXTo93/up6/0ChG2ljeJWZWBSDdaGcufpDvV
	zCFRT6HlVAGo4uCdq/N2bnm03Ayme1UcHLk7mTQEwfqoikM2iyNjd6eO43btoZ6I1BWoNjXdp4/KO
	cyLfHWP5q50Vqjzpd+I0ZewXnZHbam88yn+zCC5Ve2VFEukbDDLou9OYCOPKmHi4dBHBDd5equTZ8
	owP/dvobrnDyN3ZZC1yKyLR5DGlPFpwM8I3i6dKETAqD4CI7BDBtppq319WPLeuo7PipWN4iQ928R
	3TfzB6/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnH-0000000Fqf2-2OOm;
	Tue, 05 May 2026 10:14:23 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnF-0000000Fqdv-1yRw
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:14:22 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-834da62e52dso2413193b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976061; x=1778580861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SwJxrTaXr1qkR9Kq861LT/XLSkQTjOpjDiqJ3gweEA=;
        b=YPjnZGnJtaPsaABUtY8oTRZB8A/KEyhcnhucpMO/lPqLmz+DAbuzL4yx0aJmQl9z5i
         CH0I6v8YBIIsHxpBvtLzuDDP8ANL027W2KEsU0IZ8RUlJr6m0Z7UgWpOoMDyNc9h6jUo
         1qwNDmTdARZiL0MXBlbI2CkjfTV0rLMwN+API=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976061; x=1778580861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0SwJxrTaXr1qkR9Kq861LT/XLSkQTjOpjDiqJ3gweEA=;
        b=hdHNQqmkfYWiCy5RO1sLIv+P2MB/Yi0uG0nH2bPTrl98Sk4q/uDH3k0Yk5TFsr4egH
         +G7bDh4IEBg0g+RsGyQak/6qbspEpweOO0fFJzcDD8Jr+stWxcJxgFpLHMbC6opXAlV1
         dNLAZs4cDoUCmMkmB0Pjg68NcKOJEoLzO9Z9qunzd98XyRgGiDmFBL4MW5h0U6UThQoG
         GnOsz5i2kwGjIWhgJmWOXVqlmORosOAw0vuDWS+JrX151V9amIA8AeObVwmjYT3UgbHu
         7j7+fOc+cKGYdlQChPCICikfMjTtE2lpXmVANI8JlxcElYB78vG2WfJNBDdfmR910CxP
         LEYQ==
X-Forwarded-Encrypted: i=1; AFNElJ85w63Ioimx5ZP0oTLSYY2n9pnLyAKii5cHxzTEZpZjz0CzleNMH3UDWaNOUaOb/yN3QX4Pw1v7MI72BiGKbA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywro1ayL5yQOWJ2kDti5nCY+4m07HXYjhWWWES5TWlVy5n6bz+W
	Z4Feb/XASTet+jhApW6m7WeiI2t7+fFuomI2tnKByPeavhJsx5+sJbMrjucLC1C1EQ==
X-Gm-Gg: AeBDietPVBOE64/kT59EMmnJmhK9gZ8wfYj55ZFazIJjZz/kGSr4N9R5w3LzgcASTxW
	5s44lNe1wpl7PEJWisnzMbmaH+lf1ad6o/YKGtAIcGn5TGfHwQWeQnfQ/DCWKE05OLSfK0x4F5X
	A5DwHKQSVi4NiFIihmS/1PUmPvxnC532HgJelvLtr/5MLf6mVnqCZL1oEAW6joxiEg2MZGZsUWh
	whCK3dZmfrm1Iy2f4m/kz0KO+/3xqNqBvuodkvtX5VHL11PRLppCfCwwXdvjyyLV3/eRA+OxK5Z
	F2xGQvuiJQvEqw3o8SAlRg4qkZCQlxw+v9Nm3c1TJlUxCIkTviCwfIlblbk553ZGNcFONl6hIRO
	u5V+6N8EPECWcOa3jXDoyPhkmhgDwVGTl/eE+9DWJf5cvvuvanvw/l+3CUc1nEWz3y/8DQYwX+Z
	2NKmQpYw7TxhcjKDbhTE9U7Y1BGz9reg7DLw7bzpvlb4hUPGOaPLWWiDMTjfnbEEGG1yJEmWrjr
	6lOmYmjrimRmMen7kPFMaLMAl1AeQ==
X-Received: by 2002:a05:6a00:4143:b0:82c:e5d0:5249 with SMTP id d2e1a72fcca58-83921eeef5cmr2466196b3a.8.1777976060673;
        Tue, 05 May 2026 03:14:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/16] arm64: dts: mediatek: mt8186-corsola-voltorb: Add MT6315 PMIC supplies
Date: Tue,  5 May 2026 18:13:51 +0800
Message-ID: <20260505101408.1796563-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_031421_535004_0CD4B5D8 
X-CRM114-Status: GOOD (  10.18  )
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

The MT8186 Voltorb device has one MT6315 PMIC. The first 2 outputs
ganged together, and the other two unused.

Add supplies for this PMIC. Even though the outputs are unused, the
inputs are still connected.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- New patch
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
index b495a241b443..0250b4eeadd4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
@@ -73,6 +73,10 @@ &spmi {
 	pmic@6 {
 		compatible = "mediatek,mt6319-regulator", "mediatek,mt6315-regulator";
 		reg = <0x6 SPMI_USID>;
+		pvdd1-supply = <&pp4200_z2>;
+		pvdd2-supply = <&pp4200_z2>;
+		pvdd3-supply = <&pp4200_z2>;
+		pvdd4-supply = <&pp4200_z2>;
 
 		regulators {
 			mt6319_buck1: vbuck1 {
-- 
2.54.0.545.g6539524ca2-goog


