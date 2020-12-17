Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B92C4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 08:42:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 388C42388B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 08:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 388C42388B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=65L755BCjLQzBtTrAF3KYbvGsS4k1HPL6207dPSGTfQ=; b=nP4lWjEQF/qAJ/KdR9ft6XAse
	sJGlDuLq44PjI98go3YhLpaeEyphV3hH9jT5MhVJLCQLbRS2xLMnhRrCBcF42Ybzitdvu7kTJ0MEp
	gQRksmM2bsvE8CiDeJF5gYby62ZbDe48zWFgd0yD65A1Xk2vbTH9vD47KX4ARyGDwbUKJDJ97DJ4v
	E8d6DYK3ZLanAiRE1eH2xdjeAmiyyDgVDnTd2dJPvaoOMa7FZjiBA0d1hbCSYJfXliW95RIrQpEYl
	LCugrWSKcefUPQS59jxGMMxH43W96sZhvF6XNOu8oIUBzWwy7ONe9a7jfi4fyxBi/gUNy3ndjCF3Z
	NNx9cOKbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpora-0004x2-Km; Thu, 17 Dec 2020 08:42:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kporU-0004uO-Jk; Thu, 17 Dec 2020 08:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608194531;
 bh=K5TpauZ4unbflmWR1wNk26qVBnFQLI8jNAWmDDLGxaw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Zo3fLIi50f3ruUiwUn0Kre3b1yecBzjdOvaWXxPG+e9FnyM4UFcFpa2CWh5a8JcVv
 +2/CI7j6S79OabM2VklORgz1neZcvOUOeknYcvGnL9+DD6/fh4GCSV3G1JyQj3QvRk
 hfJvQ6bkJFLLrHSGrE9wGiF1XTP76iMbgTPuLFYUuuJds7XYopccySkolFaV0ULmLv
 Np9g4prSycYyXkOPLdsri71ZPPTVUo9XLWkRw5W/2foK0Qmj8o5Oy5Au5Zqy7jDSOv
 JmG4KoI2u4AgK2bLJcFChBXse1vZh7UY8ZyA/TyCnEZPuh4KpC7dnfQVhUqAlAznak
 Bx5l8h3AvZpYA==
MIME-Version: 1.0
In-Reply-To: <1605256192-31307-1-git-send-email-weiyi.lu@mediatek.com>
References: <1605256192-31307-1-git-send-email-weiyi.lu@mediatek.com>
Subject: Re: [PATCH v3] clk: mediatek: Make mtk_clk_register_mux() a static
 function
From: Stephen Boyd <sboyd@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Date: Thu, 17 Dec 2020 00:42:10 -0800
Message-ID: <160819453018.1580929.7663364756931158614@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_034212_751754_F9C8DC84 
X-CRM114-Status: UNSURE (   5.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Owen Chen <owen.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Weiyi Lu (2020-11-13 00:29:52)
> mtk_clk_register_mux() should be a static function
> 
> Fixes: a3ae549917f16 ("clk: mediatek: Add new clkmux register API")
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
