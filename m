Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64030C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 16:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijq1KyyUijVgubTgPld+SEpIl3PwlWYN5CBcc6woN3I=; b=0jgPWAkLG1YKuCCM3JbsjdLqD4
	g6qhYT4MF9zCWNVbSq0YaX8mafwayRV6KtGc/wLejYg/YiJNbphh0VODYWb0x7L4cFEEqOmL3npfy
	iBdpUqzNL4VZ1EhrKKr6YBT+rlGmop61ndIWgL6cC2Y6CVvQKKcrOKWllQQWQsL8FFqjYn/3hIING
	hMM7pqvbrgXr/9fUr0EnYqLA6brRKiMj/VtUZLuNazVvl+UWeq3un3zgRl9BkgWntxir2r30IIH5w
	AdBRItVcI3uvW0x5/GajHMzGD1Ss5Hz27LdLCuwVlp+Ca4cqhJpYD8OM30/8oMsv7mxMGFwP79Stp
	+QrUmE0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8lZO-001Vv6-66; Tue, 05 Jul 2022 16:38:38 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8lZ7-001Vpj-Ms; Tue, 05 Jul 2022 16:38:23 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9300966015BA;
	Tue,  5 Jul 2022 17:38:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657039099;
	bh=mWc6XHb8mL1eusk3UePGeV8EpBbDv8OndXbNn53uE8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S8+PfNfmQL2npGJZDLLZYYoVWzfdip/VQa192aX9PcvREJkNeRifqsQ1BQ/7mJpEI
	 oCxZJHpCj79kW9JeFeWFtH6ZxI8AC3NaYcmcDywCVED/rFtDFZQW3RBIHJSPb6UI6j
	 3fAXLHrk1IFq//+3i81DGnxQB0ylHoTlPW2qawACMZIZghhoY0I9IGtSUGlWreLiSu
	 VOxLO+9ZW6vk/nLy5c3KIXyz4RecR5/VUemx4ViwehkTzloeoTvTU40Xi0lP1WGF96
	 2vMdFVhfhiwW79puLni8tKGb6u/H+bzhKD5u1VCgB1E898ysfPN1DdpBmyOMO57+vF
	 2g7dT0MIYwTvg==
Date: Tue, 5 Jul 2022 12:38:15 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	sean.wang@mediatek.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: Fix name for
 mediatek,rsel-resistance-in-si-unit
Message-ID: <20220705163815.zxmww4ewclrgxrns@notapiano>
References: <20220630122334.216903-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630122334.216903-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_093821_921579_95FBDA35 
X-CRM114-Status: UNSURE (   8.44  )
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

On Thu, Jun 30, 2022 at 02:23:34PM +0200, AngeloGioacchino Del Regno wrote:
> When this property was introduced, it contained underscores, but
> the actual code wants dashes.
> 
> Change it from mediatek,rsel_resistance_in_si_unit to
> mediatek,rsel-resistance-in-si-unit.
> 
> Fixes: 91e7edceda96 ("dt-bindings: pinctrl: mt8195: change pull up/down description")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

