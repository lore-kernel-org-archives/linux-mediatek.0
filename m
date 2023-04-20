Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6F2C77B72
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 09:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ik5TTlRPT7tJMlvVvigTxTqvVCu8p0TQbmvPThlaP2Q=; b=FZ2UUt8x3tOUPpNu8zw83WkSao
	ns3pL/eVgqenlqcL0PX1/i+YhRSuSbkTZcRwsEodkrDT2x7HceuMnJlKWdF+GRiRyu+aqNx3U4VdI
	+m5UR2+CEBw+/zNBo5HTd/RESCB79jyvClSxQwUPRyv6k/Soy5Oedvcm6o0DYNmbHzDOd0JMQbAWI
	3Ihlzo4mvhb9aVEAqWzMJfi+EyywbiYQ0O/XqHCK5dwsIcx5z+jRmUQy/a0c4/jFHFU5IHbcJHsiI
	6rrzNvVmq5Uk2QAPvsGqqH3Nk24Wq+JDd3itAGZCxas/2ku1ttfbM/5NXrBFNDId2gr7z+P4hRwis
	Erb5SMbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQqU-007ZRl-1M;
	Thu, 20 Apr 2023 09:44:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQqO-007ZNU-15;
	Thu, 20 Apr 2023 09:44:49 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E314E660325E;
	Thu, 20 Apr 2023 10:44:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681983884;
	bh=68zdNUXDpJ8cN3/P2jWta2FlLdWOTdLtngTHhQNCf+Y=;
	h=From:To:Cc:Subject:Date:From;
	b=mDHqb5aPFBSb6iBFtvaXQENJchILKhe40cIAYr4YP6mXnRq7MDs8i9KloFU+5Gxgw
	 RFItZvxuuBafyihdNczuWdqN6ngIDx01l3styj4ozPvtobLyDsY7PLkpv4l5zVq8fv
	 JiEaxKOYmyK/pZIoSIxT8v7QrvJmTVeQu1Jda2RaLMY9Mdj7x/aaElL3YB8kNaWtB5
	 bpo02cIJnUxYWlpeF8jkAbJ51Ug1gN4NilvT3Eof9oKM01ErYb7JQX05KcOttyaW+w
	 W/wcYe0+OiQuwugPYwXHgiKADfKuUK+JYt8xJMIt5Z/NQJF17ijADs/RGf6eQE4Lsv
	 sshJhnY85+QKA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/5] MT8195 Acer Tomato - devicetrees Part 3
Date: Thu, 20 Apr 2023 11:44:28 +0200
Message-Id: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_024448_601687_70F52321 
X-CRM114-Status: UNSURE (   8.97  )
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

This series adds support for the WiFi card on PCI-Express,
eDP (internal) and DP (external) displays and adds thermal
configuration for the "extra" thermistors present on Cherry boards.

All Cherry Chromebooks now have working display and wireless
connectivity!

At this point, the only missing component is vcodec decoders, but
that's to be done in mt8195.dtsi, globally, not machine specific.
Please note that in this series the eDP panel was put on aux-bus,
hence this depends on the series introducing support for it [1]
in the mtk-dp driver.

[1]: https://lore.kernel.org/lkml/20230404104800.301150-1-angelogioacchino.delregno@collabora.com/

AngeloGioacchino Del Regno (5):
  arm64: dts: mediatek: cherry: Add platform thermal configuration
  arm64: dts: mediatek: cherry: Assign dp-intf aliases
  arm64: dts: mediatek: cherry: Configure eDP and internal display
  arm64: dts: mediatek: cherry: Enable PCI-Express ports for WiFi
  arm64: dts: mediatek: cherry-tomato-r1: Enable NVMe PCI-Express port

 .../dts/mediatek/mt8195-cherry-tomato-r1.dts  |   7 +
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 164 ++++++++++++++++++
 2 files changed, 171 insertions(+)

-- 
2.40.0


