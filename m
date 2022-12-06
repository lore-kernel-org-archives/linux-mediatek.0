Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9026C4708C
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 11:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ljaDIZuPFii7nVd2Sq7/+aWMmLX1ErL0OkByiWDvpR4=; b=0I1RQAjHPsn1MeKrgCoE2rCvyw
	OA3JzqK9Wl1iDGrXoWvDMnJfWCFhoBWtnHJXf+CXik4t3BpAXZlv3ylggW/4K4z48FMv1DroTl5Ps
	LOrPAhMFHVpQ+uGyMvuMiYO9iTafKT3IpQifjOIF/IXfMm9lhF3CqE8ul3h+bTycGW1pQGNpIsMdD
	Cx53oOtoqt8vC8sGWEkThp8qeH5GPfJ/7gmi1mn3RZOSX0i6wqGoR05LT0RmXVvLKra2zEOM2qluv
	qH4L9r3j1CFNrLZZFFvaNU2L4/tS9IWD/ZwTj/k1bPIsNdXf6UeOyVai/VKIuY6sNu42dnKoAvB93
	D3OJITAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2W3d-008OXK-FY; Tue, 06 Dec 2022 11:24:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2W34-008NvW-Pv; Tue, 06 Dec 2022 11:23:44 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E248F6602AB2;
	Tue,  6 Dec 2022 11:23:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670325816;
	bh=pflO3+JjfuOlmrDrXsHRzLY1ckIT51oZKH69uJ2/kFU=;
	h=From:To:Cc:Subject:Date:From;
	b=LeQ+CAX+P1ud0kPdsRBQmDFhAqHBbFW4Zh8RcIWbavEG1VjhQDyBLHrj0q9nfb0bH
	 itWZKgMIxdt0/yTsPLZnfHV9TnFyqKl+9neL+agkl4WD/niF+U/gzJ/PaIyQv33QRq
	 M9I7urg7N6pTH9lCc4iaHwp1fpSJ1spx8/YOsRi0hFDOxidhbXJv3+KGWBNvhxrG6c
	 kl5DdLs6QjjyhA8tLTgGv0ek9um1CSjKejrSTADqVDY36Js+q+xMvAQzdQwuvYwAAP
	 e244za1/0O3BU6v2zo1ZPqlRhnb+xJCIY/fVfCcjMO2l6yib9vUuDFwodbkqaL25wI
	 CjkB7ECDlx2og==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	nfraprado@collabora.com,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/5] Add CPU caches information for some MediaTek SoCs
Date: Tue,  6 Dec 2022 12:23:25 +0100
Message-Id: <20221206112330.78431-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_032343_132729_AA63ABAA 
X-CRM114-Status: UNSURE (   6.33  )
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

In devicetrees for MediaTek SoCs the CPU caches information, if
present, is incomplete as it misses cache size, cache line size
and number of cache sets which, in turn, will also prevent any
cache associativity calculation.

For all of the SoCs that I know and/or I have information for,
I've added the right information for I/D, L2 and L3 where present.
This will also make the cacheinfo driver to correctly export the
CPU cache information to sysfs.

AngeloGioacchino Del Regno (5):
  arm64: dts: mt8195: Add complete CPU caches information
  arm64: dts: mt8192: Add complete CPU caches information
  arm64: dts: mt8186: Add complete CPU caches information
  arm64: dts: mt8183: Add complete CPU caches information
  arm64: dts: mt6795: Add complete CPU caches information

 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 50 ++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 74 ++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 58 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 58 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 58 +++++++++++++++++++
 5 files changed, 298 insertions(+)

-- 
2.38.1


