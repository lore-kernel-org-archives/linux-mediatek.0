Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE35C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 22:27:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB56A6103C
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 22:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB56A6103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=saCMIF0Jsl7HWWgVO5OG4ysPkDMIXC8efm0tRyPJLc0=; b=COaTGrV62lpKko
	8YzEsAcv1uqCU/9jkU9msWHZpJpdAAzc0HYEsKE40RipCIgPilesW5ETttAYYMMwPxyYVmGbNhBlb
	FTYtk3bYoEuZR0QC/KgD294DUVyJZ1lW9n8tL2IJxcErNp9Uq8t5kFDffbrjex7EZQFcmTmJ5stf+
	uPvhgX2HIS3TaZTTxf5yYhjMsvTKy/IDum8/ahAOOxnJ824kDDoi5/47aIOu+gcPXoVEpil01nWE2
	UaC6KSE7CKlTdDpdpsL49/egS9L1DOS8N4R/uexzDDBcCit9MWsxUP7UFhhO5dTIBtz5TdzvG5lan
	xTM6UuST53qayeQzbpnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi2Ff-0039cr-Mf; Tue, 02 Nov 2021 22:27:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi2FT-0039b4-2U; Tue, 02 Nov 2021 22:27:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7BE9060F58;
 Tue,  2 Nov 2021 22:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635892038;
 bh=RyrQhwn2Vy8Vb4phGtmF7ukr6z7ieGukP6hkFFWFro8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=JhEp31JfEL9iQOgPzny6tMnrj9ohRow/wtpYwdJCiLxARrHmh6vw5gYmuKwYLi39I
 tYTMECMjRxcHmGd9pZvlLSOFVIy7eF21YEvtYNm15Fa309sbToj7PImcBs5fAmD2do
 9yzetaiUFAnR1u8sEvdOXSvOezRhUS+Q1EeTZYLgfsxK12VBQZP+dAGgCZrsynEkQv
 dV7Jv9YfBFAqEwP+CMGjOCybIjNG4VAh+I+t2MFJdQbQcE00P3gxVplFW9bt/oLTkA
 Z9ceH1yNcjO62FY869PLSGGPf/mJC0V/OjCKBnGacGfCryOdgkkShcnl1S6Hx5BpuO
 Ne0eb+X6LAyAw==
MIME-Version: 1.0
In-Reply-To: <20211019062939.979660-1-ran.jianping@zte.com.cn>
References: <20211019062939.979660-1-ran.jianping@zte.com.cn>
Subject: Re: [PATCH v2 clk:mediatek] clk:mediatek: remove duplicate include in
 clk-mt8195-imp_iic_wrap.c
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, chun-jie.chen@mediatek.com, ran.jianping@zte.com.cn,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>
To: cgel.zte@gmail.com, mturquette@baylibre.com, wenst@chromium.org
Date: Tue, 02 Nov 2021 15:27:17 -0700
Message-ID: <163589203711.2993099.290279601118668410@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_152719_158515_7CA8966E 
X-CRM114-Status: UNSURE (   6.51  )
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

Quoting cgel.zte@gmail.com (2021-10-18 23:29:39)
> From: Ran Jianping <ran.jianping@zte.com.cn>
> 
> 'dt-bindings/clock/mt8195-clk.h' included in
> '/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c' is duplicated.It is
> also included on the 13 line.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Ran Jianping <ran.jianping@zte.com.cn>
> 
> v2:
>   delete extra empty line.
> 
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
