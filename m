Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123D0C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:24:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB87A61185
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB87A61185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sP40k+gnlJ3ao7jUOnMvaYKMIBv/tyLoK1op1Wc3Yl4=; b=YCM92PQd5VHZqk
	5P3Yzl55B5WobAXf2mUUARR/zF9r67fw9xtMw0Xe3As1BKhUsJX2uizjI/1LAs3VTX6TOuMbwOBYO
	HxPoj6+WhKVxeqmYBF5D40ReOraavL7Hhk8mx8PihT0BFyXnSDR9six9Bsy75peCPWqWto5eQ7C9j
	OAHlAfpw+elTMFPIBEOXsRiFYXpSfMjHnhaGrZvdEZGM2hCrtMgBE9Iv9fHo3ia5i1DMUIkUzBoc6
	Swxhd0+GPALtFhTPkkwadEu4IWWl4ZBX0V782HgRMh53q364OBX1Tr9EDqcN3UrkBAT4QltMrAImJ
	e0QHtQMdXh3JNhu+JgEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGr4-007MHz-4G; Tue, 14 Sep 2021 22:24:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGlb-007JH7-CF; Tue, 14 Sep 2021 22:19:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA6516115B;
 Tue, 14 Sep 2021 22:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657943;
 bh=x7ffoGwn9F4ZSmybMmYQZLl6zg5IA1R+UOiKagSf6Lw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=BXJNtckld0tvyok+8nK5rEJ390gmaPJnEoNitNdVtrSgsDEqgzABEshFO2XeZ6VpL
 7UsvMqHn3HmcvEJbAFxvbyCQzlUedGVGUQGKpJ9L2Cz7tREoifajjA6prwz9yxeoOf
 4bkBOODNDylNMOe5uLzPqZAlps/kkqrGrXHz22RqlTF6FW6ffN5Liae7XtXLvVeaxA
 uW4tVJKUgq+X3NbZPCQmdnlX5jyGXPKE70YgIZJ93YWF5XPkWp/B6JoweFipH8XU9z
 leJUi0EBwOInkbhObzNAkiuXxFNQ9qIxd8vbJ/h9gNb5CeqmNnlSnJ0i2ksR7yb3gi
 aNIxnaW6gan3g==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-13-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-13-chun-jie.chen@mediatek.com>
Subject: Re: [v3 12/24] clk: mediatek: Add MT8195 imgsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:19:01 -0700
Message-ID: <163165794184.763609.8685073457952732841@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151903_476376_96B1AE34 
X-CRM114-Status: UNSURE (   5.02  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:21)
> Add MT8195 imgsys clock controllers which provide clock gate
> control for image IP blocks.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
