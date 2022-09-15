Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F15ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 08:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySTEc7s4w0vEJ2SpgiubBf3N/jLBgz4PVnhn3Y4lsj0=; b=AtSPiAQgexR91hZxDXtHd8A8fq
	uBgCnH44V+xpLZszZbuHu6lkz0ERN0yxsZJfUvGJ3xVP0yLc6Md6ONqVUt5ck6wiHNI/SNBkZreVs
	k2qc+3GW4ngSHOsz6t67wbJ74QgqUgx+o8K+GMH2HD6+JPB9+IbOO0AnD6TT4Ju/eABOJjHKpyCIF
	5qxpUy0tUM+97SKsgDTJOUgmCcEh4QpjjY4FQy0OmPOVKHlOmOHPSlpfYqtkAuMvXXb8ihyLMlg2C
	YinZ3xxXHSYRj1Z8nSeMDLhl7nkEDf61sA+DDwMVF/xq/vuZn1bpkGKwKiy4yPii4wmTDnyUJCLtz
	Yr/vhd9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYk0z-003SDu-3H; Thu, 15 Sep 2022 08:14:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYk0M-003RKo-JP; Thu, 15 Sep 2022 08:13:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A49896601F69;
	Thu, 15 Sep 2022 09:13:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663229624;
	bh=dzxV/rPMkkDnhpGeh2xlfwvyyorR0fXgBe6bsUMpQGk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b+3qq2YzIqRTlECOWZM3YuccFiEM2l5c3ZAVEn0bt6qjR68DozuUEjxA7zdrYt4jn
	 FTcwGAFkkRqZ34HHlntCAJ1+lyrQnCBLH5e2eebQP687FnGxB5EA0aZssXdUsI/5Gj
	 66TOz7o5Y0Mnd/+XNVsE736bZzNXfG/594jwotntXace3+ma4bc7KaHTwERGMewej+
	 syPbMJvCfd3dSAiw73Cf5fmrd7o8xmYR5GphdOnjlXilIRxaxpLuNw96jYQ0/zpaEO
	 96LNRVmFU1aebV0Xxlmb0hruHyIoSoTuxVfD42g+20pWstKtvWgKzx5IIY33ds6ytD
	 CW+KDN0CwvcMg==
Message-ID: <0ca4c3ec-059e-12c9-46bb-524ad6b73504@collabora.com>
Date: Thu, 15 Sep 2022 10:13:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: cherry: Add dp-intf ports
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220915075849.1920-1-rex-bc.chen@mediatek.com>
 <20220915075849.1920-4-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915075849.1920-4-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_011350_915696_94834191 
X-CRM114-Status: UNSURE (   6.19  )
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

Il 15/09/22 09:58, Bo-Chen Chen ha scritto:
> Add dp-intf0 and dp-intf1 ports.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



