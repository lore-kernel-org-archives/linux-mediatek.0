Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC83E748F4
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 16:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2N79c8blTrxNg4NBB8P22fssjy9XQEESj1753Knfs4=; b=CaKF+xtSDFW5k/+CYRqvp9sSeE
	owhFyTRTyorwJ69toB2Ex1R4NCxZn3r3LBoturUdQbX2/Ak8KlNyipumyY1J12+PwEdzrPKkFgGFA
	pmkDFMeENstE5y3IoYW7F7ucER8l9fI5EdQvowaucnZXBgnQ95IqRIV6/t0bHzVVr2f/2V8v+gXEd
	9xhXHgYOFIbDwlU9PKgYXNgqa0bifsgCWKPJMNUszl7hsD2lU7FKdZn7Pwz1WjLsXTH8QEuGbu8y7
	Y9aOEyQHb9Z8/Q4WT8eI0J8K+hWU55qIFRS01PSfjcP4w30AXPB3M9v7f5FjI9Ca+wB77NY1lGSBW
	0pOYg2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLbH-00D3cI-24;
	Mon, 02 Oct 2023 16:16:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLbD-00D3aS-1g;
	Mon, 02 Oct 2023 16:16:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0ED3DB811C4;
	Mon,  2 Oct 2023 16:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3341BC433C8;
	Mon,  2 Oct 2023 16:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696263405;
	bh=lDvldFCWk2idedyrSgHG4u7/zWcFe+Xb56KnYgWD1Ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F4BtuvX3F1ntIptvwM7mKdBk2zeRrUy6L9xiALEOoOG9SOAlFExYYUbjC6Oe0EQQJ
	 6i+YmwYxbMaDqlSrMAWo1H6ml5o0DQQaUv8+Qpr1uvqgIOanyWcFiiLzokC7i3lGn1
	 qOtUHPkJs2JEeyBXBa2pcNFt+j2Mj++YrOS1E3D06aXrBeq28yIDGtsfjR127+P2A0
	 MZa2E0QoQfnQwIWxZcJ6p9w3xZJkJooZS5nNwuFCdUg/T1nesNjbCJdrEhEHBp8Clb
	 cNfwHgVaU+vl2VuZ5KjGk+Mk8iJeivmq4WdYCf9vEAoCIi/sPia7KNAdSeiJN7zNjW
	 pnpV6rrknMppQ==
Received: (nullmailer pid 1885250 invoked by uid 1000);
	Mon, 02 Oct 2023 16:16:43 -0000
Date: Mon, 2 Oct 2023 11:16:43 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 04/12] regulator: dt-bindings: mt6358: Add regulator
 supplies
Message-ID: <169626340260.1885194.4720375759009776410.robh@kernel.org>
References: <20230928085537.3246669-1-wenst@chromium.org>
 <20230928085537.3246669-5-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928085537.3246669-5-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_091647_709640_1353DF4B 
X-CRM114-Status: GOOD (  10.80  )
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


On Thu, 28 Sep 2023 16:55:27 +0800, Chen-Yu Tsai wrote:
> The MT6358 PMIC has various regulator power supply pins that should be
> supplied from external power sources or routed from one of its outputs.
> 
> Add these regulator supplies to the binding. The names are the actual
> names from the datasheet, with hyphens replacing underscores.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../regulator/mediatek,mt6358-regulator.yaml  | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


