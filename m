Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F74FC636D4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Feb 2023 00:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wbWD+HfbykEvH9jBOiqab43PM/NEyYeMz4o3WEALrv8=; b=nNVeQz7c7a5xVM
	TkVLTk4m5z8VQqM7NtVbZueGKek0yFmR7wC7p5rT96l/C3Y2LRGGXRSNzGZq4oOy28ZPmUVCK9tlX
	MgBIompkQjOutXekO/DmL3GBP98/iAUBWwOcJ+mT5I6hq9tNR4dnZ3rum9kYzGn1BQaDYT3G5iNts
	ZAuqthzQjmCihd56F9MFxxeGPrPkwX2XDbjyY4+JiwaF2DHjV2FD5P+1r2lZPQMowvBTtWgLU4lPO
	s7tKpkCOL0JPsQPEdvh3TuSZHfBoEljWTqE/i59nsXfzwTmi2XIou0zuVMoTKgmB95aa5Iw0BJe+m
	vOsD9k8ZJ1Rt7rPWZhPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQdjA-0086PT-Id; Sat, 11 Feb 2023 00:26:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQdiz-0086L6-6U; Sat, 11 Feb 2023 00:26:42 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 02AC0660210F;
	Sat, 11 Feb 2023 00:26:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676075196;
	bh=mLxGE1hzfETEIzY5gR5Pk1qQeIPY27W1oSvX6VCd1U0=;
	h=From:To:Cc:Subject:Date:From;
	b=Ci4l9dOIm7ykglPTmFljaSkZeu+JnZ0BxSkqox3sXIpqFZv12ggpEk60TnlTANnNW
	 cCcBsL56HMm5UorW/3AMUgodtjO7xRfwksjG8D3uieiMM5Q6zXDA1Ur95IqFowhSOt
	 TKbTtWC7F40eBTqiKv2vfKSdlxqLenUaJUA6eJKE5jmDNQebunuyZzAzcotks+VNQj
	 Xc6wZOZ2Ldtha2QmQbWu6qt8LLniQmub5I12Mx7EdJS+lEvRIYtcGkqqsx3c8bHUlo
	 jvYSARqf4+XSKx1HmKXzQ9COIk3yHDK52gRBSXcb/hjpJJPSoCOeZACAFI4BQhm2DY
	 XIQmURgOy6sJA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 0/5] arm64: dts: mediatek: Add newer revisions of Google Spherion and Hayato
Date: Fri, 10 Feb 2023 19:26:21 -0500
Message-Id: <20230211002626.454844-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_162641_471206_70DE9EC4 
X-CRM114-Status: UNSURE (   9.31  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Add devicetrees for the newer revisions of two machines: Google Spherion
rev4 and Google Hayato rev5-sku2. For both, the difference from the
previous revision is that they now use the rt5682s audio codec instead
of rt5682.


Nícolas F. R. A. Prado (5):
  dt-bindings: arm64: dts: mediatek: Add rev5-sku2 of hayato
  dt-bindings: arm64: dts: mediatek: Add rev4 of spherion
  arm64: dts: mediatek: Add dtsi files to use rt5682s on mt8192
  arm64: dts: mediatek: Add hayato-rev5-sku2
  arm64: dts: mediatek: Add spherion-rev4

 .../devicetree/bindings/arm/mediatek.yaml     | 11 ++++
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mt8192-asurada-audio-rt1015p-rt5682s.dtsi | 18 ++++++
 .../mt8192-asurada-audio-rt5682s.dtsi         | 19 ++++++
 .../mt8192-asurada-hayato-r5-sku2.dts         | 49 +++++++++++++++
 .../mediatek/mt8192-asurada-spherion-r4.dts   | 62 +++++++++++++++++++
 6 files changed, 161 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p-rt5682s.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt5682s.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts

-- 
2.39.1


