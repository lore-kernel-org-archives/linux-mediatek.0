Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7496C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 01:24:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8378D61166
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 01:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8378D61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XU9MhLIAfTtd7NyfwZDiwqqOdZJPTXZFgLMTmN4jnIU=; b=JFlGOu3keHWkHZ
	vygv6ktwFoSIA44mK6WtaLGCNeQWnL52WBDlKpdSYueoCM572a6oHbAiRPk8qfTPgVs3a9+aThFMB
	nB/++sjIJ5920jIZNgjOvnnz1j8B0sp+pkIQHK+7E+mBmXuFpZy6mXdMyAg+7PB0A4V2pQvCks7iU
	G9GX7XedjIIkwvIQ2CTz6ue1CfyDa+MZ8B3dQkzP+GLKMkrCMm5QPwqe1H//OPJjiguwVKTshYfcK
	kSPZndhHgzjo9LzuDZ2FZnfP08+eL+d2lRPsrA2v5uTlq8gLyT060E1k3X9FO+jnSG8jhT1GU8QEk
	wHerWlFHo3JC0qe0iYSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQJeb-007o7L-In; Wed, 15 Sep 2021 01:24:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQJeL-007o2R-1Z; Wed, 15 Sep 2021 01:23:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A439E61166;
 Wed, 15 Sep 2021 01:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631669024;
 bh=6c/HJVFP1YE2hm4UYxB5Uc5g2ys+3LGEZlpE6HA1oTQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=trZtis5m21H9aS5vZFObZ9Ac1e8xoyIoLSFkb4Y0pKThjdj2JDQfJf/Ljo9h6F2Gx
 usfcjsilatOf6USFadeAW6obLvECDSwNXXB4u4XLQn0ojOZGDEN3HRIhnj9DOdoqMC
 YgL0w7Vqh9ADWxpbJGxRJ/8EIpIKD/jBR0FK2NMDTgfJYpEFNzsUW/I87Tk9I626Lo
 LwPUlUAOQozQvoadycJZ9nJGIvoJDkzGMzhYcS2gtRAGl6xxpPeyNbWAV428C8z/9U
 U6npT+G+oDglMpsBdtOSwfl2HDZeHJZQa0UyvAFlH74m3QXVb6ipbRlsqGovGn1mll
 dACeBvsGXdpLw==
MIME-Version: 1.0
In-Reply-To: <20210901222526.31065-2-miles.chen@mediatek.com>
References: <20210901222526.31065-1-miles.chen@mediatek.com>
 <20210901222526.31065-2-miles.chen@mediatek.com>
Subject: Re: [PATCH v3 1/3] clk: composite: export clk_register_composite
From: Stephen Boyd <sboyd@kernel.org>
Cc: Wendell Lin <wendell.lin@mediatek.com>,
 Hanks Chen <hanks.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 Miles Chen <miles.chen@mediatek.com>, Lee Jones <lee.jones@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>
Date: Tue, 14 Sep 2021 18:23:43 -0700
Message-ID: <163166902348.763609.9050267699584062754@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_182345_123231_BA25E5D4 
X-CRM114-Status: UNSURE (   6.22  )
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

Quoting Miles Chen (2021-09-01 15:25:24)
> To support module build of mediatek clk drivers,
> it is necessary to export clk_register_composite.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Hanks Chen <hanks.chen@mediatek.com>
> Cc: Wendell Lin <wendell.lin@mediatek.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
