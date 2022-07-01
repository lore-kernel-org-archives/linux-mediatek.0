Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778E7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 22:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBaZbj66S9W3+bWCLqa3z4pk3gStenLOudHH/CfNESw=; b=ZuOJt/6mhDkZHgdVibEsqawkn2
	RI7aKaOtjl6Z/ucg03WqUnv1VQ8VX+z066wW1FIiWR+Ia5cohiovCJhiVUXw8kzhPrMg/9OgrE0oQ
	idrTYAkwACmVe9JDZcJgbe8aXZGy0jAbJNu0rYjmD5HAc0f+XbSjmBGskxvxFnB68J6faBlr9Rl6S
	cCDItmT52HjwXHs1PDFxtBqOwNB+qU+En6k6IMrujd5loLry13hdD132MPpYiXvjiFV/VQrwKtSME
	Ptg+m7HlvOoVyZPQs0oS7kymwOEDD01c8ylMbSXqM2PL7vzB4dgJfJZMRN11iLphkci8yfK4XOlU9
	tbcEBCJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7PQJ-007IFA-I2; Fri, 01 Jul 2022 22:47:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7PQ9-007IC0-1R; Fri, 01 Jul 2022 22:47:30 +0000
Received: from notapiano (unknown [194.36.25.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DCACF6601802;
	Fri,  1 Jul 2022 23:47:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656715647;
	bh=6rL/5KNfhVkrrbxwBeTnlPeeQGPpZbWTfXtHgSvJc3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VanpHDr4EqVHHyN+VKaj+Oz7YS35DLbn6I2L2gC3xhLEtLp/T7vRpF/IAd06iqhxa
	 t2JX+BbsR12GbJWeCMyoaq7iAiJxTET6RYSSOuj0crcpbYTjsH1I+C1IM2I8XadKUl
	 WiRc+RHV3Q5oulSEAO1JNXNgebZ5kARTjV2ziSLtqGMRdIwDpKl4lzMBY+JocSRGXW
	 tMEmG4euLAaRD4C5hNO0WwPutCh0ccGwb5+KpxTf++DcUC3YFpIYb1uQ1v+xX1r0ef
	 S4mbstlHQMMdQd3yWNqmep+b8g/Ye+2lF9G67vl4qO7BP5pSruut4+sZBrBbS6RL7A
	 /8B/qfD68SQkQ==
Date: Fri, 1 Jul 2022 18:47:20 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, hsinyi@chromium.org,
	allen-kh.cheng@mediatek.com, gtk3@inbox.ru, luca@z3ntu.xyz,
	sam.shih@mediatek.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org
Subject: Re: [PATCH 10/11] arm64: dts: mediatek: cherry: Enable support for
 the SPI NOR flash
Message-ID: <20220701224720.xwtc55lguwhh3fvn@notapiano>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
 <20220630153316.308767-11-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630153316.308767-11-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_154729_255311_3AB544BF 
X-CRM114-Status: UNSURE (   7.72  )
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

On Thu, Jun 30, 2022 at 05:33:15PM +0200, AngeloGioacchino Del Regno wrote:
> This platform has a SPI NOR: enable support for it, completing the
> storage compartment enablement for the entire platform.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

