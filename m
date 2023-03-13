Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9828FC6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 18:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PxjYWjSxJZWB5VRDbYxpA5+lpyvYAO+uDsREZCVGcxQ=; b=vxYiEOFYDZPGS0huoX+908In9s
	bDJUcR1G7VqOyMrJ8DrhW5DTFyXkE9h+u9qOs76x3FWkxKVVZTQ6G4D/Aq/CyUBmLkveLbimHgtJt
	C22c5EhVyoNi/Sq+rH3A1ReJOAUx9plcGNoAZCwumychdDEseWrQsSzYwdWEx70sh5mzzw73bdnk8
	i5X8KkI9v2hozkIHqu5KEF29iAsye5IEp3siPZq4qmzO4uyTZhZCsZogxtdJefyG9ZTaAcu3CpKNN
	Fbb1G7L3V9lY1AVF4aLfTRBGjhLCr40jYJPRrW30HP+HXXvvuao5ZEi9SV1Et2TQ+aByQMvR7F8cI
	sriOpGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnCj-007MDt-0y; Mon, 13 Mar 2023 18:47:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnCX-007MAE-Lz; Mon, 13 Mar 2023 18:47:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 62CC4CE113E;
	Mon, 13 Mar 2023 18:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A666EC433D2;
	Mon, 13 Mar 2023 18:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678733231;
	bh=PxjYWjSxJZWB5VRDbYxpA5+lpyvYAO+uDsREZCVGcxQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Cu931uiv0GBwRx+Hf7JyRCsBY0NzGuOB5Ooded7UnEa8PcztTKNTZ9lO0FRArXpuW
	 hgmMPQX81PgXNZ6ZQ4eZBYd4X8Vglr5Zs7g/LBNublPbEdXqd3oGW9sdsIDbODFHa4
	 SymMq30JulQYDGoo+JztWFU3thoyVYchAcmVDSUrhGtBo32Dpy1LPU0uRjf+OE/u+L
	 x5C3cGYlbq7QfrTuvgLU0cOyEJooTjLPZ/Nl2EpOClsucohWwxMAjjxJyDw2DD4WB6
	 UGxk7lwEn6seYhapfyqzlD+Aczfn0AunQ+Ee4BXx/0rQbUxx5VxJUZTaI53C5OSPRx
	 LhzoM7zplvXvw==
Message-ID: <fe1ab22c2c2e33e6757988364ac84199.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230206100105.861720-3-angelogioacchino.delregno@collabora.com>
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com> <20230206100105.861720-3-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 2/7] clk: mediatek: clk-pllfh: Export register/unregister/parse functions
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, edward-jw.yang@mediatek.com, johnson.wang@mediatek.com, wenst@chromium.org, miles.chen@mediatek.com, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, jose.exposito89@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Mon, 13 Mar 2023 11:47:09 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_114717_998616_60073F12 
X-CRM114-Status: UNSURE (   7.24  )
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

Quoting AngeloGioacchino Del Regno (2023-02-06 02:01:00)
> These functions are used by the various MediaTek apmixed clock drivers
> that may be built as modules: export the common functions used to parse
> related devicetree properties, register and unregister the PLLFH clocks.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

