Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91BAC47074
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 00:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmEKcOhYGpPJ/WAJPz7M6JwZUPvd4RGL0nA8rLtBRn0=; b=gM34oAAw8CT6znMU7/4rVYw3OL
	EJI1KrU7BMCxu81SVEusyUyeKJJZ5aFk5Ipm8o8KWZkUFJ2EgYCgL05RE5r7umsuI97rFEWWDlHxe
	7KBpVkTnDK8cksqAPDVNa3DIy45ev7KWvSXtH0+aNifI+ZhOdGLqwpBNOSrsN9mESQYXvqQF5hoZr
	BU7qJkp4ANnkITLyFhOnbwz41NoydLjs217Y0o1ugnnt/dwj1j4NreaywOLCHFFPKn6Rw369sC3h5
	mAfTHSINrxRjoZH1z9GBPDVdsrx2GbnHtbAxuUuCFVgtqjP9VgeyjwDCmFwMf91XeCEUpM8WrX79V
	wjb6TRdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKpVA-009Qcs-3A;
	Wed, 03 Jan 2024 00:52:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKpV7-009Qat-0p;
	Wed, 03 Jan 2024 00:52:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89940612BF;
	Wed,  3 Jan 2024 00:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137EAC433C9;
	Wed,  3 Jan 2024 00:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704243172;
	bh=qmEKcOhYGpPJ/WAJPz7M6JwZUPvd4RGL0nA8rLtBRn0=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=HhZQnVr8s1QLAQpVFoyAGFTnDQ70UMnQeM5aTEBC7ftABslpXzCZ6nPyDhPfqcb+Q
	 ScT9H3azL/TuvcNt5IJ6iQONhMaAl+EpNH7HNdY3hZlH9KH0m/2mNu6mTN0xw1uEPo
	 sdz+FsJfzqN9tyJDhRzTaUQQK3Lu09JMsz1rAM+9z2kLASeHGn2Aa6yximGdjAeqg1
	 znpkwNchkgRhnJpnRImtBg3b7pKC04RY8YYa0Ay3suHuLLjFErAEBeEyIWJ/Fq70zZ
	 Y+nJWzMnpwKrFZ3j3/eBkyaoVrwpMGyW9hY/l7KI4pRTG4/3+8m3JFeYjfyEyUrDI8
	 BG2Sss2qNfiFg==
Message-ID: <ce30101e45da9be9d1617a35e89313b3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <07e76a544ce4392bcb88e34d5480e99bb7994618.1702849494.git.daniel@makrotopia.org>
References: <27f99db432e9ccc804cc5b6501d7d17d72cae879.1702849494.git.daniel@makrotopia.org> <07e76a544ce4392bcb88e34d5480e99bb7994618.1702849494.git.daniel@makrotopia.org>
Subject: Re: [PATCH v7 3/5] dt-bindings: clock: mediatek: add clock controllers of MT7988
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Conor Dooley <conor+dt@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, Daniel Golle <daniel@makrotopia.org>, David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Frank Wunderlich <frank-w@public-files.de>, Garmin.Chang <Garmin.Chang@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, James Liao <jamesjj.liao@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, Sam Shih <sam.shih@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Date: Tue, 02 Jan 2024 16:52:50 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_165253_338558_4855F564 
X-CRM114-Status: UNSURE (   7.93  )
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

Quoting Daniel Golle (2023-12-17 13:49:55)
> Add various clock controllers found in the MT7988 SoC to existing
> bindings (if applicable) and add files for the new ethwarp, mcusys
> and xfi-pll clock controllers not previously present in any SoC.
>=20
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

