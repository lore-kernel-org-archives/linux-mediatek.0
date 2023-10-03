Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA64E7544A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 11:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3ih7z3JVjyxDrJ2/7OmrsGgClAV+4gWhD7F8/b2948=; b=hMMgocjrpcVjrrfi0TcArQ8aNL
	sixXJmCXvubjdEwD62Dm/6/mlwDxelCRP2fqW+CJlVT7eO7Cw25b7aCS6A1VAv4vTP/KpjzbDafxF
	XdtxClQWUb4dQVAShGLsqZPFOMdCQ/SkmgFVWtb7XL/DdXjvSMNX0O20fLG7fjbawTfF5gXRc1NoP
	EF8FspxZfFKtLihJPxUrCysaFM6mYy/c0PYAHVhNcisncnSAawLu11mNDZ6c7T1gOgnJHHoQrGPJP
	G/6TH1FHZPGJm21e3bAmULknx0wqeNVESz6w9VZnyKeI9KNQoUOgPHtglEPVbJ12fVq6D8m9YbKJD
	qpSXSrdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qndLp-00EVHl-1J;
	Tue, 03 Oct 2023 11:14:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qndLj-00EVCT-1F;
	Tue, 03 Oct 2023 11:14:01 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 290616607330;
	Tue,  3 Oct 2023 12:13:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696331638;
	bh=hIZCBWOdq56nnFmuMw8Yfx0EaOSNWmye+u5MsaxkvMk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LGlEBYbuY63Hchodh7bTyq5hzODdZChQ/OdstXwzcxqLmt0ucGXdNpEzV6TIUZf9u
	 ki6CZXIR1uAvPAV50mM5Ooqd6A5rjlLWqUpkF99k10n7UFrbrbfftrVibulI8qzVh3
	 sEaz3sAGneEL9Ck3aSHOvAtnyxtfxc1WNPFwYR+EwrFrw6XJO4DHjxsWyyPfVPICQq
	 DNuG1kZd1iMzb/FfdOQ/Oq7jHxVhT5bBLtlg7S1inH814KXZpfSFbHIuNMSAb9ZPGj
	 bagR0BpDdi3FErFpd8gsvAflzNo8bOATDPl1xL5Sa+zFIxawFJjwDlVA1FE9Olm1Ea
	 j8HZFvL/FDw9g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Tue, 03 Oct 2023 13:13:47 +0200
Subject: [PATCH 5/5] arm64: dts: mediatek: mt8195: Set DSU PMU status to
 fail
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231003-mediatek-fixes-v6-7-v1-5-dad7cd62a8ff@collabora.com>
References: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
In-Reply-To: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Miles Chen <miles.chen@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, 
 Frank Wunderlich <frank-w@public-files.de>, 
 Jieyy Yang <jieyy.yang@mediatek.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Seiya Wang <seiya.wang@mediatek.com>, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1870;
 i=angelogioacchino.delregno@collabora.com; h=from:subject:message-id;
 bh=IZfn1ZaZiDCR69psn2/IYKM29jkr+w6U1WIz4R61yqQ=;
 b=owGbwMvMwCU2y4zl/NrpLRWMp9WSGFKlv+eXcT7jOS70uXRLdu9Lf9VuMcYHfR8OFWz/mDznn9/H
 wxrHOkpZGMS4GGTFFFnU79ZkP1+zkvFI+9kSmDmsTCBDGLg4BWAircaMDG84zh3bGHmkhNlz+4uQz8
 9XxLzluLWr5p1g6leLrrNtlUIMf6VOWSr9EV1fsM48WLKz8PiyZ61Nrz+t6FxjOOVwolS1JTsA
X-Developer-Key: i=angelogioacchino.delregno@collabora.com; a=openpgp;
 fpr=57152E620CAF29C5DBE574766833ABB5BEBAF7B7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_041359_562041_A8F9E09D 
X-CRM114-Status: GOOD (  13.78  )
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

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

The DSU PMU allows monitoring performance events in the DSU cluster,
which is done by configuring and reading back values from the DSU PMU
system registers. However, for write-access to be allowed by ELs lower
than EL3, the EL3 firmware needs to update the setting on the ACTLR3_EL3
register, as it is disallowed by default.

That configuration is not done on the firmware used by the MT8195 SoC,
as a consequence, booting a MT8195-based machine like
mt8195-cherry-tomato-r2 with CONFIG_ARM_DSU_PMU enabled hangs the kernel
just as it writes to the CLUSTERPMOVSCLR_EL1 register, since the
instruction faults to EL3, and BL31 apparently just re-runs the
instruction over and over.

Mark the DSU PMU node in the Devicetree with status "fail", as the
machine doesn't have a suitable firmware to make use of it from the
kernel, and allowing its driver to probe would hang the kernel.

Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/r/20230720200753.322133-1-nfraprado@collabora.com
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 4dbbf8fdab75..43011bc41da7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -313,6 +313,7 @@ dsu-pmu {
 		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>;
 		cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
 		       <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+		status = "fail";
 	};
 
 	dmic_codec: dmic-codec {

-- 
2.42.0


