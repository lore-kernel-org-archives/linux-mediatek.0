Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32001C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 09:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPa76Cf/NIQW5r1hbdvXf/hfvH9+Sq4y3YrAHJB7+L0=; b=YX0BwvFSOrLEpV
	PAQT97y6IIFQ60EQ/AQ7Vq72OrFS29PnAEXvWtDIYlB9bgjdDpr0OoWpSzF7TO5PORrKB8MpJW/3b
	arRfgI2C3ZlYDerSZrq4rpAq8TeOspw83CiMKze/N6lk33rSuFs3Nk0WT/DTn3M3o2YTIrA5YI3Wm
	zLPQnWMlxRzFNDNVP6K2ZYs+TrljraSNAed2WqfuhJKNgpY9FfefdjTbpR3wyKl3HhjHhCWGuBveQ
	2qx6hiWFj+faDpraanTqKWERzV/YRy6AxfC+M52cHFWE0alYaWPktyB6B9kFsPRAZRnzrF3qQNfE0
	m9DR3zB8DeWu/vKCvLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYkK-000ZZL-B5; Thu, 03 Feb 2022 09:49:44 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYiL-000YIZ-JW; Thu, 03 Feb 2022 09:47:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 889F61F45306
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881660;
 bh=CtAf9R3ZOxXpWPZVvlH0tdvzu9XAVmDW7deoe+JbFZA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WGq0vuGeF+K8D6du8XrezwA1WX0pM7sxQb7zGwx0de4tXaBxZKx1j6Bn/rnnwMz+k
 HM0RZQ5me6cou30bw9fuoY/zEp7ME0LaCcR5vzT4XuxD5Kdv73eO2ZCCIasQUK81IJ
 mM4s485v0iSwbLEvK7E6LcJpPLau+Q563AD4u4+1K/x+QIla8Xo7n6QJzIc8rSsJ7n
 gZiZaNEQDgkmd2qBrC3n8yqa4L3+fbJrPQN9+Y1mnr6+BxTSL4dFAiOVKVwZk7A2Co
 TvYW5IWs5fRhS3kKBeEKfmf2b7iA+WSV9M5SF8YVVLmYHtauCjDtyzQfCMqYoGIyiS
 a+Wwig6zsc4iA==
Message-ID: <6d1c3b80-fd00-877e-ecc8-7ac449798145@collabora.com>
Date: Thu, 3 Feb 2022 10:47:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 24/31] clk: mediatek: mux: Implement error handling in
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
 <20220202134834.690675-25-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-25-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_014741_831359_9CC653E4 
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
> The mux clk type registration function does not stop or return errors
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
