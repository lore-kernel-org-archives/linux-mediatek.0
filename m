Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C59EE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 11:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkCRr0UmxdGE/bJxl5WQHeuJZwvNJLVHeAIwdDo9yLU=; b=1Lv1lS8eZeeu9d3NWh82FHy5Mz
	e3gxfYVLLMwzn6mYLBXssNBq+OT7FzWmH6xH60P9z7zf5m7RfzDb7VQ0VXbRUKTerPqRUH2GrtgCf
	0GpsAPpC2IHyh7ZborxXzT4gKhB09+lM8MGN1RTORgNU9jPFLo2ZqPqWWVfnUOB9Rb8/N6FjY0gOH
	qDmj4cFLCCUVfUF/3Vw106mZiE3q15aoudrLu1FwzNI+vEpY7/7e94LugKtHcaNQ37oH3IEfyS/hI
	Vv6eAMTqkFCXv7MIBRsKGF8PUMhSPw6kvgl0ErRDdZfBPlET98q95WBQtw8iqoN8wTTlZS4LasgTX
	+9YFL75Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfehX-000LXd-2p;
	Mon, 11 Sep 2023 11:03:31 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfehU-000LWE-0P;
	Mon, 11 Sep 2023 11:03:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E13E766072FB;
	Mon, 11 Sep 2023 12:03:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694430206;
	bh=zmb+Vwx3zjcTB7L6BKrvzaQiOZSxQ6E/vnSkZ2DiCq4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cCZqKCBVkOog8hAbHsgre8yoWn74wPQJj+QfLg3llNJzJDzvpA5R3S6Rer3UpEruk
	 06whb9815zOW1xGXt70FlP7DCVbmFG5OFpUb9VKuNOlgl9bOnAe95SDAxWHXNuw4Yq
	 N+DyHTgDL2Pn0rO0xHrg2RmJ5F2ooGxn15gS1qqaBvP/gARJkh500q/dlddC/8pYHs
	 hrr52tzYnUer97xKyn5XlD6TWhagYd6TDL77a+i+uRFXNuj1PpS+Who//BmHftnxjw
	 Fs6B7AHXDNle/5QHB7HtzTi7np4kMJptNkfKXnaMFZWqV8Ol5qQONCe9mC0zdXaLnB
	 QKZoI2FJrTWRQ==
Message-ID: <d7f80d00-a1cf-d7c4-9afe-62f4e59070b6@collabora.com>
Date: Mon, 11 Sep 2023 13:03:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3,3/3] drm/mediatek: Add mt8188 dsi compatible to
 mtk_dsi.c
Content-Language: en-US
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230911105736.11752-1-shuijing.li@mediatek.com>
 <20230911105736.11752-4-shuijing.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230911105736.11752-4-shuijing.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_040328_293902_8351C20D 
X-CRM114-Status: UNSURE (   7.79  )
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

Il 11/09/23 12:57, Shuijing Li ha scritto:
> Add the compatible because there are different definitions for cmdq
> register bit control in mt8188.
> 
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



