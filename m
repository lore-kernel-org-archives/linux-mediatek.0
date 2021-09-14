Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685C7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:18:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A2466115B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A2466115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7S8aUScs8XwkHUqxyCntNmjPSva68lB0m1x99oPF3n4=; b=gZ8ih7OhkWD4nU
	iUATrFGYjDoY8p0haGsN+qrjr54x1oYBLqYTeraFwpmR7vKUXNdSmH8ASJCdhs7AVujFsJsPcvMsl
	jXF5w5gRBDYBxGPtU6S9sBTCeCbyF8KoubhKkcJ6YcvoWu3vJRLWeBsVS5SyhkyoMQ3+j8PshyJDy
	SsmiIYm/DFC+YgLBVZLReGBiPxbZcYVIQCrQqnsmqVa66+KcjKhnJEmTWlb+fWEJ39nWpVx5IF9CL
	Jb88+U/viPL1H7d1eMlR0duPvgwe7Tjp3jDKuHXYNq1tXcWDQXisffylYrxoV4TtZVHhEAD66v6xo
	kZzeDHabytI1ojI+fd/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGkh-007Is7-Hu; Tue, 14 Sep 2021 22:18:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGkQ-007IoJ-TH; Tue, 14 Sep 2021 22:17:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72F8861164;
 Tue, 14 Sep 2021 22:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657870;
 bh=H3LVFe3o74JDFJmwzbvvC8Hema3SZT1AXDwvppvUE5M=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=eJpdHrDbnx+3vrF8pnM6ntrAkPZb4titKQ40xqM1cji/VUseuBpY6tGyfgqIBf9U/
 9KNAy7z/fuPS8hTly36jaW593KK31wnHezJmIX5Ynz8mhxabYUO4gi1qu0GEgigLwo
 Jv7VZgRIc4SpN++K8SdJdCx+w8/nDM7SFGDLB7qwuN10Naig7QdcnqDnIN1mhExSP0
 AVwwsaCSUHWUC12gusEKs3vG1Zo1NihduV2EtFsaQLhESKpryQ9uc5Qp8UULHDyie3
 x3qghHo7aiI2fOxs4FKCsHLkYYXe7q0VcQPWxWOeRO5e1caGwAORHiC9LMaqwP0Chg
 Cf+sEk1WED8AA==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-2-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-2-chun-jie.chen@mediatek.com>
Subject: Re: [v3 01/24] dt-bindings: ARM: Mediatek: Add new document bindings
 of MT8195 clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:17:49 -0700
Message-ID: <163165786922.763609.13079852242605675480@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151751_020073_EA384A0E 
X-CRM114-Status: UNSURE (   6.74  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:10)
> This patch adds the new binding documentation for system clock
> and functional clock on Mediatek MT8195.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
