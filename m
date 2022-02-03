Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4A8C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 10:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uoJQPJw/cYhCqYxssQUpXaO79vBgXDX124fymzzT6Cw=; b=uNxPnM9a7d0UI0
	MxrKkI6x9mKB/1bzq0p9NxUw256eA0XZO263Q3A9dhHeZ8/PbYSPI6Y1aJ5jy+vTDiMZQFlklOJZB
	4PJt/mObUizmhpqmhuGUslZVJ/pLDhyG6CHWjWb9l9Q5qzeP8i8e7uugOHAC7GdlS2vZvKFyX74RP
	85lNCPmpfxHZ+/bZjXPOGl1oxtz1UARGBvOCx2yIwU3MOsxnZdosAPf8p5U6RE50ONi3SMSi+JNZc
	BBQMIZgWQ/VBYi41UF3Mn/+ax352iPckh8ZtSk4gaZyW1K4nF2tR4dv/Jfq8cKpIkJyTHy3x9zw1J
	KA4zdmOPc/cDsOjVaMdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYuk-000eko-6G; Thu, 03 Feb 2022 10:00:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYlP-000aEC-6p; Thu, 03 Feb 2022 09:50:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3549C1F45311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881849;
 bh=y/MhQQILS/yrG3t5+P96243Yz1T4mHZbgHuKFMh1hL8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=b91ROQvE8KQUleX8xKpjxxJMWOBsMVW2I6yH0PFRv9VMoXr+QICO+ou8j7fb1yNlO
 BNJL0/8sd0SCbxaOndiuR86r+3jL8i57PuCfMHgpNtPapdJQqGnXbY5/cJ0Jqlz5a9
 vFPmWUIzPl/MNoOQNUFnVw4zqLtIefkmXAAbAlftdueEgEn8kdtvtHi2io6m6ZqZC2
 x6+ZBP+/KMC6ZwpR6g/rxVhsbypwJfQtOGWNOhakSGh5xY2pkr8XyiLDFlKJs9LbWR
 JYR1/g5XPWI+Pj3ereMJMd4iW2V9pw7vObCeIAFsmpp3lkWJK3vBn5ZfBO8yQwXl5M
 cw4rwFKby+E8g==
Message-ID: <c8d1a8b0-8c84-1d27-3f53-2bb16728021a@collabora.com>
Date: Thu, 3 Feb 2022 10:50:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 09/31] clk: mediatek: mux: Implement unregister API
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-10-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-10-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_015051_505002_D2EDA76D 
X-CRM114-Status: UNSURE (   8.88  )
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
> The mux clk type within the MediaTek clk driver library only has a
> register function, and no corresponding unregister function. This
> means there is no way for its users to properly implement cleanup
> and removal.
> 
> Add a matching unregister function for the mux type clk.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
