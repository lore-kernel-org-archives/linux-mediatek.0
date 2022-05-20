Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5580FC43217
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 08:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZYfNWB+zKvDpJ9jysd0E0h6dUlqzrO9eCjAhSj5mphE=; b=RfshGGt4shLRHu
	Y8eevbMHjV85YStv7p2Is37TldQAaJs/dvxSMugKWmwPFvmoq7jxiwh9b40CTnuho92tznDg4Nuhr
	WFzCbdBTrd9X9BpIdhPPJ/KDtwmISLNJQwQN7UEvPJwcYFvIXW2GW6O2/72feSAI4I6oUdiCdmPNC
	UOwFUf8PC2AUUI3NA3B+JpLcH+js80k6B+WZCScd5R6IAYsCQv3aeWYbHPBic9DXzKBp61UuwnwKD
	xdZ/jZ9HMZHtZbo76HjTuhiDg+FvdJIpyRxa8E/mO6HqR9wSJ2osY4a0K3m11JMwt6hgkj4WJYIWS
	HR9IJ5wt1FsTCJ+L9KVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nry3h-00BHsi-Vi; Fri, 20 May 2022 08:32:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nry38-00BHXP-O5; Fri, 20 May 2022 08:31:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CD68B1F46109
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653035513;
 bh=51+7BPKulYL2gm7Dg44YrhEuMxIFwunP0Dh2hJ2F+Vg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=edaY0hsXE2q9RWflpd3Vr9auiF97lpONXWPn0LyP1UVSaUltdRNqSJryM2AEPR8RN
 CRWvgTch9DXZf8npx6lnyv8lWiItP1g4+7GBzDjBq0m5FrbUEOWuhiUEsxlogxkJjA
 1svlc2yVvkce5WyNWlFEF7yo96D4FN3wQZrqMchPx/BUzTng6AUrJ68Hgz9HKPrkvV
 kDVyJt5KJDF0CzyAU+aV9HCw3rIaSKnhpBaPbMLOoB8bL2VSUFpNHUdEqt6yt603Qz
 d3UtEiw9LdZLgNuHMZRrp/IS30bfdNrSfSQMutoV8sBEFpgkWK4/ZBBEarBAXTheE+
 KDb6eAJ1QdGlQ==
Message-ID: <2bf50acb-3183-b860-ae31-bd1c6e2dc7c8@collabora.com>
Date: Fri, 20 May 2022 10:31:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/6] clk: mediatek: Use mtk_clk_register_gates_with_dev in
 simple probe
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
 <20220519134728.456643-3-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220519134728.456643-3-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_013154_956327_1190F3FD 
X-CRM114-Status: UNSURE (   6.45  )
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

Il 19/05/22 15:47, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Register gates with dev in mtk_clk_simple_probe.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
