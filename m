Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC1EC05027
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 10:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AgQ93sHaWrvPulwDIUquZyN1kcQlgU847DlI+wpqv2o=; b=UYzOFRWtD1JTSkMlcR5QSpJC2g
	GtrkK/TUWfUratWdJpuagboisl+7Ut9056hxnBC16jQai8qXtJWMR5Y4QPzZ6biZKm5xnRz2JMxhA
	sYu/pQbeyykcpAvx1lFbznttBeB9PlJR9K87w02Kl92HmgHEpBkB3vLWJDw0XJdyKYPOz4tvDIpIT
	IE4VOUG69E2V7nLv5xBwVLCB8Xj5+Q2yAzxO01aG30mkarlMJOGjybJYvjFXObjqw6fH4Rv0K4r89
	HQZhJANjpb2rIwRb6vqdnvRAJU0c2VVQi+ci4sO9wesmAVgMCdpqlbR8iLverKBno+qKHu5mGFaq6
	DeXMOcgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOyJa-007zJE-Od; Mon, 06 Feb 2023 10:01:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOyJM-007zBz-2V; Mon, 06 Feb 2023 10:01:21 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 84D7C6600368;
	Mon,  6 Feb 2023 10:01:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675677675;
	bh=duZOdncpie1C6AkV6VHZLZr+dP/cQtDdlisJYyTikZU=;
	h=From:To:Cc:Subject:Date:From;
	b=Wz+D0HXapes31AhNtVqod1g92sOPbKAITwPCL6NoJWFqZqYkkxp61GhP8Yw2S91zS
	 90/Z0Yaq57mjg8YDv+WL6ngA3KGuB6z0aoAuTF0DpAvW/w0+8NBtkpODajR2zjFMSi
	 Fq2mjRn3qwnbeQaeINfHsxySUq/Bgs0lhvW5SqLy5Dl1IsevArsIVwaJXori/bhmkf
	 KqbVjow+UEK1EqtcGztQx1WirTVQXj7beaK8Ul481fmSSPEWeSNx8Cm0g8Z9ynEppj
	 /DS9/hDnNb7qibx38pfO8SG+Jx8TK9n+sQ7U3p88eOz3lyltQ6NglWJnX0c/6EZUtW
	 tFZU7dlB5ZgRw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	edward-jw.yang@mediatek.com,
	johnson.wang@mediatek.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	jose.exposito89@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 0/7] MediaTek Frequency Hopping: MT6795/8173/92/95
Date: Mon,  6 Feb 2023 11:00:58 +0100
Message-Id: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_020120_364205_B21DE957 
X-CRM114-Status: UNSURE (   9.64  )
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

Changes in v3:
 - Added commit to export register/unregister/parse FHCTL functions
   to allow building clock drivers using FHCTL as modules

Changes in v2:
 - Rebased over v4 of my clock drivers cleanups series [1]

This series adds support for Frequency Hopping (FHCTL) on more MediaTek
SoCs, specifically, MT6795, MT8173, MT8192 and MT8195.

In order to support older platforms like MT6795 and MT8173 it was
necessary to add a new register layout that is ever-so-slightly
different from the one that was previously introduced for MT8186.

Since the new layout refers to older SoCs, the one valid for MT8186
and newer SoCs was renamed to be a "v2" layout, while the new one
for older chips gets the "v1" name.

Note: These commits won't change any behavior unless FHCTL gets
      explicitly enabled and configured in devicetrees.

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=714059
AngeloGioacchino Del Regno (7):
  clk: mediatek: fhctl: Add support for older fhctl register layout
  clk: mediatek: clk-pllfh: Export register/unregister/parse functions
  dt-bindings: clock: mediatek,mt8186-fhctl: Support MT6795,
    MT8173/92/95
  clk: mediatek: mt6795: Add support for frequency hopping through FHCTL
  clk: mediatek: mt8173: Add support for frequency hopping through FHCTL
  clk: mediatek: mt8192: Add support for frequency hopping through FHCTL
  clk: mediatek: mt8195: Add support for frequency hopping through FHCTL

 .../bindings/clock/mediatek,mt8186-fhctl.yaml |  7 +-
 drivers/clk/mediatek/clk-fhctl.c              | 26 ++++++-
 drivers/clk/mediatek/clk-fhctl.h              |  9 ++-
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c  | 63 ++++++++++++++++-
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c  | 65 ++++++++++++++++-
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c  |  2 +
 drivers/clk/mediatek/clk-mt8192.c             | 67 +++++++++++++++++-
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c  | 69 ++++++++++++++++++-
 drivers/clk/mediatek/clk-pllfh.c              | 26 +++++--
 drivers/clk/mediatek/clk-pllfh.h              |  1 +
 10 files changed, 314 insertions(+), 21 deletions(-)

-- 
2.39.1


