Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE9CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3aOI8pnJYyDjspMQxv2DBmvxVq4iQ3F7hyyfzzZjKM=; b=NdQcUqr7wbwQz1
	mF/QARcQhgJCl3vHRxygPYJ2heDCMlyF91tAzAiUARSggJ8S6bYoW3tx+mFZ7S/7CJKBvHTK3Gxfh
	KOMA/I+blwxqFj2GC9elM2dfuboqy+6mniwd2LK1Ji9lw1sJGywIJPRWnW+XZUw8uyc7YistEh1Vk
	hb9Ff3bsJk2/0Nzoch2Vxss+KlVgCTjFXHXxG4a84HxOtVv/O31Q1v2xJ94tvx9XxcPSYnzfUQ44q
	wqZKUwMSEVKRygYB00Wso0OTQmZgf4g53VBDtQHUrWl/q5XxxjBrEVH03Aq/FM/tPGbJJB3usB5uk
	bwUhwW+i0eexAf2xeiwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnbJ-00CBvP-Il; Thu, 17 Feb 2022 20:42:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnP5-00C5qS-Tb; Thu, 17 Feb 2022 20:29:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C727D61E0B;
 Thu, 17 Feb 2022 20:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DA7C340E8;
 Thu, 17 Feb 2022 20:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129766;
 bh=iht8meNpuv/PfH8oatg+B++8jTrozjQQAmlHU8+wdsU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=hUQD2zTgrvbPDLj+wpbaYy6vmD1mhER0/0c00sAwoJhYCG/RGXxFHpXFi8Nl66TFu
 YdCmo9I4/jOtwdz2FyoStZbNszA0oinwUH7NAfO8Gvea/drFu4khxXDW9uvXPsQMwC
 wZNKrBkSLMebfUjZEBk0VGDFw1VzqBawuQYNx3BNsVJLVNucSx8nmi/qWhhTPQn9us
 GIaKxMfWV5qVlByy8oGuzKBx8zti4nSt3byYiZbFR0lG6ZJooIn3abznPFK+1lL2mE
 pdPPIAUEWw2oRtSiishaTb4nzbcFECrdolHKZUJPmScdavNs+5DKLVvBcZ2NKWegbf
 +FaQ4SRLzzUFA==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-29-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-29-wenst@chromium.org>
Subject: Re: [PATCH v3 28/31] clk: mediatek: mt8195: Hook up
 mtk_clk_simple_remove()
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
Date: Thu, 17 Feb 2022 12:29:24 -0800
User-Agent: alot/0.10
Message-Id: <20220217202926.21DA7C340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122928_105390_1DC493B4 
X-CRM114-Status: UNSURE (   9.28  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:31)
> Various small clock controllers only have clock gates, and utilize
> mtk_clk_simple_probe() as their driver probe function.
> 
> Now that we have a matching remove function, hook it up for the relevant
> drivers. This was done with the following command:
> 
> sed -i -e '/mtk_clk_simple_probe/a \
>         .remove = mtk_clk_simple_remove,' drivers/clk/mediatek/clk-mt8195-*.c
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
