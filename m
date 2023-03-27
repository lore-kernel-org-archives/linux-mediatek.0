Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76793C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 17:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6Mf9mmmJmkwpYKNu4EDMwMe4wXtgPWUTk0mNL0Jqd8=; b=hbQ+8BJ/5yXiiFrIK61lWxC7+X
	TPjtgHBKbFlmflcfTisUPb0bgLeCr1bwV6wk5vIDf1b1G9LmJPNu29EdohcOan1xEMmvzTGmEIb4E
	8YZesnFjaUpC/JQuJP1eQ/evj8oatnKund4cEB/JPCis2CDwJ0XxxD6Erp5vc3CHvbRGbAqxAmBVy
	J6fuWJ0jN7vEQbPbKzv/qEPgYZsP+QjVtnEQzYAgWRCAtLe90IdtxGuwaAwFT77QG1fZy5GjnUo74
	aPmNHtAX2R+hTfapDV4yFi2stIv2PVS08jxJKyuKZ3h/eEx7bSkn9+W3WoPhSvcGh0kqQs+WHowK+
	D5TUN+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqyU-00BwoV-3C;
	Mon, 27 Mar 2023 17:49:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqyQ-00BwnO-34;
	Mon, 27 Mar 2023 17:49:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 49984B81733;
	Mon, 27 Mar 2023 17:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE77C433D2;
	Mon, 27 Mar 2023 17:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679939376;
	bh=z6Mf9mmmJmkwpYKNu4EDMwMe4wXtgPWUTk0mNL0Jqd8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PtK0fCgDxniwbHb2b7tunPgVtISR8UmCwPRszDIj2DUAp/az/6ONLmvSjH7DM3sUC
	 yFrHIVTWvcyZgY2KVwMYXzzJdy9zBtJig3D7rYd38SwmVpCgyPfuaVGidixEnO4qgD
	 /8O5TCcvqHLBeF29PnGgC9OCamqscPIEBKtPkYxmzdxWbnovjYE0R6ughSk/PZIJER
	 Erl2JMZ1E5q+Ui4LsrncJ+wd1hqN91+m5TdfA79BQWG2gYgPmYfvLaQEOKqfN0PBkf
	 ZYMft2+eBw6hZu0Tto8Wedfg3yJ3DL99B3OcGp8V0zQVzXotw8e80vklina5RXqLGn
	 0ECQzt2kaUAfw==
Message-ID: <6407bbae6eb46897765508262bd2e1ec.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230118191521.15544-1-marex@denx.de>
References: <20230118191521.15544-1-marex@denx.de>
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: si521xx: Add Skyworks Si521xx I2C PCIe clock generators
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marex@denx.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org
To: Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date: Mon, 27 Mar 2023 10:49:32 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_104939_135847_0883B5A6 
X-CRM114-Status: UNSURE (   8.66  )
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

Quoting Marek Vasut (2023-01-18 11:15:20)
> Add binding for Skyworks Si521xx PCIe clock generators. This binding
> is designed to support Si52144/Si52146/Si52147 series I2C PCIe clock
> generators, tested model is Si52144. It should be possible to add
> Si5213x series as well.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Applied to clk-next

