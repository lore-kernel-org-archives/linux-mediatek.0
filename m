Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395ABCD3439
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 21:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mWFcBq0zhFRY7Cz5fcJUSQDRK4lDJnO8aVB09yQ4oes=; b=U7Cc+L/dtu750okFVz96ohJlrK
	U176fsjOK8hZlYwaoVvnG9v2poFo87jEEpb8mT8GHmVLDV7g67cPvu55StHWot7ScN9F4weO0cEQq
	6idsteokU+P3PexOTzOGVk5xWSDrp1aCTQpYpyNWbfV1vgpqo1w5KhdmvSw7GrD4tEIKR3pJ4l3N2
	oQRLglNoyngurE8tx6oGXm5tvSwwklc3BR7/LukpUUUTcxL9NEDCEJuMBsT2dz32eI6yyyWOSvwp7
	NrWFthx8ZHEcz6iyKKGhOmBj2jxIGrwEhGnX6cfPFV3tdi/asw6EFc5/fOVWTExJ98E6f2zJN2A1Q
	XfFyad3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKNb8-0000000HZOL-2Fon;
	Tue, 05 May 2026 21:46:34 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKNb5-0000000HZMZ-3THy
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 21:46:32 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso46615015e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 14:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017590; x=1778622390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWFcBq0zhFRY7Cz5fcJUSQDRK4lDJnO8aVB09yQ4oes=;
        b=PfG7wWusihT4Ce9IrI7CUPh56EZFMRAx6kL7FPhZFYszwbswL/JAEjItcZjqtoBxlg
         ckeYdhQVUB4TckcFUy/Ky0B+kWkRPYBsuKGn92jf2mrAZpsFI7hva2OOUNQ8XcGtdhyx
         R+uAPBZAuAemcE0w3StcZ0REqSKpDvZvEX9vel7CY60yCp9ajmlukHl2/29YEkzFiUdF
         zFfn6+uQ2ulM/7lGeIBiGH1R6TEgvjOAgiD+ct1/gQ6GpvoJLEGSCOGx6cvuhlGuZxXZ
         8yRR704ILyHTr1J2VTgqfUu+YDdtbel27ll77lxaXOfF65TV5OKXTM26wg86Jm/F9nwk
         zlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017590; x=1778622390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWFcBq0zhFRY7Cz5fcJUSQDRK4lDJnO8aVB09yQ4oes=;
        b=WFCienXx9jywUV9UZ6YPJ2AVQaYbj+TaUjDdoK+DSq9/Wq4CB7Fo21Jr+faOEAGm8y
         TXfG7TLrmmxqqLXTyEOqRKXjurcV7dETEJg7o8/KE1hF1l6OtC2X/zQfnNMwELlAXItI
         UwHtbSQb1iJqP7pu/Pk0y49M9df8rzd7ebSrzGwNkifZSeCxkWazL8vIKBy9STjH3gDb
         ykYCjrKkd3B95zKhUKyaKznoADxiiuIHWJhYmgR3rgPD1xSpjlAFUKnceFLqVCM9LdKN
         +wI+duvGH4IQ91foUOen18zF+YWHXlbiJF6GDa6D8ci7hZUIn0Pbm0IcL98yizmhI6eq
         CUKA==
X-Gm-Message-State: AOJu0YyIzHCh4izcv+gQc3rri6IH6h6RRd6adNF3pL5axbUmhPD394hH
	v5Yu1j5PmYeRFWDxcWAh3KdvYCywQ3KBCzupEH0akANHdt506zPV8pNc6GRHZGGu
X-Gm-Gg: AeBDievuA6zE7AAA6P7cAV5Ro/yCFJDBKi9ljd8PFKhUByjd1HvUivObLqz/kFX47te
	Ax95MmmA1wPfcQkp22SnW8wUbtq7AGcB0F/DbV8Nonp4Sjughj/yvzPYJiohG7FCw6XV+qTtecq
	b/78liKyRKV6V1rCDusNA4RQ8qCsV29JNDiKRahHfNoArzzmzckxvpd5vquqALYcHrPgHmU9bN4
	PoCXQO0fNtkOhxMyh2kKnwqx/sj8fOE3bdfKprUx3BdbS2IU1583FO1dJE38QyaYJOt4jsSAbrq
	s91NOna050MPOYftZevxnVbVIZ7md95cPT0GRYGkhqnQ0Wm4CnzlJYVrt8wz9qSrX7kTwpOepVy
	nFzGISjeOMfUVCP/rFwr0cVCVfLEpRZFmSEQX1FCUZyEU7xJH5YzKobb0xBpUXucLUkLdFp51Rx
	0cWywNShyuAH3jHOZqZaXwV90seu4ZZOCTxCwBY9RG
X-Received: by 2002:a05:600c:3f0b:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-48e51f37fb8mr17928735e9.20.1778017589343;
        Tue, 05 May 2026 14:46:29 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a824f9f0dsm411556165e9.15.2026.05.05.14.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:28 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/2] Add support for mt8167 display blocks
Date: Tue,  5 May 2026 22:44:58 +0100
Message-ID: <20260505214541.333657-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_144631_886324_980E1919 
X-CRM114-Status: GOOD (  13.09  )
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

This series adds support for the display blocks on MediaTek mt8167.
Tested on Xiaomi Mi Smart Clock x04g.

The second patch in the series ideally wouldn't be required as the
DSI controller is compatible with mt2701, but the mediatek,dsi binding
lists an explicit compatible since 2020 and removing or changing it
would break the ABI, so we actually need to support it.

Changes in v4:
- Rebased patches
- Rewrote commit message to better explain why we need to add an
  explicit compatible.

Changes in v3 [3]:
- Added mt8167-dsi compatible to driver instead of changing the binding;
- Resolved patch formatting issues.

Changes in v2 [2]:
- Separate patch for mediatek,dsi-phy binding;
- Separate patch for mt8167-dsi binding;
- Simplified OF graph endpoints in mt8167.dtsi.

Link to v1: [1].

[1] https://lore.kernel.org/linux-mediatek/cover.1771144723.git.l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/cover.1771258407.git.l.scorcia@gmail.com/
[3] https://lore.kernel.org/linux-mediatek/cover.1771863641.git.l.scorcia@gmail.com/

Luca Leonardo Scorcia (2):
  arm64: dts: mediatek: mt8167: Add DRM nodes
  drm/mediatek: dsi: Add compatible for mt8167-dsi

 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 317 +++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dsi.c       |   1 +
 2 files changed, 318 insertions(+)

-- 
2.43.0


