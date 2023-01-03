Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB7CC3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 11:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3M8wGSq25ravGzc2gimk5GOnJPpyon3AjF+oCGuWVto=; b=i17q3E0DryL188h96C/plCxU6k
	C8iULUHzH0MP6zjGmKJhwag79a8stepqJHiSQuA9fNBUZ2zmK7dcVXCGO5ZElT9Qti9cncam/qc9+
	DKMCmTlq42POtONkhth1WcKxAnhr/eWZKaKWW2RyUuh8VEMwxmsHBDibX5Q4qPXOUjtkLllLSx9xA
	OSuXeUGKxFlpbBabsh5xmjtUOCxLKUMFlJwaO/3R4juz/jmz/YZMQ2zdiG8u+/PRXxVpWg9LlHTHp
	xNbRxZK2rKNxFVq7UOgVyKMR0QftEsiTfjCLqSzbTFNhWbC9D0/NJYMvF4f2fA2Xy7JSLsqSuNaHm
	kIZky1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCfCu-000vAL-Aw; Tue, 03 Jan 2023 11:11:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCeIB-000eUe-Lo; Tue, 03 Jan 2023 10:13:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 53C5B6602CE1;
	Tue,  3 Jan 2023 10:13:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672740789;
	bh=N+C1P34GJr1WiBndymJ5TbUjQDNvai7DpHDmwfXqxF4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OtQWQSPT1qxLRtAQtfJ4DxUz5LUdv5bzLkrr2c1ep8uJXhRQ1urAAkktNz6zVD9NK
	 FKD38gqvLC2OcZwONklTYugE0zDeNWEhT+PeClwKV2sJUqGE3IDn3euD5M3JYTWSYt
	 3rW6sKVLe4eMjFplS/Y+ufbVUeQrThPfwWiuoxlm1x642SNd18iQN/rSlTa92oceYB
	 3yfj/82kE6TVoMub55TU/7XUYd016c0Thdjc7lXWprlfycZenvhH/lGmjnZSeflUyv
	 I/rNR0uEdjCNlBdlG5zWr5f4pmXOGcnr/hJms1IdABwm6QzbkAp+2r0QJeO/+3eeVP
	 aFVr94n+cPttg==
Message-ID: <4cb6029c-bbea-65a8-3923-8ede46125cae@collabora.com>
Date: Tue, 3 Jan 2023 11:13:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8 4/6] arm64: dts: mt6358: change node names
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Mark Brown
 <broonie@kernel.org>, Tianping Fang <tianping.fang@mediatek.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Fabien Parent <fabien.parent@linaro.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen Zhong <chen.zhong@mediatek.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Flora Fu <flora.fu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-rtc@vger.kernel.org, linux-leds@vger.kernel.org,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221005-mt6357-support-v8-0-560caaafee53@baylibre.com>
 <20221005-mt6357-support-v8-4-560caaafee53@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221005-mt6357-support-v8-4-560caaafee53@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_021311_957791_A7266EE4 
X-CRM114-Status: UNSURE (   9.09  )
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

Il 02/01/23 17:06, Alexandre Mergnat ha scritto:
> - Change the node name from "mt6358" to "pmic", "mt6358rtc" to "rtc" and
> "mt6358keys" to "keys" to be consistent with the generic names recommendation.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


