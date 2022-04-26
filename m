Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0587EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 09:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kq1jPZCzx80Sznmw/fdxBWYFkQTN7x7zr9YTDJIdBUE=; b=Z5bjlDBPqh79nu
	Cni3MJ0V8rGAZVQe2iTh1NhKjZVmjOWD6Ips+ScHG3Map0K8Ni+d02gCHSF2G+Zgp6YIvFOQUo2wg
	uuJ8ra1QJ2Cp1aniCCZmSyFua9H8yQTYXMTXeldwPGl3RIQOdhh6HCOyWS7JeuWosPNAHKv9K8SI4
	0omzVNNpQHImAi9NY0S5E86a0xa5YpG7VHNg6dR76lStT0yrH3cNGK+c8sHoarHoRqtIdiAS1b3SO
	YpWmysSeDVyaLgFH2FSoFZ50dLNV5jrZqy+eBZMo2rQ1N8jrz1Lpqwst+y+TuJhNMXShc6zvQbaTL
	Z2Hw/D8jYq6c7sTNaVHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njHam-00DdsH-Ox; Tue, 26 Apr 2022 09:34:44 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njHaI-00Ddf6-Ir; Tue, 26 Apr 2022 09:34:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 70EC71F42EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650965653;
 bh=Z6n2q8wBqdT14TgYeHPogEpYZASOKVeIGrkc2DakH1k=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=eP4Q5RH0xTQ3ms8CVZker+XZ/hyknF1puDrOlKb3EgFws7cDlZxKUm0jjvYaRyI8g
 ITjwRsOyTHy93bt1V2vHH7YC8+x+K5cFsnUwhGn8a6ptTfHXACXxplrQU18bPwQw+S
 tJXPOeY5o/khpPsZjyFqCcXty8ebMyTNsbrJEgV+6NLsdo6FHsyjRRBigMK/KEoM7Y
 rA0TdNCX/daKPdJABBx70qvL+tUEydaIPdh0xgK/IjwbN81Sr7A4q2zLo7yLgOVQTQ
 TwB/r8LXm0NKhp7lKgpbxrtpiMKR2uU2dx0CLng1p9d+YEplHscwI+Z20NrHdWBJvw
 mv+vZMz7HRHJQ==
Message-ID: <edeff584-89c9-ab33-5c9d-f086be758640@collabora.com>
Date: Tue, 26 Apr 2022 11:34:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V3 07/17] clk: mediatek: reset: Add return for clock reset
 register function
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-8-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220422060152.13534-8-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_023414_802539_1DDBD8B6 
X-CRM114-Status: UNSURE (   4.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 22/04/22 08:01, Rex-BC Chen ha scritto:
> To make error handling, we add return for mtk_clk_register_rst_ctrl().
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
