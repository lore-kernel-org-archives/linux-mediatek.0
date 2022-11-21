Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1719C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 09:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQ7Ui3Dim12JJwEcytWC3w/eLyjQalA7rFb8BL84auI=; b=1trN7WamGpwBP/2RxZeS15jKPb
	U+a3eT/dk6+tc4h+DELvWTmMVBzAvw4R+MYe+3XhmyyVCBLre/GsmPbnq9VC+kywK++IG3U/YaZqh
	JOInio4+ury2J/F6bRZUupi39vVNgDjRDMh/Q1znDtHdYE3mgUcnYOMRra5byFIWsMIfPGzHLLVHW
	Rj2v90z7UMKZ6VDBESHTsQoblsrme2teqeKSy4PF9D79EKUGNbsyW0GokNOw16QVQ9jgE68N7cuXJ
	uUXDD2e5D6l3+PwxIsvgGcYMVfBAPXqNQ2p8Ppc7kaB6XmS1KukFkSQQ/F740Q/DlysZZd0ld4Z18
	FETOrLrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2fq-00BaCr-25; Mon, 21 Nov 2022 09:01:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2fH-00BZir-OC; Mon, 21 Nov 2022 09:00:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E1D83660037C;
	Mon, 21 Nov 2022 09:00:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669021227;
	bh=MXlDWXncLIFxW00lPLdUcN0Z8H99/RrA2zO5uQrPlb8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VrdNhm+rAY63uTKkMeau0NTxhjrMRh1EGlc7d43oN0AvYTS7aIvRPrb5lkyrMpchA
	 KpsJtDnvrptvp0CWSF+BIF/zqeLLm3Bf18ZNHPiZjs+PV2poQeDOs397vxQHLJxP0K
	 o7WbxncC0kMmb9ahghXjJVfAGlAJ5ButnSDBMqT7aucMkURsIQMNpfSfJVewUGe899
	 jZabptcS5ddhXRUdBMEaZ4ZMJoFBSptUBns1D6VXO4fmUxjoVvN0IAht5i+HQjls4Y
	 r70EJd1hgVLILCX5GjNzqpSR/jz3ghrJZYrMo91ejFGpEMTGTbTUObyj7hLQzZ4zF3
	 hhjEzcF7tNe9Q==
Message-ID: <945d26a8-5074-80fd-0918-717d127f9224@collabora.com>
Date: Mon, 21 Nov 2022 10:00:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/9] arm64: dts: mediatek: Remove pins-are-numbered
 property
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@linaro.org,
 khilman@baylibre.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, matthias.bgg@gmail.com
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-6-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221121015451.2471196-6-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_010032_018920_B349CF39 
X-CRM114-Status: UNSURE (   6.07  )
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

Il 21/11/22 02:54, Bernhard Rosenkränzer ha scritto:
> Remove the unnecessary pins-are-numbered property from
> arm64 Mediatek DeviceTrees
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



