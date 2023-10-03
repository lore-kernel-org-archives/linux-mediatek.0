Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E838EE7543D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 09:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsGzVwxz2ibSZQQX8sYcuRweZwRG01s2xFqhRXTDaBc=; b=UrrS60ojMR4kS2ZOzOdSPCIBlB
	NVGOVF2V6PFN9h88wPrwY6RaMnE2Y4zc9WtMbsp/b+iAcJl5Dkmj+o4IbFmRYyj2SvTqWvEi5tUGd
	OacXLikCOprfPW+bTf1YfcqBf+NuXb71zw27jK8BPL3LX+1DNaon612DcNAGdXk87Pgg1ojASCeFE
	xX/Cn1706INjFhrPlz7JNmlnXda6t8jl+YDu9Ljg2o+TRB0+NtyhlcQD8MM/k/U8YkOsrR+yJL5cU
	o8nhNz+S2yxA4dlRJWXd8Kmdt4b6CzlEwDU6Asw5WVGifRIm5HB3sVaVmGTDbl3EGn1y3KSqXys/x
	7IT/E9Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnbe4-00EEXA-2I;
	Tue, 03 Oct 2023 09:24:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnbe0-00EEVW-1l;
	Tue, 03 Oct 2023 09:24:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 407F16607181;
	Tue,  3 Oct 2023 10:24:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696325081;
	bh=fglFS8/SJTxax6nKCOPR+u+mqyIQq4V/6eD+bn6enag=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LscWssJW+MqsWczsrw3nIOSf0rtr6/nbmR7RS2yUbx4aYtZh7s4RCjGNaV3QD6wRu
	 QTaHmxzxgPNanqdk82VRO4ntuWMg/MJTewnabeFJibpNUhYJ8mxZZrhqZ61k1tngh5
	 M8snckqZak/z4MzsCIfhP+LIFCMaZ9xyx6L1wzxnjameAwUwmvpEwcfRR8mIxakkNZ
	 uLj9ZU6lp/D5zdfjSG64mY+kpUMITVqJ275VLFeoWvjsc8XnDAg3aeC97JHefwbgBz
	 176JTJWl1BYwnXq/ssMSysUxoSm/zqSF+ORF564joj8juOqkv0Er33JYejrco6J3Az
	 GjqvtvLS4QchA==
Message-ID: <1c639f51-a444-c8c8-8585-2e413243c3a6@collabora.com>
Date: Tue, 3 Oct 2023 11:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Set DSU PMU status to fail
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Seiya Wang <seiya.wang@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230720200753.322133-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230720200753.322133-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_022444_718962_43E275CB 
X-CRM114-Status: GOOD (  17.06  )
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

Il 20/07/23 22:07, Nícolas F. R. A. Prado ha scritto:
> The DSU PMU allows monitoring performance events in the DSU cluster,
> which is done by configuring and reading back values from the DSU PMU
> system registers. However, for write-access to be allowed by ELs lower
> than EL3, the EL3 firmware needs to update the setting on the ACTLR3_EL3
> register, as it is disallowed by default.
> 
> That configuration is not done on the firmware used by the MT8195 SoC,
> as a consequence, booting a MT8195-based machine like
> mt8195-cherry-tomato-r2 with CONFIG_ARM_DSU_PMU enabled hangs the kernel
> just as it writes to the CLUSTERPMOVSCLR_EL1 register, since the
> instruction faults to EL3, and BL31 apparently just re-runs the
> instruction over and over.
> 
> Mark the DSU PMU node in the Devicetree with status "fail", as the
> machine doesn't have a suitable firmware to make use of it from the
> kernel, and allowing its driver to probe would hang the kernel.
> 
> Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



