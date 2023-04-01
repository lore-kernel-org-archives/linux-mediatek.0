Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E57C761A6
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4vRYJY8ryhUA0yMBrFO0HH4k0Yoddg+cOrhCqZMApQ=; b=rhv+mMjSbW8PDf5j0In1VaLCAo
	WAunZxA0t7yquQKDX9xmRlxxniUQfSPYvCEBcjYVD/5ABZkx2upxH+EftYTJVf39SWMXG3wHReFkT
	STabYLw818Zt2T6jvxJ10co2HboiZ82ADcir9dPWkOMngxuMCZ4TXHxhBAjdXhqdAX5Jq1rKKqlh7
	uGJCYTKwdPQm66baK8rVbj/VFaQreGCdvJO9Ywdn7OAZ4XTCtRZ4KBbdd4BhDKcQQkWMxuMVOgbpz
	PZ6fPKUC3dnLQs6R68eEhuCAPkcKsJX4mi9NfhsVuVWhWghasDMdeOlqYG4fSQqsa91lSAN2scYA9
	EB1suruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piOgM-009EON-0O;
	Sat, 01 Apr 2023 00:01:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOg9-009EIq-34;
	Sat, 01 Apr 2023 00:01:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B175BB832B6;
	Sat,  1 Apr 2023 00:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC07C433D2;
	Sat,  1 Apr 2023 00:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307267;
	bh=X4vRYJY8ryhUA0yMBrFO0HH4k0Yoddg+cOrhCqZMApQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iA+mc9T8GqBn10Lfg+3HSMFIFbFtIEOyZPkzVtRO/Y9YRPztuwO3/p9naG5ElH7B4
	 8ZGh/nBO2zVGkMACpp/6cE41gT4q2lo1X9dyUgrnQDlSKn7NQQcfHYIbiT0UuwsOzC
	 EvBV/uDDpZ2B6d0bxHWuTD1bElIjYZVjT/QuKZ2R7V/vJ4LXlrfMj5JG/9b8GffuGf
	 NZ9cU/23dv5Gy1qbPm571VNyiGYGl1HfhmdO24Jnli+oNydtzwYc6E4yZy6Wq4eNjR
	 KP5U30iu5KwWnk4BDPFtd35eEobr0IPvOaVfQpNYsozDy2/vhKrCdnI0hSkaaNKnsA
	 gw+mAD9V2Cs0g==
Message-ID: <c2956201fe1692dbfb013279e861b5cd.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-5-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-5-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 04/19] clk: mediatek: Add MT8188 peripheral clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:01:05 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_170110_134740_E5754FE6 
X-CRM114-Status: UNSURE (   7.63  )
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

Quoting Garmin.Chang (2023-03-31 05:36:06)
> Add MT8188 peripheral clock controller which provides clock
> gate control for ethernet/flashif/pcie/ssusb.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

