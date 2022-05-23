Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C49C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 16:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9k6PsVYXq1EktMJ+zm8Z0aIyYJEbtL+ET28PKkSNYb4=; b=NHuu4NuHBcwDvO
	D+odHhBvshhf5npRQImtzJgQ0lq4zrawi42VNtA+HlE16fIxEkNUq2XXmJIwJVps5Ez4dOTnC96qa
	o23rsWaaMiK2HkvyL0PkuI1NPq+VWcCeMnuIImVU8qaPtYSn3vDb2eQtqp5wWX4dgYo0haf2zvjyZ
	ltjv9/Qp1P/Uw+FQgEvJZ8PNPEjSKs+hHSYMAl5fmrMCje0Vj3L+yzfN+5dTagScVvI5PoM3pf1Eu
	Yn+S0BTd0yUkB6g4/SDM0MCtkQo4voGLDKJoxAkYjGKg049kgMBnS26ElC2FaO/6oP0U8rLOxGNMW
	TCjIODcTvCLRYR13+kZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntAZ5-0057Sk-6x; Mon, 23 May 2022 16:05:51 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntAYt-0057Q3-9A; Mon, 23 May 2022 16:05:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F26181F421DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653321937;
 bh=pq7khLHWi/yVaniPHLobCPtQ0hFap6Dt/6ZtOvKKXjQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IagPd4MIZk3813/QMTC2CR9tyjBOBR7zUEEg2EmdwoFASN3/2QbQGk7QfbMqJcB/w
 Awucbs11+Vn/YOVnt9lVyV5aHf/EUvsE79CgmwUF4y3VqWbm9xIfJKImlCMmRAmLU7
 o271Lfn+CTFyqOdE4X7nI9AKxk0VE8yIbObs0f+DZTtwRZE7ALEx+dqVmb/se4Yvil
 mu+2pAInNmUFU1wPODKj+sdpwQI6+Nt+W7oTwBjKy/UtM5lG+PzGOSMFRp1d7HK3QJ
 Euh+ATlGBYoA7efQYJGpsj3iFHKUbK8ZrUTLmr+Bu/t0l9H9Ov4F/Tq2zK5hhrq08q
 vSdTC+8ovfpLg==
Message-ID: <9bb62269-986b-180e-ce5f-ac8cf7d667ff@collabora.com>
Date: Mon, 23 May 2022 18:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/8] clk: mediatek export mtk_clk_simple_probe and
 mtk_clk_simple_remove
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220523160053.1922-1-miles.chen@mediatek.com>
 <20220523160053.1922-2-miles.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523160053.1922-2-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_090539_500844_B9D56AAA 
X-CRM114-Status: UNSURE (   7.91  )
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

Il 23/05/22 18:00, Miles Chen ha scritto:
> Export mtk_clk_simple_probe and mtk_clk_simple_remove because we need
> them for MediaTek tristate clk drivers.
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

Hello Miles,

the changes in this patch are exactly the same as what I've pushed in my
MT6795 clocks series, so you should simply advertise a dependency on my
patch [6/7] for this series.

https://patchwork.kernel.org/project/linux-mediatek/patch/20220518111652.223727-7-angelogioacchino.delregno@collabora.com/

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
