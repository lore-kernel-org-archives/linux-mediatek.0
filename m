Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0B7C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Oct 2022 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LTpooZDpdsqsvqaDbOu23ms4l7LkFqk26NVhnZqBE0E=; b=wggs8QyK9eY3rH
	jx8gAb1cupwpyjoWwrgyPg2ZU0QqhcMmC8oF4zFuxpBq0fL2vjifoEnOhXV5gQaa/Lvy1DtdJrtQs
	23VoVJ9QP94yUXuyBi/aJQGwsEDf+FwPKWA0+8qnjLSB3wI5vWKHFqo26Z9B69TI55gVCFVr+UTKn
	mRLTFui7nhC04q00UBAo5ibobcekQ7KsvDyRIx7ekB1FeqIuXu92w1R3SGHc0/panP7KYy4PP1I+X
	7kZK/+uOXDl/dAWyjaXmgAa4Wh9vc9wZMlXFJFAoe+QPyLFm4lElUPe+f0F0dZm1SUEv3GF+rfXvO
	dZfacicTFyw279wwxlTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooo8q-006yud-JL; Sat, 29 Oct 2022 15:53:00 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooo8f-006ypR-DZ; Sat, 29 Oct 2022 15:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1667058753;
	bh=Kycf1XZFridgEvLb9sjdHDeiaD0OdfNkXClfb9amqkM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=hw0j53BVtFbC1xnqlHkNqtba6jEmor1AECidmrkh3ggV/tYuIXNsb8DlqLOBpKPUW
	 qCWZo+dk/rPSKumoAY/NC0zkXxDY5wUdATd7JhGrjWuNHiOWF/KMjA9CJZDhsikVji
	 cv9zyWW+2NbST3BAi67O9QIqegtE7QctujJUP47s5mhxwPAsqBEokJsWep8BCIdbqH
	 3Pa8np+C5TMVSc1gsq+O4BepvCsB1Drrz/+dxf700LTOdmKVmwIAiT+T53men9WeMK
	 T7b2guUVjmFG/VDi74Jz/cH18ymAKWoyclI0GScHy1hKulDNheWxyYwGt5BOirElK4
	 1B6uzTaVebU9A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from frank-G5 ([217.61.156.178]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N33ET-1pBism26KD-013Kf9; Sat, 29
 Oct 2022 17:52:33 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/2] rework mtk pcie-gen3 bindings and support mt7986
Date: Sat, 29 Oct 2022 17:52:23 +0200
Message-Id: <20221029155225.7104-1-frank-w@public-files.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:diT2Gefmafn/nZ+zWz2K9Sc7U/zf7MWKJVX6SrzI9Fk1bXLYPHD
 o1XqCd1Ag1j6hIDROr6UzLx43dkgDd+7JZu8NSLvyAnG0dWiBqAt6v6JouGaJnzBzBOHM0z
 8rpAcRv0Lvsx/BrnBOQ0xX8cIUBToqff+sTKW5AFQlVRIsTpRLRNNhRBw1uJKGOP2cQz7R1
 jvWHNfvQf7mBWY31E5Gag==
UI-OutboundReport: notjunk:1;M01:P0:n9GfSGB0G2w=;ZjGUNKuL/LJM8mRrT1iGH82btnK
 OAESaaRGx0UxdcBWNW8gvgEleJGJ7JSxpxUDkfzScm4UyQx960VlXBPZdnn277knBdtd75ZFN
 JAqdy+H7R7LdBgDqhaRg5jDwtLulhJkDLOKFBWc2CdJ+xHQnHrQbhYhQUykQQ8hD+LtNADit2
 k9GHCzwCSg1ff0+QzbJ3IhqhdT8Zbj/3wN2juKSfKm9C/Yguq4JDfPxEqP1vss+5yt8Pyv+Bj
 OV+KDHtSb4nKE2ZzkGR4d/N+VMSFd5pxdlHv/oDFShf0w762npceEPhwgCoCsf9AC8ipPq2ix
 MI0tByo+oUv+q8qKF7lyV5o80T+mmnTYABJKXKIzUUR8pfD8QZkJ5Axv5To9iiPPtr9ppEf2l
 6ORf0/7bn5WIsuPFTl6cem2Oq45KyKNfrhVy1BTPvRbbw2eHIB8p/hChp08eR1tsjgeO93eME
 koNIk4u/VaE5wT681X+m3YuBjdWUT2llAEb1H2kqfshYkLOGYD3N49lsNwPjOfMhQqYVYdmYg
 UnYArzVoC0Nfb6KBbZJdZHuCQpCYcUf43kCZJU7+BHsTVm3pFRqv/8JIF8gRuQIhKPtF6GfHn
 a61q1Gu67yI1BZU0TwYcLngRqfPHomE2B/e+7qtFZTHlWXwzeNHEy/qvpA4HS8WDdc6ibuk+Q
 9hhmlvZElw+EVqNVlTK67K245fQelDUOQHScvnadyeUTMO6JZKqLslJ4DJgO88zjdKkwGlgcH
 id4TO/fGhHwPb6sq9TsDvxrjb8isAbB2XSPSRwlJt5Z0q+s7F5M2R5HDg82QOnYh/uVEyoOcC
 61Ci5VJhKnH/Llqixke9UI1RPR/DQJK3HhYkG3B7+wo+NYwD0j+Gvo2QqVgHGNx8I4xSxwPg+
 KCd0Ow5Fy0ulNWXqEd+TwkpUVe6vHsT8V0Oda9gRQI7TkSDHzDKoW47tto9M9R1gj+jwyd1tq
 3RyW6rsdbQB/IO2sBzMomyTlX9c=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_085249_762949_3741576A 
X-CRM114-Status: UNSURE (   8.80  )
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


