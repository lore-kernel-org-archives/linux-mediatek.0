Return-Path: <SRS0=kVE3=AW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B98C433E4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2020 00:27:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 576DA2078B
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2020 00:27:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HLs2i759";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+hmiuKl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 576DA2078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dwpZkpCEDpT67tBkrvJaH/6XohyVey+TEdJkHDV02hA=; b=HLs2i759kZfoIzcLdd+Vu1B65
	zlV92SyrH4btV3jj5dKfoDTaHzS7gcM+smmKi0cmGh0J3LTi0vHypeEuQl0RJrfJz0+txrwZYwPew
	mDIzbdGF9/kC+d3zagfFrZmkr5vLwUJlZy7KeIvdDrX9YKW08OcL9YqPyPWDtY1cCJ+Wn0325e/D9
	PmgNUsm1rZ/xtR2ee23FM67GI807hMHPBZPmOVHsTt6yHJeajrG36bFweDyraCX3/ptXU4mRosCI3
	RQxlCmstZxmufCHI9O9Jc9oJwgDFS3ntHI33HLaYHbH0h0B42iMMbNAjfC4rxYfSFbQIuMwUeTgP4
	QePNE++4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju3Lw-0002Kg-9V; Sat, 11 Jul 2020 00:26:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju3Ls-0002Jq-Rc; Sat, 11 Jul 2020 00:26:49 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB6982078B;
 Sat, 11 Jul 2020 00:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594427208;
 bh=k3yKm/q13vgtDwU+/6cU4tH+X0uAEuUwaNvogC6Hk2U=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=b+hmiuKlAjhjYftyRiSU3RmWBHmGzCge2OMOgicfVTaTz8EcV5dOBhOwx6Xmr7mTC
 UdQFLeqWoH3C2ZeLt9U80qqogFKDNGPTuXgeU9OydPK62AhHzLsR5P84qzOaavTzm8
 bWXwRTi06qFLRBfLiiPLT42pYd6azJjfNPBZFlFU=
MIME-Version: 1.0
In-Reply-To: <1593588382-19049-2-git-send-email-wendell.lin@mediatek.com>
References: <1593588382-19049-1-git-send-email-wendell.lin@mediatek.com>
 <1593588382-19049-2-git-send-email-wendell.lin@mediatek.com>
Subject: Re: [PATCH 1/2] clk: Export clk_register_composite
From: Stephen Boyd <sboyd@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 mtk01761 <wendell.lin@mediatek.com>
Date: Fri, 10 Jul 2020 17:26:47 -0700
Message-ID: <159442720733.1987609.12625915294903304595@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_202648_965625_FA8C483B 
X-CRM114-Status: GOOD (  12.78  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Wendell Lin (2020-07-01 00:26:21)
> clk_register_composite() will be used in mediatek's
> clock kernel module, so export it to GPL modules.
> 
> Signed-off-by: Wendell Lin <wendell.lin@mediatek.com>
> ---
>  drivers/clk/clk-composite.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
> index 7376f57..fb5cb4a 100644
> --- a/drivers/clk/clk-composite.c
> +++ b/drivers/clk/clk-composite.c
> @@ -360,6 +360,7 @@ struct clk *clk_register_composite(struct device *dev, const char *name,
>                 return ERR_CAST(hw);
>         return hw->clk;
>  }
> +EXPORT_SYMBOL(clk_register_composite);

Should be EXPORT_SYMBOL_GPL()

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
