Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06078C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 21:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wol8FUScGGz0zEUfNMwrq5fMJjU5In0liJjcad3nmDQ=; b=t6uv/HZmo6/9ApJt/S0E9zXwdU
	1kHSBnlxjXbtOEbg+2V9CinmaCkwaPKfsfQ8SNchOOyOP78tkhVGuFMGEUXpUbXV4qhkInmUUZ4TT
	5z1sRdFsYEGYkbbw5uN4ApCvg1TdSE1Zrb3PVKid9/IqQYjLc7/w0Y6r8AzyTtSdkfDEIB2SHskj8
	1AqZIs1+Wd6EYb+lGOnvQnG3Ff0X3vVL55s4XBElUOl0d67OGNdMjoSmbixjPw87bXK5iTWSaG6F3
	C2kL9BdORPUPzGKMaD1W86+59gC4jQGCt9bXNKtBlQyggGn/0tCBpA+LJTCMznN5Cn3j7tK39YZyr
	8obj2ZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdcDd-00000001ZOO-2rJn;
	Mon, 12 Aug 2024 21:04:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdbye-00000001V8F-2oXu;
	Mon, 12 Aug 2024 20:49:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E6FE0CE0FD9;
	Mon, 12 Aug 2024 20:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F705C32782;
	Mon, 12 Aug 2024 20:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723495753;
	bh=wol8FUScGGz0zEUfNMwrq5fMJjU5In0liJjcad3nmDQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XswgXcFRRiyFIRxGpNM8I/pvxwK6kARK8SzFQx1ozX+RFGMWZCokQaN68uUZH2EQ1
	 e60ELPE2j8+fwT30vuWyMmmtTxTVAc6phUga7y5jhYnRO8uRV4UtxcqxN7bsOBmU7E
	 ejz36lcCAawT5xYKIjQGiz1xhD6S5Ors3kXIFKncdFfjZ81AoNpG5edn8l6lS26JB+
	 EuaOeF1MjP2b4jjKtL7Qmf8D1MYjGCrUISagoQOpYGnWtg9u2MKZPzzgiQE9xmZaqM
	 kGHJdedtWt6/0svhe9GjO4R7zKh8e3u90tvHyukJYxwj/APD6LuxyDa1gxcrWtrJXs
	 +YAJui0wbWixw==
Message-ID: <ac351d619b7a216bd8d197b026e6cb09.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240807-dt-mediatek-clk-v1-2-e8d568abfd48@kernel.org>
References: <20240807-dt-mediatek-clk-v1-0-e8d568abfd48@kernel.org> <20240807-dt-mediatek-clk-v1-2-e8d568abfd48@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: Move Mediatek clock controllers to "clock" directory
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Mon, 12 Aug 2024 13:49:11 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_134916_905792_CA05C080 
X-CRM114-Status: UNSURE (   6.80  )
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

Quoting Rob Herring (Arm) (2024-08-07 09:58:54)
> The "arm" binding directory is for architecture specific and top-level
> board bindings. Move all the MediaTek bindings implementing clock
> providers from "arm/mediatek/" to "clock/" binding directories.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next

