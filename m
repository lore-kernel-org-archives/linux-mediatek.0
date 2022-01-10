Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EC1C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WD1w159Rp3Co/aXkEAhbsNkSQ9pz6JUYfu3OHADz5tE=; b=CvR2b27TbgO3vuN3eBHwV06X/i
	SEObZIt15gLVyqGyQ6D5u4ygBvC3VaOTX46+TWtwK8r/b8WoHRaN5lD9LYrYF9BbjPoBRvGgorhJJ
	X52UxX7qjo6JyMtdDvWozlWXHJ06lZsXOosR9ivFkV//V4ajnYabYkr7QGoFI5LkHVJudaTh/fphk
	SUI718kKTgqN5h2K9YSb4jts0pxqscIZMjNZa7VV/1dQca1uyxDqIgaEogf3XsSacBrXp0afw05uq
	RAXdfe1uXzJOR5CEvDK/p4Co4IwzoMfWKf1IGBo2wZAhRFolgt2ocN+p1n6VpHSXCFVBG0MRjKJCq
	5vXYYT0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6wvX-00C8rJ-4a; Mon, 10 Jan 2022 15:49:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6wvF-00C8kO-9y; Mon, 10 Jan 2022 15:49:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 246B81F431F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641829762;
 bh=UZ86+qtGAZmijY1SJYcDI8C4rEH6l/3FZjTvPIYKrgc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=H3ids2JuC8ijokX+7+E1n7WgzF5xF70ND1OZ+WN39szw6CaHM+dtNIGdPbe3Hag/L
 SPnxY302NidxgfMBv6lzwPPMfhxyyznI+l0S8ffbj7doxPa7Ml6LAcdnZn5a/qYMds
 V4/eyC4MszEMBDM6XaiVf+QVnw/8g2cLEjT622rs0Ja5uciI0TsNCnm9R1RD864lWT
 pjRswKbclokvF0J3LyteoOdK9yEa96V5ZHUUn9aEACzGa6RgircCyTl0n6FgRgEc7M
 RnqcuLwb2qtlyVdKsiQDddxUUmWoSzoc1FM3bBCyaTIQ79wR37RbQGCvvP9FQMuNyB
 PCHFBXdtopmUQ==
Subject: Re: [v1 14/16] clk: mediatek: Add MT8186 camsys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
 <20220110134416.5191-15-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <271644d2-e2e6-977f-c7da-173f072a3ce8@collabora.com>
Date: Mon, 10 Jan 2022 16:49:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110134416.5191-15-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_074925_519211_59F46FA3 
X-CRM114-Status: UNSURE (   8.37  )
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

Il 10/01/22 14:44, Chun-Jie Chen ha scritto:
> Add MT8186 camsys clock controllers which provide clock gate
> control for camera IP blocks.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
