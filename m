Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A5DC7EE26
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 09:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KK/F5D99nL30mXIx0+oh8rXHY+cilT1whzaWMYVe1c0=; b=xH24cNSz+hPjYoNBu46cd475hT
	BSKzpiQV6bFLnPD2E/MtnH+scvA8ZacE06+we6wN8od0rSm7uf525o4CQaW8hPu7I7ZH29XtZz4Vg
	FZyA8popYxDcABEDFw5ZuoYgbrjYP3FFUETsGvX+ve8loM8ASZcN9DzDCL1B5BDTr+Y9RWSN1umbN
	ncr9StXLUO/lYRC3q1Awq6L0ut8vf+dl4F3rdP5g/6fL662yGBRiMVabtlQ2iyP9X0yIHVEIstg7J
	rbHw21MT8Va8mxi7I35/9PuKN6yZ3novw45wvl6Hg21zNw9q3l4PO75UrN9oDH5m0hwfHJMWYa/JS
	6L7qd62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q11rt-005sXK-0E;
	Mon, 22 May 2023 09:30:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q11rp-005sUV-0y;
	Mon, 22 May 2023 09:30:14 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CAC3E66032CE;
	Mon, 22 May 2023 10:30:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684747808;
	bh=GxVItKEsT8c0ceF0ObJivEmeAbzK49Pu38oLODBmZgU=;
	h=From:To:Cc:Subject:Date:From;
	b=Sftz555q5xVRiBE6mu/zf5/4HJFfQCqQWGJFWQ2mJbK4OaSCeQb/SHrYZcTsKuMj/
	 JBsbX3w2jF+Yd6Y9VHyh5x09NYfjcscXzx0ZGjewKVEMWbkbqh0zc1eMKQ3oCnAxD7
	 rcqUBboits9kJ8TuYmnbzlR/flqoj1ypGFurmEbIR1gm6UaLdhnsFT8bEMQopnLIMs
	 ss+sh9o2HzdOsUG1s3icAcu2/8KUwz7EsPLw64FycXXNsD4QZQW6Z7RK7etk6Qowr7
	 0P7UfzqLuvLj/KkqEgp6iYCGK0Qz071FXloUtnOddYE0gKngqAxKRp3VjLyBj8ZCMt
	 3CalOoiVs5TqQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	weiyi.lu@mediatek.com,
	ikjn@chromium.org,
	chun-jie.chen@mediatek.com,
	tinghan.shen@mediatek.com,
	seiya.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/2] MT8192/95: Set correct MSDCPLL rate
Date: Mon, 22 May 2023 11:30:00 +0200
Message-Id: <20230522093002.75137-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_023013_548004_236A9B9E 
X-CRM114-Status: UNSURE (   6.70  )
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

This series improves both stability/reliability and performance for
eMMC and SD cards on MT8192 and MT8195, where the PLL may be set at
a sub-optimal rate from the bootloader.

This was tested on MT8192 Asurada Spherion and MT8195 Cherry Tomato
Chromebooks.

AngeloGioacchino Del Regno (2):
  arm64: dts: mediatek: mt8192: Make sure MSDCPLL's rate is 400MHz
  arm64: dts: mediatek: mt8195: Make sure MSDCPLL's rate is 400MHz

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 ++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.40.1


