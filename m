Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E1CC761A6
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzYp5GZ3ncPSncuWnU/JCyhmeSE8bxY5oSz4V1eSUok=; b=yzmeZBECGSfH9iYbGIj7bGq20t
	3/HBNXPuNff8eCY+m5iYvYsIHbHFNZB3wE8Dat2qtpHweFv0U5ONT/Y7/qy+V7NnkafyLAWuoVq7Z
	f0PgEazfk4zga3xCy/e2+eM4HvQWtfEH8lVQ5OQ8Hfu4Ios6nxQhHbbmbPBnj0ifCRg/8hQWlCBMW
	SifkWB+TQfX6CN/YzzaukwQaCXImyCpzWi2CNO8++UJh8AdVcwMoUiK7dCgl0ag0zuHFL4UzhxPH4
	tuVVrf4IFLoJ1Eieev+/fennRLmjy4t5CUMZB4lFeXg/Q08yCOFydva7ZU+suhP0N4qM0qUGFtJjn
	3Of67mzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piOi6-009FAI-2V;
	Sat, 01 Apr 2023 00:03:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOi3-009F8T-0I;
	Sat, 01 Apr 2023 00:03:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BEE41B832B6;
	Sat,  1 Apr 2023 00:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6853FC433EF;
	Sat,  1 Apr 2023 00:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307384;
	bh=SzYp5GZ3ncPSncuWnU/JCyhmeSE8bxY5oSz4V1eSUok=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qcT/IfKpzLOOqXmKc5nnJFNOhzqLMi1Xc7DOPuZWziz1uRMaK3P/u0NfufaPaqQTL
	 aCIaaa4jsl06+IkF4BZqzFgaWMUoceUPnODfLcVVSiZiqqlqPL3c+uURcKUUOKWCed
	 Yf90Z/gT3ykyv0k+O8lGqHds92ScARUh1G5f4JMLZg5sc0sBXJpO4yIJhjfr/wmRSY
	 JCGcrAQKhZlWaw8+/eprqOezlVLDc+1mcUReuUMg7917ltT4mbHY786K+dZ7FUd03z
	 PlwxuJdMD2pg0RcRXok1CYyeZAklp6XolFuRssLiL/wmhWTnqbWYxmUyYQ9sliSSfA
	 yORpsv076PcGQ==
Message-ID: <24ac35a6453b994a2723b86ebca8797b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-7-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-7-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 06/19] clk: mediatek: Add MT8188 camsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:03:02 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_170307_279557_B72187A1 
X-CRM114-Status: UNSURE (   7.17  )
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

Quoting Garmin.Chang (2023-03-31 05:36:08)
> Add MT8188 camsys clock controllers which provide clock gate
> control for camera IP blocks.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

