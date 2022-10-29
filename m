Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D03FA3743
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Oct 2022 17:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LTpooZDpdsqsvqaDbOu23ms4l7LkFqk26NVhnZqBE0E=; b=ha9cbq+Ft+6L3q
	aDJ3RlG7VECqvYGzYE0Bi+WAOgKfa7cXCKiI1kNttibMwiZ+A6Y8/KeYs11TRiyAaaKexV+kTa8BT
	i3tfjqCVVO6EWicJawF/6UHuAZyqq9zDfZ1skKktwpG46qaQinVzSnaI2d+igzSDu1p8r9dFiX62l
	RG1QkEKAbWr5LBYIArCJ4oWwi235MAvomf/U208lksvI4kGLI6TG3sgAAynAYvZAWR5kyz9QMRMnR
	h4hfzX4u8exi1t/fUbnR4s9vs6wf3Tkzvgz3ZymExTSEC32sKMhZq65yKhPnarI6hGqR/kHUuOciP
	ImN0WJlPVGWKFrx5AMkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooq3f-007jOq-Ig; Sat, 29 Oct 2022 17:55:47 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooq3c-007jGE-Bw; Sat, 29 Oct 2022 17:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1667066124;
	bh=Kycf1XZFridgEvLb9sjdHDeiaD0OdfNkXClfb9amqkM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=a95ybDL6/m6NouR77Vfx/jrjpFe+vsBdD/+3panVqt9YNUw3PMjZysOt8njrj1aMt
	 iQpVwmgSmAPG3zy7QNXbzJpaPRI+yQQoxyf5bRsA9sW05OVtnOtqFgRRSdVgYRaozu
	 c5yrYq19bS46YJt5pcTTgKXFQlJnRJ1dGmZNFokvWRdZEex+pY/wvaxKXxc8IAfZxh
	 2SkeDqXOBR2oQhvclZ8JYRvltBviOjtbtLcP5rOkMoEXy1YDdi0Qad4IsB6Pmq7nfT
	 LgmIWHvf9eFnmQqUBWh0nWN5B9T0ao4Xs93bPOTgl2kcW9yzupreJbeRq8fPBCaJ1G
	 poNPNV1Ac8pRQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from frank-G5 ([217.61.156.178]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIMfW-1os7qq0I7w-00EJMD; Sat, 29
 Oct 2022 19:55:24 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/2] rework mtk pcie-gen3 bindings and support mt7986
Date: Sat, 29 Oct 2022 19:55:13 +0200
Message-Id: <20221029175515.14526-1-frank-w@public-files.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KxEWb7itPFWpTFXDzdkAlZkhTG+OLCfGNO1UX1xRxoigacLZp9n
 BHAdDh48FNV7BvYDFaZKZDAtM7nqke88BIiDjCNhLmveo9xisVCE3CzkDCw5JIxop09tCGn
 Of5NB7MZNqULn+zl8Wa3RI8EJgXmUbdmSmEnOX0vqbcsBBCne0xeq0syWyZXq6zbgKQaOhx
 qmr9cuOq9bdLj5o/oPjiw==
UI-OutboundReport: notjunk:1;M01:P0:UgbdyR0oegs=;WsBLUDG5xSh2G2iV4ajaVN6GcL4
 RxEPfjzboRWB7yNWnDB5IEJ1h+CD0fSkRtJYJXIaABYBJYdEBYi3a2gHL85n+yac2sgXPQVqh
 6st5Yuj+ipW3YPHU8DHQKAPH2avYDAwPd4aue9SKqFYaWwfcWgwd2IZRGJ1Qa0hbGlbb4Lcz1
 2IQdWus23mLM94MjwqSZlaCrODvisBHSLypch6jTUwJYH3m/BzvMz0UEY1pSp+6Sm/QilzOUm
 hUm910tYeWJxWUyBtqAtddpV9HlyzQ+55ZKuTpgoMdCftvq2n2SPB9xMSrkDSp2idUXE0Wz8v
 0ZfF6n3UYi0qFJBsxvbhLvIiJjcVYOVw3RQKRpmKy1qLgLIiPn60Bq0KHXR0w2LkUhJII1u32
 CFUl9EhdcnxdCmmRs48RwiCd23E388r66pgLb1qlH4PFjax9Ff16zoPD0BdyfKOEpMCNWw/b1
 0myOWaYZEZftAqJ8Jrif3zkr4DpJXY4jEYgH9IykGANnxzCJdHKAYbTSHLHsZs0d8iGIjvXv6
 SfSG/M9SlUqZJlbGTt2g2HN4zg4m/USyGBwEKwgwdPjuUgIW8LWXo8t1soi1s+abWwT3IVPNt
 N1rHMSB6rxr+oebOTrMrcCilwWJqLLuhWqiYGqqsCIO3pUJVx1NfGx8SvNR+noWNpsaxjZmor
 JoaDvEz5huovWu9hBe6ukU54JpLVM1SUKuF5gvQNP5V++k9gV8f+uXuiDUbS//b6LOutVe+yN
 IzoAGooUqgFONwiR/hD6kNjuH+dd/ZK9bXQgq17J/f7ZpaOa01hZ9zzEAxLGFmRiNqUPUGwcj
 lgR8d1RtVMZV+nw9j+9hyQjLyRuwqVv+J3gzR0Pj4zmOU6fGR/perUtEm1dUbCDjIdSHf8Eq2
 LDEuZdIvTi9j8KNkIUICEMGDWwSNkoZGAGqHIMN+9A9CYPaQktS1DWOSEUpDBQ2J8ouf4YOI0
 6d7U9g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_105544_807116_9035A397 
X-CRM114-Status: UNSURE (   8.90  )
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


