Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDBBC54E94
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 02:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ppops4WANV0M6ju9EQKG+ap2Z8XXMTIGd3hN/S/qEo=; b=XrrsL5oLBJFYWoAS8YAeuzbXTx
	CLJViRmOXs8dktMu7Ujy9ARPR62Prdsz/qwEH5RewHS1fkicmzwsCBDkD7ZIjirTiM515IrvPz89O
	0tl919hI8QdJpcPs+gc/mpZW/W3bHXiEaa5d7uYJwQWgrivPX21TPCKUNtiYrO1I6eZxNe2PYSBe3
	ATxTfoi05bALH/gq1aImrdmjcLjLdDsf3XEWMirBu1MuXYvoHPGj4YybWewAHcDlfYJJMsw2ijAF5
	oTOQ99oMYlXoZn8QAoSmZOeLZ2hVFCcJNX7Bt3FO9U4jlaL5oTcY4rOam4sXZjrNBzcRFyydCkYo2
	NT9DAcgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKrrv-009Qei-0l; Thu, 26 Jan 2023 02:20:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKrrk-009Qal-7g; Thu, 26 Jan 2023 02:19:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 7F606CE2272;
	Thu, 26 Jan 2023 02:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4F0C433EF;
	Thu, 26 Jan 2023 02:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674699582;
	bh=3ppops4WANV0M6ju9EQKG+ap2Z8XXMTIGd3hN/S/qEo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bm2yWbCF4ELyN7Wi4/yG7Pjp9CjQd+35oVmBRjjyCtRsScxsfEm0Cj2sbS4XnA1zh
	 CL19mKXSUeZqYqX4HAsDOlqP5cfVFPYMl14yPKUmu7EkT74On8N0hhGmfjhIuFHne8
	 E7v70pe1oq2Fndhi1P+hex1za8c95rp8/nOXNRlPdKU4qCygs+vuQtsrbc921OIJ/o
	 ri+RLv/q1aKDLc6fpMPpK28qYOsJZWHI+Bgl8qe7MTOsi2M3bVGBbJZuouYZMAF4Rx
	 Nv7F2kY/FNwtmgFTaU3A/+oYE/jZdQ/kvHjGyhttxjBQdEUe4EMBPdacS5BjcSecbh
	 KODB/X86NBJag==
Message-ID: <fb868ebae274e55614f5bb6e524d6226.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <367c21c111458abf35170b37d51d023a04a04510.1674401764.git.daniel@makrotopia.org>
References: <cover.1674401764.git.daniel@makrotopia.org> <367c21c111458abf35170b37d51d023a04a04510.1674401764.git.daniel@makrotopia.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: clock: mediatek: add mt7981 clock IDs
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>, Edward-JW Yang <edward-jw.yang@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, Fabien Parent <fparent@baylibre.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, Jianhui Zhao <zhaojh329@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Golle <daniel@makrotopia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Wed, 25 Jan 2023 18:19:39 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_181952_482510_ECA99D4E 
X-CRM114-Status: UNSURE (   8.99  )
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

Quoting Daniel Golle (2023-01-22 07:43:00)
> Add MT7981 clock dt-bindings, include topckgen, apmixedsys,
> infracfg, and ethernet subsystem clocks.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next

