Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B41BC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 09:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aVJW4ARHzhOSVYsbC2Xbvxk+Qjfnb3f8OhDA6vkAbJg=; b=J9pkuX0pUpEW0B
	KNqaAGYKkoY27DFmjTjpUQFNb5hDl+cdf+E2SJno5aKUNvLaaaKxGXB/W0CkvX6qTmzVKbAt0u5B+
	vwGPSF9o7aq2LSeK+wJY1JG+Zru80kgVL+IfjMTuv8wMwLWoY3cAXiDei6XStMNWaqabcQFiia4tJ
	RRXTfLEqdib0OKJgEAMySTJ9J5ST+42Q0OGkCixM24J60yva6gKeSZWPqc8C4o9ajMQXTb39jaJdh
	Fdcbw1FTRf57I7YkJbJP//6yR7TItke2ZL2l68GJVk4mHhObWiQ39rB0ZAqrEjVnsxNE1rmYm1LMR
	bClygtTKoIDfHfVP8yFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYlf-000aNR-R1; Thu, 03 Feb 2022 09:51:07 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYk3-000ZMf-2F; Thu, 03 Feb 2022 09:49:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C6DAB1F45305
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881765;
 bh=ipkRReMbtwAu7xVakE/HQLluSawAEt4oVRymv8x74FU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VTPrpDUv+2KVJfr+imEDhCwuRZwa0Ioi3IhiJgLqRu7h9pUWUnipcCflR3KhpBZ0L
 0kdTyz6PQUVv7q1Y0rM/iotzT2hzZjfo5xPNINEL6yYM19KpJdh5YMR9bdBh3a0LU6
 idyBkgXjrrSitF/1r4NYbgjLhJUdEiM/pbt759jOoPd1vX8AN94+fdAXXdKMLJ4wO9
 JlVpOlufDeTyOMdVbf+bWV4DWnRy6vv2jwwY81ZEOPIlRQaAIdP19TsVVB6C7exeUB
 eGs/C5ft/XDC0ehrV+DAOgBmelvG9dOFpB7C0oViTXbpZChrFwNzwkjX31pmYLem/9
 HfUy1TdddgOlA==
Message-ID: <2ecf754b-d59a-f426-3def-1d4c96b26600@collabora.com>
Date: Thu, 3 Feb 2022 10:47:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 20/31] clk: mediatek: mtk: Clean up included headers
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-21-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-21-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_014927_294389_55005E17 
X-CRM114-Status: UNSURE (   9.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 02/02/22 14:48, Chen-Yu Tsai ha scritto:
> Some included headers aren't actually used anywhere, while other headers
> with the declaration of functions and structures aren't directly
> included.
> 
> Get rid of the unused ones, and add the ones that should be included
> directly.
> 
> On the header side, replace headers that are included purely for data
> structure definitions with forward declarations. This decreases the
> amount of preprocessing and compilation effort required for each
> inclusion.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
