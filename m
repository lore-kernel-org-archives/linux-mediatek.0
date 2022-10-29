Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C557C38A02
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Oct 2022 17:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LTpooZDpdsqsvqaDbOu23ms4l7LkFqk26NVhnZqBE0E=; b=cj322z6dC/iNIT
	CJNnrF9M9CYb/dMk0OGOzkdRI1kTSrZ5dwSZd+oiVWk3f+LZL6p2IDy7lirc7Jt3HYHKS7h+u89gN
	OXQaLWNNTgTkyYnEGm6J04pwY2Oe9TMvJp2vjPO3kPVD4g6c6Dn8VL6iowTCSEvH35JyIbjL8V9lD
	iBSM0ryp/RFURqTgHFHxa8Grxt8gs+bWLFbvT7sUIiMqwmNgel4uCq/ArHTNFjwGyCgs/V4nNsYW8
	nVEWiUP30ET9OYpzjL+NwkYeGTCkVE+VFvZmeQrRv7vo9s75k5G2siyrT+KOzXmA+tCezLUfVXyFN
	48/yPEEYShO+9a6Ziv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooq5l-007lI6-Vd; Sat, 29 Oct 2022 17:57:57 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooq5j-007lEA-8e; Sat, 29 Oct 2022 17:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1667066264;
	bh=Kycf1XZFridgEvLb9sjdHDeiaD0OdfNkXClfb9amqkM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=gcDPqIPhiTQ+pzawxtf3bhnipr/GmH4NIl1X328jXZCo/YAMUuCL6R/DBgEYClYml
	 6/T2OrL+UQ/P0ZpD6GlNyAi16LmxnSVlz+EVpukOLDiLCIgCbq4Z6YAEXg0eMuR8cn
	 JCqG7Ovm9/BBnXRusyYYAl4GJODfvhDjJhVspLYb8+DN5uLxd++yiqjvuNLr+8AQtm
	 o3W6EBKNwvAEgs7TjmgG9aG9TE86SRvX+pv/nzh6VxO5yKrxS+neNXMocROTvm/4kn
	 FJMp6egebAxgDfF/d1Kp41K1U9HuPpsXT5hiChZbn1eAPkem4/Q5tLxpjUIPi6T/k8
	 WhHafbOUhO8VA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from frank-G5 ([217.61.156.178]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6Udt-1ohyKH2HzV-006sfm; Sat, 29
 Oct 2022 19:57:44 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/2] rework mtk pcie-gen3 bindings and support mt7986
Date: Sat, 29 Oct 2022 19:57:35 +0200
Message-Id: <20221029175737.14834-1-frank-w@public-files.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y9FHqWI6q/ps50bB8NVirHxE+56q04DIKv1dG+cnZsKTTeVERc8
 KfhfxYgV30IQD4KTR8uYZEAkj7lV2sUY3rQfOuHELKIAOCvg3cw3r0FbuizmYBGh4Cf24ur
 IBP8a1RVZ/+qN49KsTKpaPXoOJ6JV2o1i55we0LCBKfvCBizXhqv/wfTufFYOVdB/4z85ml
 FPsi5rhHMTHcgD/LwzG5A==
UI-OutboundReport: notjunk:1;M01:P0:R/lddGv2HO0=;S3AAUs1/LjWeXAC1CYf7F4QMJSn
 ide6VGdiypJSGD5BMUXOwmp2JkmqcDtRPfWVx4kMqnqtb2D+F+LmJMa2Dd75eF/h3YWjKR+Gp
 kuopi+qQBpnNalVwpurqAARZgFlT0w7Cm+eSbqpBWXZRRDGWuUM1ic/5o+O3BagOvLVlh3NiJ
 YQ6QA0ZWoWa4cUphFktKrf/MD0Jqq/2FTcFYFXAHlnAQ3Kj7F+o6zUjQAvuUtm29CAe/ctnpU
 WY0CwfBDF63j9M4P5yYDL3oy3lwH7h4SXRkQIheTQ7F15Rp0YUNZ79ILPZ7CxPnriTvNiVhj4
 cNz1KrKCR6nZ6+XVNazv0SL68bTi/QjVJlMadQI1H6HuhU1PPHkH76CjVN3m/QB1w28Fqj8Sm
 dW6dlvUbQYrodrmCukxGqHvIM7O7ljbClTFWmxtpO985FPsTQ1cWkYchCFk4H0nHJD55qrfb8
 Zjw6gYvSPMfG32grGW3u9N7624YbpImipfXT5uo2alJfmXEf+siZttiwY1adVFIILV2uyGaR/
 9BHIqr8HDASyEWjWjemHCzxwpbshYjGsKjgax9Lwbt4J8UyXM/QpTWB/wwFsPw5zhkFX7enO/
 urBvIXDsInHsJ4U2j1iw+3/ffOYg5kFANsXe1iczkWEI9Dy9mq4oO8LYu41qvZRgCLBo07wNY
 oDsW17Tyr38NTwM6s7IsRX3SJS6C7FG23AsX2nbMj1oEpOxk3HwwKI+kW+yTlBMJq7aZyO3Bh
 T7StM4cejMBmjOh5xQCoiuazYDHi7+MIOg4EGE0MCZHObGWDO35pFN5Dm9lADVsYRQ7pncptb
 zGfIgJOzzaHlO7FrThGGNV4jqrGeBuAuBFdl/C6iqfoltleWiHgQo3l44KXTDKUCwyiv28CPQ
 wp9DpiKEjgvByZ6eKyFrvElw2D2v5rFs74jVOLUzcIKREBuNu4AcCv9UIRKEQHD+gmJ79z0cm
 c2OaKrkE+EQJPRRB8oNFzupmghE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_105755_597489_0991AAF4 
X-CRM114-Status: UNSURE (   9.64  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This Series prepares support for mt7986 PCIe which is basicly gen3 PCIe
but with slightly differnt clock configuration.

To make differences better to read i split the exiting bindings which
has already different settings with a compatible switch and then add a
new one for mt7986.

v2:
- fixed typo in part 1 (SoC based config)
- squashed part2+3 (compatible and clock config for mt7986)

v3:
- fixed problem with fallback-compatible not compatible to main

Frank Wunderlich (2):
  dt-bindings: PCI: mediatek-gen3: add SoC based clock config
  dt-bindings: PCI: mediatek-gen3: add support for mt7986

 .../bindings/pci/mediatek-pcie-gen3.yaml      | 64 +++++++++++++++----
 1 file changed, 52 insertions(+), 12 deletions(-)

=2D-
2.34.1


