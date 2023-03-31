Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3F0C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p22hUzd/ZbuOy5KsA2VoxfjZYtFSQP7+5rx2FNpLMP4=; b=0BbjO8bpOg8jmWl6HMw2OSeQng
	fJ2A57k3BgiKxNjTSuJHOZpB5cU74emMIAqaZrvPGgpH2jRtorY/W1IuBmNhVWcoyc3xP6BK5G4yo
	hQR1zDvGlwvj5arEUltKZIxgaX/6mFr9xV3+GGV+NwI4ptRo8WooCqscZ0r4o0DaFUq25WcxY+pMM
	0Y51cUd6SyUqG6XavBtsS2QJg8Y9VRGezV3dQI69qp6noeoC6jOMHGJ4EpFfm0mEuLcaD7lpMJHfQ
	SseqB165QZt+XYamv6hhhvdKCIzRLqUYAWS611js93GFnpvNBpD5M+Q2pJ0LwnlEubK9fFVOUGbY4
	ir6Cg7tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBTU-006nx9-2Z;
	Fri, 31 Mar 2023 09:55:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBSJ-006nLp-3C;
	Fri, 31 Mar 2023 09:54:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2FC976603192;
	Fri, 31 Mar 2023 10:53:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680256438;
	bh=sspxzw56VEnil1q/9XyhPaFsk9HHWEpegjewYiAaP7E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VJYp7wcfOv1UDNjmHg9zxoUCo54f3983SrRuvmrG7ymv09+0/zwYSL3eml6IrgW0n
	 H1lLSqxXvZqwYgSpJwYCRg10Syh8ngfYIJTaRxUIg94tNxsqudnZ9VCTLvFtvM2Lll
	 4sGsheV+q0z3E/B6gfg0zz+MWjfO6pSB2I+5sNv7ogEqj5KmPw5GfjVaIZ7JHA1MjR
	 bwrIzO0O7tSdrecvITuaucLi86NMje3z1hnBZCqD15BQQ3UfeIYGNsLDyLTx38rFyt
	 Ch1o/FMgzMjOxqukhSDRLKOdLkKhPloPzOcErnIEM+GgRLnguaAong0X7te0muOwU2
	 2st/VIz9YozPg==
Message-ID: <53d52fa8-3117-5ecf-cda7-ef2eb948cfb8@collabora.com>
Date: Fri, 31 Mar 2023 11:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 15/19] clk: mediatek: Add MT8188 vppsys0 clock support
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
 <20230331082131.12517-16-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-16-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025400_189909_9E4B6A71 
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

Il 31/03/23 10:21, Garmin.Chang ha scritto:
> Add MT8188 vppsys0 clock controller which provides clock gate
> controller for Video Processor Pipe.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


