Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF73C38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 23:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAH3FEaklexlVeMM/F+Mq5G7RmdCgW4ngE83Zd5lWmo=; b=haM+m/41VGfWHfGjiMEOYjbWe9
	WpFiNFhcj7Pu8MfB8bbTSnMgMHiQUbNICN55AvsEzAJshtK8uOpc3jfaHaStdmh5exiF4Jx7S8p/e
	EkZfdcs3Ct1//VZVwASFrBU31WtexoPAQS1WvBXEjcJQGGnACTgzDDJt9KkYaVgHCtBAXkRnEbB68
	nz9yXH7IGQ5Xo0u6v+bgRoboubq7VihFrTHp9ykzVkEnW/zZIL0FDaxPkEOvoNhcrLiljFXt5Bh87
	8xyzgM7yBcdHd8Jr0cGdgzXVbFZWlFxs6w6sYp5MopiW0zkVhj3DHJrAryl4eGN2fWyeSENjhN6ha
	VkwO1MvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLXyI-00GoJH-6G; Fri, 27 Jan 2023 23:17:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLXy6-00GoHG-TF; Fri, 27 Jan 2023 23:17:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 33D8761DD9;
	Fri, 27 Jan 2023 23:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CC0C4339B;
	Fri, 27 Jan 2023 23:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674861433;
	bh=yAH3FEaklexlVeMM/F+Mq5G7RmdCgW4ngE83Zd5lWmo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nN9FbRLtgFL6cOBuWQftB7zqy0UzNOFywDIxyJqttRn6JaQB9JHDONJ0OCXtk2zq0
	 Dofi6oiyheH6xDyyr/WppyRsIW/v2i2JqLsPWiGrxe/FiQUWFUPsD9ujfLW58k5odw
	 RtFttHz2vAnLgCX1E/OUfoLhDJ91xgOJMYwh8cNg4RU3GcL2h2qOTL5lW5KPI3j90v
	 IjTCAFy0jE6lqKO0lHx8JaXScjnQe91DeeO6C1DuHLGUXTqPGJyaBMsbHQLIficHde
	 sAnZ2UlyaQQ21YaTaoKsGE7Hy5FyLCWk9gZGcnmsio1UH1T5j2dqTHe6zxglhPil5N
	 l5hyBXbH2Vm2w==
Message-ID: <47323f5043bc32140cbdbf6d08b8a0fd.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8136eb5b2049177bc2f6d3e0f2aefecc342d626f.1674703830.git.daniel@makrotopia.org>
References: <cover.1674703830.git.daniel@makrotopia.org> <8136eb5b2049177bc2f6d3e0f2aefecc342d626f.1674703830.git.daniel@makrotopia.org>
Subject: Re: [PATCH v5 3/3] clk: mediatek: add MT7981 clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jianhui Zhao <zhaojh329@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>, Chen-Yu Tsai <wenst@chromium.org>, Edward-JW Yang <edward-jw.yang@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Fabien Parent <fparent@baylibre.com>, Miles Chen <miles.chen@mediatek.com>
To: Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Fri, 27 Jan 2023 15:17:11 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_151714_998350_FF22A543 
X-CRM114-Status: UNSURE (   9.41  )
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

Quoting Daniel Golle (2023-01-25 19:34:24)
> Add MT7981 clock support, include topckgen, apmixedsys, infracfg and
> ethernet subsystem clocks.
>=20
> The drivers are based on clk-mt7981.c which can be found in MediaTek's
> SDK sources. To be fit for upstream inclusion the driver has been split
> into clock domains and the infracfg part has been significantly
> de-bloated by removing all the 1:1 factors (aliases).
>=20
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next

