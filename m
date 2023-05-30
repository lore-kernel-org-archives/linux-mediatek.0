Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1B6C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 20:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sWxb1uLSvOMQ+A7ucc82ozJghsSsGNrOYRShIiqyHuE=; b=G0OwHSdhO79sRn
	nonO3IalAtyRI2XEf6oW8BV91iIujJ+F/M4YkRDhyU995p2ecOZiCPlJWVwTEtxqHHUei/+UAfU6P
	Wmq4Mp0XBpI+tcUWP65Gf+V5RGyWxuqFY5JP7BP/SYs/QZ3Bvz7jeA3hWvrJaK9PQTo8Zpt2+OvJs
	23QU89QK/be5JcojVzLTVAgyz4m757m9aaYeA+gOw88mswYK4PFJobVeooMBwEU4G6IOa5uTY29Ir
	GBUt1ijdfLF5LLdPU16ZjwAXtri77Ly6VVBjxlGEWt+x3eD5N/D4RtMeGXTPKOizZzSTkWyet8OMS
	0v46XqgWuRUgZoOv9W1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q45iu-00F4M4-2U;
	Tue, 30 May 2023 20:13:40 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q45iq-00F4Il-1S;
	Tue, 30 May 2023 20:13:37 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id 50EFB62622;
	Tue, 30 May 2023 20:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1685477611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sWxb1uLSvOMQ+A7ucc82ozJghsSsGNrOYRShIiqyHuE=;
	b=QZTiWltmIj1vb+SR0MGMJsQgkkG2BnlKci1RPZHFhCMPM62XvYjyHAtzxcduI7NKXHFsdx
	+9s8NoUNnrF62WAIQQ0ciKElH+jeXpsJOZL4UZM8MppYOiPZiGRDJfXLS9PhZZh7sglSUZ
	LLpDi2VZio3iOldbNvOugWlfWESopmM=
Received: from frank-G5.. (fttx-pool-217.61.157.145.bambit.de [217.61.157.145])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 263A040ACA;
	Tue, 30 May 2023 20:13:20 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/4] Add mt7986 thermal
Date: Tue, 30 May 2023 22:12:31 +0200
Message-Id: <20230530201235.22330-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 9f03fd52-88cf-4dc1-98dd-2f3ea44d9010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_131336_678327_BE8E97BF 
X-CRM114-Status: UNSURE (   8.53  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lars-Peter Clausen <lars@metafoo.de>, Lala Lin <lala.lin@mediatek.com>, linux-iio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, "Hui.Liu" <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jonathan Cameron <jic23@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This series add thermal related devicetree-nodes and necessary
dt-bindings.

I left pwm-fan for r3 for now as i cannot test this completely due to
missing 2 pin-jack and 3v3 pwm-level which my fan cannot handle (starts
spinning at ~3V). Only checked voltage of pwm there.

changes in v3:
- efuse compatibles into one line

changes in v2:
- drop highest 2 trip points as they are not yet used
- leave already applied patches

Daniel Golle (3):
  arm64: dts: mt7986: add thermal and efuse
  arm64: dts: mt7986: add thermal-zones
  arm64: dts: mt7986: add pwm-fan and cooling-maps to BPI-R3 dts

Frank Wunderlich (1):
  dt-bindings: nvmem: mediatek: efuse: add support for mt7986

 .../bindings/nvmem/mediatek,efuse.yaml        |  1 +
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 31 ++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 62 +++++++++++++++++++
 3 files changed, 94 insertions(+)

-- 
2.34.1


