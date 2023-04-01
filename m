Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315E5C76196
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 01:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2ej4KRjkyDPibBFC5j4GniM5FIqqNOs/iTjseDN8wI=; b=OvAPAoTJyvjwuKKXLWNtUdex4K
	rlujMbT4hGd4p2VlE0N3jCfp8IBWABA3RfN1n3tI14Xy8xUAPlN83n+9Uxx3Lw0Nh2inzLqrv7RzE
	CIjz4U/NTnv1vXlPUyognCDhrMBJEVwSO+DpT/dO3q6UKXfisSGz08vJnO6b2s7DT6ZStjyGvjwv2
	hULqp7qlwCJ+vxPli4nfR4JDqC6+rsTcaHLLIaO08z9lzk+20riHrqmLUyIeAqLR5aELYsa08qkK+
	bGYeT1DE9L5ZQDBcDwJATjZI0E3Pfd7EYWeff6bN4e+A9sUg7TFjp66HHKwwQvbzEOwXgv4q/9XAY
	xUPwntvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piPr7-009QiZ-0J;
	Sat, 01 Apr 2023 01:16:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOj9-009FmY-16;
	Sat, 01 Apr 2023 00:04:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DE62B62CAD;
	Sat,  1 Apr 2023 00:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4029BC433D2;
	Sat,  1 Apr 2023 00:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307454;
	bh=v2ej4KRjkyDPibBFC5j4GniM5FIqqNOs/iTjseDN8wI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hibT8l5OYv1TGz/vDSpf+JpkNxNH5xiZ1GGH5hR4jzv5X5gg7/ckJa9GrYGwq45B+
	 NZUGqGGFlcgTHTGJVpb3AFwNe9/PEA31JWqw9SxEUeZ36mk+9On7I7CevWY+bc295Z
	 4DEHW+j2XW/XMrtYz9HN+kOJiSf6ViD5YIWZYocl4i3QjKlBcCnCvc35XD+YxhEfJD
	 jFryC/GpGbnoIrvA/2N+FrFfiYHpn38Aosrq5wQSgXasPg7AwHGj6fZd8P0rmiYri9
	 vnKYmFQ0/qGohNCgXtlBEl8YkiH1algxpqzLYWtFIGuXR2nV+Q+SQ4FAxFl1Cb1lD2
	 4tZXsPbf5jIcg==
Message-ID: <5645c4028e6abcf4f7585092de85940d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-14-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-14-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 13/19] clk: mediatek: Add MT8188 vdosys1 clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:04:12 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_170415_452400_DDFCD346 
X-CRM114-Status: UNSURE (   8.29  )
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

Quoting Garmin.Chang (2023-03-31 05:36:15)
> Add MT8188 vdosys1 clock controller which provides clock gate
> control in video system. This is integrated with mtk-mmsys
> driver which will populate device by platform_device_register_data
> to start vdosys clock driver.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

