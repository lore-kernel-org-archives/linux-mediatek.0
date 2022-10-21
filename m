Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8CDC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 08:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ahT5nZBWsiwZEV4hDmcwWE5G1KNKCZCnB8yGIp5Wp8=; b=j1vio6nCXbnkHgK/AxIuGlyRbD
	2hcopi1ow0bcEITV0Kgl7P0wJOvXBA2XGWSs//InXEfH5mnhe9Ekak0lEznjIM7spj9eG1E7pJ+Pa
	rUVePX84RisQ6bvU2N1i8PQgX6/hhLDtLEJV4S0MZMUGUcvfBTX/E8aLAkzlDY7/WQ6mL+0ZBnMHj
	rU/iB4cKbeCF1ghsVhlMgbJAAE/kEkueHbJsvkmfbv31aUkEYjnUNrAXAF/BJzGiXeUVgSLWlf9p5
	TmiTdLExe29XVrUCHAtnp6AoNgBGdudxw8/c99R18x4glgvEryja2vXlcvcKZIcbTSlMjpcTYph/J
	/SCqLkBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oln1C-006B49-Ry; Fri, 21 Oct 2022 08:04:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oln0z-006Ay8-Cy; Fri, 21 Oct 2022 08:04:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F35D66023A6;
	Fri, 21 Oct 2022 09:04:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666339461;
	bh=hrqBDuZ9432ZvdQYwLmGeqRfzzmpcTHv6oU5E2iY+3c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UA1jeMKcvgrpnC/MQ+hb5EmmnfDr8ZfVWtWjVFCgaSegocooKV+g9uwJWz0ktTINp
	 Jf2rME7rzZVl2YzO+XcUQu2JCbV15b1+UM9/SKt+TCSuPSuhpGdtORvme6ExPLGwvT
	 HZMGZ5RqofgH0etXvEKbtZTJ5IjVCYQFqeeOAwrS7wS/ipkZxz069LweU1FLhAWsxT
	 PlpQqVXt1TLcKK/eAXl4HhtpBH8OR2yDHsX+j81DNhqse8BJYiBtqwo0ZD4336wMi3
	 bg4z9y9jE7CdyGcIGVAtaNeRCflPxw4Uqw3QdHc3lGNhETSXeb/NaWUzLvE9sfS+kK
	 D3fbp4mOlJdtQ==
Message-ID: <e416292e-8e5a-93b2-509f-8df68c1e04ec@collabora.com>
Date: Fri, 21 Oct 2022 10:04:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 4/5] regulator: add mt6357 regulator
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
 <20221005-mt6357-support-v3-4-7e0bd7c315b2@baylibre.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221005-mt6357-support-v3-4-7e0bd7c315b2@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_010425_674078_A57D2161 
X-CRM114-Status: UNSURE (   8.71  )
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
> Add regulator driver for the MT6357 PMIC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



