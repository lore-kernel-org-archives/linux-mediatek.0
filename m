Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD396C6FD19
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 01:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nTNiI+NmH7Q4yOrOKY1uD60vY9Ey6O3Qq1exlEM6mkM=; b=HO2C0lK/IBCIjPKz8XEGUgTpEG
	LFlr1xqxDw0qjsUa7njIELlvkYpbJJr8/CAQ/DGOvG3VyWIQtdjy4ovNw3LOIe1ubgVqcAMVCO9sJ
	ZWlb5Qjwbp+k3ecIpdIQY2NL4jBhCno2m6DtQ5WodEAj7Kg3qGGkQpsZyN6Kdbp1mKhZ7Rx9yQNHo
	tN6a1DGm2x0erHMjoaaC9Ww4PHARYEor3Puv7qBnQCreSvxi3AINX6GkWxBnnmiGWyWylEq7I+U/e
	BdgQHZId7fN4465Lt/asrhMN6066d15xEwfAvxHI0lcU86/7MgKh6er6wDQMJyto5LC2Azj8nDHwh
	I0EV1sbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbtKQ-008XLJ-9L; Tue, 14 Mar 2023 01:19:50 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbtKM-008XKX-Q3; Tue, 14 Mar 2023 01:19:47 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pbtKG-0005i3-2S;
	Tue, 14 Mar 2023 02:19:40 +0100
Date: Tue, 14 Mar 2023 01:18:03 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/2] i2c: i2c-mt65xx: add support for MT7981
Message-ID: <cover.1678756608.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_181946_886590_ADFF3403 
X-CRM114-Status: UNSURE (   6.57  )
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

Add support for the I2C units found in the MT7981 SoC.

Daniel Golle (2):
  i2c: mediatek: add support for MT7981 SoC
  dt-bindings: i2c: i2c-mt65xx: add binding for MT7981 SoC

 .../devicetree/bindings/i2c/i2c-mt65xx.yaml         |  1 +
 drivers/i2c/busses/i2c-mt65xx.c                     | 13 +++++++++++++
 2 files changed, 14 insertions(+)


base-commit: 24469a0e5052ba01a35a15f104717a82b7a4798b
-- 
2.39.2


