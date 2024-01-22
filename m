Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA77C4725D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 11:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XBJFaL+Q2YIz7h/2o3VV6FT8jIV8p9oXJKZMSgPRBT0=; b=hx1nc0lLw91/yJ0A831Y8ixjTK
	I3q6oqUPeloMfr8LW731sUrabrD12OKNwk1+Anfm5E4CDF9JsikOjZmojA1HUFoxjNywx6BP0V2wL
	DinBydpHf8OT9pi9Cm5J6/LF96LKhuIArTiKaXWf0YTiOc9bsD8NzCnTy1uN+/O+vH4nyW3B7H1Jq
	xmV/9arrdKgyHhCHk5E3ojm8y0WuoAhli4LACnVbEGCLi1OCanpQQBRJ8YxYCGQLrD1DMXtXQRanB
	8cIun8eGpYJYl05G0dCsIoqjCYa5QQrHqddO8vX3xARPUL/TueWHOFrYHyCU1llfBXkHlVfCcjk8e
	EHzCfrCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRs6p-00Be5e-1D;
	Mon, 22 Jan 2024 11:04:55 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRs6l-00Be1y-2K;
	Mon, 22 Jan 2024 11:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705921490;
	bh=3m1/vci+MfAYp79wBH/oi/rLtZ2m4Wx+8gZRTD02VwU=;
	h=From:To:Cc:Subject:Date:From;
	b=BLOL7btbWcb/npidSycVbvPsflgnOgK9uWB48Y6VSDYYZuxsD6uHl0R2DPQBFVDdf
	 wFpzEAPNWNuM+UXqTI0G0wa44q+O0Vlqd9yWaesfZptiXt+K14XraK4lil0EgSVWx1
	 TYn9Y+/esgW77UNAulq0LYWxlrpCsQPiD9AxRisEujW/C60KL85jk56iDSEkYfGjQ9
	 fzRb6e8lG52sLj99V2FWf/gRKwg9LnUC938Vqc1FI2e+QZ7ZjWG0z5bge9VUgxO7+f
	 ggQlEQ501mBDzhuKS6lmstDuWZ5Povlp4AWr4dQP7KXf/gi0/qE9LS8vykleoH0vNf
	 ojzEm3cw3vt1Q==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F1FAB3781FDF;
	Mon, 22 Jan 2024 11:04:48 +0000 (UTC)
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
Subject: [PATCH v3 0/2] Add ITE IT5205 Passive MUX
Date: Mon, 22 Jan 2024 12:04:44 +0100
Message-ID: <20240122110446.140226-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_030451_884971_D1287599 
X-CRM114-Status: UNSURE (   9.92  )
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

Changes in v3:
 - Fixed MODULE_DEVICE_TABLE for it5205_of_table

Changes in v2:
 - Reordered headers and removed unused ones
 - Added a check for altmode in it5205_mux_set()

AngeloGioacchino Del Regno (2):
  dt-bindings: usb: Introduce ITE IT5205 Alt. Mode Passive MUX
  usb: typec: mux: Add ITE IT5205 Alternate Mode Passive MUX driver

 .../devicetree/bindings/usb/ite,it5205.yaml   |  72 +++++
 drivers/usb/typec/mux/Kconfig                 |  10 +
 drivers/usb/typec/mux/Makefile                |   1 +
 drivers/usb/typec/mux/it5205.c                | 294 ++++++++++++++++++
 4 files changed, 377 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ite,it5205.yaml
 create mode 100644 drivers/usb/typec/mux/it5205.c

-- 
2.43.0


