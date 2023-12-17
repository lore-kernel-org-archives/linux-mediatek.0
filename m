Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BA5C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Dec 2023 23:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kF1H9/EDgVZxsSZuexSY64jgH3mq2OWdvdCAS2qa+U=; b=V9411Ww6f1kS28X1qf9qhHFE73
	9xvnHM3kLRMogsxpSXukP83M3BEnHZVrsAEzTbUYCn8wS7Rt1mof/ep1ByMOKbBYUseU3lB1OIVTy
	PR5OJXO8pYRTqVDs1fCqbDxiXP878QoX202imKBtwvJxSJ3TqbPgymJdXS01Xi86qQyAShIyqCBZr
	l312/e8bliKjjr2mQvLmDUwDYOokXydJAz1+u321SZf28DdwcyJUsgtBa6qN71BtWXN8+VAo5ecAZ
	W7K6Trf53w+m9eqUvRI4Xozv4/p5sfZA9Qqb4zamLe7SPZqluc4fjkHTxRZ/K7/unXpRNpio/dDq5
	DsLIGxhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF0TE-008d7R-22;
	Sun, 17 Dec 2023 23:22:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rF0TA-008d6C-2j;
	Sun, 17 Dec 2023 23:22:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B4B68CE02C6;
	Sun, 17 Dec 2023 23:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F56C433C7;
	Sun, 17 Dec 2023 23:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702855363;
	bh=7kF1H9/EDgVZxsSZuexSY64jgH3mq2OWdvdCAS2qa+U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=AWc1oPc8hUfYZ3M1va101JvghU+foufXlR3La7TH3s5qNNnWWA+b9PhHDq+gVlJ3p
	 chJMhoxJ9ejV3CArhOgv2U8+Yn0Qmlv2pich5jyjGrSyFxUpbS6gch203iDVYzrNXn
	 qGMQoOPBTD3bYtN1khVfBQ9UkS0klgZx6qwiimOItxcNgOlMQ1TYKS8jwjDnzNa8yx
	 sZE5b457JQH2xF7kp//2YLg6KKnnfNm2Vnnzs8hFIKiPPyLRoSPUyOeZ64/laVfDdy
	 11UYBOQmxECv0lNe8yfm91zfw5I4qEoEQMluwJXYi85CzcLp4sagqt0YCwbZiC2hX8
	 gahLys7Kg7lDg==
Message-ID: <30b8c150ea929063614990c8a1bd3a87.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231119212416.2682-1-zajec5@gmail.com>
References: <20231119212416.2682-1-zajec5@gmail.com>
Subject: Re: [PATCH V2] dt-bindings: arm: mediatek: move ethsys controller & convert to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jianhui Zhao <zhaojh329@gmail.com>, Daniel Golle <daniel@makrotopia.org>, James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Sun, 17 Dec 2023 15:22:40 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_152249_117698_6F5E98E5 
X-CRM114-Status: UNSURE (   6.40  )
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

Quoting Rafa=C5=82 Mi=C5=82ecki (2023-11-19 13:24:16)
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> DT schema helps validating DTS files. Binding was moved to clock/ as
> this hardware is a clock provider. Example required a small fix for
> "reg" value (1 address cell + 1 size cell).
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

