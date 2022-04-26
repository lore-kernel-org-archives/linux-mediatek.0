Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC0AC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w42rUlNY81VH21ZZYIliAx88rMexUTR2+T4MWNDu/L0=; b=4VtAhZTbIgTBMs
	t00GVt1fMKHOoPqcYaO+qBgnZM6GK79v9PYwql1YCRUDX6q9SYNZAyLF3pymJuKmDQohDWCZ5kJO7
	tXeGYUzYdJUABd2LUWiUTBKtr/bVWFeMEQC1Kq/IxrzvYPp0ewqW3sbm2Ekc9Opf6GumGkqhtaQY+
	nnzf+RzarbtbcoYO/QYqaIUwdPPnPMkA86iSu2csi+hzvKJIeLXnKyt5sfaNVEsZ5No7cyJOb0Ukc
	PpHzvVEfIxVKKCAVU+gIemWKGn3yULa24m3KN4ckhCT9SxQolfLsfdIJMSTMMoxbayWQze4w6nZnp
	nPfE/rMah1euAYUjYtBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njHah-00Ddo6-Ay; Tue, 26 Apr 2022 09:34:39 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njHaB-00Ddcd-ES; Tue, 26 Apr 2022 09:34:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 922591F42EA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650965646;
 bh=ZjCrWBTNIv5WU4cFrZdi3/7uMy715irejzScTBuxtFg=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=MNhLlpuE19PCP8voK4ItuiOevt4DVE4teezmVQe5coKAwKvswAq+rjmWdWFl74kyv
 rG/RiyLC9HUEie6DIKqUxEbj2kwidF+j+H/TRuVHNIZyNVrsfW4yfbFldoS21W7jpN
 etnzk2u6l234Be2xaHKcECRZ3XKVBPFaQMet0tiWbiAEuSaRjUyAc8Ms2MLnDy00Mq
 ItzetMQweZOMa9wI+dMq2mQfndZMwMFpFVTre48uZO2i7QjQyHcl3Wc7nugFc1MSB9
 VTqB6Xz4rFHsO3bmSJv7tsY15a+M8Q6bwKRp+CkTxJoHaqCHQfGE1QcC7WX9zB7SRD
 rILSmxApmGFOg==
Message-ID: <2653c5f1-5582-82ae-ec20-b9ee85325530@collabora.com>
Date: Tue, 26 Apr 2022 11:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V3 04/17] clk: mediatek: reset: Extract common drivers to
 update function
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-5-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220422060152.13534-5-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_023407_668750_765E1690 
X-CRM114-Status: UNSURE (   5.86  )
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
> To make drivers more clear and readable, we extract common code
> within assert and deassert to mtk_reset_update_set_clr() and
> mtk_reset_update().
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
