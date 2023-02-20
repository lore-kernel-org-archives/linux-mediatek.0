Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F7AC636CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 11:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlwFH6KFe8Vs7ZR81OZ7yyC/RhUTy+5qXCyOHSeKPJI=; b=YDzGjhtNDelcyttBDjMl+EfEc1
	ARuqiq0ATbLgjzcP+4m8pcvCqKChCNE5UhtahSirO7uldDINT/cFgQAP7S+EE5AnAWOSuup8lZ9sr
	6lc66PdlwCh7cjy1WwIwlr2Ia6GNpnnu7145naR2fWGrVPmaDpCwvy9WGggIbz+kj6V9zhlrFLiBP
	cFxdMejpF06H9ZRVwUnBo5bMd3hynx1P+NET4eD4Lqak7GfGSdUoXfpO3gV8744zW3Td4KdGGusYX
	T0RIzJVKG4LWzHSK9JV6lHJlGqdesPAiklAbvMsYb6v+uNmIKexhdxhBsafYvRrPCSa5e5K79UHr+
	Dr6OA8qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU41x-003mxp-Ik; Mon, 20 Feb 2023 11:08:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU41l-003mwM-7q; Mon, 20 Feb 2023 11:08:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 071296602135;
	Mon, 20 Feb 2023 11:08:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676891291;
	bh=3r7QiCwl4pq0MK/urg3yHiYgTcMD2IeavuKvvenUpcA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bM0XFAXxn9n9WA1u3UQW1epuxIWhI9BdumCBcEyGOrfj5Ix1V7Ec3ucH9HjXn1fcE
	 SFlISHrs9BBBShNK8zLJt0iL7Tmqlp0DyPnE0nkcqi02tXMQOthDHm5TMuP0Rj5RWC
	 N51S//d2gZnpm1Vra3ecmUbRAhX3/7UyD76IUWoPaUUHvFfb9MfApxn/x6ZBZAJdN6
	 6cwqOcsT8sMrV7jFd+aJHS9eEuv6JWMu8MKb7zkbnROrHPemUsjccsCuIyfpO7ru/S
	 L/4U0vhSg0QFqRgEHy0ht110iPQTRz9IWO+/oQjkFbNGZWE2m2twydCsa8AP1JasS2
	 yhO3KwJV6r1tw==
Message-ID: <e77fe423-e40f-65bb-3fe4-43d692779259@collabora.com>
Date: Mon, 20 Feb 2023 12:08:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: kukui: Add scp
 firmware-name
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230220093343.3447381-1-hsinyi@chromium.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220093343.3447381-1-hsinyi@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_030813_459515_A2DA69C5 
X-CRM114-Status: UNSURE (   7.46  )
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

Il 20/02/23 10:33, Hsin-Yi Wang ha scritto:
> The upstream SCP firmware path is /lib/firmware/mediatek/mt8183/scp.img
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



