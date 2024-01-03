Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FACC47074
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 00:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7ZMMxY08OYA5uN5t/1uTGmU08BXdfN8CaBDPQSuYio=; b=egzwNAvnmxNSbUlkInzk56c6xe
	133W74O5XnEZIm2kFJznwWr26FAKzB8suq8d4ekRRT0gvtvU8x7WQjq8bazT1hX7doplimL3+Jpzz
	0oUc1Y8Wu+/qcigA4MOyMouI8qvEHbx/+GD7xhnocTSoZY+vBs30qFL0jzZvf/vEvT/HPE8uaixNi
	2FCP9dgyPxsjw2u4rmXdf/xWeqhLqhicnGSdkx/9gxX0MWDeBG09HZU3zGQXvW4AlmXSbl5mE728h
	oFRj+t417FZ6F+gsu8MuVrq/At1/rXi6BG2gp/KQ9LESdAhClC6MVJAYqzdxzP4iWyIUCsQFJ4rvy
	Af4jGogQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKpUe-009QPd-36;
	Wed, 03 Jan 2024 00:52:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKpUb-009QNc-21;
	Wed, 03 Jan 2024 00:52:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7A1A612DF;
	Wed,  3 Jan 2024 00:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E29BC43215;
	Wed,  3 Jan 2024 00:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704243140;
	bh=V7ZMMxY08OYA5uN5t/1uTGmU08BXdfN8CaBDPQSuYio=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=XrOXl094GCIcDcleUHAWtg6GAUXIxc2+jQCYde7C7jffU4zUZVHUUUwXswEmhQhSB
	 OHG7+IfFG9/zMiJeeA6dwAVoaQmWH2JCpLYfd/LZbOmFGuLazSgFwpuNuykCYLq2z1
	 sy31VRJaXjMEc06Uqqy9CQwnLFTxYJDD+aMt5v3ZPbpO2ZEJV9RGvtN5FlWo4tySGN
	 lgEnTuEr8fSAM4qsF9trP7+opLrv1Jom2AmoAQAguQiGAC7FxqkXBHBZABcF3NJpwg
	 3HQbRkGA6Sq2HplukfFVUg/lbvt1MXzsYsgAphHgpSr+xcCK6kHxHdGuBb/6u5LNrQ
	 S6nfI3ZqCKYEA==
Message-ID: <0decc5ec227b4dfde5324d99cea31b97.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0c14bbacf471683af67ffa7572bfa1d5c45a0b5d.1702849494.git.daniel@makrotopia.org>
References: <27f99db432e9ccc804cc5b6501d7d17d72cae879.1702849494.git.daniel@makrotopia.org> <0c14bbacf471683af67ffa7572bfa1d5c45a0b5d.1702849494.git.daniel@makrotopia.org>
Subject: Re: [PATCH v7 2/5] dt-bindings: reset: mediatek: add MT7988 ethwarp reset IDs
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Conor Dooley <conor+dt@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, Daniel Golle <daniel@makrotopia.org>, David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Frank Wunderlich <frank-w@public-files.de>, Garmin.Chang <Garmin.Chang@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, James Liao <jamesjj.liao@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, Sam Shih <sam.shih@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Date: Tue, 02 Jan 2024 16:52:18 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_165221_708151_49C9364A 
X-CRM114-Status: UNSURE (   7.89  )
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

Quoting Daniel Golle (2023-12-17 13:49:45)
> Add reset ID for ethwarp subsystem allowing to reset the built-in
> Ethernet switch of the MediaTek MT7988 SoC.
>=20
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next

