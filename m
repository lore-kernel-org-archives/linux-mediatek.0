Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31291FF885A
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jcPj9jxKJ+7Gn13Bn4AR/zcbvWrepFf4+yuL7CK2GFk=; b=ei/p8WToIpG+i5XrAbgjPFAMB8
	yWTUV7jZBE6w9ozy5qFhKgHinE/qHtyuyD4yuuSdKOZQBTHxbaIUCO9QGq8q3RNB5+FnOLEEcwqy6
	8xZ2y1TBACAzbyL4/+USszne1g3ZhiMyz/EzyQTSskyfgxYxIK7Q3V/CPMo8G6PGKxtvbF5vaw5G+
	jLO/chqvjVkCVxh+ZNon14TmPVKSakUrjYKbfghbJk8WivlxuR7NbPhWB9oo5IsklPDMUzfxQMCng
	G9Pnasqn1mayltK0G7WWfxMjvQZDCIjKuin5zNIMR/i68Fu+Wfgba8DBbBVdf4SVxThmIg3Nv60RV
	Lhif0QcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnr-0000000FrNj-1xO7;
	Tue, 05 May 2026 10:14:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnp-0000000FrJX-1J5q
	for linux-mediatek@bombadil.infradead.org;
	Tue, 05 May 2026 10:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jcPj9jxKJ+7Gn13Bn4AR/zcbvWrepFf4+yuL7CK2GFk=; b=Xuxxndz9lL/j3Jb/wSsqMbLelv
	570mSZzFki7TRhFHybBWYxgjfGsjzme5jg9VqkUQLbbC8G3fhRrcEuusId1lqAPPEcO2gaWQgu1n7
	qsmMzoccwjb1iblAs2EJ+EuOdYHJcPF7v4UDyNc/2vbbC+C9nmrBagZmG+0glbRwFLBkPD5mZ0xZ3
	3IzQUsiNP+CnWX7A9u2UGEtkCd6R+PLYfyTZykiJDg4vvLLxEckhXzX9xNwVfrUsaBmPrLnypuR65
	q48B3KK++BKbTRnr2kP+B4sz1wR8nuiyN3PIjisDyQDYt64XpYLmbm0pIYHj8NLx5jcwonHypdVwd
	GYRE1e1w==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnl-0000000D9ck-1q3A
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:14:56 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so1594544a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976091; x=1778580891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcPj9jxKJ+7Gn13Bn4AR/zcbvWrepFf4+yuL7CK2GFk=;
        b=bQEl6kM9g4hFoTPkZ/dCMvL2LKFjHQDfBdqumpzlbmtZZIkrFkDGqriT+3jNUvDEaI
         6l4TQ6vmF5qYAR6SrUO5oShuaO2pEJJNLuBg16qId/kOGIWNgVoFdm/5EfNqRuxmpLaZ
         JT19pOdklpOgL/nJKZBWsa620fz6SLuZwhJ2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976091; x=1778580891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jcPj9jxKJ+7Gn13Bn4AR/zcbvWrepFf4+yuL7CK2GFk=;
        b=WJJe6S9wPAQ4O+dcf8XeesJwuRfktYq10zL3rsHz5Dd8vslZ+VF6wYJmxIIYliyR8N
         ujHDltCffloonwmB2IVaUZ06ZUx52o9sp8rqlWVaHY8LDv3kf8MbORon0VCsH+jgkgTo
         ZA5pR/6hg6rGJQ0PTL3N+qwGfQuGPXvf+WJlnA/nfWFPDrCy9BpzZWiMybHnBHcfiOFU
         Sxkwq5mGGdujqiQvN4IHAjE9wx0n6xIGiFdl3BxS00FWIWKBOylqSw8J8uQ4Me89zb31
         m+ibvR/0erbXdaZPz9Z1XkTE6oQOo6chHOrU3MZVEXhLywJLiD+jCpRAYLHL45cbTrwM
         xpvA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZYzMohQRmQAgy/T5BvB1rvv2O+kZ3/ZB2GqrkMNRKsGD47WBnxcC+bE+wHN64753KT7ixI3EakxdN2V0qGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyR1kRhSjrK3xTy+zQ26xnS3gBDKYqV7Ug0UXG2pLBElTgkSlLl
	HPkLISWBFwsLPj6sjtq2PV215cRBv1P89+w2leOszvVjk5kNS2m1eC3agHSiiadcBQ==
X-Gm-Gg: AeBDietsPDsuYTWSqXLXgj11B16sQht/F+i8/t5GbvngXmglvlRnOU3D8n/tyhmhDxV
	nvnEl29+rY8HBrNUgJuYTqBHl+U2QDVlRXWZobzD4yLBE0jlJRVcaE9wgxFtlcgw+pelZYY3w05
	r+Z2+lQ6kVTj9WZX4Wy9m8UEjV9mLGmL6tNiEdQBnPuiHVBt6fVnP9FuxbHu6+r8PnGkBPF+8eF
	KBjlrcX8B8No5yNLuE5/ltT67gBtbQqZw5AlghLR/8MLUEKmpNOldXMgF+6qnU7luupqCI080E1
	TOOINQSqy0u8cKdwFG0a+9HrjO/R8XWzezssA+EThLyvFkxMXObYGmcps/iNJ5RsZZeSlaZp+Tn
	MbBiPrZfASNjtAdVdu7jQnEqtAZggIBQqHqdPGem+lD9d2cC0GFaeMwD2kaw4Sxy8w2x9fQ+Bm1
	Kj1nhdw4oYHjzfQpSyMPEJkrpYgaQp6tOiBwrrrqDYfVOpTqBodwyRtWpnhSdaAf8l/e9fT7lmw
	9g7O9BcMjVbBhQCOyQ=
X-Received: by 2002:a05:6300:218d:b0:3a3:56db:919c with SMTP id adf61e73a8af0-3a7f1b3ad0fmr13728832637.14.1777976091454;
        Tue, 05 May 2026 03:14:51 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:50 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/16] arm64: dts: mediatek: mt8195-cherry: Add supplies for ChromeOS EC regulators
Date: Tue,  5 May 2026 18:14:01 +0800
Message-ID: <20260505101408.1796563-12-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111453_642726_F33571CC 
X-CRM114-Status: GOOD (  10.64  )
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

The two regulators that are exposed by the EC are supplied by the system
4.2V power rail.

Add supply properties for them.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- New patch
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index cf9855618494..bda1b0f9f72a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1431,6 +1431,7 @@ mt_pmic_vmc_ldo_reg: regulator@0 {
 			regulator-name = "mt_pmic_vmc_ldo";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <3600000>;
+			vin-supply = <&pp4200_z2>;
 		};
 
 		mt_pmic_vmch_ldo_reg: regulator@1 {
@@ -1439,6 +1440,7 @@ mt_pmic_vmch_ldo_reg: regulator@1 {
 			regulator-name = "mt_pmic_vmch_ldo";
 			regulator-min-microvolt = <2700000>;
 			regulator-max-microvolt = <3600000>;
+			vin-supply = <&pp4200_z2>;
 		};
 
 		typec {
-- 
2.54.0.545.g6539524ca2-goog


