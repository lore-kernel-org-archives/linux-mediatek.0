Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1ECC47DAF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 10:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kvlpkFBsC6q3hKHHJmMXxD34HwTNwUyxphdh1/InhRM=; b=5AvS5QAurbHMyX7kJDQMiG0+/Z
	0vC7WdCPjIIgJIxdXyqEYflxT+d5iIKOV7xLqeWOosjNN3mUZuycAyrw7rKgJWHigIWCZlr/uh6In
	n8g91dY3f39tOD+3Gnc9j81ZFvsX2H3OKOhAo+Ze7/sZ4grkkCFh+UhX6Zt7lR9x3ILqkfm1KxX3m
	OoIMPkTndII6/oDfE1c3lpRVXjsxMYczy6UbybxrnoH/nUttge+bDV8cvWIgko7hAXJH0SQIcDIMf
	sX9YLQKZlC42rOufsNqgO6GZbAZfHxzjuloMqyPiFdUBDsft22+wZ3mIjj2OxOPHWheXVigpT8L/B
	MWtVj1Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQmOW-00587z-0m;
	Fri, 19 Jan 2024 10:46:40 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQmNu-0057Zs-1o;
	Fri, 19 Jan 2024 10:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705661157;
	bh=+BtwhZWZLy/TV7bT5xQL0CluIjxMSGPYSHEHTV2fZ3E=;
	h=From:To:Cc:Subject:Date:From;
	b=kQi+KwgBvloxAnur4ACXtrvBUdciPBgjm4NPdwynxtEzi36qqnIUGCX2Q/rk4MF+B
	 z0Jnn4dSB/i9e0ueNQaKD/FeHD0UfuVviadwz//b7mww8YRKNvA9yqDXV1/HvruUSM
	 iqzjZ6MCibi9dXyg91ehzUWoUBplevDftfVGWQcg8zXORHwU4nhzzDrm7ZexiCDgso
	 wwlH0B1vmWOydihSb1m3DZSurvScU2qWq19jJgDUw/J9rhydTgSF3Sr7EYOQxi/qlN
	 9zJa0km4Jh2J2/9NnFYikx+NyCyb3A7DVZEUTJo5hYFfvpdj14HYPryAdoa/QDOAjh
	 DBSeJLN0uTctA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 04E09378202D;
	Fri, 19 Jan 2024 10:45:55 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: gregkh@linuxfoundation.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com,
	matthias.bgg@gmail.com,
	dmitry.baryshkov@linaro.org,
	neil.armstrong@linaro.org,
	andersson@kernel.org,
	nathan@kernel.org,
	luca.weiss@fairphone.com,
	tianping.fang@mediatek.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/2] Add ITE IT5205 Passive MUX
Date: Fri, 19 Jan 2024 11:45:48 +0100
Message-ID: <20240119104550.140061-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_024602_761027_D33E55A1 
X-CRM114-Status: UNSURE (   9.36  )
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

This series adds a driver for the ITE IT5205/FN, found on various
MediaTek board designs, including the MT8395Genio 1200 EVB and
others following that.

AngeloGioacchino Del Regno (2):
  dt-bindings: usb: Introduce ITE IT5205 Alt. Mode Passive MUX
  usb: typec: mux: Add ITE IT5205 Alternate Mode Passive MUX driver

 .../devicetree/bindings/usb/ite,it5205.yaml   |  72 +++++
 drivers/usb/typec/mux/Kconfig                 |  10 +
 drivers/usb/typec/mux/Makefile                |   1 +
 drivers/usb/typec/mux/it5205.c                | 292 ++++++++++++++++++
 4 files changed, 375 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ite,it5205.yaml
 create mode 100644 drivers/usb/typec/mux/it5205.c

-- 
2.43.0


