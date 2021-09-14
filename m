Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF7AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:33:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80CD26113B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80CD26113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fAaEW1lrChwUroecPqJonVuwXQbwPVTjeDMMyRwMZmY=; b=01Cv1jFvTrPLXF
	4EZ5boUJirIRnXbwXOjQGLqHt1/hcQxP/Z9O9ui7l8WLggDLNZSDGfSfb8yjKhy2K7tN14VlZ4RuL
	NtVVtLx3GYpSQjeetUQdhDPxzekvb1MqZ/4bmBd32nWbdPwuUWOSKQmYU9IPY3khdwX45suyHfnap
	SVSEmvPBWFPOVBiI1cPp7Vg3qBSeSkwKjvAlb8w5Zwu10VgFFC7sPjcUAxgyPepip7RupwUCvHpu3
	IQlmRCtudQ5eqjRF/SCGqZz3MdV8EiZtSznBcqeFUk0MlQTWhtxsvWa+4aKT0xi7tBE2on3TC+7oN
	H0yu8p0mLMzzPFrTej5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGzm-007Q3m-0s; Tue, 14 Sep 2021 22:33:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGmQ-007JiP-KK; Tue, 14 Sep 2021 22:19:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37B7E6115B;
 Tue, 14 Sep 2021 22:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657994;
 bh=hpJblHQsrimkq/c68ID4x9JPNBho0SJE+Frt4QttDBQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=hZnJaepBxrp2EoSlw9XB3CnAJyNV0oQajJSkcOXRGudZmkE1sdphhSa0KzRl4CdXX
 bvJOXU9HQgJwpFNb1UZzwIX4jUw02Lmzn2D1H6RpdYn69IWlYeZRsKdNfJXxEz8hzI
 TSjzXbbcN4m8OCFw/5h77fkqg/vEtMxTQ3OCNrlgrJolkyINcnVEhMsvdxrqI9KS6s
 XyyXzV62c9Z3cB0JRlS0qmksU5ta4GtR0ziWKI2PLtS9itGeJCWZKEqzvBftGSX3Md
 TOxRA0xGooWI0H1H7juAeiFGfhWjbb6gvp9mWsNfMtLdQdRTukrKoZQDacrhP6nlBj
 Dve62aSwiUqaQ==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-21-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-21-chun-jie.chen@mediatek.com>
Subject: Re: [v3 20/24] clk: mediatek: Add MT8195 vppsys0 clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:19:53 -0700
Message-ID: <163165799301.763609.10553027877067193825@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151954_748336_2897E200 
X-CRM114-Status: UNSURE (   5.12  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:29)
> Add MT8195 vppsys0 clock controller which provides clock gate
> controller for Video Processor Pipe.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
