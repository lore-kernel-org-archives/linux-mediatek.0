Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88595EE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 11:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZaWbUXKbArKaT/v6WUj84XJxG7G9d8SLqBNmAEfKuu4=; b=T0xSfQCOANJFFMYMsLKhERKOpt
	5uqNKmkIXh4gbR+v4ZgbJusZrG12j2dQtuL48CqQ2yC9QGdn982KFhYbG3AQav+jDIFZwdpUtvrY8
	H/YCOYchKnEboi7HtG5SSprgvB+fmJpxpl6skLRiCLFVqd66h1qEnz4MCExoyt4kxXGTqMgNnGjnC
	4sqEZjjsYCVt0n/XERbAJYQYqMmiqtNGYrK8jo4qRlZ3xCACWIwJKpIE1wvgzX9v00KqUsHZVPDgJ
	tOVB6xSalUR8FTnxLV5BmIv1UkzGLloXWxH4nKFaW57MTsCuJD5eASUE26H9UkP7kHcKL2v+LDvJ7
	7G+RH9fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfesK-000MgU-1i;
	Mon, 11 Sep 2023 11:14:40 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfesH-000Mfw-13;
	Mon, 11 Sep 2023 11:14:38 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0103366072FB;
	Mon, 11 Sep 2023 12:14:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694430875;
	bh=wCziWKBrYCLn+iQllKVDANcEQ7lNKBoWAymVUANwCco=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SafZm5o+3vl+C1n72vNwCoE59yHGvzAv4GZYMCY2dItGKGNjoUT/kMolJ0AzxDvs5
	 IV4MBnajK0v+Xv0Ihvttsz5UTUsInsIyqDlnxhJ/z0hfsKWsk5PVYPNQFIpxiIT7j7
	 LG/J2GH54leijlCRY5QwmKYWRpNWCzrY6HNEniTYQO6/ZOw7wWBouz8Ukd9eRmtxtA
	 GecTzamVoYEOk0RGABMREFtAOZD8/SMqEQA5Nuy90iBf9qdNVba8ivmywVNI/YMgHG
	 Sx3wE4XbtQljCEeJ3OJFDdI3XsmQZZayKSyVopWccc7ksZmUbzQgDDqGHGGNIv1Tf/
	 bTobRshmTPG/w==
Message-ID: <5146679e-3ae8-edc7-69f9-c89ca1e7199b@collabora.com>
Date: Mon, 11 Sep 2023 13:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3,1/3] dt-bindings: display: mediatek: dsi: Add
 compatible for MediaTek MT8188
Content-Language: en-US
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230911105736.11752-1-shuijing.li@mediatek.com>
 <20230911105736.11752-2-shuijing.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230911105736.11752-2-shuijing.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_041437_500962_66732A32 
X-CRM114-Status: UNSURE (   6.66  )
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

Il 11/09/23 12:57, Shuijing Li ha scritto:
> Add dt-binding documentation of dsi for MediaTek MT8188 SoC.
> 
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



