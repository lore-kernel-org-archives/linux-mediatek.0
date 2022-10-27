Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1C6FA3740
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 06:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lb7cH6d0uhpgKwi/q8Rz+TeYgmt5q7s0QqhDeERUfDw=; b=KIRd82dbQaoKva
	KfIljgjfQxiA1TQRpvwLJ/DKfujl7B2rWgDs6xQYGfMogdoOzDuLYw72VWEccutKIfgWrPJ00cvaV
	kkMaWu1jUPzZSKmGQkEb6XR4AmU2+0RgzIzOwKT3xjXbhS5xlMV8BgJwL005gZ3K1g/iBSK+ds5/C
	k/TuWs1JANEjIcskAIN991sTAFAmRkFguFT7uQCn/OA7qr1ESoX/w3nnAeiW+nq692wX+THnjjaJV
	zrd7Odw2jcE8Bn7wQ9VcazaL7HmORGSGZ84oGO0U733SfWUBdbqt9tM4UVps2H9TR2qA0j/5oHgaH
	mKZGG5JXh1Rt7C8v8DVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onvy6-00BviA-JT; Thu, 27 Oct 2022 06:02:18 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onvxm-00Bvcn-58; Thu, 27 Oct 2022 06:01:59 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout4.routing.net (Postfix) with ESMTP id A8B4910094F;
	Thu, 27 Oct 2022 06:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666850512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lb7cH6d0uhpgKwi/q8Rz+TeYgmt5q7s0QqhDeERUfDw=;
	b=xcylABz939+HpHeG+PiIHNOaUsT52G3yaalInhmAEMN4Dt7JRtMRVLU9VcqsafXXYhXeyY
	1JbFZLtpHLAsWtb0j75/vlH4VeQkr5q5NsVoUfF/bY/eFlDxv4xfOCAPHPeqbfxZ4S0Be4
	1BVVrYGsWNVZ2ecMCSTuG5a7gjPJblg=
Received: from frank-G5.. (fttx-pool-80.245.77.6.bambit.de [80.245.77.6])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id C9DAA405D6;
	Thu, 27 Oct 2022 06:01:51 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v1 0/2] support PCIe on mt7986/BPI-R3 (DTS)
Date: Thu, 27 Oct 2022 08:01:40 +0200
Message-Id: <20221027060142.6354-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: fcc91801-ff5f-40bc-b091-068cab1f2dc3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_230158_392332_459175AA 
X-CRM114-Status: UNSURE (   6.44  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

After PCIe binding got reviewed here the last 2 PCIe Patches for adding
DTS nodes to mt7986 and bpi-r3.

based on:

rework mtk pcie-gen3 bindings and support mt7986
https://patchwork.kernel.org/project/linux-mediatek/list/?series=688557

Add BananaPi R3
https://patchwork.kernel.org/project/linux-mediatek/list/?series=688984

Frank Wunderlich (1):
  arm64: dts: mt7986: add pcie node to BananaPi-R3

Sam Shih (1):
  arm64: dts: mt7986: add pcie related device nodes

 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi | 17 ++++++
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  | 16 ++++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 52 +++++++++++++++++++
 3 files changed, 85 insertions(+)

-- 
2.34.1


