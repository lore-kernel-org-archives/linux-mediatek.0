Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E36C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zBsIrk6fHfe/j7hqparI4h+eSviTsU44b2C9hU4I5nY=; b=Q+ecsUIOINZdw6
	cO4y9lrEXeD89lFyosQPv1zCTbhCXtjRBD0bHeG741YOtIHLxGKJzHHYEOwA3k9YQm/i2nVANZyjH
	oJ+O2pleC5zdXPWW1a8MP5kO0fvZvgMSwYijbrJSzPeYgoBloaYBYYIWcMhDxjqcyTim7SaEAJsWI
	SMKZqC6p+9rZZ/71zdqGDoA4BHRc3rxLeRbeIkOnRlyTnwe+CXJFyZUDiLVIWXcsxi2K0f4EPvHOf
	FPNM0PHfoqVow+pnfKeaA+prwMNwzfhbJBPQaIXDjai63YfUn7YTrJbDdaqWQivephTErTKbqCtc8
	HlDvULi58VI2+TwgCyiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnII-00C2Sk-16; Thu, 17 Feb 2022 20:22:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnHN-00C1th-Jj; Thu, 17 Feb 2022 20:21:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2E5BDB8249A;
 Thu, 17 Feb 2022 20:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BCCC340E8;
 Thu, 17 Feb 2022 20:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129287;
 bh=N36bo1yfSyP6hcLk793Vh+liTZVBL1O2wlzJDq+XKJw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=BHkN59vZ6Llj6Ggy8qAFd8FlT2Zx62gNGHlVbU0ghRfEnLo5jCLUovmnkAId91HyQ
 lKHqbM3UIPAq+K6qnRrV8Xk1vvws/RQSDvB8GL127rY/k6CcYJqMN1Qe+3RQCVUFs8
 arLoK+1UOpqWiqJGYIXn+VAb8EqinnlIqyFVlXsMew2/itbmSRWwu9IaHb6zJKCv3x
 TIl3pKToPaKsOmyQVYMyLbgtiHJvcSyQSXtdnxYJY0hMqOBjo1cOrduQpZY+SAmz6e
 9MUYn3J7RlTjxsxAmKHqsQRWCfinqa0AR6zWXclMFPBI7ThK5g6E1XFGdMPIWBqEGf
 Vo/YcHReT8zfA==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-7-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-7-wenst@chromium.org>
Subject: Re: [PATCH v3 06/31] clk: mediatek: cpumux: Implement unregister API
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
Date: Thu, 17 Feb 2022 12:21:25 -0800
User-Agent: alot/0.10
Message-Id: <20220217202126.D8BCCC340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122129_851132_BA1451B8 
X-CRM114-Status: UNSURE (   9.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Chen-Yu Tsai (2022-02-08 04:40:09)
> The cpumux clk type within the MediaTek clk driver library only has
> a register function, and no corresponding unregister function. This
> means there is no way for its users to properly implement cleanup
> and removal.
> 
> Add a matching unregister function for the cpumux type clk.
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
