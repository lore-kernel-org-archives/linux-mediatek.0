Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A03AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pnlqg6fYzAVAjeD6eq09Lyp4Rbu8+TI5jxRFwKa20C0=; b=YL5EbZrcfpjdq8
	EnldhGA1VIb7hnjnnkAL9ZhNodjQFnhEWv6lfC7fKLBnUfWqtrKH5lb8+3ck/6ZgknQHVpIejhTgI
	qGw3+fIZdsd3/yZRdGToyf3q8l+exQ5AnHcQKN3Jt2sqiRutka+lHvC9GtMkN91Xv7HFKwrdzvwrw
	U6F1ue2lGJON9G1vktiK+qpCP27DPLC6E1ar2fr9SiGb6DHBPzJmA6oSHMjGjBkgN8KC/eHLOtWKr
	HkS1lu6myOVxwMOpq5IndSCx/OiRNQAhsM9I3DupCPASYtkgi63rmuXT4J36DpVt3tqMQFNuqAvvX
	gueK6xBOp6M6jv7ftPLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnVH-00C8xC-2e; Thu, 17 Feb 2022 20:35:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnMx-00C4pR-Tr; Thu, 17 Feb 2022 20:27:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 448DC61E07;
 Thu, 17 Feb 2022 20:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E2FC340E8;
 Thu, 17 Feb 2022 20:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129635;
 bh=sNfEL4qPz/YKpoz2FZqa2kn8NIWSr9QYg5aiwDlvBKc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=TwBl7NEis6eav2W8qiuHVYtTBZGKSzVd9LjWIqh4nNPH8SKvLk3ol/kHX6/ITqm43
 /itljxvAwhPpntr545JR4uFu5aMSxHvdF/OfbDWkn1M+Qz8ByFeH8kMelHLnPLF0gb
 FldZ3rw1PmDBwvDDQMlR9hq6WOAY1rQsOKuVVjn7CoEV6GhuCizIiRs5fQFB2YOnVD
 5Onr9jS0f2fbZeGrIsFNKxhE5VUZyiMrOtYynN3h/n353eYXWLZN7P5O/W2V5qI22b
 uiiV53A5ApCJeDYt00bD9vZY7kdTeVAWn0YwA+PSa12LBgrVkrTK1V+9wM0gqpruFy
 u2YiC1od3CIUQ==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-23-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-23-wenst@chromium.org>
Subject: Re: [PATCH v3 22/31] clk: mediatek: gate: Implement error handling in
 register API
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>
Date: Thu, 17 Feb 2022 12:27:13 -0800
User-Agent: alot/0.10
Message-Id: <20220217202715.04E2FC340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122716_073017_9C4EE17E 
X-CRM114-Status: GOOD (  10.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Chen-Yu Tsai (2022-02-08 04:40:25)
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
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
