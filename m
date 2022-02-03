Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FA1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 09:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eSrMxNkznxrdKbJCHq8hTLrdg74U/fVQT/UNZn9i6Sk=; b=uY/RsoVYo/iyFK
	zRUXdq1tFUXp6TgW7ZCiiSp2MvAcAQtqbv2IdGckHB44jdSS1BgrUrVFTLTcxZc1ZOADaANngL1YV
	dOZDys5tC3wPpcI0UMSDuba+GEfsg0IXDb5Ih+pP6pL3mhir9hhJ7XnTCaElLDBs0QiBVzqFzGbha
	dhZNa1erwfRhsaFCOg5UtLuB9NUVyQFlLSPiOKAnl6ZwB/XHRq0k0CX3nTpBm93gJEyZmCOqwpy42
	KNWm7Y2T+fetTUJLfwemBvyvJ5SflkDL1Cy09ik3UZZ49A3uWum0hhQtzetgWOwc/D8c+poJIIumm
	ilAmy2SW38uW7aCPngZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYnB-000b91-8W; Thu, 03 Feb 2022 09:52:41 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYk3-000ZMj-5P; Thu, 03 Feb 2022 09:49:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C70081F45306
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881765;
 bh=emPU3XQgWpbANmBHfWeZ41kek+W9O8z3OgW+v2jZ4Ic=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nwiV+5tA1fw4hZW7ev7s6GcS68wu0Xxvz5R8eJbBEKL/0HZKRiOg9I1Ppk4iaVr1A
 bmunhmUJw+0BxDsh3Kr+/yGp082qHRgdr6qEtYZ7goQ3CQu906rOcF5E5k/1I6Yyiq
 vxGX35DSz/bNQiAKAUW2ofAzm3WrMGoZVkvoxYKq1xnjiLEKaqTEskrWwDfuEL6D1y
 TgzROM7OLRRamI7m1LFhFo+nVR8WGaAyUYMjSG5ENkAcgH0fezOTQkRZA5djmWv9ry
 y1Jm98oc1wv2kr/8ALes+Wtvu5alh3yOCyXjhBdiqkz9X0Kqy/chTybW+CTt1i5rkm
 wF25PXvmK/Wzg==
Message-ID: <10c53bcd-e8a6-d358-4cf6-393e6152863e@collabora.com>
Date: Thu, 3 Feb 2022 10:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 22/31] clk: mediatek: gate: Implement error handling in
 register API
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-23-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-23-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_014927_394477_E5827CD3 
X-CRM114-Status: UNSURE (   9.36  )
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
> The gate clk type registration function does not stop or return errors
> if any clk failed to be registered, nor does it implement an error
> handling path. This may result in a partially working device if any
> step failed.
> 
> Make the register function return proper error codes, and bail out if
> errors occur. Proper cleanup, i.e. unregister any clks that were
> successfully registered, is done in the new error path.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
