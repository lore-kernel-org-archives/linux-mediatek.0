Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB2EC7EE2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 11:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRwbxqwsXecXxaTMANrgWHP9vxE68UJFdeO4g7qdGuE=; b=Wvzzsv7d24SovPCuPd/0O22NPS
	c53Rf1u4wUgsIiUVPL1YI0CHzOBeZiabiHW0b8sYnFf8FRsV2ce4L1jVwjv+P6BufHYYwsRugD7W7
	pvo4j/bMKW59XYPvHojc0jiIPeXttPRcw/VD25IkKzBgHzTemYB08khv0IGV2IBXX/3gBuQhB5i9S
	inYRecMCg+Q6ijOkxoRX50s8KjrWg1jwBEJthY3sikU01Q0FYI+IPGjw+AkNmHzrFUwyZ5NN7gtjQ
	r/w1HkkQNeeujeFF/0ED76X1msShNJyaHH8UIQCRbbqBd78i3udQFhnSzQb3U7rvCIUAjxlSlwkP0
	ZDW9nVwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWR3-001z83-2E;
	Mon, 15 May 2023 11:32:13 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWQz-001z6K-1k;
	Mon, 15 May 2023 11:32:10 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 96BBC66058D2;
	Mon, 15 May 2023 12:32:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684150328;
	bh=cPfScSjEIViUXg9igq9wKJK7dvvZF603dx1SB8jDSVY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aXkPYit1vj7yO13eF9hZOAneb6JnuAfYpcsHCzzqy3Bt18uaKV6Q9jCaL+H2eEVNp
	 eBsbnxZPDaib3xcfGpX+HRULWN2TVWa/cHrihPd5eWoqngRSIG7c+lbuk7FgMcru4R
	 50aXmHXatq9EUzVw8Fd65b6i8fHBVojgK3KzxxrqQzkMXAagQr9jT74BGftLF/E+40
	 chuf45t+3mo7DzJOtVJhfB1SpC7L0pNtMtTlM5jdn/y7Ke/V8HJIyodgOwx21Aw5et
	 Y4u25Sk7AC43Dco5+0UFp4kCq5xqLEpNF6b0gTKqynKBFtD1aT4/QlO5cUnaHL0K9j
	 enBx2sRYR4uvA==
Message-ID: <c795f509-a073-9ec4-006d-e41c749f25d9@collabora.com>
Date: Mon, 15 May 2023 13:32:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH linux-next v4 4/4] clocksource/drivers/timer-mediatek:
 Make timer-mediatek become loadable module
Content-Language: en-US
To: walter.chang@mediatek.com, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>, John Stultz <jstultz@google.com>
Cc: wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
 Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230421034649.15247-1-walter.chang@mediatek.com>
 <20230421034649.15247-5-walter.chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230421034649.15247-5-walter.chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_043209_706576_5AEB7852 
X-CRM114-Status: UNSURE (   8.21  )
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

Il 21/04/23 05:46, walter.chang@mediatek.com ha scritto:
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> 
> Make the timer-mediatek driver which can register
> an always-on timer as tick_broadcast_device on
> MediaTek SoCs become loadable module in GKI.
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> Signed-off-by: Walter Chang <walter.chang@mediatek.com>
> Tested-by: Walter Chang <walter.chang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



