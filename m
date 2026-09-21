Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8EEC982F1
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 11:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bJjHs4K3u+gvdjbfOs0Xg8GRiY9vzGbZiOJ805s9gPE=; b=Dw2U282VDdm20rCkLJR3cStKU8
	+5UDeb/qR0IXKRSWYwH5vwNhXEnrXdvK0lYSakU8ibE0UPVPe5YEtgXYvPyhGECzefivfraHj83/M
	9WpNKn5knYTxiHNj8g4xw3SIlO6LFk2iCLnnCoK4qM8DjiXb/0RXqXibpf5ijKZyvS7Q8n4MK80oW
	N2DhRDZab56Bji0QM1TZDFWEcqfld6bGgdm6QtBMafb0W3mAt4zb7gzPp4YDPLKXewUW42r3Do+KG
	oFSIhizWLTmI5pLbKtY+61IzmkXxYauADMwe1FIHM8M77iZhg5d2niCh5PZofbY0p77lNL9Hxq/VT
	F/7bXXKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cN5-00000001wLM-1hQy;
	Mon, 21 Sep 2026 11:39:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cN3-00000001wKe-3M4d
	for linux-mediatek@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=bJjHs4K3u+gvdjbfOs0Xg8GRiY9vzGbZiOJ805s9gPE=; b=Nyizbq1D30qR1vqnSbkpbVe4HY
	bWCYe1ChU9UpDdBpb+oT98rSdW+O+0yPsod4/MoRYI+l3kiaFrrF+3U5LWtaAbqqMwV1h8r97bFY8
	QcJNResYSeo3ogmrEiJO2RDbuKodpxPUmJ08obQ2krd0c9SlTpP0//KH3+rMyMQdTYpmpe26uz+lD
	qFsGvkZI8YkDYVelAUMV+G1PeQoJynyrPOfiMiQkHRiXCBQZgRQ8H9C0KYLPWGxPVlg0lxNQejN6+
	9idvC742nS7H4CnYOH/f2SgrFIFA8Wtqks+r5f40813VPFMbl3xfOytZXTytMVgXLm6amC4cirRzp
	sA1FRq/A==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8cMp-0000000CDk6-2SKE
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Sep 2026 11:39:29 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e66390995so15143515e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 04:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789990765; x=1790595565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bJjHs4K3u+gvdjbfOs0Xg8GRiY9vzGbZiOJ805s9gPE=;
        b=BZ9Np9kR+pY8wDQ3o8ZgV/avcqOHN2COuOXhW1pVxP/jKkXiiVmr4p+iT8fosTWBIO
         GVYzreWYAc6jTk2QAJg1BnK0diPcGcgNefwEKQKHpAF+7BCMImPjjVYDu3UAz7dxvEc5
         6aDT+b04na6XOU/rlx3UHQ0e0h661PDS2lVRuVGk99i4wFxfMlKtuijLTG9utRnhvAVk
         ZvHazQNq7yIwm8XBE6Djnjs5tKXWblibnnuT5//z7xyZkBRMwg3dAPQvQ2/wbijXR/wS
         sfMQYSTAx82i9PiXHbe9Nc8wiKCl4Rf+lyX2Lxv+gYXyUt1tIsJJ5KHvpOw1Bm2NcaqL
         h7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990765; x=1790595565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJjHs4K3u+gvdjbfOs0Xg8GRiY9vzGbZiOJ805s9gPE=;
        b=OXID32oYalqVuKN/UnctJJuWrmTSvDmuKoWMGOhts2nIT/6qakeoRqBYfiYFW13A5o
         OUQSqhrER4Y8ZEy2Y50ew0zlwuklW9G2AYq5Kdpcv6Zj4cvBQugHnYxhmNbtqR44vTT4
         2p90ekaD59WesuipR4VPzK8KR9DJtcKfg+bMDAo/6Mc1eOWKOyml7l0hG8xGx0Zhx8VV
         ZeAXWbYdelCFlTWu0CUjEpuDja0sWjPKrKZKdD4uhiJekFOyRBrhoXxf5X+YYfUIW3OV
         FjvYdGL8Us7nZwqMW6q+8VT6D07iJ5WGJfg2EHkMS3hvI3Tmzw7vykGRN1dWt2/OXjUW
         nqBg==
