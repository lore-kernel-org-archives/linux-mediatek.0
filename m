Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF482C761A6
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTZTdCRdjrCDaFvY8EdGZ3A8hK33gkH5nQnKUhIwp78=; b=u0Ne1sU9hAB7OL8jH45sroM/ZH
	I4rkWZN3tAM91hm5zS1CQ9/ZrEGNC58fuh664iRj14rTZ/x8MflajwMifkH09uGUY9ps8UWJnBmvU
	bmNbn6ExpFD75GxU1dIjPZh7725xCKxx0JUgAAZzyY+em5W4NfriW8huaXwjTwhtJxpxAP6/hEFxZ
	JoKJVdjakaPzZRAbhDakaDOz3Qu33fyM63lpei4hZhsiyc+XpNAaQLp33onbLAOBdmUbGWgT4WRtJ
	PP3hFx9upARMze46HvRtCgTD2wrtm86AiZMfSz6vGbGW8uKRL7S/MGyUsY3rFAg1YgzDqKPRxoYcV
	igfQnyJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piOiL-009FGD-0H;
	Sat, 01 Apr 2023 00:03:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOiB-009FBk-1S;
	Sat, 01 Apr 2023 00:03:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C773162CAD;
	Sat,  1 Apr 2023 00:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A367C433D2;
	Sat,  1 Apr 2023 00:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307394;
	bh=RTZTdCRdjrCDaFvY8EdGZ3A8hK33gkH5nQnKUhIwp78=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hOxg7i7S1QRTRjd9QhLI/NW0CTXht/pxEJo6XXWqBI+iM8UATLYYw8Ug8OFRyyu+k
	 NwNcUuObCQcyMzYv68sl+Up/IbyBTuKu0d2hkbDMhVfWwHxE+F7CdQ5XwRojZyDJa5
	 OeYYkLxOdhHsDQxoIRBX97rf5nqOLpiiUawV9HjBpeP45N0acaWxLmnt3Z4Bn0xPrr
	 yLWqVuHdqb+7ZPyuuf9oHyH0UyUDXnLWHr6aku/qhdBhBejSjL2rXiv43dmWRDrsdc
	 BAkMBdvIqguJyXPNVal2rvU137bT7NbFn1cYIT/9xKMgcbT9vrY3mUxD4ihcassX8B
	 yKHG6hWH2OCTQ==
Message-ID: <0a2f4fc8e19117f1c35c38ee526245ba.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-8-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-8-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 07/19] clk: mediatek: Add MT8188 ccusys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:03:12 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_170315_529665_B1780526 
X-CRM114-Status: UNSURE (   7.08  )
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

Quoting Garmin.Chang (2023-03-31 05:36:09)
> Add MT8188 ccusys clock controller which provides clock gate
> control in Camera Computing Unit.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

