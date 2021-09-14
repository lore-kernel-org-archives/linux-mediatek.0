Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE06C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:22:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CAA061184
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CAA061184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOPIda6bZPTejjjPZM2XTzl7STqhAntHvd1QDZ304eY=; b=PAKoSoVAu8r03h
	uGUMjOR1JXkO981stsP9LxbuSNpW6+SM2dGGE4h/2A7O8zRWScVhEhpUvQPcG2KDzIHSr7diDoMYC
	JOLUWMM6FHP9ez5XJIjlr7XfJ/iDNnSsTyw7mDQkwuSjZnKD5ZyNQu7e3k/NzdwABlAt8bW06IFJU
	xYWIChqor6folGFMG7EUZY3OogYVhWNehoGv/x8sGwbG3nIptgIrhouC+alJTKv7f65yQYrEMFp6o
	Jc/jouSogs+TytpivAG5LIdj0TJBHw5qXyQPxIs8p+DZAwq4t3YBrP9E63Rd9DdAFD9TQ2q0q6ErV
	cLyLhM0SmeNqPFl46m8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGpF-007LNA-Gl; Tue, 14 Sep 2021 22:22:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGlI-007J7N-O8; Tue, 14 Sep 2021 22:18:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 543BA6115B;
 Tue, 14 Sep 2021 22:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657924;
 bh=01uS6VKFvnOijqMcf9pn5juu60oS1v80Mb/+F+Yu0cY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=M1D7z/GiyWf7pviaz/6UmuBgvaZUSnzu+Dq9epmIBdKfvpMTVqEFngkgldvRs3JhG
 W2oj4LTs7LbAL3jDO23Jys3CyBHyPbf72bhE0pxih3aEj6ppS4YlFbi3vXN7N4ZrIq
 HisLaYA6LhEZ1jnY6nmcQROEDWAJ4HF8jip7GRbLNzujfesaP/d4Dw7OVLJqtE0r0m
 lJ28k0eMZJStScjAe8+m+JCdk2qAyiIuiSnCeh/n75BKMJMkLQKlQIRUCacrIWHuCJ
 ytF+G1kqCBPW9Dr/tznibcDm7iuUIKmB623s3N3BrRtFazv+yiMcKPlOqAb42DZ9yi
 LmA8qEBNs1CSQ==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-10-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-10-chun-jie.chen@mediatek.com>
Subject: Re: [v3 09/24] clk: mediatek: Add MT8195 infrastructure clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:18:43 -0700
Message-ID: <163165792313.763609.7788460119459873369@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151844_848577_2174A41D 
X-CRM114-Status: UNSURE (   5.44  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:18)
> Add MT8195 infrastructure clock controller which provides
> clock gate control for basic IP like pwm, uart, spi and so on.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
