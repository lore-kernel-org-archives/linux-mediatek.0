Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CF4CCA47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 01:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s07JkacgYheRotOQFYTku/YMbG8vMO95kzvQ82X52Bc=; b=ifO18TevAjnA3WpkaPdohGJkTl
	nyBX/D+rXTjM+4h2/QlJrjQEtujuAloqkcazNoamgnaZ3KdA9piA67TS5BSeq8ZSGQd+hlUpeu5YJ
	sqpiIMn9YrifFFDvBGwpv0d9vg8q4U733oX/eTncsYmHZbnDgUI0TpXJ+zFEIC8BQsJ+X0BKypMRN
	c9btHcX4CTPyS7SWVItYXGTso8G5b7/P1lIyZRsTEYr7Lf8/eAETLdeZM2YaWmo0OkcnglWbKdWx8
	z2hThuXlzqw+Uv8H8I723fs8o4mI+hNjoAgidfjnAi1mGxDIxSL7kGtX1XzLspL/vut9dGZ+Oszsd
	VihoBeIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ekI-00HVBy-7I; Thu, 16 Jun 2022 01:56:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ehR-00HTUq-2j; Thu, 16 Jun 2022 01:53:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 55D3561D13;
	Thu, 16 Jun 2022 01:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8ED6C3411A;
	Thu, 16 Jun 2022 01:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655344411;
	bh=s07JkacgYheRotOQFYTku/YMbG8vMO95kzvQ82X52Bc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KcnkPwWpaJUZZ49/RkqIAnNfcQGE0hW8FH76WIHf34P9fPO043LXJaf1gjc2HnZb+
	 2jKXrEZlq0BSOCWMKNeY03Kigj/9AJg88lLpoTRbpfLGYH67hTggeFsZj1JjiHqonW
	 L+vAtsIuy+S7vgKRfNcAlO4iNmg4Jhk6XlCeMSLS32tuYlaG36TKyx5CFGXxClRVZh
	 PCGANzSD5RS8+OCafYmD1RvdQFO9WAqu+CDFpuvP8Ru/E4iAf9lPJ9E8pK5cELzVSZ
	 kDPphfWnTdSLu/Gg/Ve03XUJMOsf2xpUP1XayIYAfbfnCtYpMMsTIo5vqSKupFPFfY
	 WFUj9xYmO/+ow==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220523093346.28493-13-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com> <20220523093346.28493-13-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v8 12/19] dt-bindings: arm: mediatek: Add #reset-cells property for MT8192/MT8195
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org
Date: Wed, 15 Jun 2022 18:53:28 -0700
User-Agent: alot/0.10
Message-Id: <20220616015331.A8ED6C3411A@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_185333_218863_081FF80C 
X-CRM114-Status: UNSURE (   8.68  )
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

Quoting Rex-BC Chen (2022-05-23 02:33:39)
> We will use the infra_ao reset which is defined in mt8192-sys-clock
> and mt8195-sys-clock.
> The value of reset-cells is 1.
>=20
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---

Applied to clk-next

