Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9851C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:30:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AAF56117A
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AAF56117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gfW648+GVBHR6c7OJWzsIN86mLH0El1aWFn3VD1oqRE=; b=dDYlSJqeIF8AJb
	xt50Vsz7FgARjrJ+n6m8Zp66wdzzNNSelfP2jwHJr33Xuil/pjHK+oQUDGVZHXLY5kRuVw+L08M6n
	wvGElz6ZyKGVZb+ZStxox67SyDpBC/HYqf1iSSj0CKD244rGqn2q7IwGcdx+8SzJLRFosPNyLpYIB
	/sVbW6sHvD/i0laqc2XuBKoFTsgIg3VQ6aHxR4OrPdn5HQ0vNi+ZNjzG7+ILtug105biRkypjKInK
	Pc4s4Ys+iRn4O9K+WpCQTXoaYdI0qU7HEkfaZdqUPSYGf9az9OKAI5uyFfgmv64BPX6nprnSCtec3
	AvOoB8oo/xx49Q62/1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGwM-007OcT-Fe; Tue, 14 Sep 2021 22:30:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGm9-007JYv-7x; Tue, 14 Sep 2021 22:19:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC94D61164;
 Tue, 14 Sep 2021 22:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657976;
 bh=+KmAmWtMfypw9Fo3nOIC+Li00raIN7DW8K+8HiWqjv8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=pYKEq2kho+6E/8YNSJRFJHbuQFcZpmzjanSTHkAFoBx+1fv4EHsHvYy6i8v2ySqll
 TgRFzq7p6yZVCkUf0uNMOLWNkK2pfubwJF2LK+OC9MsUR0qFfUJtDUn5c+JI4P9c/V
 nyFN31s2F6gLaWXKaD8uLeSMprzOldTpSlUmnh2Gdh4XpkQG18gyJa+WBqvLzcCqvB
 enf1ZVPnXSTvSohvRfLqWpfqQnDKOzX5GGSBUq0T0SKAFDGi3R00kD87H5NSW+SvM4
 EnVW6J7plyhIVKL5DS2mEDX1BYIGuwP8N+HzFzqhEgYh/N9EiWchrPl9s+AHKy7BMN
 pX5tujO7FOelw==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-18-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-18-chun-jie.chen@mediatek.com>
Subject: Re: [v3 17/24] clk: mediatek: Add MT8195 vdosys0 clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:19:35 -0700
Message-ID: <163165797561.763609.17217948869258296181@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151937_385239_238676EF 
X-CRM114-Status: UNSURE (   6.12  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:26)
> Add MT8195 vdosys0 clock controller which provides clock gate
> control in video system. This is integrated with mtk-mmsys
> driver which will populate device by platform_device_register_data
> to start vdosys clock driver.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
