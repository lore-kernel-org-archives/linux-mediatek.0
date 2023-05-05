Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A645C77B75
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 May 2023 12:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8Ew4MWBOfFMNOHRGDkZV0COadcpg3nRX+vRy2jNXDQ=; b=5DM9819DilKW2b+i8TY7bMv7gq
	EigTufFmyVmjRSNCyVxyWll376xBDArTQ+ZA1gmKSXQu3F4+BPF2ouKMAoY5tt9zVq6S5GBQl3tsB
	Rz5hUqLIAFs4t8qgaoM7xRrJTFY1Qwgor5GM9ocgXZJbliuQm30MMd/Tb+rq9hxVgwcQEDqGR/z8C
	rJhHYfuFGiq16m4xOdO9o0SRfSSAKsI0779lWo+ppzQnaw6BGlPEYzZX9D2XOx9vkVtwO3MSXIffx
	T4z6IbUmxu7P4IHSznyj9mF2OfrulX/rl4bXJt7m8WqbMgyYW9o1Dwr9tw7hEkp86IqoCZnT23rJh
	fsBmy9gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puu9l-00Ap5I-0Z;
	Fri, 05 May 2023 12:03:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puu9h-00Ap3o-05;
	Fri, 05 May 2023 12:03:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 66A32611D3;
	Fri,  5 May 2023 12:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32BDC433EF;
	Fri,  5 May 2023 12:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683288199;
	bh=Ndf4luLTqs4g+H4PSvF6ERtG4AtnUUEJcgo5864W62E=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=SXZpN9CSSkf1w1OHnHLXuMwnio1laXiwGHsj8vus6U/oSpc6lMjTNSRxGHX4V31BI
	 b4YbmBUfD26Bp9GaEAr8IM4n/oXjm2o03PqFy53u3e0ZSKd73sAs+z5rgFVzQlKJcB
	 0mIAa4tBT3ik4nG0i/gms3GNiODyglbVTKDtijqjrJzO7SCzbhYtkCtyUW8xH5D1HP
	 jpV27RyuQkhKv99x/+PQGA9Ay/34YGZqm8AENDAzmn0KkNJw0JXiaXMLxRq5G2YlHy
	 3Q0mdnRAW7aBHBh6WxzLvqv4i6RQQBqRNNw59SZvIonXw4CeKdrWdMXDntjO4RaMJF
	 pnyRcjQ2LMbbw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: mt7601u: delete dead code checking debugfs
 returns
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230421092200.24456-1-wangjikai@hust.edu.cn>
References: <20230421092200.24456-1-wangjikai@hust.edu.cn>
To: Wang Jikai <wangjikai@hust.edu.cn>
Cc: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
        <angelogioacchino.delregno@collabora.com>,
 hust-os-kernel-patches@googlegroups.com, Wang Jikai <wangjikai@hust.edu.cn>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168328819522.30117.3097099418946262250.kvalo@kernel.org>
Date: Fri,  5 May 2023 12:03:16 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_050321_103458_46E0285A 
X-CRM114-Status: GOOD (  10.56  )
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

Wang Jikai <wangjikai@hust.edu.cn> wrote:

> Smatch reports that:
> drivers/net/wireless/mediatek/mt7601u/debugfs.c:130
> mt7601u_init_debugfs() warn: 'dir' is an error pointer or valid".
> 
> Debugfs code is not supposed to need error checking so instead of
> changing this to if (IS_ERR()) the correct thing is to just delete
> the dead code.
> 
> Signed-off-by: Wang Jikai <wangjikai@hust.edu.cn>
> Acked-by: Jakub Kicinski <kuba@kernel.org>

Patch applied to wireless-next.git, thanks.

f3dc7bb037d8 wifi: mt7601u: delete dead code checking debugfs returns

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230421092200.24456-1-wangjikai@hust.edu.cn/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


