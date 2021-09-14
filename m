Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CECC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:35:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 800CA6115B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 800CA6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/w6PqCg/F6Uvryab+SNwVaPhi3ouc7na0dFZpqJrnFY=; b=V/LBGDdTI5Fcha
	PUDvaw5nMmRI/8B13xbHl9hLfuw7mLD+5wEtTnYEs3c0Scxs0zzlloZfUFtjOkzuplnHhvyj2axn9
	9YPWfSu6xOun0ScCnRmRo7+wGefC6wwuMBhj0Et7dQYZIcE2Va17YHl6HblwBJ1cl4Af85hXPR6GE
	TID+pMATIsX6qxlDsTiMxAmrYCeyVZatVchQ3uQNNObhN1/qUlqY9y7oVbDzHIgIZiPl0ocfWueJf
	5aDSqv1UimLRnnT0WEhgKy6w55Om1zvUnionoChJg+/kgnGuuYemdUH/AWX6ZSIsMeSxFM8/2n1Rt
	aezyoVyqKYZh1DJaKPBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQH1W-007QsX-LZ; Tue, 14 Sep 2021 22:35:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGme-007JpR-3W; Tue, 14 Sep 2021 22:20:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C6226115B;
 Tue, 14 Sep 2021 22:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631658007;
 bh=W1pICJlRvSW1ssmFRiGoKgBpCPqmo3zRGu6NGVebegw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=iT/sbQMhhcXy0LkiRmzPGy03xQNLwXKS4E4jFnfjI6mnbfXkn89NI+rcYNdXYjsbx
 5RXsU/twsLIVKRLLogXPhxTUAWl9CPFNqYCrvLKSp6Jy+dhvgxxDdKuAKf93si18oQ
 5lQakE7pb6Ms71Upkwy3RGxsPc8LOt4w1XyQR18K9UlzEEviczIm/Tja+fEVU8Booo
 0qO7abqIukgx9tIfL0LHUYvxhCDDgpg+ZE/nqakm2QtejGu+FkIZN3Vaman4vCmSCj
 YjgxnCPLOqosbGozjG+LD7YJ3IpWxUHWlZ0VqX/CbWhXmB4urXSQq7CnoUeQ5zwu4y
 SQhc5j6nbSdpw==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-23-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-23-chun-jie.chen@mediatek.com>
Subject: Re: [v3 22/24] clk: mediatek: Add MT8195 wpesys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:20:05 -0700
Message-ID: <163165800550.763609.17699241098825295982@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_152008_304703_8D90B753 
X-CRM114-Status: UNSURE (   5.01  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:31)
> Add MT8195 wpesys clock controllers which provide clock gate
> control in Wrapping Engine.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
