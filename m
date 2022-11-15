Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF95C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 09:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrcxd8W9nCRtd5o0Zl11drnF3s/RcYqPyxVagA+y6Fk=; b=un5DXl3l6RznA3VWC5/FC6E0dF
	m1u2IMppHiTFIUExH3C4u85n1yvFICgSzy+bUN/pr//xcZAJn+OWKwxKLhTQpeXZUG6Il3x/sXwQj
	PYDMaEWaNEC2buHiwOwd3vtx2TyguQuAiCJg1nURglL+3T7skj5ZZXNXRzgguh0EkYyrMsggTSJ5w
	QRv1esPVaiPpGvZ1Z7sQDNdJJ3vg2qYP92lg+WRSw8u5c2xMd1JvAAlIIM3hnweRxAQgdho8vcOW8
	7gV86/gI3ihasvCyjKYGPAUnrZrM2duTNFVAZRoubR+KOXOyvhLy2QGcTLZ1Le1Q/BwWmY5mx+N3O
	NPjON/Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ourpg-0097QT-Fm; Tue, 15 Nov 2022 09:02:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ourpU-0097I7-FU; Tue, 15 Nov 2022 09:02:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ABB3466029B1;
	Tue, 15 Nov 2022 09:02:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668502923;
	bh=ZPjE++vtLLVJ+uPzcItsluli5tdBrmbS4HkjOXglXbo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SoWQkRtv4Esd4iYFiMSZOOIWFsPdddCpd/c1iwwj7oHppZK0KpN306Efw/QdP76d+
	 E69jFXVYXNXEB5wiJerMy4opI0mkM6HT31fWKzEsD1BesoUKTusefYg2mERRrlM7Nh
	 2PPSD4q9+RVHGsayBx0Zut5iQbCfTzbSkzO+Fb2ViXPUCE265FYmOcW1Hj4Dv+bnqj
	 kcY98qP8e3J9QkTBlGOLRHYEGlIzuKREld94HTM72pYUMMnajbO0sAqtAEmwIdiNyK
	 7DdcY0CetsDDNGNJTjp3ShNUN/Feou3AQ82nr5nxm7DkvVctrx5h/mSJm8VttAqUUt
	 ZRMTSUpdp7F3w==
Message-ID: <6a915c0c-63a2-ebaf-92e8-473c43085cad@collabora.com>
Date: Tue, 15 Nov 2022 10:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 03/15] dt-bindings: iio: adc: mediatek: add MT8365 SoC
 bindings
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
 <20221115025421.59847-4-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221115025421.59847-4-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_010204_671486_E590BB7C 
X-CRM114-Status: UNSURE (   8.13  )
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

Il 15/11/22 03:54, Bernhard Rosenkränzer ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add binding for the ADC present in MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

You're sending the patch, hence you have to add your signoff, which is missing.

Please add it.

Regards,
Angelo

