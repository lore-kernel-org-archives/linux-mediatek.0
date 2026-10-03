Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D840CA5FEC
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2026 19:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yNdfF33mWaDtKQmIYOFKyplY+dYLoXzNcNN0FYYoZ7A=; b=0w2g3NZKN1+k5S
	/S1roISnKaa9+pyFwW8dF4kfdFOyg0Y34GfUvzzH7JCLUtDhHKCpQ8zYipYaoGYtj/bXRZFmpVst6
	T20ZpQHC+e+EakDkUg+R+ednbYyz6HrwKuptFB8Re4CEIqd4GACWCAjYwMkbLDoH8i+c8FI/hk+Sh
	MzkHkOB0uPdjeNA3u9GUwXNCy3X9KZYuNY+RYvcH9osqX3y4h0nmIAQEWiblcdp54WXZEIVpFo6ut
	PnVCf5r9P3cshU2IUXvth8CsjAFyLt3d7e+2bmW1DglYzCZNIYpO49hcXWqbcXTYMIYoq5DooIo13
	faT4B0SAzKX8/DI6x30g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5S5-0000000DwMA-0kwh;
	Sat, 03 Oct 2026 19:31:21 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5Ry-0000000DwKT-2ncf;
	Sat, 03 Oct 2026 19:31:18 +0000
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791055871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yNdfF33mWaDtKQmIYOFKyplY+dYLoXzNcNN0FYYoZ7A=;
	b=RnUPguuM8lX35TwHLzfLe3aHOiSd6HoDvXZ8EamkK8ISmBPlNWOlleG3KeJOrEOVdJcE8u
	kb1c7bSXSaoeVgByZLOwNZ7A16uW6dz6GUm+rEVi2d2fM/d7QL4UHJ+wHvmXzpg+/JQAQf
	O4Rlrh0u2lV3OiSl5wseVS5GO9ZwLznCUZ+B5u6Y+rEbRd1p1+YbriCzVL/AhTpGmwKDQZ
	Lcs3vGrAUp0vp1LTzMN7knFpt+hxrLS4HYTQ9xQQHyy2Vu4VsAR/MMiYvCh6+dSjQHcjxs
	XdbF3x0oIm6vg7+nzzT6q7tRgv1fQzLYcfCV8a/TqRpRjUTQcwqNvlIXU44fIw==
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 0/3] arm64: dts: mediatek: mt8188: SCP memory, thermal and touchpad fixes
Date: Sat,  3 Oct 2026 21:31:05 +0200
Message-ID: <20261003193108.789939-1-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_123114_854802_6FA8CDC6 
X-CRM114-Status: UNSURE (   8.16  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These patches fix a memory reservation on the MT8188 based Chromebooks
(Geralt/Ciri), tune the CPU thermal zones of MT8188 and add the
touchpad of Ciri's detachable keyboard base.

The first is a fix for Ciri: a DRAM region that the trusted firmware
protects for the SCP was handed out to Linux and broke the GPU under
memory pressure.

The second makes the power allocator governor usable on the CPU thermal
zones, which prevents thermal shutdowns under sustained load.

The third adds the touchpad of the detachable keyboard base of Ciri.

The series is based on the v7.3-next/dts64 branch of the MediaTek tree.

Tested on Ciri (sku0).

Michał Kopeć (3):
  arm64: dts: mediatek: mt8188-geralt: Reserve SCP dual-core memory
    region
  arm64: dts: mediatek: mt8188: Add power allocator parameters to CPU
    zones
  arm64: dts: mediatek: mt8188-geralt: Add the detachable base touchpad

 .../boot/dts/mediatek/mt8188-geralt.dtsi      |  23 ++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 110 +++++++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8370.dtsi      |  14 +++
 3 files changed, 141 insertions(+), 6 deletions(-)


base-commit: bf89276b2db391cbb25d1a0e898280fe85b16fb5
-- 
2.55.0


