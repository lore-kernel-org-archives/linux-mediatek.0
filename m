Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B88C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:27:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BE9761178
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BE9761178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjmFBPfORIngolYqIGNBZWPrE2GrL6CijbF9kOnXxAQ=; b=0K+UNsRyBUCe6s
	AlNc9mVE4QLiejoWI+bHh4AZqY/SCl/ZlV66JYlz/pfjvmO0saBV9C+hhC4kM3+t8JeKrgTLuZ33y
	i126hnFjSfZt8bn2+LxQsU0kVcizh+kZVm+CaanamBQ3mta/dx7W3g6u19AA2SNBY872omNfOGI3I
	DaitJiJpw0BiYm2GZX3Xf+O2uo3488qEJaPeAhPE9rPk5P+tsucTQ3MA55HMOkXj8pEe22GYNAB6C
	pOXjGGMrliIfPOYLq9A3WTwMwMluKqU2zieSTm5Hd+ss+p9T1QQsxt5EpiZJZQTcRlpSFrC3QsJjI
	hGjdvbENM+64L4gLVTpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGu2-007NfI-56; Tue, 14 Sep 2021 22:27:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGlx-007JSR-Vn; Tue, 14 Sep 2021 22:19:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 885E96115B;
 Tue, 14 Sep 2021 22:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657965;
 bh=AgMSoy3JfMBRE/ZXBD7mZzhZ6tcZ1mRJ/exmm2fjcGI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=suJR8MBrfojYcQ8oMJamwq0k/7SLzGDP4c2aGsUEEWkRhdB5Nv0wZoIK7xENelsPo
 S4p+Tc3L/8Mw+IWKWYFUtO3wsV2FfwyzRixNlnxuW71ibCGDpoTF0qWnFgo0EH8z4N
 ONAUX6ySYjc3/PR80S6Ep/fsy2zl9YnXB3er6SeeoSJI1NVqYY5zb/evuBuaBXXdSE
 PG3XMCNQcTmiyr80aIRUbZNz1DB7C3QxF7yb9RcOaOUvNIxZVR1vWQ3cF4u2JsYQC1
 XltLUXLiQsKNzxOw/EU16g5paOx6sdaZBPNXLDuQpeMYu2A+LKJB3zKkW6eauBKvYa
 KmbJe14NT9NPQ==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-16-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-16-chun-jie.chen@mediatek.com>
Subject: Re: [v3 15/24] clk: mediatek: Add MT8195 scp adsp clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:19:24 -0700
Message-ID: <163165796440.763609.12268726479643503630@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151926_089520_29B9A5D1 
X-CRM114-Status: UNSURE (   5.23  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:24)
> Add MT8195 scp adsp clock controller which provides clock gate
> control for Audio DSP.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
