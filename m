Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048ACC6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TeVB+H7kVeovKJoz7xUH8S/Tn97iWeIkqAh6O40lvIU=; b=nj3h8q0mmMBVBFIOtANczbB7dK
	epEzqB3g51Ohfr9+ps74uaMOm0zX7jP5AXVNXuw/83KHhjlyYF0coOIgv+ZAkCUHvyDJDaMcbLrJF
	VQlj1MtlOQOsTn7OkA1TYV0F7tvpBNSifVV+gbQDA4humpJEiuYZc2hYeWQHAVcV3cii7tmiK2bym
	yvprJuvUNzXE8tGIgNaeHDOEn372ZToSkGTxe3+jOS6PIDIyyiwR2NAFjYwzZffB4TnMc7orYm3EZ
	9wvifU9yK8LWw/GnDeYQKXgs6ddHW7rL5uGKq1+oPf+vI2dccYKf1qcpYRt0fE23PQbBXqXzm4i6r
	k2TQdxKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBSQ-006nPH-10;
	Fri, 31 Mar 2023 09:54:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBRy-006nE3-1t;
	Fri, 31 Mar 2023 09:53:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B99126603194;
	Fri, 31 Mar 2023 10:53:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680256417;
	bh=JOF2O1/PMM/CO83ndiLN5FOdpyZy2/s+X+DPx1ZekhA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BRETWTbtoSd8kwZcRcjJyDM1yJD31hEXeSLVokGVBUtwJWm+qLYi6uX5rr+V0OCwc
	 QC6gkUHWxUFXsxKZRcmFPs91rq5+5CxRrezMIOch4nTsT4tvUUzREouK1kdIO3kyY7
	 IjUjzwPa0uTtNVefhe6rzNl8PFBBjw29GykffDaR4EOVlZQM9xZXUrUG2PVvtyhF44
	 8tybh5Zi1IFpp+VpAbgtcEDsO3Bp3p5jQ1ZCn3YhTvMyKSb8UvBG5MdsSCW7qMQ6+Q
	 wmdAwOakddNZxX1V+tOIHtxEVL02sMbT7u5SL7J6HbYRtMm5p0PAfx3pysPScwK4dy
	 tzluITC7Qi/zA==
Message-ID: <40bcde9e-a7a0-b879-b838-ace98266e9fd@collabora.com>
Date: Fri, 31 Mar 2023 11:53:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 17/19] clk: mediatek: Add MT8188 wpesys clock support
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, netdev@vger.kernel.org
References: <20230331082131.12517-1-Garmin.Chang@mediatek.com>
 <20230331082131.12517-18-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-18-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025338_770648_FC1E3864 
X-CRM114-Status: UNSURE (   7.55  )
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

Il 31/03/23 10:21, Garmin.Chang ha scritto:
> Add MT8188 wpesys clock controllers which provide clock gate
> control in Wrapping Engine.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



