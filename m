Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747C8C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 09:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8mAxu13/j/oCPj2Z6uSA/3Jr/rXnekrrE5kcJtDBo8=; b=Ts9Vc3QnlLISS2OajwA81nji+l
	QO4gRP2iziavKldMen9+UChjfs528DKz7tlLpn9L+RLS/Aq1lxkhQcJyEZiucyU9ECeN2HLZ++eR+
	D+aPbxdIAGa/SIJkKHv2um9pSv0lTGiGzPMqM+Wk/Y4vngnxDSyMH6FOIgM+SzsOz7f5YzLU1k/8g
	EFkl39dshRlLEnJHX+oUjOrVNrTmthpQECQmPu1yygIJSVmfd4hP0mrl59ETE4P3z0ddJDljdv2bf
	7SuvaTPUoLDHzN11omBcOQd7Gz67jf1VEDZsLoOXeJ4kZlUwN0Efaeayqh56xuv/JDMTGMum8YFTn
	ZZxNC37A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8eIg-005gHM-Rt; Fri, 23 Dec 2022 09:25:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8eI5-005fx0-RY; Fri, 23 Dec 2022 09:24:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 658426602CE0;
	Fri, 23 Dec 2022 09:24:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671787472;
	bh=7V70gBK9OEYmEAkkBN5wXw8RnXXhhRdhdQHkoaIpKe0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e40NHzKsNV0hq7vDwiqkRViojw4UT/GWvfQZe52ysa1cvePOe18EWgepLZN4n4d6j
	 1S8e/WdCUw1BK0mZRM+4BmBgLdhDbvoTHtWKuW2HnhP5jp/rUJFsnHtMkbUnP+NLu7
	 brdjvrGrJf1umNrOH/uQosX8RgKB4RH68nFS2AMP4q93Ut0Nfas6um+iBWL6RXqYFo
	 Suox9ULMMGlmn9L4cqq66PgFMyfxqkbPM/6Grz1JVts0XvWpDNkwIIPK2+37eLv+ta
	 lKzkSeY6dfUiucvo28cW/UnhIFs1/o0/P7uWZUMVDHv3xg9Wyf8IKyWFFHgO0xG/mP
	 65hpcuUzoCM8Q==
Message-ID: <bfc4c7b5-3d5b-e087-1e33-1c461e361802@collabora.com>
Date: Fri, 23 Dec 2022 10:24:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 1/2] stmmac: dwmac-mediatek: enable 2ns delay only for
 special cases
Content-Language: en-US
To: Biao Huang <biao.huang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 macpaul.lin@mediatek.com
References: <20221223015029.24978-1-biao.huang@mediatek.com>
 <20221223015029.24978-2-biao.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223015029.24978-2-biao.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_012434_118738_80EBD5D8 
X-CRM114-Status: UNSURE (   9.29  )
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

Il 23/12/22 02:50, Biao Huang ha scritto:
> In current driver, MAC will always enable 2ns delay in RGMII mode,
> but that will lead to transmission failures for "rgmii-id"/"rgmii-txid"
> cases.
> 
> Modify the implementation of fix_mac_speed() to ensure the 2ns delay
> will only take effect for "rgmii-rxid"/"rgmii" cases, then user can
> choose phy-mode freely.
> 
> Fixes: f2d356a6ab71 ("stmmac: dwmac-mediatek: add support for mt8195")
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



