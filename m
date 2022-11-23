Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87661C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 11:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F/dGKeFVnFl8QD+KVMBAjeYSBOYG8N12cKM+ANnfIaE=; b=NNFlJJ3xa8RzaNEhJ4aGATFTqH
	Hwm4co+0fHwmL3V6565jqhvuE41kPXuAOVsv97vf0pweuTdAlxzRbq2ngkD8+FrCBfj8BK+qJNMwI
	M5HnxFih2sFn5673MviyMO5pXa+ddiCgWdcL2D/0c2tnXhtZ9UdNbFldLFVoTx7nt6WwHyhr5Ceds
	KABt4ZtMAdE38AKc8MoJ95baJZ7vP7yM6PUZmK+IXS0Bj0IFnuyNEYFaUU8YL+NnCrJuam351UWN+
	cdPCe7nb1ZS6/r0pmcpJyZVsPvkUAXq7kWoE+oxgnZMH46q+eZlq50FJ3o6O9rk7rWfeTZsQd3qix
	8AyVLyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxnrI-00Gdw4-02; Wed, 23 Nov 2022 11:24:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxnqH-00Gdbc-M6; Wed, 23 Nov 2022 11:23:03 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4A4F16602A1D;
	Wed, 23 Nov 2022 11:22:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669202577;
	bh=+f+soK5ibkBzyHND0/INlV0VOdmTdJmaAL6gQPdWIUo=;
	h=From:To:Cc:Subject:Date:From;
	b=Fohq9DEzlCEE/5lh4LJ4BYVjRxw396rO4ldL+nsahl6kzXBXJ9+kl0KtXEnlsGbKr
	 jl6y8O+6z12Uknf2vz/30XUJ6lbG3dTnFzS8cPLqy+97zZDdzE55g9H+LPWziSbJCE
	 KagE+/XGNVV9NHqP9+UwJBVEM4A27a1mZvNsZRmwGAEc5hEL6Rr1ArTTO1zocKz4TD
	 KMc5lAh8iY4kH00DV6YCL5miDKmO6S5eqTMpKSEBImvuCLZX/y8rymXGNWb+6D5cIS
	 A8UHIiXKPSHhTf6+JCOAIX3uDFq6FPuBxiuvpO6XXYDunjiIrZOTtdD6A2VODny57Q
	 FMGEh5XbPLc5Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	youlin.pei@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/4] MediaTek CIRQ: new register layout and schema
Date: Wed, 23 Nov 2022 12:22:45 +0100
Message-Id: <20221123112249.98281-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_032301_872238_C04D7CCA 
X-CRM114-Status: GOOD (  11.55  )
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

On newer SoCs (like MT8192/95 and also other non-chromebook chips), the
MediaTek CIRQ controller has a new register layout: this series adds
some more flexibility to the irq-mtk-cirq driver, allowing to select
the register layout based on a SoC-specific compatible.

While at it, I've also performed a schema conversion .. because why not.

This was tested on MT8173 Elm, MT8192 Asurada, MT8195 Tomato (both
MT8192 and MT8195 require devicetree work to actually make use of
the CIRQ, not included in this series - while MT8173 has it already).

Changes in v2:
 - Used the right base patches, as something went wrong in v1 (sorry!)
 - [1/4] Fixed items for mediatek,ext-irq-range
 - [3/4] Renamed `regs` to `offsets`, as it's effectively a register
         offsets (and not registers) array
 - [3/4] Added mtk_cirq_reg() accessor
 - [3/4] Added all supported compatible strings to of_device_id
 - [3/4] Fixed mtk_cirq_reg_index enumeration to not assign 0 to the
         first index (as it's 0 by default), removed meaningless
         CIRQ_MAX index
 - [4/4] Now this patch only adds the `v2` offsets and a compatible
         string "mediatek,mt8192-cirq".

AngeloGioacchino Del Regno (4):
  dt-bindings: interrupt-controller: mediatek,cirq: Migrate to dt schema
  dt-bindings: interrupt-controller: mediatek,cirq: Document MT8192
  irqchip: irq-mtk-cirq: Move register offsets to const array
  irqchip: irq-mtk-cirq: Add support for System CIRQ on MT8192

 .../interrupt-controller/mediatek,cirq.txt    | 33 -------
 .../mediatek,mtk-cirq.yaml                    | 68 ++++++++++++++
 drivers/irqchip/irq-mtk-cirq.c                | 91 +++++++++++++++----
 3 files changed, 142 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml

-- 
2.38.1


