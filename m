Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB1EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 05:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qy4JTD61vxbITWzlLU+YQU7QY4EyadXtn9Rj/F8yhsA=; b=P16HcxYw4Kw2ZZ
	dFXkkPyJB1KU0dXWS7DKiHqfVXNMAGMaI6AZ6/1mEuawKdINN6Szs5cySR2nAMz1nB+kMw4hptBQV
	PdWzxaR9fGp7+Mzk+1DlPT/rfTDztblGaP4MmEPyi+3gpiLaUDbDWhW2gXjT+1pXjfd/v+RcuZxHI
	OsgHX9UoAh/yJIO+rePX4LDB7zARTJEd3Mz5yJoM5GubCcitPZFhQRZCLAQj14ms6ToSO2LRY7Iwk
	JVmIyOil/7Otks+kTIEA5I88QukGqnbfnD/vAOOsim+7MIApRzG5mfw1NaN3TJSWmIk3KqeFYuUyD
	3/yOF4I5xgRQLGkpcYlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrBxm-00HC8G-Tc; Wed, 18 May 2022 05:11:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrBxb-00HC6Q-UY; Wed, 18 May 2022 05:11:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 63EDECE1ED5;
 Wed, 18 May 2022 05:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31AD1C385A9;
 Wed, 18 May 2022 05:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652850647;
 bh=zLSUPhiMZkHcI2NBTIXoQ5eEv+4diNzEqoaYxrNP2p8=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=ExkNDaFYEJVADZBn0RIDYtfSpF7+BCYlUhclkwTg2tVyN5Qfke+g0VXRlWz2LAgIj
 RLyh3sgNLhMcDVe4iv/1P6zhDrtDP7LAKEqGxfJv8A+DawSK1pHOIrWxtSHhdN+SEh
 lshWxLML2s5ttHCyIIzcNhDvxJ8otkbhbibBdiCeXHqVJxLh6v0qMEL8UZJA2g4THD
 cBR1IZICuEYpUgSOF7WezLKmTxQIGrgbMLHjoz6NFq8OnQdzz9V4Nv8mXPlPkPdX84
 cj6MUwu6nh3PIuPE8QCD9aQ9Cv9odkiBRTFAgEBpXCtEfwQfhqWr2GIWWMlpRwgHsJ
 gP5rjt2EJRrag==
From: Kalle Valo <kvalo@kernel.org>
To: Bernard Zhao <bernard@vivo.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 zhaojunkui2008@126.com
Subject: Re: [PATCH] mediatek/mt76: cleanup the code a bit
References: <20220517062913.473920-1-bernard@vivo.com>
Date: Wed, 18 May 2022 08:10:41 +0300
In-Reply-To: <20220517062913.473920-1-bernard@vivo.com> (Bernard Zhao's
 message of "Mon, 16 May 2022 23:29:09 -0700")
Message-ID: <8735h74e9a.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_221100_209308_774F3087 
X-CRM114-Status: GOOD (  10.90  )
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

Bernard Zhao <bernard@vivo.com> writes:

> Function mt76_register_debugfs just call mt76_register_debugfs_fops
> with NULL op parameter.
> This change is to cleanup the code a bit, elete the meaningless
> mt76_register_debugfs, and all call mt76_register_debugfs_fops.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Please make the title more informative and don't use mediatek in the
title, for example something like this:

mt76: remove simple mt76_register_debugfs() function

More info:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#commit_title_is_wrong

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
