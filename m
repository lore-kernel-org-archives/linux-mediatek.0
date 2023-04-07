Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BD0C77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 10:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wuqJ3NJSgCZO0KTwOialPWQBgLhEbjc4bx2H+jW2qg=; b=IkD3pbWFyJUOh8kKjvZ58RebWI
	t3XpQmkO812UPp5Nb/5wZcZ4624dMTzmPl3k59rV/RF7CHxYLBW4vXIuLCS8vjjJBRSj0M+0MJgGK
	GdmeqyFLVGT7wKtgZJUxvpH8WMFdiH4dt48AyCNTSn7Ots2nYRAqS3f1KB5dhKOqW/jR1MVHq4qmK
	XNcRM5EoLrXuLJHnrq0wcmpKdyArmf62wPjtuQB2sz6puItWF3P9cTsateSNTz90GycNLjW7jYOp7
	OUA6xjdvmg2maQXnphxwkEX3DglAZK325QSPj8IAEEyZBz9w787vTh4rPs6PwXC3l6z2tTF8M1lBs
	LKdROpTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkjAN-009m5x-0f;
	Fri, 07 Apr 2023 10:17:59 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiAa-009cv3-2J
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 09:14:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id e18so41803342wra.9
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 02:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680858844; x=1683450844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wuqJ3NJSgCZO0KTwOialPWQBgLhEbjc4bx2H+jW2qg=;
        b=HNuTTSYZbOUQAPBqHTfl7H0KFLeNCmBSAlxUlubupMhOHWwNQX7gFMQvX2qd+/g6Br
         Q8B2M9kpRg4kTYh0DpI408C8L+TLkj5J5eR7cNmIEninDkXt0vocGH1skpHpoa2seyqk
         Et6CPDUgY/OCG6gnfzrLD5Pd/lPKPqA2oMZAXeOf88P8xIvE9iWlwoo4HceMpDfMOina
         wElzOKii4Tw20GzTYGASf+eYnIAfjJQtU62qIlRuqkfmJCihiY+dur3rNbgD8hEZKX+I
         /k/MnCjIkLOpvbWLB8wtijx/K6jOQAPKGHL8qImw7PzXzwIqQeFfqObuehrh/ebLxWUR
         1tbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680858844; x=1683450844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wuqJ3NJSgCZO0KTwOialPWQBgLhEbjc4bx2H+jW2qg=;
        b=rpMC/TR6cOwq0BO6mJX8PLbwBq9wc4mmhkU4sTAcxWDh+c7cAvk42BMnrvG151qkrv
         0Gtew6qt074ExvW+R3E26aAm10d99MAAsl/e2JzxF+aRhdk0j6hU6m6CAAR18eEyfw8O
         8RwKGlRq+oIh+z/yGwpBCoqEIqlI5sHk/L+003zsOO+sYmMgxAaO4bWn6Va2Hgu49jHp
         MQel3gLDikVev93oRr72sEPA2tni+MkWcwwzRnuTIlDZtk//HKqaIlMEMcGsNY8nulwq
         tVMy0J+6GkEOm1vyFK+QqVL4xWQEYvUBopHJWcaD3SK+BQnNQ+Pv3yQ/5OvTdpRXzjL9
         1QfA==
X-Gm-Message-State: AAQBX9cpNqtczCYvSQwa+m5wVFBRX8+iO013ZDVQT4Fyjg98SlWQTjub
	UJwoeA4MyAVGsw6iZihKBAzMeCjrtWMedYSgIas=
X-Google-Smtp-Source: AKy350bxY50SgH2Hy5SgJ/V3cCDFecii0IL92XTMoom6qTEgvwZttd/LLHHjmQUF/RXNh0HfefYpNQ==
X-Received: by 2002:adf:e643:0:b0:2ef:b32d:f54a with SMTP id b3-20020adfe643000000b002efb32df54amr523144wrn.33.1680858844242;
        Fri, 07 Apr 2023 02:14:04 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id k22-20020a7bc416000000b003f04f0c5a6fsm4026429wmi.26.2023.04.07.02.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 02:14:03 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 11:13:51 +0200
