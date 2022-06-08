Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFB2C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 17:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t+Z9orQubUKFciqBvuau5P0BPn5DMdmp74UiBjSHELU=; b=eHC9wM7GRFwGmm
	vX2mG9zUQrfzpmCrc9VUw/Wca57BgL69YVBtf1VzAtNPp1PpwSVTUsAaDvkf3Xf7h8QxaRjJimNPj
	peOwWTAjMmPDeSUWBvh9sbQdAWVGTcYjpL7t041vXhT4mT2BzGz7pnKKmRFkX/4KHLwp3ITRDTAaK
	NeUOLVwaBdV6WrYo/mdZ9xls0cEUQMuV7RBkdIfPJYzAkb34fzaEbUMHFW5ITY6XiDSF/GfagO+aj
	olnJ4SvsCYMVJiYlBoSqiMIya4h4WuZEwmSLPLTki6KVkUTqaaUpHz9B/pNekVGpYmljIrgxq4ViF
	ltUXNHOnBz35M9zBgmCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyztU-00EYu3-PO; Wed, 08 Jun 2022 17:55:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyztJ-00EYrR-Kp; Wed, 08 Jun 2022 17:54:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1B535B82616;
	Wed,  8 Jun 2022 17:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD09C34116;
	Wed,  8 Jun 2022 17:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654710886;
	bh=joa25S6k9i7tTrj0S2JqhbnuflBDsoS1LuwLIiJsIc0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=b2g08SPfLwcYx0f83deLHU0Grduadd5VXyRAtOiIGM2WmHGZ1fn2h2PQMy3regGFn
	 /pnBfPPXX1+ZDM9uyaAH80MRbpq++7VHOXw63EfelmT1vLA7yk6+7faxdfQ9sLC8r5
	 GcqWwLiL0ijyKy9XPTiq/mbnMqPjAOwRxwyGIVzBHHZDJhkA7mcJDXIgNQi3yXxe9P
	 aXXxSASkY692065iV8bXfWtkqRzUxwbjEEJQcNT5QP6CaT4xl/8XwFnK/B6h9aPkE9
	 fWbEdcU4p+cbHULSVGhGE0mtW70UPZHK+xcdY5+cZobz5g3+QheK2gj3IvsA3Owlwl
	 gKcaB3/s8iI8g==
Date: Wed, 8 Jun 2022 10:54:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Greg
 Ungerer <gerg@kernel.org>, =?UTF-8?B?UmVuw6k=?= van Dorst
 <opensource@vdorst.com>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v3 0/6] Support mt7531 on BPI-R2 Pro
Message-ID: <20220608105444.62e93f07@kernel.org>
In-Reply-To: <trinity-c7b8fdfa-11b4-4e5c-90d6-6dd96da1e2d2-1654709910860@3c-app-gmx-bap09>
References: <20220507170440.64005-1-linux@fw-web.de>
	<trinity-c7b8fdfa-11b4-4e5c-90d6-6dd96da1e2d2-1654709910860@3c-app-gmx-bap09>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_105449_878523_A32E1DE6 
X-CRM114-Status: UNSURE (   8.58  )
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

On Wed, 8 Jun 2022 19:38:30 +0200 Frank Wunderlich wrote:
> just a gentle ping, is anything missing/wrong?

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html#how-can-i-tell-the-status-of-a-patch-i-ve-sent

In your case:

https://patchwork.kernel.org/project/netdevbpf/list/?series=639420&state=*

I haven't double checked but even if the feedback you received was
waved the patch didn't apply when it was posted, so you gotta repost.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
