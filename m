Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C3FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 09:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MgCXYUZlUZFRNBctpU/oWDJdmVqtJOUFb3AY+ArUa40=; b=x/X9G/46m93pTN
	zXOMjobpEfxHyLQAOf85XrDJJGtDEt6serCrNQXmNBRGxXf1qrnYWVtrR5P3KQPP0kGjplXrh3u5c
	OZ+1OGQuTraeJa66fUo7YXI+p2X/9VyGJCZhL4vKkeSOCZvkQczUNb14Jk87HXG6NzxSTMNk8v4xg
	OuKvw23zV+mN+VX9SNb9S57FeXKJhshai68lBaLczywhp0f881IKDGC3+CYSBT/2apowVnq3wq5xj
	d2BXptDE3AKK9ZAwr6gTsLwVI5CPblyCBFRNM2p3OmgneZsHTblOv6yNvCXchWVUcykZBmvpp/fyb
	EqV9co5KntToLne29vog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSpg-00CcEP-5z; Thu, 21 Apr 2022 09:10:36 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSn9-00Cao1-C5; Thu, 21 Apr 2022 09:08:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 649651F45275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650532078;
 bh=q7E0XYrULEygpCoWTbaEgauMlG2r6aEoMPACx1vJZxI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oIE5TBnrzrghqjpm4TSR7PTB7dNpeBWr/7Q3Ecj72RH+o3zHcPL58jnTXHnQ1RIXA
 s03A8H/qYgLvjQ4nxquXduNnxKevOwn2KSOJlO9WuEkLSNvYlGN7kdHVq5c8AI3Xv7
 7wmHlJkTV1uKNWG1+Fs/0dia/jYVf6f9PfBgkxi/mfc8EhCy20eZ2OA497lmh6fkfZ
 XIGfVQV3c6lW43W2jwBjw/lkffjipZ5tB4EwMVa34mV64fBoXUmz6ZA3fHvGNPoI0s
 pfKHq77r3dPGun57eNVlM7jiBrR4ElloWCAUxJrACpMBxQ1YwVGucF9btcoLJS57L5
 xtQ/jmhwHEcGA==
Message-ID: <90ad46a5-8b67-e9ca-25df-2a7cc6110bff@collabora.com>
Date: Thu, 21 Apr 2022 11:07:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 05/12] clk: mediatek: reset: Add reset.h
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, allen-kh.cheng@mediatek.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-6-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220420130527.23200-6-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_020759_574860_18E57BE4 
X-CRM114-Status: UNSURE (   9.53  )
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

Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> Add a new file "reset.h" to place some definitions for clock reset.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Right now, you're adding the enum mtk_reset_version and *then* you're
moving it to the new reset.h header, but does that really make sense?

I think that this series would be cleaner if you add this header from
the start, so that you place the aforementioned enumeration directly
in here...

...so we would have a commit that moves the mtk_clk_register_rst_ctrl()
function from clk-mtk.h to a newly created reset.h, mentioning in the
commit description that it's all about preparing for a coming cleanup,
then the addition of enum mtk_reset_version would be in
`clk: mediatek: reset: Merge and revise reset register function` directly
into reset.h.

Does that sound right to you?

Cheers,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
