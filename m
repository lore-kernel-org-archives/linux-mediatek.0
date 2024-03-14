Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA93C54E67
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Mar 2024 10:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zSUOhziiBfjKSLGMTMkTNUsg+7ebYE+77GKx5fCdvWk=; b=HsmATAYXMWM72en1lRReFnt8H1
	PrvvWMnfNXoPr9B3jd7AHU2gLl3VXZSCgHRLX+R/uhi1qAXQeKHbzLDhOCwHuNV6a2TyXWzPfn80F
	OUEG5bgWl6QU9vNiDhv5QmpJ8wa+vzMc1bLG2IN4j0DxE/nWTENoHdepiiWiAAysv/DVwc1fhjyow
	kqsg6GUli1gv42MallrKUb/iXfqV/pqtlLiqXio9MF+H/sEuokKcb7+PSyDOvJgKTk/oWqFmMVPlS
	BxE9/XVdpNzcBLSSRkf0mHcjLPDYrRlFWrgmuXQfxZ8qoLeyHJqXKVwXOr8fymfxsefsJpDPOTqMe
	nhGwI2AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkiRF-0000000DvTX-2vwR;
	Thu, 14 Mar 2024 10:35:53 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkiRB-0000000DvR1-2cJI;
	Thu, 14 Mar 2024 10:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710412547;
	bh=J6gb1OM02C9ikyOM174uH6DQpHWs4urKUhlvpsHkC/o=;
	h=From:To:Cc:Subject:Date:From;
	b=3npdZz2i/ErBoZ0oKKMPq94oMjo2fcIql3voyUdnx2U42zfqXA6eRW2MTOLaaZtYk
	 2ulDO8hO2OnDUFwyeK8shrGfbjb8AtwkNcqVpx1A9eqAPcOuipirvqjPMrSVYtvGHS
	 3nZ1Y38qPseUJ2yjowGjdOUI651u8wj8Cys/BSxgQ+hzpQx1S/HRynbG1EAMNOBJHR
	 Vjdw7AhR/tvLi+e8lK9b0i9ywJ2nw14dVYuYpSXLIyO5HjqcgtN/PWKmiTsZWZRAoO
	 OIw7JSTMnGOs/XeszVmvj4b1+Yk8nW3Pw3cd+Z95uOlw6kLNPx5tbLMFgNCyfYt4QR
	 V8nFLp+ZC0NZg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E198537820EF;
	Thu, 14 Mar 2024 10:35:46 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	jenneron@protonmail.com,
	kernel@collabora.com
Subject: [PATCH 0/2] MediaTek: Add HP Chromebook x360 13b-ca0002sa
Date: Thu, 14 Mar 2024 11:34:58 +0100
Message-ID: <20240314103500.93158-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_033549_808276_E28FECB5 
X-CRM114-Status: UNSURE (   8.87  )
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

This series adds support for the HP Chromebook x360 13b-ca0002sa,
Cherry platform, codename Dojo.

There are very few differences with Tomato, and specifically:
 - Different touchscreen controller (still HID over I2C, different addr)
 - Different (dual MAX98390) speaker amplifier
 - Slightly different keyboard top row keymap
 - NVMe storage over PCIe0

This series depends on [1] the ASoC MTK cleanup, and was tested working
by PostmarketOS community members.

As for the changes in mt8195-cherry.dtsi: personally tested on MT8195
Cherry Tomato, no issues.

[1]: https://lore.kernel.org/r/20240313110147.1267793-1-angelogioacchino.delregno@collabora.com

AngeloGioacchino Del Regno (2):
  dt-bindings: arm: mediatek: Add MT8195 HP Chromebook x360 13b-ca0002sa
  arm64: mediatek: mt8195-cherry: Introduce the MT8195 Dojo Chromebook

 .../devicetree/bindings/arm/mediatek.yaml     |   8 ++
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt8195-cherry-dojo-r1.dts    | 114 ++++++++++++++++++
 .../boot/dts/mediatek/mt8195-cherry.dtsi      |   5 +
 4 files changed, 128 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts

-- 
2.44.0


