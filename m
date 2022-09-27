Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65C8C07E9D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 10:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iLls5c7yUBQOHmJ65vNEvWsheKawrxnPexHnBBGAt8=; b=TGIihDwLrmJhPNkdzwQLdjnOkK
	DorQmaDWmAxku8mUwIQRgqvXHcVc98H5vysaPPGoKkG8Sx9juY8tH60neyLvv/fdmwoC8xTdUiT1C
	sPDAaNLnD6lq6JAhWsXhM6jg49iAP87fOCFnEFKGqnEUICP9z1cn2M11JHuBAaHl3o5N2LV6nVhFC
	zcIgNKFiqvz0JnPFeYCxQVJpV5dRR/KGTYLJgwAuBlikp5JMejTf6kxkORo9yxGQL1Jsondc+jVpN
	Y0ReZ3dgi80vUwn2psUiVOju5a548BeEiDvmGcdxiHFT0WHZV3i43HJLYphUGB81hETMhx842peEC
	YwViWYoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od81b-009ujK-BO; Tue, 27 Sep 2022 10:41:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od80U-009txs-CK; Tue, 27 Sep 2022 10:40:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 74A576602265;
	Tue, 27 Sep 2022 11:40:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664275205;
	bh=ZVTrgfVA6sTZU9HqQ1ocNSZIePUdEQRqC2ZzuBqpb8Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nLjPXmnIv71cfIlYfmfSSqFkItZT03l4nW9NWFiRq66WZqzwzH//oFLt14mBVa3KJ
	 oqyyYYhRn32kd+Rhypu/4iRQHXV+UWdVwMSRcEKZZkI2YGroulJlnWlln4xBUhzLnP
	 SemlxvUSvj4jXZy9fa26lSr5S/TNtwSc6FoK6wC+S7aSgAT0t+e8lK68YMaogYDaYF
	 fyTDZgrPCR3nYNCwl3z7gWEG2ZRtYjcEAHX4rZP3Ed8h1gYbzKFgqzkSQcFzb7M21E
	 GrgqCsmOWWDWqAC4sIKd+zcoOkQXbQcXHIvY3CopCSlkGWAMW8Ciq2QgIgqfHQZk4a
	 yRFSIbPfy9KIA==
Message-ID: <7806b7f1-a216-9a83-f598-b6a92e9f7a9b@collabora.com>
Date: Tue, 27 Sep 2022 12:40:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/6] clk: mediatek: Migrate remaining clk_unregister_*()
 to clk_hw_unregister_*()
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220926102523.2367530-1-wenst@chromium.org>
 <20220926102523.2367530-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220926102523.2367530-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_034006_589254_6BF24888 
X-CRM114-Status: UNSURE (   8.31  )
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

Il 26/09/22 12:25, Chen-Yu Tsai ha scritto:
> During the previous |struct clk| to |struct clk_hw| clk provider API
> migration in commit 6f691a586296 ("clk: mediatek: Switch to clk_hw
> provider APIs"), a few clk_unregister_*() calls were missed.
> 
> Migrate the remaining ones to the |struct clk_hw| provider API, i.e.
> change clk_unregister_*() to clk_hw_unregister_*().
> 
> Fixes: 6f691a586296 ("clk: mediatek: Switch to clk_hw provider APIs")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



