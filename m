Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF07EEE258
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 20:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnL50oLjD1K6SfOfHIxUu7caH8fjspyOnSv3ATFAp38=; b=P3CaX6Sk46eBdtPrxyfkD1/Zz1
	hx02RssgP9PwtxLA/Cy7sh2gAtEO9z62vm1xCEw+6crQUbkJo/2S+DSMB8v6wn9opaScAlNxfe4OX
	ZZrYNEwbdJgxUyXtegpca00UQAKir50t+67Kl82+mA05SYStuXPNHB/B8UOwwFgbbvbHMt9yejJB3
	kp/sK+o33ut/wy6PVraGJsAzhipzjltYi2466ZrD7dCcUD7IaHEJJbGbMrX/mcxhk+hXMRR5uI+sP
	ZR+SeyFIhRX4Vx8kf4YZZlgn79X+j9YUqiyeE15R5T6nKo4VFHpzlC9elWISxm7mMrcCirGxNxid+
	T7sOQVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soqVC-0000000EBDS-0iu5;
	Thu, 12 Sep 2024 20:33:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soqTX-0000000EAzh-0yLu;
	Thu, 12 Sep 2024 20:31:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF4FA5C5C6B;
	Thu, 12 Sep 2024 20:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2B3C4CEC3;
	Thu, 12 Sep 2024 20:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726173094;
	bh=T8U1b6wp7ibIw+njMfMHoCAqw5G8qqefpz2hppJxRUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kOiDMmpINwcXPW7ctic3yrgfkP+q6JH3vrPATY9CW5RefBK+soiEQrZ4Vd+aSmUzp
	 QiafSnqo0RF8HWEua4j+AOXHEYs4oQ299wU1ekXduP8xlyWNAYn6B8WdTkSV+35MtQ
	 uOc2eK+vs6ohAw1912wpw/NQUzCUASwL1nyu2q8lLqGBhr6VRNxa61dBHqFCrmvj/C
	 vcEiXeU6Mde9PU9gGXwIITxght+cKiELqyGn1yKUKM5sUDA5UoZq9zwzWi2H+vrsnb
	 YLkub8mMsQK2+GWxCTrzDCot4roQOjoYjXpYyuS0WpDSuWKt+mmGKInh4k2PTaZji1
	 3N4rNUn6ZMPig==
Date: Thu, 12 Sep 2024 15:31:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Saravana Kannan <saravanak@google.com>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-kernel@lists.infradead.org, Wolfram Sang <wsa@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v7 02/10] of: base: Add
 for_each_child_of_node_with_prefix()
Message-ID: <172617309153.737512.5462269215203973657.robh@kernel.org>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_133135_361398_56B57B92 
X-CRM114-Status: GOOD (  11.96  )
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


On Wed, 11 Sep 2024 15:27:40 +0800, Chen-Yu Tsai wrote:
> There are cases where drivers would go through child device nodes and
> operate on only the ones whose node name starts with a given prefix.
> 
> Provide a helper for these users. This will mainly be used in a
> subsequent patch that implements a hardware component prober for I2C
> busses.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v6:
> - Changed helper name to "for_each_child_of_node_with_prefix()"
> Changes since v5:
> - New patch
> ---
>  drivers/of/base.c  | 35 +++++++++++++++++++++++++++++++++++
>  include/linux/of.h |  9 +++++++++
>  2 files changed, 44 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


