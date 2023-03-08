Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F19DC678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 09:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rksQYstpt967QG4A4ich5ifOWhrFoZsObp7jcakY3ME=; b=pMztnRfqRSaQxCiCiusTY+9io1
	yf3oc61SHOlyfv8HNGi+3WF4+msnvXiDF5CYPo17k3Fx+zkcoyb1RlxhS8LDj/M6ElSHFpzSNF4ii
	6X1ZuL2xm6GCcPdrss7qoD19/5yvoa6R0qAsjd5GsLX8Drklgg8xR82pSRPe+5Q8ki1Yweab6kbVj
	bbmMi1s8wTkUZlsGR+m6OWXiW76kHN5hmNTNWh6TC/SdfiPBShhBjJWN3zj7Bdz+SEBLly+cotL3P
	LfYt/JBr/AeWRCnYcpKX36FK/46UJpWG3BTDbchUz7ZXV2OWD9Q793tFHZ5VgueJzOzczo1G5DBSJ
	FHi2+yyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZpva-0049PM-Br; Wed, 08 Mar 2023 09:17:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZpvP-0049Lm-8e; Wed, 08 Mar 2023 09:17:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 17B946602FE7;
	Wed,  8 Mar 2023 09:17:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678267050;
	bh=7CthwUYZWwI26oi5ci4iad7NhcobXUwsiHbgXRCKMaE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dd/8bSV8L/ApStx6zaCqY1vsUbxan/m6w/4ZEuSB1oWwoWucZRZhOTJ7+mR0Y8ilA
	 vWo/V8x8/Rum5972/abhAnxzI6KoW06Wz7hTPoZVTJQP0zLP6xh6+Z48gFG7tazMsi
	 HCM34qdTGRIPhdoItDrL4xsSsjhhZPidAO+q69u/QuIADFAjulhGDNFkqsR+Loy7nf
	 oPsA5L42D9dkb0ohRuA6Net0gKCoSRFZJNBU5IRfVgZyalhdKknxxuKyVjSZE2LWWP
	 JJA1gevsEt9oPW6cVuPYAK81cYkfRawWPYx6qnzMyUMi+PZTk4iurjsFPemLs/Y4Fe
	 oHE7zGxBlfwKQ==
Message-ID: <5f980c7d-1bc4-cfdf-9392-70626317ca54@collabora.com>
Date: Wed, 8 Mar 2023 10:17:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/4] arm64: dts: mediatek: mt8195: Add AP domain
 temperature thresholds
Content-Language: en-US
To: bchihi@baylibre.com, daniel.lezcano@linaro.org, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230307154524.118541-1-bchihi@baylibre.com>
 <20230307154524.118541-5-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230307154524.118541-5-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_011731_464776_39C9F194 
X-CRM114-Status: UNSURE (   7.02  )
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

Il 07/03/23 16:45, bchihi@baylibre.com ha scritto:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Specify the targeted temperature thresholds.

You're introducing the thermal zones and *then* fixing them in this commit.
To be honest, this doesn't make a lot of sense...

Please squash this commit with
arm64: dts: mediatek: mt8195: Add AP domain thermal zones

P.S.: After squashing.. looks good.

Thanks,
Angelo


