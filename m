Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D442C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 09:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZiKUkfCp3oWm01mipv4cEXJKarpovwLnH/tEnlwETg=; b=4FQymOagIQGNJCR5pt1Tk6Yi5x
	cT0Cmynl/CoXVNPV4wtblBK/nllwcc3YXF3lRcFM63W+lcsUbfJUn2wyXquuD+2vaJoW4+7PegCYO
	JqadnGCNBPklQowRG6yX7WepEOHTvog49WPYrrGfgSOf30wH7wfhbvEYn+B3jKpDgdbdf4OmpBCPc
	FiWIfI+qxSP3oe3iIsu8M5ov7YrC5LRFqzJFplSWvFGpPokDLlgT/Fd20g7lo7POi6X4cuO1EFUkG
	uBumzmwLkTOS5AGe14y7XQrXQYB7LOcbh2kAzIBKbIspbriaJENQkH3QfdU6txHVlgni25IjU9uf+
	c9LshGVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peBcX-008RsS-0t;
	Mon, 20 Mar 2023 09:16:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peBcS-008Rr7-0E;
	Mon, 20 Mar 2023 09:15:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 609CE6600362;
	Mon, 20 Mar 2023 09:15:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679303751;
	bh=FVE/VnhCqhKLk/cTAsJE4ygkLkqvPEjjRuwr8ROyMvM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EY7vmn2bfUZM8B6KuVifIfAdWx0h6YzszVdX1HeOUlpZnXV7FdGTyvGUQUaE4jG8d
	 uVMFtNtmlPIPZsCEA7jMqrWLLhQMaXFc+oqMH2WsBtq6sJqne0hpapXMzp0rUAtIsg
	 igbCOFalXRAYvj74u78n0K6qB3knPpJzE6IHhPj5qhIafol1B3Oo4l1V6E0Li7n+NR
	 hWglPl1HXz987icEApndGia57kjVCZknz5OIZwp0vRj4k2cFf/IL9f1VZxQwjIMOMq
	 0REeIUWKj4Q/tqr/cPfjiBuBKZXH6ogrhRuHJgL2wUujUe9iZDkXG/7coTKaSGnf4j
	 hRsqkL7JrLlfg==
Message-ID: <4af1f582-33c1-9491-0ccc-38cc412b9639@collabora.com>
Date: Mon, 20 Mar 2023 10:15:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] clk: mediatek: mt81xx: Ensure fhctl code is available
To: Arnd Bergmann <arnd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230320091353.1918439-1-arnd@kernel.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230320091353.1918439-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_021556_337588_F554E979 
X-CRM114-Status: UNSURE (   9.98  )
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

Il 20/03/23 10:13, Arnd Bergmann ha scritto:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Just like in commit eddc63094855 ("clk: mediatek: Ensure fhctl code is
> available for COMMON_CLK_MT6795"), these three need the shared driver
> code, otherwise they run into link errors such as:
> 
> aarch64-linux/bin/aarch64-linux-ld: drivers/clk/mediatek/clk-mt8192-apmixedsys.o: in function `clk_mt8192_apmixed_probe':
> clk-mt8192-apmixedsys.c:(.text+0x134): undefined reference to `fhctl_parse_dt'
> 
> Fixes: 45a5cbe05d1f ("clk: mediatek: mt8173: Add support for frequency hopping through FHCTL")
> Fixes: 4d586e10c428 ("clk: mediatek: mt8192: Add support for frequency hopping through FHCTL")
> Fixes: da4a82dc67b0 ("clk: mediatek: mt8195: Add support for frequency hopping through FHCTL")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

....and sorry for this big miss.

Regards,
Angelo