X-Gm-Message-State: AFuF++m1FT8X5Tw2q9IZCKK6S6fUZ7neGfTq+1ISFVL1Dxy/u8DGoxb+
	hxrcy6xpCb14qSp2oSBU5/JW5KAxdZG5qYZAIMizen09fTwJiZ2rluW3mXLnhnhizA4=
X-Gm-Gg: AYBFou1Sv/t+WqB6ZyZnQngrStofX0CT34DWFRffzfmb/xqa3BEVn4AleWY3ZlW5Tc6
	cHLB19SUguvymutMwV3jStlz6euVHWW/vbB7uE1ZLPPCtVNiK6s8x4cGUlJxUMwaOjsroAZfHNe
	+5KOejMJl+v67AeRLwCG87c9czxAmz87MQEh0AqrOxcYRkJwb/GwN2D7sq83rhX3dUgqckl4/YL
	2RIaf4xML2t24/MPE82eaWxlyf47MianR7fH87Xhtt2mWEjmlQI0jlBsE9YPSohWjeH0Q6o9yGn
	qg8ptYoMNgG3P2ULafQCYGB7RNCzo0HC+RkOkQEpJB2OOsMp/8kk+GNPeJM06PINCzlKuNypz9c
	hROvOCbpHXxkRyxctWQn7qLnmrnpsOOZZW/QbNjueOkfe5wcysXzr4QacZgTnWGQRo9NDwjtpwX
	OF4/d4u2ACr5j2q49juJ1Igv9GiaYCxRyjvLsMfz7UI3mlAAAjPGA1tgjKNKLAI+HWJsFRD2Q1Z
	oiBhw==
X-Received: by 2002:a05:600c:3b8e:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-49fc57144aamr185348875e9.8.1789990765124;
        Mon, 21 Sep 2026 04:39:25 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc57547easm244273865e9.3.2026.09.21.04.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:39:24 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] Add support for the mt8167 display pipeline
Date: Mon, 21 Sep 2026 13:38:54 +0200
Message-ID: <20260921113914.779393-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_123928_145745_6D2C8D7A 
X-CRM114-Status: GOOD (  14.16  )
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

This series adds support for (almost) all display blocks of mt8167.
This SoC supports a DSI or DPI display and has HDMI output via a second
DPI block wired to the HDMI phy.

All the hard work was already upstreamed in the past, now all that's left
is some glue. In the first two patches we add support for the DPI output
blocks. In the third one we describe all the possible combinations of the
SoC display pipeline and in the last one we add the required nodes to the
SoC dtsi.

The final outputs of the display pipeline in the SoC dtsi are
intentionally left not connected to allow board dts to specify their
own output node.

I said almost all display blocks because HDMI output is not included in
this patch. I have it tested and working at all supported resolutions, but
since it needs some fixes in clocks and a new phy driver, I will send it
in a separate series.

The series has been tested on a Lenovo Smart Clock 2 (DSI), a Xiaomi Mi
Smart Clock 2 (DSI), and a Sony Playstation Classic Mini (HDMI via DPI).
Unfortunately I couldn't find an actual device using a DPI display, but
since DPI1-HDMI works, I feel confident saying that the clocks divisors
are correct.

Changes in v2:
- Fixed some copy-and-paste error in MMSYS routes spotted by Sashiko [2].

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/20260918175736.355305-1-l.scorcia@gmail.com/
[2] https://sashiko.dev/#/message/20260918180358.81A1D1F000FF%40smtp.kernel.org

Luca Leonardo Scorcia (4):
  dt-bindings: display: mediatek: dpi: Add compatible for mt8167
  drm/mediatek: Add support for mt8167 Digital Parallel Interface
  soc: mediatek: mt8167-mmsys: add routes for all display paths
  arm64: dts: mediatek: mt8167: Add DRM nodes

 .../display/mediatek/mediatek,dpi.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 369 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  23 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +
 drivers/soc/mediatek/mt8167-mmsys.h           | 193 ++++++++-
 5 files changed, 579 insertions(+), 9 deletions(-)

-- 
2.43.0


