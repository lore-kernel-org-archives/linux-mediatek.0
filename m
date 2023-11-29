Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99BBC07CB1
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 13:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gF7X9nkhqtPmB7+VlAhfSH/2A0wJ4JC8AE+vV+L8QqA=; b=RA9vCLVLpEMjKU
	3nD4FFe7xhgGLNhS2jxieh3An6tPOCTTF6zvJPRcVSqjfdlYlgqqP9JncO2HISnztgceW1Kg+sejA
	8MzToKCdI3z/S5rsDZoTCPYjN2T/QsBBa02wBO/X9XDoysPHVt4EQk/Sp6Bho5LmykU9uul6ZA6lI
	1d2QQsmkM6jYy0VSjpILTFay1wJ+vjl1U/wcu9L0qYTeastKC4LEkNb22lSzch9bveTc8VP2Edvo8
	U42R9t+kFeBVUrp4Y7kEl33pa+k+IA0MMPTjtt/oopmiSIWZVK5+vamXgG8QvqcpsAo6Bo10k7B3B
	MPfoBjjRdMDfVvwoQGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8KdB-008Ssa-1p;
	Wed, 29 Nov 2023 13:29:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8KcG-008SX3-17;
	Wed, 29 Nov 2023 13:28:37 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 310176607328;
	Wed, 29 Nov 2023 13:28:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701264515;
	bh=391JrrSGeUr9291eqzljQo/DgLrHi642hF1rtV4tUW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C8YuxjikO+Q2FNYZ3hrnkWv9cv8/7ajn0OcCYlOshuU7VMJKXTtUcAs7LdbmxZPH0
	 1UkLmNtwkLnA3OPK69eDjnNdboS5YCwRsUqOyy/fp47gTfnYl/1CioFRSqWHryvyOt
	 Wm/IjXfD0KQwW7e/KXyDcxV5pf4I4Alj8JIbmVS53e+xZuFFV0ZO6ci1zvB1XqeSGB
	 5La6rvC0HnU+YLA6mfRuQXUQLHR2AP7nrF5PpQ0XvCBImnsh6Ht9cF/Mvip2rIqDIy
	 Ql8qeRpDlkRyGSt9AXNAzLnIJsm6KVWcYax3PX3jsJZesSyfk/16mjKgp0ZA0nCum/
	 Q1Fp1TCH3RJfA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v2 3/5] arm64: dts: mt7986: change cooling trips
Date: Wed, 29 Nov 2023 14:27:40 +0100
Message-ID: <170126437824.153055.7638508509040884567.b4-ty@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025170832.78727-4-linux@fw-web.de>
References: <20231025170832.78727-1-linux@fw-web.de> <20231025170832.78727-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_052836_509976_65AC8AAA 
X-CRM114-Status: UNSURE (   7.40  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, Eric Woudstra <ericwouds@gmail.com>, matthias.bgg@gmail.com, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Wed, 25 Oct 2023 19:08:30 +0200, Frank Wunderlich wrote:
> Add Critical and hot trips for emergency system shutdown and limiting
> system load.
> 
> Change passive trip to active to make sure fan is activated on the
> lowest trip.
> 
> 
> [...]

Applied, thanks!

[3/5] arm64: dts: mt7986: change cooling trips
      (no commit info)

Best regards,
-- 
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

