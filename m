Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66D1E748F3
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 16:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAEkFcXO+UtmKlPU5ziV5/QuD8FB5HyQRTGTbbl4lJ0=; b=bctkGnRQ2AAwHDwelIPEaT+6Dz
	mSGU9yeYoR8ulpkkEfntZ3kJpfukBDjUrbfp6Lpl4cEXhLew75wiwAj01V1CGUU0RNtAVnBJNEpYS
	jyKmkat6obaWJWDLQA91u4xj5bk362tWsL67sBX1TDPcCPDyV/TjcS4ef1sUvdTAz9TUT4Px9FVwP
	A7+LA7rSft0I3cpmqwOiNi6SIuQtSCJzekhkDEAkT0KSYagn6minlpscMbaMaM2jN1rWCnXQ9A6N8
	Zhd8Sk3WBok/UWT2N758N6uX72DHIlnWPag+ArcTuAsHHt3wwxZ3U8Xb8sjupzOs3vnwvj9wQugFL
	TkgPXt7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLVA-00D2w4-1f;
	Mon, 02 Oct 2023 16:10:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLV7-00D2uy-0s;
	Mon, 02 Oct 2023 16:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6DEEECE11D0;
	Mon,  2 Oct 2023 16:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7353DC433CA;
	Mon,  2 Oct 2023 16:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696263026;
	bh=CfIUOjCxqP4k4PEwlJ3KWN+LSN/aN14INr8PFuBU1gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KmUE24gWThX+EImHY5hV0v2pHMvLxkeVCnJHZ00Ae79HwxE+sH2xf6rO2icIcHLhQ
	 kuA8UeyUFpfQ/Rrv+WrhFR6u7+HlluCNkxLc4ZGuJMo6ouClZnoRU0/L+Ut0StCG1e
	 5n4Ol+PmGUNzV6aqmJVwDPZALnTtEvbd+avoD6v6N4vnmHmz5N+IBuujSzUmrpCZDw
	 l8m09QHqaE7NDsWQ1m3Bs0PjPWniEVLWZCZC4jYP1wsgovVnDW1IDYO+nbEOFjt43z
	 OafuSZjskWKxClwam76QWAaOnQfrNih7e5z+BOBN71TRiC/9F2lZry67Vc+t11BfAW
	 RxMXo9xuRonwQ==
Received: (nullmailer pid 1867798 invoked by uid 1000);
	Mon, 02 Oct 2023 16:10:24 -0000
Date: Mon, 2 Oct 2023 11:10:24 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-mediatek@lists.infradead.org, Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 02/12] regulator: dt-bindings: mt6358: Convert to DT
 schema
Message-ID: <169626302358.1867415.15357334455488086427.robh@kernel.org>
References: <20230928085537.3246669-1-wenst@chromium.org>
 <20230928085537.3246669-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928085537.3246669-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_091029_482296_6FC8F804 
X-CRM114-Status: GOOD (  16.30  )
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


On Thu, 28 Sep 2023 16:55:25 +0800, Chen-Yu Tsai wrote:
> Convert this from the old style text based binding to the new DT schema
> style. This will make adding the MT6366 portion easier.
> 
> The examples have been trimmed down considerably, and the remaining
> entries now match what is seen in actual device trees, minus some
> properties that aren't covered by the bindings yet, or don't make
> sense on their own.
> 
> The original submitter seems to have left MediaTek, so instead the
> submitter and maintainer for the MT6366 binding is listed as the
> maintainer here.
> 
> Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v3:
> - ldo_vxo22 and ldo_vusb moved to properties
> 
> Changes since v2:
> - Added missing end-of-string match to regulator names
> - regulator-coupled-* properties in example dropped
> - #include and regulator-allowed-modes moved to new patch
> 
>  .../regulator/mediatek,mt6358-regulator.yaml  |  98 +++++
>  .../bindings/regulator/mt6358-regulator.txt   | 350 ------------------
>  2 files changed, 98 insertions(+), 350 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6358-regulator.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>


