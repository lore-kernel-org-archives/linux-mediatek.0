Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A372EC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 23:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4e2XnzVD64xxw0K3LkJydIgTL5u8SOHIr+8q/XXU+cY=; b=PaqBbOhahph4W89/2GwIxQHueY
	0v9KFRZDqcmtPGLhoSUea5qudfQLNsSw8+FoYhPmFNHgZ9ga6KWhqj94lFtjItfLWnJ9f94VVmE/b
	4+Z+VQXJ2k9aux4Q5tblXL0iQCFnPUnGSHNggCZw77H+SrN8zQ/BeDSR3Q5rDSvTwAl6KqoTfZK1O
	sr22OpnLhw26OCWC9WGLEi8QFAPlaMWFPR7dy1f918HroRo88HFsdq+lEMTxFjVxQTMpG63s4q7M+
	vjHG9y805Gqs4ksfoqNwcOQi2AWx/vZsrvTMOdccFF40ClP/rcBKKi3BLmW36WNX4I4BRJXuVcghZ
	vcYHTI7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf8Co-000D7l-0a;
	Wed, 22 Mar 2023 23:49:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf8Ck-000D6G-2q;
	Wed, 22 Mar 2023 23:49:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5AE5F62304;
	Wed, 22 Mar 2023 23:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6C2C433EF;
	Wed, 22 Mar 2023 23:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679528957;
	bh=4e2XnzVD64xxw0K3LkJydIgTL5u8SOHIr+8q/XXU+cY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SQHWi+M9SksMIcwSwW7vQk2ilND7txWs1TQERx+M9MLFfOxkbkRwcYMY1Quf3fszz
	 A9VzaLlXafrRLkseMo5Enbic1gJ4NIg16mxt6OINxPaLzLTvJcb03OgwL0EcKSpY+y
	 xFWE73Yv65DknBcyHr+7+seStGRE0erx5o7HZDkoW4AcAle7CBOQ/nkUjfMiqCHbI1
	 wSC4swco5gKd2WaMoA3KZ7dYaTj4vQNi4IzCndBKtW8d6h3zd3ws9T8cazIcKs5tym
	 6A3Zif8XPxBSbAyIS7igO1XqC++zSWZpmZbYPO6yXENKVYtGj72zR7rqdmQWdLFCYP
	 K4Luha7MPrWnA==
Message-ID: <003f436e96aa480f02ee5147f428f389.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230322173549.3972106-1-robh@kernel.org>
References: <20230322173549.3972106-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Drop unneeded quotes
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
To: Alim Akhtar <alim.akhtar@samsung.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chanwoo Choi <cw00.choi@samsung.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Orson Zhai <orsonzhai@gmail.com>, Rob Herring <robh@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
Date: Wed, 22 Mar 2023 16:49:15 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_164918_956369_A6DB9AAF 
X-CRM114-Status: UNSURE (   9.13  )
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

Quoting Rob Herring (2023-03-22 10:35:48)
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

