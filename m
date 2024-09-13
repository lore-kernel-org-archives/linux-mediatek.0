Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B533FA3755
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EM3hU71clw4hx4Tly7uSizDCT6spBBk9YPHvB0V8yxg=; b=Rzv1Bf/+Po6xVg+U149K58NQsz
	1bGRujW4F8HQYNZN6kgI2qKWNb1YW9/4Pb+AzVlXJhrSRtAmEHHG14kIk32cNpe0t0/rGgl8A8zKV
	UcU3LYwdkOZhDMIo8NgnNjWH2cGopdJVB0QjdUEtJbfKVgIFtzZLCn/YPCfIDv/rkYl1TFs1ft9pN
	dL0vLXon6lqn4/jtnXe2h5OIYrAWA05DyaIQhPJXgFBUdHaLqT6HzD7WBsBnGaAOQh93gpQZwofCW
	B277AqXMKh+++Rm3e3CGRP8rmIez9+UEe34u7olHFgPuOD7IzWgpwe4JAqilEbBKGJsenyduKFQQ6
	r9N9rjag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp7n4-0000000GH4D-47zU;
	Fri, 13 Sep 2024 15:00:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp7m0-0000000GGv3-0L3d;
	Fri, 13 Sep 2024 14:59:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B3FBFA44DBD;
	Fri, 13 Sep 2024 14:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F454C4CEC0;
	Fri, 13 Sep 2024 14:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726239586;
	bh=GBR/ylUWELEf4Nvt0HwsmeixlCJh0DahxVeDrnHTK4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nWxOMY176ksBiwhKWCrUFM7eTN7vl/Fdu2uY9KOP3YrBH58M7EsYQsOAgxsPceD4E
	 zVv5xb6v5CkMxp9oA8Yl8KbjgiXIqPuCvrps5Zo/7TOgPyFRm2LfoiT+F6qx7WCJpA
	 8V9kLoCD+9NtLISQFVtnqYbMgJ9yeQptoEV7Cb9P/7eTdre2lz9oPh7VrbFXtpdOjQ
	 X8fnGTbqnqJ2y0mgoQ9qyraTMFVhLkxsPFVaNFJj8Pym5H8vQfbbChevZnz2WNCV2k
	 8ZcxwYVTh+m4iXePzpQvqRrQU3B/yz1jRe+haxn6Y+EMElAJeNDmmaNPWWDUSD+7MN
	 YN/u8jkKDhlVw==
Date: Fri, 13 Sep 2024 16:59:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v7 05/10] i2c: core: Remove extra space in Makefile
Message-ID: <q5g4lus3fifwtaypqvljtmw754px473mpx66b2vtemyivqfpm2@4q3mnojbfp66>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-6-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-6-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_075948_204104_3CA65B42 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chen-Yu,

On Wed, Sep 11, 2024 at 03:27:43PM GMT, Chen-Yu Tsai wrote:
> Some lines in the Makefile have a space before tabs. Remove those.
> 
> Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Closes: https://lore.kernel.org/all/ZsdE0PxKnGRjzChl@smile.fi.intel.com/
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

