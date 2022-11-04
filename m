Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A97FC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 10:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=udWPOBXPLH8ELd/9vx9GinaQfO2qOL74S4ly4WI8daI=; b=nCll6wGINdbQCSkU0gLUsMLd6l
	+MOm3kLKUJ6sL5QPgQZyRFw2zpPKMKqIdlIRbuAphPrgHV29GUW8DaLvgMuTVddcfvsltNP5zsOkg
	mlgVShKpYqiZi9QUE+ZTVT9+HP+9rQnZewjwCVHJQcjEAGF4NntWfwp78vGaFen0VAmazNlUcNn6H
	I4il16u3XYgKZNsu16OYvF/6M/QJ1kHIurxBV5syH7V3PlfSRreBD8QzidLVESqNx29Y4rOFJGDlz
	z7No4Y4qxWbu+6oQLmMwpuAa+CmnDY4ADAhPpPJ4VbDK3manefxhyxOsnJ68HV64TYmfwZygcfzjl
	g47EScmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oquN7-003INb-Gx; Fri, 04 Nov 2022 10:56:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oquMv-003IJa-QR; Fri, 04 Nov 2022 10:56:15 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3F5336602970;
	Fri,  4 Nov 2022 10:56:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667559369;
	bh=kR0yMmfSADaph/vvvsbk8ijgbIAXuJ7Ew0EtyUSL8pQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ElwKlRjACqNxRMX31ZGDEzzA7bLPFU7hCpa3HSCzqanj7wQt6Risk6xSZMSgmndwH
	 bRH7opU6YJpLbY9JePqn5pUTXK2g+Vx/Ft291hEWKRVeWBmDgSnXa3xSQzFRB9JX/p
	 e7KDPuysbKymQlh8hnlBAiaAHmiRNTAT0MfoOOHrE7Dt5NqHYcVu2E4xOd0iv/PN9h
	 hVkPH5QgqzlvGoQlYLkMAzwZQKSjDZAmPAN7ArpD2aB1U98t8dxr6U6qayPVAYy5z9
	 RNknrq1sTdXlsnelalFxRGYukYx/O+ucmg0Cra9ASRoAL27XaPVwhZP6bvvnjSCz3+
	 CC5mR2RUdRQOQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linus.walleij@linaro.org
Cc: sean.wang@kernel.org,
	matthias.bgg@gmail.com,
	zhiyong.tao@mediatek.com,
	wenst@chromium.org,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] pinctrl: mediatek: common-v2: Fix bias-disable for PULL_PU_PD_RSEL_TYPE
Date: Fri,  4 Nov 2022 11:56:05 +0100
Message-Id: <20221104105605.33720-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_035614_124897_E40C370C 
X-CRM114-Status: GOOD (  14.05  )
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

In pinctrl-paris we're calling the .bias_set_combo() callback when we
are asked to set the pin bias to either pull up/down or pull disable.

On newer platforms, this callback is mtk_pinconf_bias_set_combo(),
located in pinctrl-mtk-common-v2.c: this will check the "pull type"
assigned to the requested pin and in case said pin's pull type is
MTK_PULL_PU_PD_RSEL_TYPE, this function will set RSEL first, PUPD
last, which is fine.

The issue comes when we're requesting PIN_CONFIG_BIAS_DISABLE, as
this does *not* require setting RSEL but only PU_PD: in this case,
the arg is MTK_DISABLE (zero), which is not a supported RSEL, due
to which function mtk_pinconf_bias_set_rsel() returns a failure;
because of that, mtk_pinconf_bias_set_pu_pd() is never called,
hence the pin bias is never set to DISABLE.

To fix this issue, add a check to mtk_pinconf_bias_set_rsel(): if
we are entering that function with no pullup requested and at the
same time the arg is MTK_DISABLE, this means that we're trying to
disable pin bias, hence it's safe to return cleanly without ever
setting any RSEL register.
This makes mtk_pinconf_bias_set_combo() happy, going on with setting
the PU_PD registers, which is the only action to actually take to
disable bias on a pin/pingroup.

Fixes: fb34a9ae383a ("pinctrl: mediatek: support rsel feature")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index e1ae3beb9f72..b7921b59eb7b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -709,6 +709,9 @@ static int mtk_pinconf_bias_set_rsel(struct mtk_pinctrl *hw,
 {
 	int err, rsel_val;
 
+	if (!pullup && arg == MTK_DISABLE)
+		return 0;
+
 	if (hw->rsel_si_unit) {
 		/* find pin rsel_index from pin_rsel array*/
 		err = mtk_hw_pin_rsel_lookup(hw, desc, pullup, arg, &rsel_val);
-- 
2.37.2


