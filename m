Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D630C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:26:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F6D160462
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F6D160462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Wzs/TsWV7iEOwUdYsSWJQ4Q5qK/BhFun+Uixi0BK/M=; b=inulOwwswVO9E8
	NvPSnpkvQjXy0Y1oYUo9xIDaH28mR0eK/4nUvAD9AtinZIBuo3zTcZe0bf5hVPb2bA0YdJjoq8koc
	HOn8D7Z/aZXpoMF1UdqGZH9zQWsxtgFV4TSTP3FKRMI3+g8A9x4hA6evhOMc1+zgTKk3ztA5068Us
	jj+5v1HZqnzl9waTZbm5xpDphocd0fR+ur5TAkEnVTMk/43Wd/PPY0OEhKZ19DIxLtmdpzgU5Oc5U
	ttpPUy33DfBjcoSOMqiLX9wpL1ZTP7xpzOypvm3Hmm7+SGs0vr3wfpPEmX9p8+KxcHPnkrI1IY6/n
	0q3IL+IKvunXXy50au8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGsx-007NDe-MR; Tue, 14 Sep 2021 22:26:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGlp-007JNe-Ed; Tue, 14 Sep 2021 22:19:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F6706115B;
 Tue, 14 Sep 2021 22:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657957;
 bh=yjIs0g9MLXapVPiuBtQEanyGP3q9sN9rXhDmCOR3AxU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=t14Fdj8ft601W5nKoiyo+UsKLvyznGqM7oiNgsvkKZMMAbC8x9V4PfD6Aqj7ZnEBD
 gMwkWiwUNsofKw/+NhmboI5+DKuA+zB42/gt2TvVj75InDj2wkQYmB/bviW210Kmx9
 9oxpS33uFGJhz4kLIUEKy4Jg803+V/ZNVPAidZ4EbwVBsdaaZiihj9kgOKoF6NWZdM
 MSQF+D6T4jgPWqlsL6YwQr0hqeuuCaoF2riXKJgKJbHuPrS2AwU1CrzwOg0RXgxvAA
 C37Ke5UG4/5xh05vBX3U/DwJXJHrPwR1f/IxxYRKjh3bIYIYdGt4Q9jDXVk8br2YOO
 WtsHWZ22EcSQw==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-15-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-15-chun-jie.chen@mediatek.com>
Subject: Re: [v3 14/24] clk: mediatek: Add MT8195 mfgcfg clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:19:14 -0700
Message-ID: <163165795490.763609.14036221868373779992@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151917_542021_2C212C82 
X-CRM114-Status: UNSURE (   5.29  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:23)
> Add MT8195 mfg clock controller which provides clock gate
> control for GPU.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
