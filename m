Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E5BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 10:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46eZI8EBmHCeYZ18PSz8qLsBpQq+85K2lsgJJ+Z+5NY=; b=liN9D+swWkxSCpQWPlkj03vIdX
	IYB3tX/XJm5jaRlMPRC7rNZpEwBJ2r6YT5//nqA8JrXOrFULI0WKvfzE2Zlz6JVPd8FhZtELa9VpY
	BWLLnAn/UFmYjh9bqkDpFnCt+dld6meJg1FiOqceGbrYHfGeyehI4jvHyjWBdFijJGi3MuSAgU0O/
	GtwahZsrueVnvE9u0HNAG9Hr6iMfh5eQNuttZ2gI0wGOSrH+y/+ZaUCOzSo57CPW40ccdotcWVavX
	TtycQG+7Q/G5XugS+Hh9MtXkL/cRhngYNpj2P4jKiS1WqWxBPYglNbgOFDigXJIEBPh17vQYmCvqk
	e54PB0vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4gRz-001jBQ-Ss; Fri, 24 Jun 2022 10:22:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4gRV-001iwG-G5; Fri, 24 Jun 2022 10:21:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1CE1F66017E1;
	Fri, 24 Jun 2022 11:21:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656066093;
	bh=XiQqaDDVsr9ct3XTN5uUy3VFBouJw2oayLQC2BD4/ig=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B5+Qof2yy7qYYHlV/E/zYtNZe9KOOGts0UL40hc5pHask88etXUGsINGHgCieqMcR
	 AwODsgtze+9SM0LRZgskDgBWfDJIYbP4iGXlTWHpoV3KTVtkCpVsSw9nc0cdAz2Bhv
	 XFFAAzQ+OO2DDPIuBMa2k+ZvSyLmzR6esYY+r0GqDrnK+h3N53uVw+V/HLcsOr5PlL
	 LcAuPwJK8wlHvz9Pt6Hz3GatnFdLsjGtzn1ie40TwLmB17LL0GviBJ/GH0XWUAXUO6
	 kpnW13gwDPutFDHN4o293k04vXkbW0xQuQR+mH32ICYQmgy+I2ChtOy5oZ0Y59hN+I
	 wIdGa+eZ2VcDQ==
Message-ID: <cb36b4a2-86b0-630c-8012-d1df1b0a42de@collabora.com>
Date: Fri, 24 Jun 2022 12:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/7] MediaTek Helio X10 MT6795 - MT6331/6332 PMIC Wrapper
Content-Language: en-US
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, zhiyong.tao@mediatek.com, henryc.chen@mediatek.com,
 johnson.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220520124039.228314-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220520124039.228314-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_032137_756979_41E66220 
X-CRM114-Status: GOOD (  17.52  )
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

Il 20/05/22 14:40, AngeloGioacchino Del Regno ha scritto:
> In an effort to give some love to the apparently forgotten MT6795 SoC,
> I am upstreaming more components that are necessary to support platforms
> powered by this one apart from a simple boot to serial console.
> 
> This series introduces support in the PMIC Wrapper for a different PMIC
> topology, which is commonly found on smartphone boards, using one main
> PMIC and one Companion PMIC;
> be aware that this kind of topology is not *specific to* the Helio X10
> SoC, but common across many kinds of MediaTek smartphone oriented SoCs
> and board designs.
> 
> That said, support for the PMIC combo MT6331+MT6332 is provided in this
> series in a form that will be able to initialize the PMICs with crypto
> and DualIO but nothing else: these PMICs are very featureful, so I have
> decided to add this support in more than just one step, as there will
> be multiple patches for multiple different subsystems (..it's a mfd!..).
> 
> Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.
> 
> AngeloGioacchino Del Regno (7):
>    soc: mediatek: pwrap: Move PMIC read test sequence in function
>    soc: mediatek: pwrap: Add kerneldoc for struct pwrap_slv_type
>    soc: mediatek: mtk-pmic-wrap: Add support for companion PMICs
>    dt-bindings: mfd: Add compatible for MT6331 PMIC
>    soc: mediatek: mtk-pmic-wrap: Add support for MT6331 w/ MT6332
>      companion
>    dt-bindings: mediatek: pwrap: Add a compatible for MT6795 Helio X10
>    soc: mediatek: pwrap: Add support for MT6795 Helio X10
> 
>   .../devicetree/bindings/mfd/mt6397.txt        |   1 +
>   .../bindings/soc/mediatek/pwrap.txt           |   1 +
>   drivers/soc/mediatek/mtk-pmic-wrap.c          | 287 ++++++++++++++++--
>   3 files changed, 263 insertions(+), 26 deletions(-)
> 


Matthias, please, can you check this series?

This doesn't depend on any other series that I've sent and besides that,
Lee has acked the actual MFD PMIC code, so this should be good to go.

Thanks,
Angelo

