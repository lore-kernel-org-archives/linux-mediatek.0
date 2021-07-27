Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E3CC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:09:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25E7460F57
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25E7460F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8eCo89cCIqIDVf743zecAi4nSN9qIvfpaHiXMxz2Ig=; b=4BA7kbt8ZalzQo
	iXPRDnXI6ySULBTyJ7DLvLOHmzn1h0zLZHH04uQ7Eg4tFcl5aE+FaMHDtnGvagHcXv4lUi88j6E1y
	zgxmVzPPp6rVri9mX+SE/ozMkmyBFlT7PaWth6ah7bkargnADqJTnL2V73xQJ/pixJvR7zGNXfDsb
	YzU3PJRRmPzYnV6slUzhcJnlK95I1X59nIaepU9fuZiVHquRmIwbxT69d6+mfcrchQFf9Ihf57QXs
	26sK9y6k7/OJHG3mG1GBT2BNE1B5E/W1wFYWHvPkQU3wvBfD9PhkET5lcoIt4xk/aAOABmxJiTtuR
	UGfwmwYHCoPhrG/yBX/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RW2-00FjcK-OZ; Tue, 27 Jul 2021 18:09:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RKH-00Fe5M-3I; Tue, 27 Jul 2021 17:57:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81B3F6056B;
 Tue, 27 Jul 2021 17:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408628;
 bh=mejTlmkLG6zbGS7GMMOnMI2qHdVVdSLcMDbPHgY7uL0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=USk0BJOawI2FI3CzDfmsyLCI8MbPz49tuIUKOx0uXhbJI4IAUkpxUZn+/D+d908CO
 K+n++JzNb6N1wzqWXmg0fbtqN5WgvNeHhbkdZYs3AkjXLa/toypYmZclrG5JbX09Vv
 7cWsrFINCi2ICpMNe53hRzaIbOBA3ccaaejbGO1I3EPCtyi41ssHAylfMcxm+01f1Y
 s4ASbxkJROH2enVY7uznQSvFTmgTCN4D3BPiVDrVyJ1iE24/ffXnRdB6wg0BBUhDo2
 fZ9gA7nxiPW6FvMUAFw7hzWGrfpDYHL4foQObxKQ+iFdX8VNbUEjlRTEG0JzNWxy9I
 cEPADssFZlsgQ==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-18-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-18-chun-jie.chen@mediatek.com>
Subject: Re: [v14 17/21] clk: mediatek: Add MT8192 mmsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:57:06 -0700
Message-ID: <162740862632.2368309.18192597600151365795@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105709_232610_2F5D2B3F 
X-CRM114-Status: UNSURE (   4.95  )
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

Quoting Chun-Jie Chen (2021-07-26 03:57:15)
> Add MT8192 mmsys clock provider
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
