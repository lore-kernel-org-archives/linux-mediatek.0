Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57304C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 08:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0YKpdqttHXx5+VDV3VSSCsYk0O9Qb4IEbFQMiQ03G8=; b=luHctnAjc+ibq+
	0zM2rlEABjTwyPjRaOkK3bd4HlmW7JfqmI4sFhRbN3tX6p7OA0RRUYUWixajUxUk42PTSH7kvp0Jm
	8zvkZ2wT4H8RuNv7a+Y60TTB26c7lDYwG6X2nW6V7oZzryHa+6ouJk3lBZIbThZbrEob44+bSubwG
	+3urmT6pgBuj7DW7jqHJXETMAGTdR/vkZeT0A545dxo8ZCPG7bTJiir48G2dDDPT+iZa89tbU3fQs
	M8D5I3NpnBKl28ZDGK9hvIpPx/N9UX6odgj3RCN1DaUHxfwOIivCj5zgA4rk3Fh02Fp0LuqQQA8YY
	UYD8OUQNiSIw7FOTNYRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nryDo-00BLOp-Hg; Fri, 20 May 2022 08:42:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nryDd-00BLM6-TI; Fri, 20 May 2022 08:42:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 60EF21F43F56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653036164;
 bh=VV7uxDN1Imb56z7LKukCJYplYNlWvJ/o/kgUG//vB80=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CKGNnBlz4UxZuDv7oD+pHQm7jL3iCcv8u3ytZdgZt3UxC7Kn+CH4sbiXcbZSkW6zk
 pp2ICEZD6VK0NzUkAbammKLfF42VOFCJusfNoIre8ZI3iQVTxKirFr/vrjwl67dqPg
 GHIBJtyzT9A01nFU+FpgxyZ/4E8BrF/LtizIvVHejrd608DjOsCgioQ1l+XEKNOT+j
 8UnYE5WsOQ6PN+uj2YiLL06m/9WTm7u+ow0CJzC+MTx23OJlMxvVOnwo/rIxhCkaHR
 DD/JBHD04El4FpremJNnmTaH1ZYufM51vARbL03EBZhaV+MWvPwjPUgby88kldwWE7
 ycqmpMXjAqvdA==
Message-ID: <5b5f6656-8694-dc78-ef42-7ce301849aa4@collabora.com>
Date: Fri, 20 May 2022 10:42:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/6] clk: mediatek: reset: Return reset data pointer on
 register
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20220519134728.456643-1-y.oudjana@protonmail.com>
 <20220519134728.456643-4-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220519134728.456643-4-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_014246_130441_2D49586C 
X-CRM114-Status: GOOD (  15.26  )
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

Il 19/05/22 15:47, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Return a struct mtk_clk_rst_data * when registering a reset
> controller in preparation for adding an unregister helper
> that will take it as an argument. Make the necessary changes
> in drivers that do not currently discard the return value
> of register functions.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Hello Yassine,

Thanks for your efforts on helping to make the MediaTek clocks better - I agree
(and I'm not the only one..) that there's a lot of work to do on this side.

Though... I don't think that this is the right direction: you're right about
properly unregistering (in patch 4/6) the reset controllers on rmmod/failure
but I'm not sure that this kind of noise brings any benefit.

Explaining:
You definitely saw that there's a new register _with_dev, which uses devm ops
and that's going to automatically cleanup in case of removal/failure.
This is what we should do.

Hence, my proposal is to drop patch 3/6, 4/6, 5/6 and (slowly, steadily) migrate
all of the MediaTek clocks from CLK_OF_DECLARE() to platform drivers (which also
means that we can eventually change them to tristate!), so that we slowly remove
all users of all functions that are not "_with_dev", and that we finally remove
all of these then-unused functions as well.

Making sure that I don't get misunderstood:
      I'm not implying that this huge migration work is on your shoulders!

P.S.: Chen-Yu, Miles: do you also agree? :-)

Cheers,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
