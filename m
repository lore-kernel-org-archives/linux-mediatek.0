Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8195DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 13:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcLCuTUIG6JVw4XYShtZ1HG1906pQtuj3uojOSSg21g=; b=kEqkCCTdu/ZWYf
	1y9mEu5RM95WCvv4g6+gsLJwyrDGA92IkaK/E4EJF6RURr39HKDHyjdAgWFnGVmcjAAjDb4pm4uzY
	dtyL4+BKl44xeyR2ZrVu2UyfsF1zSPF1BCqHEsFmz4GlGqjD18GksENfUOMGDAEqbouE2e9biqPfX
	aXWOAW+hFmhmTkmLM5LV24TY5TcaSEF7HQcF1wf6TyNFpjyv5vtn5PPzApFzgLWupMFzQ6Eih2u8j
	ANtRJyz2szvQuRvEVLP60txDnkAmkUngEi4kCHJkr2JWRmV6y8WlF8t/dftJJHbQHfF3G8i5TawIJ
	vWcOC3tU7iI6bf+OasAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHQXn-00E6bB-JF; Tue, 08 Feb 2022 13:28:31 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHQSf-00E4oM-8Y; Tue, 08 Feb 2022 13:23:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4DFC81F44D85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644326592;
 bh=o7erjfdlSIRztr8BR7vLoN0cESgk0yvfG32LdmIoclY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MpQZw6E3e1cJJYtYYjILxSITbmds6umcehEJcVUFODDcrZbvN0T6wG8oEzbHHsBab
 ZKxV9JRPkSUzA2arqrCdZjyZ0uDhGcAMuT0VhfIn9dZc1QwGX5pAi+va/Sctp/4u6k
 CHDkUfUlwKJ/BnPIZa583SFtyrGkUUKZpYsqkMCZZVqL6/w4TSifDE7FTooGrhdLGV
 Uo+lgVfET7BvfX6j5BMsjKFUq68rZXH/5KU8OV2FFQbgIa2zD5MNXW1p9PUgY0j6I0
 GZ4TRnDfRlG4v2YghoEfSyx0edNq2CTKSQkRnatvpWLWJBUySOQKodBl0hZle67fV4
 aEpDEl5wxsD1Q==
Message-ID: <68fda288-cc2f-aa35-8b21-e7f91d9f3b49@collabora.com>
Date: Tue, 8 Feb 2022 14:23:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 29/31] clk: mediatek: mt8195: Implement error handling
 in probe functions
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-30-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220208124034.414635-30-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_052313_496359_4BA3DC49 
X-CRM114-Status: UNSURE (   9.48  )
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

Il 08/02/22 13:40, Chen-Yu Tsai ha scritto:
> Until now the mediatek clk driver library did not have any way to
> unregister clks, and so all drivers did not do proper cleanup in
> their error paths.
> 
> Now that the library does have APIs to unregister clks, use them
> in the error path of the probe functions for the mt8195 clk drivers
> to do proper cleanup.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
