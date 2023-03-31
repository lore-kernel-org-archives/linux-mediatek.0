Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5FCC6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jb/SGo17FRs/rkYr0OC2gibUq5fPZVF+RCswdjZfHqo=; b=OgRN32iR0s7y0Vhn+wQVFYlT7/
	32Vv20trGXa/t6uUd+V4swfUrD/q7akFG87thn92FoFS/bqS6Snss4zRTroskbJ3ku4hm/5XQXwSh
	iZBLfkuqaEVp0UPm3tiLFBINtU0oi5mMaNYxiH2MHeGoOC9oAY2N74k1Y4LZe7h0kPFkckeG9gT8u
	XMNvb70bZSB6pGJ48HIyAP1eI60SB9qnl8wF8V8vLSs3OJuR8e3G+IJ+5UQ4PWRUGCneHpyMuCbPI
	hHo/q3d9nwKMpwcmI4NsYl3ry5eIaJd8+rymbi53u41K3G6OGV/JQ10cVVIv++fG5p+vY3hKdgInj
	efqltJLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBUt-006p0U-2h;
	Fri, 31 Mar 2023 09:56:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBSk-006nZP-30;
	Fri, 31 Mar 2023 09:54:28 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 123F16603194;
	Fri, 31 Mar 2023 10:54:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680256465;
	bh=QjvTKxsd9BZPXZP+P7tT5c+ITvaOHGme9V9XWPP04Vg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lgz2Jjise18gqEuKAgIJHy83p8BLiiGUlrIPeremq5vY/U8BNU2huuT9sB8nPr+ME
	 gDaGJYTs27wDwO2tA9sGImaOQBQ0h4SHjJE1mcmJsPD3uB6dXsQoNr96hD7xDUWikn
	 Nic11ZehDWhA1CpaRt/jC7hetPfaImcJlS5PYpY1UEzAK38l2IJmj9t+KS0nRhYte+
	 5drNkxWQg3qK6mFse2uZdI0W6itBa3w1uM9ONEF0o4EwXi75mfIzisioYFhhN5O6Sf
	 qoHAswRNomeLq7/jng/k1xm4F88WytWT+3b0c0kJT8jxK0WBtCuf1bgk6rLx4cuiR/
	 xoYi+QmpNDGKQ==
Message-ID: <48265ae6-556d-bff6-94b4-e039330ec2b8@collabora.com>
Date: Fri, 31 Mar 2023 11:54:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 12/19] clk: mediatek: Add MT8188 vdosys0 clock support
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
 <20230331082131.12517-13-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-13-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025427_107744_C9B16A18 
X-CRM114-Status: UNSURE (   8.46  )
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
> Add MT8188 vdosys0 clock controller which provides clock gate
> control in video system. This is integrated with mtk-mmsys
> driver which will populate device by platform_device_register_data
> to start vdosys clock driver.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