Subject: [PATCH v2 1/3] memory: mtk-smi: mt8365: Add SMI Support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230407-smi-driver-v2-1-8da6683cdb5c@baylibre.com>
References: <20230407-smi-driver-v2-0-8da6683cdb5c@baylibre.com>
In-Reply-To: <20230407-smi-driver-v2-0-8da6683cdb5c@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=WjdOKn4CNCGCL7Lz1uy2ciMySKdsHm1qKtgJMaQs14k=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkL97ZvbpRspLALhiKU8/NiiqCdZPzY7s3KtdRLwlQ
 I+nMncuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC/e2QAKCRArRkmdfjHURfqiD/
 wIWom0hIvuKv5lKnL+jKLiTqW2HHBKLSlyk7G0nOr7xQbxRn3IA2QhwbhG0ngNdq86GffH/W0Pwlwy
 8pXHY3lFHRZZe/GATtihD8WF9UGfngW2YxmzkR8/AYErq1JESIJHvW4pvDVEGUJQY3nAJ0A9I5hUCu
 llhZ2oQKp/eUYB2I35n5iEJMZbIVChJulAHMpfTrOsEoJHf9DMD+ZUsozwyASoPxUDkqNbgnjsvlxp
 +yN21T8U3N4YA7z7Li9DRTkdFzh+jNtM1tACIR7qdqJeH7WDWXIY7IaRmhBF1EdLUmNN8ZB9MWjO7p
 OoWSCwwwm8iZ2240G+ggOjOBI0yt6BbGaSNqjF3bQrUdGVKbSdUDRG5MauEkhDHq44eVn0cxjdpUL+
 Z1qEQSbvML7lf6yGj4sMv6ztJKwFoslR1lEnAkjSLj6AgUaILci8Vyrj0eWZf9ZclOvzb07W5mv3/B
 U9O454Cf4uW89JcAOJNJzjo/w2a8NuJ6IqYESeWJsTBRKrJUlwszlT1XCkyqNdqzfgcyhso9jjzf0X
 oRtUUXRpHPP5RfIQ385xYAXAh5cvpt8iNgoncHY96XPn/i0gvXRZvW1ojdq6I0v1yS9vGeB/+YSUoK
 KuKQNa8zyDNK2EF/q24OQN2FCSA+U3xp17auk1jhvVhFX8al+l+ukXLJNNhw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_021408_776201_A240F7CD 
X-CRM114-Status: UNSURE (   9.17  )
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

Add MT8365 SMI common support.

Reviewed-by: Yong Wu <yong.wu@mediatek.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/memory/mtk-smi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 5a9754442bc7..6523cb510518 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -713,6 +713,11 @@ static const struct mtk_smi_common_plat mtk_smi_sub_common_mt8195 = {
 	.has_gals = true,
 };
 
+static const struct mtk_smi_common_plat mtk_smi_common_mt8365 = {
+	.type     = MTK_SMI_GEN2,
+	.bus_sel  = F_MMU1_LARB(2) | F_MMU1_LARB(4),
+};
+
 static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt2701-smi-common", .data = &mtk_smi_common_gen1},
 	{.compatible = "mediatek,mt2712-smi-common", .data = &mtk_smi_common_gen2},
@@ -728,6 +733,7 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt8195-smi-common-vdo", .data = &mtk_smi_common_mt8195_vdo},
 	{.compatible = "mediatek,mt8195-smi-common-vpp", .data = &mtk_smi_common_mt8195_vpp},
 	{.compatible = "mediatek,mt8195-smi-sub-common", .data = &mtk_smi_sub_common_mt8195},
+	{.compatible = "mediatek,mt8365-smi-common", .data = &mtk_smi_common_mt8365},
 	{}
 };
 

-- 
2.25.1


