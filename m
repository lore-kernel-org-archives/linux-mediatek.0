Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A505C41513
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Jun 2024 08:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NxOmAqAC7peWQq3km72FKb2gwXAq1zrzMdr4NQiTNtU=; b=H6KheSUVaUBhBH
	8upwIrO10RIbxNA7JTgeU7bkPV1fhUaAyEZ07vIyBycKc/OUy1ZULJWhctb/MZ48+9ZTUMdIN+VX7
	eRaxMrfe0Cq1jP2nYQlulxrezT8/nNOP4nabWwY47mCQkE0pqdaL5Uzd9rIncROkeshhIajne4aqw
	kqlCQVl6Hts2Pfv5Y+YOOIDNnlsk+NnHu3edmlNfQQnkVIGk5JhTd+nKv1objXqf+362wBC6f/dhq
	0ltmWgzq+fSA7YlwLH9qh/d/NDlUWfwCptzvGTbpfacuHqYkPXAP2ldNEJyu8ANVfg0OQbyjE/FGG
	5wlNh5Xnhd2zu22f9U2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFr5J-0000000Gutn-2l8c;
	Sat, 08 Jun 2024 08:05:57 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFr5F-0000000GusM-19Qv;
	Sat, 08 Jun 2024 08:05:54 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout1.routing.net (Postfix) with ESMTP id CDF4840271;
	Sat,  8 Jun 2024 08:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1717833946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NxOmAqAC7peWQq3km72FKb2gwXAq1zrzMdr4NQiTNtU=;
	b=FUUP1n5uRODU9HEEy3sXxbh5VIJfd1a999zTRgPZCO43UvHCDAtY+V/gh6FkM7COhtYqvu
	i9xJ7veuRXCuTjPRGZ7GNDv42v0wjPs0f0igbD30LuoyRmsvYSbWq46ZZNDMguYYZryMtk
	RVr+XdOkLrz7ibCP1Mquoxk9RJ3k9NY=
Received: from frank-G5.. (fttx-pool-217.61.155.199.bambit.de [217.61.155.199])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id C67CA8010F;
	Sat,  8 Jun 2024 08:05:44 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 0/2] rework bpi-r3 dts overlays and add SATA dtso
Date: Sat,  8 Jun 2024 10:05:28 +0200
Message-Id: <20240608080530.9436-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: a095108b-ad1a-4ad1-bf03-eef84b485d3d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240608_010553_510735_1F9DEE56 
X-CRM114-Status: UNSURE (   7.04  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This Series adds check for bpi-r3 dts overlays on buildtime
required by rob herring [1] and adds SATA overlay

Last version seems to get lost so posting v3 with updated sata
overlay syntax (removing the fragment).

[1] https://lore.kernel.org/all/CAL_Jsq+f9bq5Mab9m1pzDeiw304TMeNDmJk+ofG6M8J9QD3cvQ@mail.gmail.com/

Frank Wunderlich (2):
  arm64: dts: mt7986: add dtbs with applied overlays for bpi-r3
  arm64: dts: mt7986: add overlay for SATA power socket on BPI-R3

 arch/arm64/boot/dts/mediatek/Makefile         | 26 ++++++++++++++
 .../mt7986a-bananapi-bpi-r3-sata.dtso         | 35 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sata.dtso

-- 
2.34.1


