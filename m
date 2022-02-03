Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39418C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 09:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v0PulJ4hadecJw1CNbRSURTs8gZhsIWB/85Jvi6sXk4=; b=XRURGSGH+AAglB
	1FiKcDLpzhDTR8W+VIo5DSMFtKloDIphp32HV7BcFBqDsV/d4v5P/QHDBB9+fJbVqID/6YsDEJkrK
	GJJclATbiaJ/i9Ai9zPN7vdww05AqgXJCwP6sennA+GIoHYv14JYzKwHKJKtdYK7gwlNy90qeG6kC
	LHU8L7KdgrjIY9fhWz4XCUHGC7DymF+akcVVmV+jd00JhuNL4Cua0dUBlfZXCTM7rgcOj3I+6sPP5
	6XfSUe2dO+o6YnlzXSyZ0VzcBmul7l5uHEUVM4X/AH4pmFDclCwDoGfcI+JcfbVVIoC3/Z04N+zMZ
	8WCvr6Aqyj8LjNQS7bLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYpk-000cSB-2V; Thu, 03 Feb 2022 09:55:20 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYkn-000Zrq-AX; Thu, 03 Feb 2022 09:50:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BAAAE1F4530E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881808;
 bh=u0ccJYHRiiNGbW0hqtPBw67zxGgUU7hHj9QdESZAnfY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SMpC0uaEhR6koKK8uY+kUeigZJS4oYt8bc538kZMyH/WrnVf0GMDf9lamhp2Mry/j
 vjtHhWepKhbu02Sncrww8JOdyWru3u2BZ93OL6aaI2jZcZ1UA6tz0xdHGciSigvOox
 JSqO5IhDuZepGwJqRHWK+U6NHpJsba2c5XrvXC6XScpljWT6MqmMA4+j7WAFFodTqV
 ihNr68Ts55q3s1XoIazUwQBQpzHGkWthjOzuQ5wA13vG2Kt+/P0Uk/E1nAjLPg/LgW
 zM2ta4IUK9x44J44WYEuFAX/+6fVPDbdbZuaOPpC/WC0FNahpc4kJroU+Q/Eqk+HZq
 Dg7MBexEivt/Q==
Message-ID: <f0a9db7a-9482-eef0-c533-f2abecd15ccf@collabora.com>
Date: Thu, 3 Feb 2022 10:47:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 16/31] clk: mediatek: Implement
 mtk_clk_unregister_factors() API
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-17-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-17-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_015013_580186_C79A251D 
X-CRM114-Status: UNSURE (   9.94  )
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
> mtk_clk_register_factors(), as the name suggests, is used to register
> a given list of fixed factor clks. However it is lacking a counterpart
> unregister API.
> 
> Implement said unregister API so that the various clock platform drivers
> can utilize it to do proper unregistration, cleanup and removal.
> 
> In the header file, the register function's declaration is also
> reformatted to fit code style guidelines.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
