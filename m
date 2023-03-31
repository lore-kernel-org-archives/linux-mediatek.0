Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA23C6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSZcPlQzPvjxRj/YmJl9ygJc+3N33+cNWIyaO4E1CJs=; b=qfeERDn+Wi47gojpHe1YN/g+Ji
	cYJez1OwfpmUOAmrbU2M9wwKH8FNP9qnJ3EB0pKkhEt6WQDK722lQwv7nUzUC8Gv7JYRbZlgZFWWO
	W3KGYS/rFb3BoEtxWPVqPR9LRTEiHW1Tm46oeqyi9WslqyyG/3l5nmTljFFVzxDy7aWLfjGsoXRxR
	t5+xbCTD1shKwy2DqwW/t8Im836ZpM1f+YDpgPi697bi6jj2nCwHNhOdMQhUrG5kqCTKGHoZUFvLu
	EUG8Pv68BwRLAQlpKqCc6xtVJpfIkJRPg+Ecc9/CmuBoQrxlcX2+Py9u0DLsWTqrFPtLispQiUtuQ
	9KkkuBqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBUX-006ojL-1Y;
	Fri, 31 Mar 2023 09:56:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBSg-006nWi-0R;
	Fri, 31 Mar 2023 09:54:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2792C6603192;
	Fri, 31 Mar 2023 10:54:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680256460;
	bh=piM6PA0EHYRy8htLrhyuISmb7ChsQu5VGOfh5mw8r2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lWxlktbD2qs1vfPddbKp7mpgDaoOD7JbAnTRhOUf33AtZov2yGlCosviqcwqJajf/
	 gUVQx8e2r5Qirk+zveV5azVqPhsPFqcEJtq/dy+WKGH7ObCCBazVghT7pxOOk/4/aw
	 kU6yfz3pJV24BYPBSz1p1CYO+EJpZ9g9SaUIf2yvZlwHzVliyWnkGyZh+jFc867HC3
	 HeixATwgeKohJOsrcK2Z/JgMmv3jRZ46pxar9qWLuYFRHzLwhHNUNDfMJ/vbDvGHld
	 oTS5DcA2zlNLPsluaEKmiZnMlNakKk5jUdMC154t9PqFGdhtiqXDiIr/ssOMxkX74+
	 rnnAopV31zWLg==
Message-ID: <e76e9ba4-7331-9c9b-617c-74bf7d43e70b@collabora.com>
Date: Fri, 31 Mar 2023 11:54:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 08/19] clk: mediatek: Add MT8188 imgsys clock support
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, netdev@vger.kernel.org
References: <20230331082131.12517-1-Garmin.Chang@mediatek.com>
 <20230331082131.12517-9-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-9-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025422_326415_FBBC1DA4 
X-CRM114-Status: UNSURE (   7.06  )
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

Il 31/03/23 10:21, Garmin.Chang ha scritto:
> Add MT8188 imgsys clock controllers which provide clock gate
> control for image IP blocks.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



