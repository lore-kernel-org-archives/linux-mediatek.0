Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163FFC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 13:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWuDihguXT1hc3tMjgA7eXp7w/K2vRAhjohTE/ito1Q=; b=wkZoU6HX+ebG+OpKGJvxn3FNuH
	AdaNwo/F4D3F9r8Q095SmLsOREzlXD+BITIMcV3ie1b5VZwj76BQ8kwLjN/1tGz4YuVjaG14GQWKM
	kPt7+/CPbOkkEFHtuiW7hdPixltjjofj9XvXjDeSkq1Rt/UHpnqfKCvazrnqvMK0FoE8DDOVosn9Z
	hQuGwNRL0L0EG4QIWxMc4NKjFiAoGC+9WYquQS735Vs1bfgyHZRPodi87EyUIilf3kZLi4/q6N8ja
	5Jkc5yIG4JZtbGJMGQVALyLra87pfiwsCxmLd56e2eIg8DHf8hAO1BoD1VKe/ZzPdqZNFcmQVAP0E
	Qm+rYd0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rythe-0000000Djcx-2Hla;
	Mon, 22 Apr 2024 13:27:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rytha-0000000Djbn-1im7;
	Mon, 22 Apr 2024 13:27:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4E2860C76;
	Mon, 22 Apr 2024 13:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193F3C113CC;
	Mon, 22 Apr 2024 13:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713792441;
	bh=H1irkZGAWDGw5VgXFMcSc9/h4VYnX/SA9x7f6oCAJHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XD3T44zqo7lkJUIG5AKmE/ZColS0jrrrLLSrn57pDMg/VjWid2KoOsWDf402WBEO7
	 UglCDO0cKpc+fv4PiHxs8gJzUTZ0re6hCCpVbYt8Iv8RvnMnkJqIyZR1z0N6Bpnmov
	 RbU6F+Olqgykq2KwJZAftLAm4dk5Dn4RpMM1wsGzOWsrNHZ5okSwxmyAPa6xT+UHH+
	 uT/ZJGVw0AghZ6aLkdiQmWEa4pzW1rqF6ye6Kp+PzLxH/nu10Zt5CJvv4VrzfJfnLR
	 vvs1Ja56OUscELNYHziALrk/bU4z9yuIx/Sq0jd98WaRYxTY1S8yKvQmsqj9yJYdZt
	 v7tk6625G0HGw==
Date: Mon, 22 Apr 2024 08:27:19 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	broonie@kernel.org, linux-mediatek@lists.infradead.org,
	lgirdwood@gmail.com, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org, amergnat@baylibre.com,
	linux-kernel@vger.kernel.org, gustavoars@kernel.org,
	keescook@chromium.org, henryc.chen@mediatek.com, wenst@chromium.org,
	matthias.bgg@gmail.com, djakov@kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 1/7] dt-bindings: regulator: Add bindings for MediaTek
 DVFSRC Regulators
Message-ID: <171379234629.1115290.1388746342600815292.robh@kernel.org>
References: <20240418094134.203330-1-angelogioacchino.delregno@collabora.com>
 <20240418094134.203330-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418094134.203330-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_062722_522837_829C96A7 
X-CRM114-Status: GOOD (  10.35  )
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


On Thu, 18 Apr 2024 11:41:28 +0200, AngeloGioacchino Del Regno wrote:
> The Dynamic Voltage and Frequency Scaling Resource Collector Regulators
> are controlled with votes to the DVFSRC hardware.
> 
> This adds support for the regulators found in MT6873, MT8183, MT8192
> and MT8195 SoCs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek,mt6873-dvfsrc-regulator.yaml     | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


