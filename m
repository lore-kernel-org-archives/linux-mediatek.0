Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354C8CF3197
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 06:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6U19lHRu/n1DjcauPZZx0eay2r9u+5E3uCCA853BsA4=; b=Rwet4JsWuHXuw64FVcJvZexQqn
	hr5wTHBNeuztV5cLVR6aZLoN2uqxvbgwTxmvyb85FhCRwt+UA6owu7IhqBHe/zh74GxQdaYC3d1Ya
	ptNBrY8YtoZI2VAeIBHyAtpBsVYU0d/z78/0PVsAcx0qb6Kzrwbo6QKVxVQjCepAs6LnHZEuXjgee
	LGAQqrBW8QnYnArz/KDAaLPpj1kHrQOONh7+YVBWHLKbpbYzf+AVD1SWTyTXd4KG3rigZ4qfIk3rf
	QgTMJAwRvn1muGRClU7gEijNRQpvCH0wfsAKRR+aNlZgLft0sROoV/LdTLzrFS1txvLl6dxUCowW1
	VeQofMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svshL-00000004vR3-3k5A;
	Wed, 02 Oct 2024 06:18:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svsfW-00000004vGC-0JNJ;
	Wed, 02 Oct 2024 06:17:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7CA4FA4374C;
	Wed,  2 Oct 2024 06:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0984DC4CEC5;
	Wed,  2 Oct 2024 06:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727849820;
	bh=OFVg8fIX+xvAe6Xup+mksgw/mFNgnlC3BvGhOzQyrDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLyXMNbv1KT7bPzjbpXv4QMhO1w1rXIDUdkZhmuUlQsWKLDCvm+7BtxCx9RoHw47s
	 74T1n1xcvfYY+EthltWB+a5O/q4YbFNkxppfWbeOOCBTtwmIHtcibRVKp+vwSfFPOV
	 P3uZQC7JbvZHYiiysotmf9pc+XMBu1pNwzLDAnnp+fkdS5CBXLzSvWR3JAkdmqEBRv
	 xWRwz9Ga5NFNGF/7AkQbzJEe1ILSYjO2IyhFF4zjrZQtz2KCt5KsiFJ0wjdR1yWAl6
	 8SKCXIgWWh+SBuPeXOIae/26j7w7XHF9OoI/eA4ygW5Gss4z097KiKcXpaHLw/3Izn
	 6AFCoKc7UD5rQ==
Date: Wed, 2 Oct 2024 08:16:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 4/8] dt-bindings: media: mediatek,vcodec: Revise
 description
Message-ID: <sl5rrmqh3zwhaz4dfbcworgmluc5albeov2f4qmka4ih4phfhf@g7vs2bwhhd6l>
References: <20241001113052.3124869-1-fshao@chromium.org>
 <20241001113052.3124869-5-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001113052.3124869-5-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_231702_302542_9F3C3371 
X-CRM114-Status: GOOD (  14.02  )
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

On Tue, Oct 01, 2024 at 07:27:22PM +0800, Fei Shao wrote:
> Revise the description of MediaTek video decoder to improve wording, fix
> typos, simplify diagram, and extend the pipeline architecture used in
> newer MediaTek SoCs (MT8186 and MT8188).
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> Feedback are welcome.
> I've tried my best to organize the existing information with some
> educated guesses, but there might be inaccuracies or gaps still.
> Please let me know if you have anything to add so we can make this more
> comprehensive. Thanks!
> 
> Changes in v2:
> New patch.
> 
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 100 +++++++++++-------
>  1 file changed, 59 insertions(+), 41 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


