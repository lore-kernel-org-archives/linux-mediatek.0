Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6165C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 10:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DdUzGYOb+Es0VQ6AMdGYLtRLQasZEQ4wd/23H38qcX0=; b=e/nQ3YM3NBGnHZtlj9sYpxWTFF
	E23Bw9349hb7auOYKros2w1mrqU0+Jdj4KuAaP8gHax0FX7Lwc5KtZpm2aAeOxSsFfPA64+Frpi5b
	qplK8yEXSicWbTunjAl4f7ovWKmTIaoT7JJy8e8MkA82FhwKAHJZm3lYzMqEn6k2/XsNUvE3Nze6C
	7iU3+aRoq0XdQfcUKtV8ASYEz+yuvQJwmeP8/AQoEedkSwhEFB0gb5iQwm55Kno+e0zvUXu1FqyZc
	lZroIyQRxV7B609eqJSZ8TN0HOE+tsqCI5GVy0NbiM3wQXwNKCh07h8cDZ0j8825Kn1ShkvJ33qo8
	e2yhKpig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mMg-000Hb6-Or; Mon, 27 Jun 2022 10:53:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mMA-000HHu-NR; Mon, 27 Jun 2022 10:52:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0B8C26601826;
	Mon, 27 Jun 2022 11:52:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656327157;
	bh=WxkNGjx5kgWUdeLMvig/vI26O0/WciY9uF+6rptUBeA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mA8gY84WX77GS+QSIgYY5nCzqSl5cGKnzWNf1K0Zu4fxBdEtwNYJtYZXQjBPRxvBE
	 SrAYXwtgLPVqMYoSHlGoQPqcMsY59XWaRVrXM40cpFD2R0+wbtBJnV4q0QkBZfLjqv
	 9fyU4zKOEX3dkiPg01j2zpGhUQPv7fQoUQSrKO3wHW5gQkZoXa/LHTMLYLwbnRK0zG
	 2xOZ1ZJNq5/owiBnbAsz1O1SOqBBy9u9LvrMno34QX1mAnZdA5ThoUpsWcsknUMq7D
	 b2cUIkSbGRU5crGxtGBDNX4lcBmUr0ncZBp2MGLlZqHHzixhptuUA7aMiKebwqddqr
	 lWZaoVGb/IrFA==
Message-ID: <693d8201-5da9-8ad0-2194-812f7bfb19b2@collabora.com>
Date: Mon, 27 Jun 2022 12:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v14 15/15] drm/mediatek: dpi: Only enable dpi after the
 bridge is enabled
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220624030946.14961-1-rex-bc.chen@mediatek.com>
 <20220624030946.14961-16-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220624030946.14961-16-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_035238_949372_BF1AC400 
X-CRM114-Status: UNSURE (   7.98  )
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

Il 24/06/22 05:09, Bo-Chen Chen ha scritto:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> Enabling the dpi too early causes glitches on screen.
> 
> Move the call to mtk_dpi_enable() at the end of the bridge_enable
> callback to ensure everything is setup properly before enabling dpi.
> 
> Fixes: 9e629c17aa8d ("drm/mediatek: Add DPI sub driver")
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


