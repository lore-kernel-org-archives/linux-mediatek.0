Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E910C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 20:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJQGFkIhvhg8TCnV22jFh8WohgxgBb2Ptua1X7tXZNs=; b=Wu4P2qlEthzFCYwmfYIMP0OgKM
	gmWpTL6gmIpNRavH4e9MK22I0pK4nFtIvABNhPZX/MUAM2mfz3hRvfvc8bYkwNQG2JkoFjQT6E2Ni
	uJ/R4NJ7KsxYK6JqH0wa+h6HQk4GMlKNYsjeiV89+1vpZBYZJu9iy8MCdNp5ywZp4UZgwWkgbSPTY
	flTh1ZR8MGiu2EEl9ZhGm357qrAFJYpJZ2cJGWFKMudsPBG5TqaDqNdbF4VVTAwoX2HFHbKgJPZVh
	BgjuQEsU9evpBFrI308VyH3anvy1ANbDZsawC6ywAl+CGTkxoAax9CNx4Ug6oz8PyCvjZmdFh8M8b
	rrRuPLPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEEPG-004Ptk-3C;
	Fri, 15 Dec 2023 20:03:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEEPD-004Psk-1h;
	Fri, 15 Dec 2023 20:03:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 955B962769;
	Fri, 15 Dec 2023 20:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32ADC433C8;
	Fri, 15 Dec 2023 20:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702670609;
	bh=c3AVRVEy1u8nl7MxlBgA51P8YXTjWZByYGvp3E/El8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=adIVa2jiA+F6CC5GfdAFYQ3mtjewwauLcGfiV/kJtmd4m46kgSYZZcuhDlbJ+S/5b
	 dfdxOtfgP06fqwKgkSfccJEvT90+cEYefpmUcGWRoomXqWW2ORiWHDY+Z0Dj+khufP
	 KKTRIprUkD1IT7hrKlaWwXhpSZXiWKyNrHQAFgD7obEVviiCrPiBUhOMENAU/xUt5z
	 uDljQMMA9lgDZh0I31Fete5pc7alKmX1YShIks8WpowYlWlwkyMpShkwxxHgkh3buf
	 s12dO00McnklcoJPtlNHbBcrN9HAbER4sHFripKsLk15bGbBQON659sreCVk38pGkP
	 rBMFR141eMQ5A==
Received: (nullmailer pid 304252 invoked by uid 1000);
	Fri, 15 Dec 2023 20:03:25 -0000
Date: Fri, 15 Dec 2023 14:03:25 -0600
From: Rob Herring <robh@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, angelogioacchino.delregno@collabora.com, andrew-ct.chen@mediatek.com, tiffany.lin@mediatek.com, matthias.bgg@gmail.com
Subject: Re: [PATCH v2 5/7] dt-bindings: media: mtk-vcodec-encoder: add
 compatible for mt8186
Message-ID: <170267060230.304140.8670744494776319731.robh@kernel.org>
References: <20231215104551.233679-1-eugen.hristev@collabora.com>
 <20231215104551.233679-5-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215104551.233679-5-eugen.hristev@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_120331_604549_EADED98E 
X-CRM114-Status: GOOD (  10.44  )
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


On Fri, 15 Dec 2023 12:45:49 +0200, Eugen Hristev wrote:
> Add compatible for the mt8186 encoder which currently works in the same
> way as mt8183.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
> Changes in v2:
> - new patch.
>  .../media/mediatek,vcodec-encoder.yaml        | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


