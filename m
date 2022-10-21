Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505FBC43217
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 08:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0OJnSRI8reeXriz90Q41bSHLViYz7DdZP3MgJe0H8I=; b=WGuJNncroGJrchlqXhge4yWua4
	J364QFNDLXHqP+DIVNC3hS3IX7RZTKGKVHu74UejlbVCwslgFXfb+ZoUQtF9FSoJBoT2lubhnVYgH
	CPZrkaGnTsMHBSwhTJaCbXLGiLO/w+z5r4FYNmZfuKsIpYXpcW6tCuDZdvXP4e2xCBTAt+/8t3n9q
	Oea5GuGtBasvWsdr69hjbcqo6Wa85PIEip4x0hltDmH6h4IV0XqKGSAhaOkHSeo5os9G25iXy+Mcg
	U/tGbbp30nAq4XESd4qCdDNAiuRRmojD77DOnVkK0yXbtbMYF+s/CuRInHWYNOCmEb20Oye7op6Xo
	/bBwcCJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oln1a-006BEw-Ed; Fri, 21 Oct 2022 08:05:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oln1N-006B98-Ny; Fri, 21 Oct 2022 08:04:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 909F366023A6;
	Fri, 21 Oct 2022 09:04:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666339488;
	bh=+8v8j3CmYy0V5Wq2wkndR69HIDwbqZQ5C7fQX3ELlVw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IWs9rC9m98Q1I1estZybthcBQOSBE+OnVNazeYA1948VDQQXN8XQqxWemscEG0Nqy
	 3kfk0NXb5GZZtGPuhEtt5sLk+BNVlBix6UAB1y9XDJHwC1C11Njr/1c0ixmz2OnZ99
	 S6w1nkdpeRLTaCtONxRZmjCiI/FfNdo1e+a2ieDDJG2ASGsMkUYAIKpAi2udqAm3ii
	 oUW3fiah3Ei/7k7YcebxiviKy+rvsT6hItVdpGIVrq15qjqJGyANhfJ9bAMD336LiO
	 Gyn3vYOrHQl1JvOyywhPO9cSutpH70MdGB/ng2RHyhEJUrBqKiVNxQuBOCKH2q6EYo
	 doOzPANMiecNQ==
Message-ID: <5b62a132-df41-6da2-4cb5-c15f9dc53801@collabora.com>
Date: Fri, 21 Oct 2022 10:04:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 2/5] dt-bindings: input: mtk-pmic-keys: add binding for
 MT6357 PMIC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Mark Brown
 <broonie@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Fabien Parent <fabien.parent@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mattijs Korpershoek
 <mkorpershoek@baylibre.com>, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20221005-mt6357-support-v3-0-7e0bd7c315b2@baylibre.com>
 <20221005-mt6357-support-v3-2-7e0bd7c315b2@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221005-mt6357-support-v3-2-7e0bd7c315b2@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_010449_936365_98217892 
X-CRM114-Status: UNSURE (   9.27  )
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

Il 20/10/22 18:20, Alexandre Mergnat ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add binding documentation for the PMIC keys on MT6357.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



