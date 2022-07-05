Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5EEC43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 16:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efCYhp9G2/s9puYNxPtLLmmM1L6zWQ+SNFR92s1Hs1w=; b=ZDmTaac/qlXjcvrpoJE5VaAmVB
	HqcGLoFy+enYA/4xTR9rh7ru5eKZmtyN2Lvd/UNeOFIIGcCxLAqTN5d9hUV1As3UUUCjeSePxlX35
	lAN5IIQ3ZO3fYNLKADOmP0G0TepRE9bRWRN/5VVgJ4/+iqd4opTYnanZGFm2yuClIhY0DycJjqr7F
	Wg4xc7ldpSE+Jf9JKRa6NoS8TGLWyTOfewS2LCFmnIrKdgKV0X9aVwsV5JZvQZXQ7KPAI8lJZFep3
	dKzD+CC8NBcXmRyXBtUnvWmZUQ8BokeSFVzdU2PLJsB3dyyCAvrQpJ2NPQFpwVCaxvSAginxnwINF
	fQbtFnew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8lmw-001c7n-2j; Tue, 05 Jul 2022 16:52:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8lma-001bzN-SN; Tue, 05 Jul 2022 16:52:18 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BCF8766015CC;
	Tue,  5 Jul 2022 17:52:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657039932;
	bh=UttKVZOt1YH4wTXBPy+uccKMn+S4wfEPch8Ann4x4fU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmPk0x2Rpj3k94LO12T8Dh8hCCCwft5+4WUti3Av8PMbU2OA/qaysosNCWac2Wr7n
	 muoJGNj/HWNIYntLIJICsdA+WOh/ih/e2PYMCJ46moeAYQmltmBXofEfenIbTCNVJy
	 cIyHoaXpscWhFAoYd7HkfbJGzCG9skQos5Xl9Ibgehj37EuTbsEi8dczFQx+ay6vKS
	 6CSiIFafFfEzqRuMwwTNdgnhxSpIkwO64hGGUUTfPl+tAlBk0pWHqrjZpey1vhr8M3
	 YVo3DV0w+Zo9gsfo+jpgX6arZgdFBKF+g9vOOlFIx+qNPZnJ0leyX9gSGyPBpvgPh+
	 jn5orayEpx2JA==
Date: Tue, 5 Jul 2022 12:52:08 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	sean.wang@mediatek.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: Add gpio-line-names
 property
Message-ID: <20220705165208.wvwlgx3gosw66xhr@notapiano>
References: <20220630110453.186526-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630110453.186526-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_095217_126396_C5780711 
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

On Thu, Jun 30, 2022 at 01:04:53PM +0200, AngeloGioacchino Del Regno wrote:
> Add the 'gpio-line-names' property to mt8195-pinctrl, as this will be
> used in devicetrees to describe pin names.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

