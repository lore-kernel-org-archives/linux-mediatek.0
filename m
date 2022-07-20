Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABBECCA480
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 13:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gep0cALt9bOs6G2CdycW3VMN8mBCr3N3JX3ZSs4cY7E=; b=DpuACTjLc4gja9ZdYQYrFvPWvd
	WXvJwTbInqEFceqxvwLq88PCkY1ia0zkdjNv12ukKJkLgCbewaOXfVaDhREQdDjWWQ9yLU3kk2Q4m
	OK0T/GusEjePSVy+VkRiEy416KMvDZE9qKGJ46A+ZlyZCB/y8u7Xj6SY3G5L2VGET+VfmpyDx85ON
	pU3ml/t2w/UGZZbhFPfiGN9xw3AdcqacOCJRG3n+BFQ5jk++pV0Opb2xL7hmyz6aXp2VjCJyHLG+B
	5J5hnTCreNwWraXSA91SASY6fR0/2dIdrfZl7EA3KcVj78vJ0MrA0GNHul08xjf6YvWT2o+WimeFo
	81nfFFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9Uy-005oQ0-Ii; Wed, 20 Jul 2022 13:12:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9Uc-005o8K-2V; Wed, 20 Jul 2022 13:12:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4DAF16601A9B;
	Wed, 20 Jul 2022 14:11:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658322716;
	bh=7oc6WBjJf/tumB9KMpI0YZxq6H6lB5W4oL3qgJ6y3OU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XKOQM+fNh6zsoKIecOTLM/vTXJzlPo2d/YtqnK4NKSzBa6GjNl+WxBspoIXMCFjtH
	 EguKTTTHQzCCJ1o74zw6+wG8Ki/fo8QcYImbOUJ/xND6Z90h/d6Td8b1BjCnSk3D/G
	 70ue2tNlOzsMfac3u4U0z3iCtv1IBSFJIAhCPFAaQO3t38FwhLl6GYUIaekBRri/fK
	 aQ+lX6DFdY4oO8o4SvHLLug550ecwc057i9O4xUbs7AKtpl4Y9nc5r5A76blF+xPFt
	 /AzC4aACQuBkO13poWsxbv5KxnU4S20MXPHpiNmGVY0u4xrZ8TuqoF5jpmeVbMGcZs
	 Sr3FYeNe6+A2g==
Message-ID: <bfefe80e-9f14-fccc-bd4a-58ddadfc287f@collabora.com>
Date: Wed, 20 Jul 2022 15:11:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/4] arm64: dts: mediatek: Remove mt6589 wdt fallback
 string from mt8195
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220720125015.13797-1-allen-kh.cheng@mediatek.com>
 <20220720125015.13797-4-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220720125015.13797-4-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_061158_296386_4C7FFF00 
X-CRM114-Status: UNSURE (   7.82  )
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

Il 20/07/22 14:50, Allen-KH Cheng ha scritto:
> The watchdog driver for mt8195 relies on DT data. The fallback
> compatible "mediatek,mt6589-wdt" won't work.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


