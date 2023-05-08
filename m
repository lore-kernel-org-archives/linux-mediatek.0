Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041D6C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 May 2023 08:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HymwWd4AJ2qoICLAk5E5nCfPf9fabHa4aCzEC3gvtcM=; b=3IxapMyD2ZEx9tQD9rgXGM4N0a
	ZFEo4BjG/E7UpToACj6u9Qi03Se3Equ8KtjXKflRk/xiIpPgtEMx0MxcHznBjK+ly7XWBK9hgaE/Y
	uXUGcsQh9+5jfjsCW0G6FJtqw32p4eHK4WoOqFrMqPeoaiQqJ72df7SiT39hh2w4Z0RwajpIeIsbk
	VOz4UaRXlDT9GGha5ZEdwhPsmSI9H/gJWBrniZCw5xImK24PokasHUtjeZQtWfLsdPjJ4OJiB0ovw
	mku3TDQezqlk+OKsVoNyQRnnsmNViQ5gwEajVHFXQtf4aXylHYN9LCeW6gyixyLj4bWyjnXYumhnP
	AxJeg18A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvwgq-0001uC-11;
	Mon, 08 May 2023 08:57:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvwgn-0001t0-0B;
	Mon, 08 May 2023 08:57:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB716620B3;
	Mon,  8 May 2023 08:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E10C433EF;
	Mon,  8 May 2023 08:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683536267;
	bh=G5v7NSAKXe2kLiZkicPjPQ/vKtmbjwfgIRwrsi4rT4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pl0UQZj54buaQ35xQcBdmpJB5ccWsOHmiWJ7iamjj1B4SoCPRo1KbNe+Aukzlc5n0
	 uZMuGpJNslVEQWFdp6SVSfIhl/01niiqlSnP43z5Z5MyWpV91e66gqMkOJI237gRtj
	 ar6LG2CQu7g7xRL4EVmpPL6H0s6z659skAJLJikwHvbbxMh5NnoDKthlZjFvuauR+7
	 UHGLwXIF475Aupcf11AcKtW9W9LVMZcZPTlUgJmb7cx5K+Z1MqjMjPoxtdohoSGWUu
	 ZnDq6Q2bic907kFa2sq5IqN5KB4gpocS4VZx3rcrWCAuBmKvVpfnAgAuP+NM0k8+Ce
	 lE1EgjLr+fVPg==
Date: Mon, 8 May 2023 14:27:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Tom Rix <trix@redhat.com>, chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de, chunfeng.yun@mediatek.com,
	kishon@kernel.org, angelogioacchino.delregno@collabora.com,
	nathan@kernel.org, ndesaulniers@google.com, granquet@baylibre.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] phy: mediatek: fix returning garbage
Message-ID: <ZFi5hqhsTKqV96hF@matsya>
References: <20230414122253.3171524-1-trix@redhat.com>
 <ZFTMPWp8LhwA9uHz@matsya>
 <db9c3190-28d8-199f-f4f0-a12524d0451e@gmail.com>
 <ZFipVfhLVyye/eud@matsya>
 <f5cf30b2-c29c-03ac-e7fc-4c7da2cd0c5b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5cf30b2-c29c-03ac-e7fc-4c7da2cd0c5b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_015749_139761_A98A677E 
X-CRM114-Status: GOOD (  21.37  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 08-05-23, 10:24, Matthias Brugger wrote:
> 
> 
> On 08/05/2023 09:48, Vinod Koul wrote:
> > On 05-05-23, 17:37, Matthias Brugger wrote:
> > > 
> > > 
> > > On 05/05/2023 11:28, Vinod Koul wrote:
> > > > On 14-04-23, 08:22, Tom Rix wrote:
> > > > > clang reports
> > > > > drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
> > > > >     'ret' is uninitialized when used here [-Werror,-Wuninitialized]
> > > > >           if (ret)
> > > > >               ^~~
> > > > > ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.
> > > > 
> > > > I have applied "phy: mediatek: hdmi: mt8195: fix uninitialized variable
> > > > usage in pll_calc"
> > > 
> > > Thanks Vinod, that was on my list for today as well. I was a bit puzzled
> > > because you took the patch that added it, but I wasn't sure if you would
> > > take the fix. How do you want to handle things like this in the future?
> > 
> > Fixes should be sent as Fixes patch
> > 
> 
> I'm not sure what do you mean. Patch subject includes the word fix and the
> patch has a fixes tag. What was missing here?
> 
> Does this mean you will take fixes for this driver in the future or do you
> want me to take care of them?

Yes I would take the fixes as well for the drivers

-- 
~Vinod

