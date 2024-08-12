Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D86FC52D7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 21:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQ8usZ1RlfOYVFOCxfGa2d4cHIAOC6KI4xcce7W4NzE=; b=W4RGZGlhda8Du26sNHCzqZ73I3
	kywqNqzbeMLiug9Tads2RdB7ndCy5d9Y4ZLy1svKFslrVKffNDsYNsirgkVjOXLWSJ8s4pnTYEjwt
	lBS0YKp1D28x3HdtmstFDXCC399TfU+wQ16q7hkmNa/zgz0KtvksCQx91SN6+/nCcB9xGsm+sFaPA
	4DQFwFjV8ZDIzUSx+xkwAqwL8VYY1E8MHzrd0tkv3DwcTe/MH0UgFMSoK/oweV39UiWxQB6liX7gc
	DmISnclevZNvHmz76tjE+WlIPVbLqehLEaN4wYleCQ3oAh7011i5IDE5gxiMtkS6dG0a9ywAi80sd
	69Agfhkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdcD1-00000001ZAu-1xv6;
	Mon, 12 Aug 2024 21:04:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdbyU-00000001V5T-2XVh;
	Mon, 12 Aug 2024 20:49:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E02BD614B2;
	Mon, 12 Aug 2024 20:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393C1C4AF0D;
	Mon, 12 Aug 2024 20:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723495745;
	bh=WQ8usZ1RlfOYVFOCxfGa2d4cHIAOC6KI4xcce7W4NzE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KyOcnWJBCgaVHvDkK3BaWnxUfRhGPpSLq0zb+KQfru8ZxaE9JzBvf8NC+ujsnEZlN
	 veAPZRaIAQ3WYO2tu+qQHgUn3zYIgvf0/j0h6EirItVppuXugUV8yWPJVWMLTMeQFJ
	 x3dRwX2FxsddRCEIxRgzJr2KofduqW4lDLskPcMfj3w1LBHt3twAv4Djm9BzNuuysQ
	 mLU/LKU3P058xOsG95kPeSa68IpkcD1pLwCr1Jet0ar/+CSzxaxBCTPw5NNGvN9TJ/
	 ZrDupOUjaypDnFCJD/iWGD5CqTTafHLX/EA1p52Q18/hNmNZjPsg3RWW2fRs6GeamK
	 y1dz7GhePXRug==
Message-ID: <02d5ecf54338564b8ea4b59fe39af395.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240807-dt-mediatek-clk-v1-1-e8d568abfd48@kernel.org>
References: <20240807-dt-mediatek-clk-v1-0-e8d568abfd48@kernel.org> <20240807-dt-mediatek-clk-v1-1-e8d568abfd48@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: clock: mediatek,apmixedsys: Fix "mediatek,mt6779-apmixed" compatible
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Mon, 12 Aug 2024 13:49:03 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_134906_725948_041CF85C 
X-CRM114-Status: UNSURE (   7.00  )
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

Quoting Rob Herring (Arm) (2024-08-07 09:58:53)
> "mediatek,mt6779-apmixed" is the compatible string in use already, not
> "mediatek,mt6779-apmixedsys".
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next

