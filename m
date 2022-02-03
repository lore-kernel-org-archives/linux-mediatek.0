Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BBDC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 10:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vu8tkn59//eO7MrNCaZuZU3Zz0hBNVV9/pAbhk4VQ7s=; b=2hRNDNiMkfQ7bL
	HYhC2/obxuXE5xqt/BazPH7n8HLictZCNG9LG2vECwx75InjhRBDEu5B8ltbp0mmX1sS6Qj8+gULP
	jbmaioXnnOQvcDlYIlUG3freqoOO60AQcEbkqeLZ8l1x+rldLZiKX3gSpFIph8nNHewAmLvtJ6dSs
	NrMIX9UpW/gyG0MbzljY33BauJ8JRVPqFqyVHwxGquQUexb0eUVvqoUbhHHmTRqR79UcamLA6eNvM
	j7sSsYsPxGCUBCdGi8PQaqnnOxTdFRcZ9dVqNakUiSJyK6d2om1ZfStczBxdtQL0ujmNlpe2AslvA
	cppeHMUsase3vnC1ysUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYui-000ek6-Cx; Thu, 03 Feb 2022 10:00:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYlK-000aBd-84; Thu, 03 Feb 2022 09:50:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 91C401F45310
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881845;
 bh=0YKA29I9dGqT+kRMVnEfwXAWDziKXePsM7uLyg8Eon8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ljfT+rGj4GAiBsF3Wbt0FcbftjA6VPN2TMas89EuJnfyt5wYsNp3AwT7iz+4RioAC
 8mTmAcv9hLOhr/LFsDH6v7iaeyfG4IXqzCCnE0m1UaHentF2inNX4WSYzzhKOc06ZO
 QmC5saGyFgNEQuNmoodrPYn76XKh0mbfzSPKbmXyCMchMeZbWm24te5Qizu7ejyDzl
 Bk2BAYdxGfRo6owJAUYm3zMxTZObWKYWL+o5NNIILyRSP60AARUaiWhcmrG1FYh2Yo
 KfNSVtPxuit25LS0jTU5lrz9grnwxHIMlzS8UzvjYMjV/hN0tglUIxQJSyr6bNXGaf
 Mrd//1Ps3fcjA==
Message-ID: <b8f6ca21-f516-5e13-2758-03bf9ddebe49@collabora.com>
Date: Thu, 3 Feb 2022 10:50:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 10/31] clk: mediatek: mux: Internalize struct
 mtk_clk_mux
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-11-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-11-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_015046_546809_EA7B095D 
X-CRM114-Status: UNSURE (   8.91  )
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
> struct mtk_clk_mux is an implementation detail of the mux clk type,
> and is not used outside of the implementation.
> 
> Internalize the definition to minimize leakage of details and shrink
> the header file.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
