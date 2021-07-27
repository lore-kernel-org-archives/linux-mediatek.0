Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E39DC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:11:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDA1060E08
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDA1060E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zW0astpf7Dji+NK8Qp5+9Oo+TGoDdqSMEzhQniiOpnY=; b=2hCNVhlX4AntYK
	ESRhJvQQp9w8OvHKsKiGldJmi3hLbqTBOktKHE/s/cTTRMueD+/Yvu50ENE+Y+WMTd9zYWLENhSgd
	ZoD+iS1uF7SigVzqk51AuguGeFHuImoJR2ijljYhdz/bcdfmIvG1AQSTP9ymzs0inJ70xBuo6lDFb
	BKCPvPu6qVK3Sb7GInHp0lx9N3c9iGbKMwN1TXvukKaK6zOZYY9PQkUajz9JVa3RbB+Ak5v7QrmIi
	cz4TbtXPX0O2SmwDgNTNudxYLc75R3Xu4V3Bo7CtzLlnjJ0CCmNISPKI0epbaPLZsHHvkHyTqa+7C
	yMAzehjnYDWKJmGwGcTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RXp-00FkVt-TH; Tue, 27 Jul 2021 18:11:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RKe-00FeI9-KW; Tue, 27 Jul 2021 17:57:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32F506056B;
 Tue, 27 Jul 2021 17:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408652;
 bh=HUyhatCxcGH3OM0itBe6EZjaJZ2ADW7P1VbpjXcwZvI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=urs4o1XCJp2ln1RmGUFnDlz7TkmbLYFabKl7SM+AeARAMLgXOJ40CYMK859Ah/gIq
 zJyotdvntdT2XAXdI9ksNnlcOYFWUKq+WUKyybV0ycW7a0IZugTlJRq4XkJGba+qta
 sAfx4PSt5p9MnY1Fyu0GOsqUOv4vCl1gXKtrgZoCdv+rn652MVsP7oRURpaDiyzQgb
 BJGsB+7FtpK4ed5TvYbICr30jX5fXKwtU6RXgJo2cFdq5beTAT4DSWijPpw3eNISj3
 udW7sb7zP+jXGkIhnPZZkHZ6CbTQ1v8hp7tSh0wJfuo0N/dSwpAea0sIzQ2v64kplP
 u5xy0BrASS9nw==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-20-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-20-chun-jie.chen@mediatek.com>
Subject: Re: [v14 19/21] clk: mediatek: Add MT8192 scp adsp clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:57:30 -0700
Message-ID: <162740865000.2368309.11701590537224350739@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105732_751660_FEEEDBFB 
X-CRM114-Status: UNSURE (   4.84  )
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

Quoting Chun-Jie Chen (2021-07-26 03:57:17)
> Add MT8192 scp adsp clock provider
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
