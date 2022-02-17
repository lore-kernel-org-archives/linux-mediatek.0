Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723E4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMvwPt8ctjyo+NOIpro90bg3q66pZr+wJ1SfaBi8hUc=; b=BbaQatvey5ob97
	bm/zxce/mV/HwBbKsByXz1DGr2txwua+7A6WXjzgIS0/WRmd5ivvzEm4L24m/BbRJAbLvcAnReV9y
	6lZt1M/hJ6bU1pSIdm2Hi3xK5+RLmdgq6HSPwC4oMvyk89Q/qYaXZixu/lM8a9yn36FNDpVbYBr7v
	gK5rUoYuRAJ9tIsP2fvv/joEGi+32GLKlYuCg7YaB6Ax05P0SiNkHEjRMKcadyMwcYkdb4C2zAfaR
	gq1rmfDrcs0Qoh0ChhjNma1Htoud326xJ+o7NzVSjFrNwvuLZT/WLgpj0WcXyZ8x9j6VRhZB9t31J
	ciuCXbrVfvIs6QsbKbVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnTe-00C89W-D6; Thu, 17 Feb 2022 20:34:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnMW-00C4au-8T; Thu, 17 Feb 2022 20:26:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA92F61DCC;
 Thu, 17 Feb 2022 20:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAFAC340E8;
 Thu, 17 Feb 2022 20:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129607;
 bh=Hg0HvUnNwBRW05VO30c88sEDX/Y/WcYd7sjnYYrwl/A=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=pCoAYV06o9IAkdrh1qatdrPK5EyvuPhxDyFfIZG0pOrH4OE0WkDGXRITNE6s5ripj
 yEjS5ueBLcH3DnY296dwc763e8PoPNBWdY4joZQst9diDo3LehJLADKLYluiUfu/WX
 m4DF7Tj9mAwu1f08FzHGRYcB4MKSXGlrTD8q5+FZmvwWBUAwdSFMiAg6Me2Xr/JfzJ
 8x1GOcy7o0rOwkQPO94YvM08P7PN7Zw+eq097eQi91ICFEqpJSY9mztN3+P7gI1pwy
 kvbai1/nJK+WDF/gXCjCOS9tgInimN5MqJ9JQ22FmM3++VZ+APfZfcnC95uAb3c5U9
 FlkNCDJsL3GVw==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-21-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-21-wenst@chromium.org>
Subject: Re: [PATCH v3 20/31] clk: mediatek: mtk: Clean up included headers
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
Date: Thu, 17 Feb 2022 12:26:45 -0800
User-Agent: alot/0.10
Message-Id: <20220217202647.7CAFAC340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122648_402068_01EFDE7C 
X-CRM114-Status: GOOD (  10.02  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:23)
> Some included headers aren't actually used anywhere, while other headers
> with the declaration of functions and structures aren't directly
> included.
> 
> Get rid of the unused ones, and add the ones that should be included
> directly.
> 
> On the header side, replace headers that are included purely for data
> structure definitions with forward declarations. This decreases the
> amount of preprocessing and compilation effort required for each
> inclusion.
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
