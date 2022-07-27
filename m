Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85245C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 08:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKkWUpBEwMrNrkR4ZBGDUWqD9T8n7YaqKCvSc78P7eM=; b=cgt+VQuNonU3zW1poy32kvl24L
	P1QoFModp9K39/bjzfBRez1BOqMXB/APlN7G5CqvDBeWPYhAXII7wJVwl6AccoU7wsKdYkKgdZEET
	mBDJw7Z5J7J39v4dDJzNcQfXpg8kCYhUqSqQIFjDzYY7S4QWeL/OtikZtQDczmn49J93UkMi3FJsM
	FEaZDQHjzwN7EGoj5m6tP+jXDogWD1e1GbVeCNgWyPMpUYms3wxlalURQyvJun/p4m1hVywGzgB74
	U+OcrT+z3KDDloQoOF2goY0DJpebc9QTZB63zvB6b3hCZyqSaLDGSgN7OP/477XqjfUFaJ1Mfz9cn
	uyhfEsdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcEZ-00B2Cu-Lj; Wed, 27 Jul 2022 08:17:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcEL-00B22x-0Q; Wed, 27 Jul 2022 08:17:22 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CC57A6601B12;
	Wed, 27 Jul 2022 09:17:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658909837;
	bh=LZXLih2SwGeiRylAPXX7UXVKbKZwvUB3TU1jCoiphXk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nn7xtgzhD40NJk6UblOCXp35/hNMeaNnBVBFJg2X+9Oi/tk+Umdf/cGzINlaXcwv9
	 pkuCvEGcOO8LvqrZbfWj8aaeaYuEFk0GOW68TFqVs0jro53FoIJbiWPN82pkhK7GN2
	 PYucvOjkc2J4958CeH1HcyqiWp/DteMeTB8qv992tEJgxHIIT8v95xIaTAe4DEJXHp
	 H556IfchTmZ2fNhnRRtPgSbmia/JHtHP8dUaM3eBL2jtstgOo2sFnx1Wx3Y2eHvzKU
	 HhHRBesUXEieQPWl3oTZW1ViwhMNCw0ETuNJWNbjy3ACS6P05P9Wv5mMzYMSNwO3VD
	 zPY6s6qRDzXtA==
Message-ID: <35e9db62-4233-1804-0233-f048b149c22c@collabora.com>
Date: Wed, 27 Jul 2022 10:17:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 2/6] dt-bindings: thermal: Add binding document for
 LVTS thermal controllers
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>, rafael@kernel.org,
 rui.zhang@intel.com, daniel.lezcano@linaro.org, amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220726135506.485108-1-bchihi@baylibre.com>
 <20220726135506.485108-3-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220726135506.485108-3-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_011721_262263_20E0D266 
X-CRM114-Status: GOOD (  11.63  )
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

Il 26/07/22 15:55, Balsam CHIHI ha scritto:
> This patch adds dt-binding documents for mt8192 and mt8195 thermal controllers.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>   .../thermal/mediatek,mt8192-lvts.yaml         | 73 ++++++++++++++++++
>   .../thermal/mediatek,mt8195-lvts.yaml         | 75 +++++++++++++++++++
>   2 files changed, 148 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml
>   create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.yaml
> 

Hello Balsam,

I don't think that having two separated files is necessary (and I don't know if
that's correct, even).

You're referring to variants of the same hardware (and using the same driver, but
that's not really relevant here), so my suggestion here is to have only one YAML,
named like "mediatek,lvts-thermal.yaml", where we list all of the compatibles for
both MT8192 and MT8195 (and future SoCs).

Regards,
Angelo

