Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B25C38A02
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Oct 2022 17:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LTpooZDpdsqsvqaDbOu23ms4l7LkFqk26NVhnZqBE0E=; b=eBz8sN2KDanHJK
	7hIAfDbhoJhjxgVIZME7p2BbBaPjxu3SEWis2JZfc5SJhfoOPC4B5Oa9O1GWaHJV5/0qiQf89BhmS
	8vlFpI2Xjatdp+owXwFu+8OvvzDzQBiHk+L2v0i1u/BlmRsSzuTnr7XpzHcLPr8gnn/IvtNXLpawy
	XNYw7cWW1o9miN39jCgMleM8L/zQZTuEwjJgVxaaSm13d9Zj9J/6TM+kGfwvPFaLoosc3FEZjbypQ
	WgjkKHd2DfnDMgO4sYqVZWSkwm5Te1vi+Ax5yU7w0OF/cQWXoUPytpF+Qja2EHlajPF4AR4kZNfPi
	4aGBPmC6vf5wfRcXP+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooq6b-007mI4-8g; Sat, 29 Oct 2022 17:58:49 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooq6C-007ljw-0N; Sat, 29 Oct 2022 17:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1667066288;
	bh=Kycf1XZFridgEvLb9sjdHDeiaD0OdfNkXClfb9amqkM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=UsPVdHkaWEBcPgy9htvvrIQT3hEkQwmUwDBPienJyCYI+AtAFEhMYnchSg8bVHpDE
	 KXGiLaczW5z8F2ZboyrXCSFynY+6bkbIbLnKTwp+/Aqnt+FbCV8ZdxoHFdgfWZ9MnK
	 HACV4Ez82Q7R36/mUfZfaqoyfC9UV4A/9f5VOG7fVgYM5A/eTtlGyi28D9naCaoRpT
	 YJqOjIaNvjYrBP4LpsQHOlAjZW7A0z5dk9MdZh1lVI2h2Cy0fCqzHF7Ef8C/J3FMMA
	 38lV5nO+8naQVvGfkT5FZND5kgDVFdd7p8F4tP2FV0VBF5zLfwSxv2DeGpt0dVo1Yo
	 rIV5o45YLi4uA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from frank-G5 ([217.61.156.178]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXGvG-1oYnny346I-00YeoW; Sat, 29
 Oct 2022 19:58:08 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/2] rework mtk pcie-gen3 bindings and support mt7986
Date: Sat, 29 Oct 2022 19:58:04 +0200
Message-Id: <20221029175806.14899-1-frank-w@public-files.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O8JulodXz6iNhGWFYBR5Cj6XqvHcQPN5n3A5elUNyc8v/6ddcN+
 3m5Eu5scvKIpc/c0Kt2FhLfHZW5dLloOapBj6o6pCcZp1yom0ODWRqPJgcsGktaEY9JP3/M
 WJUYzqPrCZKNv+8Dd/xhS+wsYl6mCFjbwVC+0+4rJ76MwbE3AHJ0gM4jNrxe7SteSvFKp8f
 58ctIM3jobvwp6YsPlh0g==
UI-OutboundReport: notjunk:1;M01:P0:OqLcNjY3+us=;ZQkvU2y4h+VNqF0k6uFxn4tIBJz
 5lrhIWbcICbr+bMK9s0/2SAc1pzkYvfefzP+K91+7WS9TTDMYFJfZTCsU/27nCi4VQIGTAPKW
 ItbQnOzxKsZLQBpBslHH4ZIVYoeM09UA175b39Q5DX/CYvKQL6blmp4rrSBwPbau/EP4qgXQL
 Aweh9eBkE1iuVFdHVi0ajHsVOzX0fnICRG3YWCD++fSbZmlNshwGMXHLUkysNTAihOYK5snbE
 QPCB3mg9yJFR7IGysXo3iUjxIn4vq4A5onWUMgFO2KuaCylCs5AyFnxWfvllpB1W86w1XsbE/
 7P2ehVxeneM7W8dLUJYpumSw9jqmRHoqs0HASxsJH8llhLQHq4NmxADUEsTgvA/kxlayoWZ8Q
 srG4d8oafS0dXL/Rif70joKXFE9M00UattmjsfcG/Jklugu26slYv/cWtJFu10oUxf2zjX6jX
 bPB/BtvIMh47Yq3uW3KyBo0rg7zSJZ5AMh9zYkn9AMrKocUT95du0xAE88Q0g2cU1j9wQDjWc
 NqYZgxzHtNEVZKsRPgyReYw9fC+1OEzuzI09rnE2k5e5y5dC/iwaBKGfT8Czk++q8r+NKg83o
 G0DYHcqpjBAvPK4kfra1uKfoCn3kBTx9U0ydFMfJRUHb2TSCAtnhsUqzKcdBvtwbQF5RDqcOD
 BsFtmr6u3XV5n3oJiY5o42oH8owrWi57++QuyUjI+lEmmg3lkfdE5K2NLKILaFsW3Lpw2d1JG
 o7nZ4YsZW5u+uXZl/cDIsg0dysbJzl/o8E+q6FgwK0JYj298vaASGmNyVOoC8jbPUu544T9OL
 J8vjL4f24ZmEFqha6omdjRvPM+jeZOdpQ7/lAVGnG3UwIfm4Cjpm/iwtRNifnpzccVqMh235i
 BlmnWJlv8nRUOdc+zDoSvhCPscOybAdXl8TGtQshppD7YKyo2jrAeDckV2lRYpu8vDSxDYOuD
 2BiOTg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_105824_354713_6E972F2D 
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


