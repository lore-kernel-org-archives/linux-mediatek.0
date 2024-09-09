Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECFDECE577
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 16:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDxrQJ8+6t/xbWS34nrN4EeJZMPEadmBrJM6DfubgjQ=; b=qco7DMjDZqTo4KnSqwmN/RV1K6
	ss2TjlswsmWSPwSbYu/ItBpwny4NVurIgCJlwKgCpNgvCnUEmmHfFydHUgUgoDbwU9r+F8b9vNjLj
	951XHqKrHfLiIw4ffm+6LJe3UsohXU0Y0tiBswfUkMW21T5jyVdBQFyCEFU5Z+5up/SZjHrZIP4kj
	5jyFiykDYLzFlbAJVjfzaTgX5lGjghRvhhGFAWG4CNvfMWLT8k5moElEFnv9Yi5o2Ti3vf1P56fFc
	MsLPFwb41kImaqS1EooBOLArW6OY6Ju0eci65oe2WlSdKZrtgJXDNMmSLbg1eZcNUdbkk1qCMGuLs
	LzLjrk1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snhAi-00000002dVF-21Uz;
	Mon, 09 Sep 2024 16:23:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snh0k-00000002byS-1OA6;
	Mon, 09 Sep 2024 16:13:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC5515C0277;
	Mon,  9 Sep 2024 16:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C64C4CEC7;
	Mon,  9 Sep 2024 16:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725898385;
	bh=CuPqv1XEUhjryvlD5DFL0yvyN8vD15Z5qVwFtffbYFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L6eckzBV0VzGP6AGdvzfU2yA/ueT9Ys5uRMS3aUrhI0ZMZJ/qzpRVxEOLUqga+ZEv
	 CoJ/mfkd2O7K42XlmPMafpEXQuCNp51j+6/kuvKgSsoEPl4HhzoapdPjLBdEiZ6Yr+
	 4AMbxfYkq2HNhBqjH7ZUa9g7o2fNEZWBQf+K0UVbZyuVV0hYRientqjlCx8607gVHV
	 LOs2dEn/0KKakPnBksbDH7eWotc2HBsE4ERksdmYTm1OQvQ/drTkc8Hxq0F4OHFlOc
	 nGbPyjYt99p1Utl5eqBNo2AEyUsulLNTNySsPlTTunbxW8UwO9vYEez+mOxOCxCHxJ
	 Vdpf8zKEkszCA==
Date: Mon, 9 Sep 2024 11:13:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 10/13] dt-bindings: spmi: spmi-mtk-pmif: Add compatible
 for MT8188
Message-ID: <172589838295.312976.17005993093788269336.robh@kernel.org>
References: <20240909111535.528624-1-fshao@chromium.org>
 <20240909111535.528624-11-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909111535.528624-11-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_091306_453872_6E54715D 
X-CRM114-Status: GOOD (  10.34  )
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


On Mon, 09 Sep 2024 19:14:23 +0800, Fei Shao wrote:
> Add compatible string for the SPMI block on MT8188 SoC, which is
> compatible with the one used on MT8195.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
>  Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


