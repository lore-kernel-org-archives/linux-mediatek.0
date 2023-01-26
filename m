Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFB7C27C76
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 02:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzfcYhdvhhqXC92MQNxZiIt7bbyHYk0TCSvJiiZVLdw=; b=skX1/MNyGRIuNUKGBadsD0KDp/
	Vq5uKMUFeQ7QQgoHOZHxsdwQbj78i+jpTI+6h5k6OEkWm3vssqvmmlNQBRdsJ9gG8sn2LJ3z7gtkv
	EW4I0WGYAR64ecJoPmHl+FQX7BT2NDACKPr8Mx2BCaprlJcuDjdSkb8E61hjdSzu2wfzseWBuV4UW
	VsubGi5wblI3jU03tXwXjpOezr2XZcocg5/bEaYUPCgfyq9ZX8qufmG4i+npREcvS3cUzmHQlHadd
	PkLlZJGg6QJwwxcpPQFVrr91f7+fuo+mvFCc1gyi8EiVpD9soMo4CAl97zOBm+MyI2SitCCzU27FL
	NJXuuIEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKrrV-009QZR-HX; Thu, 26 Jan 2023 02:19:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKrrL-009QXs-06; Thu, 26 Jan 2023 02:19:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53D8561707;
	Thu, 26 Jan 2023 02:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B96C433EF;
	Thu, 26 Jan 2023 02:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674699565;
	bh=FzfcYhdvhhqXC92MQNxZiIt7bbyHYk0TCSvJiiZVLdw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HRCpRnhYRh0Ijd+5XIEqo+S33nWqvMqLgd3dDfR7mU+YdX6Pcu+3Ti3v4mCuTiCSa
	 KCw7wEuYAQ62X1xP7/lQyOhQ//VBVWyTwiLGktbpInwYkZrcVSFShKSPfb/M7jSbw5
	 Gzs0c+QNuPqnYHOps9TLa7wVvDEpuce0XLaqEFlrV1cXkqpV6YRnK2PIjqzZgwa0xk
	 ips1BFWC0FLMc4Use//2QtU2aDpPFrJeYUFsBRSyGS2p53YIpuKheC0EUcVwOpPYbT
	 mpwqLYL+0XJ+CbYAhhdTQDvAvKRcH86VdSCnBgd0oqL0FHyAJzjJLeCI6q9O1kWUTI
	 krFHMVomsXrxg==
Message-ID: <2b3a32bd490dbb55cbcd2cfdc5abffa3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ae9acd210c1566b4bd72b09df4430bcad4a36c9b.1674401764.git.daniel@makrotopia.org>
References: <cover.1674401764.git.daniel@makrotopia.org> <ae9acd210c1566b4bd72b09df4430bcad4a36c9b.1674401764.git.daniel@makrotopia.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: clock: Add apmixedsys/topckgen compatibles for MT7981
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>, Edward-JW Yang <edward-jw.yang@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, Fabien Parent <fparent@baylibre.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, Jianhui Zhao <zhaojh329@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Golle <daniel@makrotopia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Wed, 25 Jan 2023 18:19:23 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_181927_113196_59579E63 
X-CRM114-Status: UNSURE (   9.43  )
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

Quoting Daniel Golle (2023-01-22 07:42:27)
> Add compatible string for MT7981 to existing bindings
> at mediatek,apmixedsys.yaml and mediatek,topckgen.yaml.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next

