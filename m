Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37ACC4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 08:55:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EA5E238A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 08:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EA5E238A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+aKKfUjVGSBdo09A4MNBJp3AKUMi03GHI6dyMUuCGmU=; b=CyKJ9gIGCFyrOYLbu0fSutr/a
	mMJNk2LNWlzuFENGKwmbqDEDA8UyF8dxX8+M1kzZhT+Zu9qiYpugPIaoZZBTqMS0S7qrFb6kY3V6g
	QFNCegpA/UE0qiDUhEHmNxT25a09zYCvosGQcZGNSrn2PVDX/Nmhj8bss0krWYMt+7N3X4CRprtre
	U67ZszH+ZFoO5MBVLoFHO5Rw5AbzSzbGj0RRh1Z39MxiuPoVku+xrlQYq4hRTKICWV6ft+HEulIVh
	/1cuwa1DDCEfST3U+/DIr8VEXfWO/If/nQL7mJlAOMQZDS1/pQTPNylB0q/zlNqMTCNxRc7Vz+LX8
	iJQhoT+fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpp4X-0006jb-A2; Thu, 17 Dec 2020 08:55:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpp4T-0006ip-VR; Thu, 17 Dec 2020 08:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608195337;
 bh=FL2t5hhudOLhIx0t130/8vEDyVq+PJWtHbS8rAyMkN0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ZiG+mLQ5A3wW0ghkZBjIg8UDyUXMaOW8bwyNjDHUeNPtJ+mRhSIOmjjITTr+LAgIm
 U8dp2cam+jr/Ae3xi5BMfDUUQ5w2qo+8EFiwtTrPNMpCtZu3XLFEn7HgEc5t8GQZXk
 WKvTwuv3JyZJvVzsJgNkAlEHMP9q6CZhHeIiyEpnDJy9w+f2D8CSon1y/MMEZ9rHxG
 6BI/5K5oZlUm6J6c6iPNTfvRSIocaxdOdeaJOxzgp6i1qM3MOEbiX0rgBgtP399gyq
 knLkV0pXTzSp1/1XMwXfCSh7nfxvn/lhyLP8PUXSViR9TyTcKo+QOrt7LphgV2a93e
 6vnnhPUso0KqQ==
MIME-Version: 1.0
In-Reply-To: <20201209083921.879-1-tinghan.shen@mediatek.com>
References: <20201209083921.879-1-tinghan.shen@mediatek.com>
Subject: Re: [PATCH v2] clk: mediatek: Remove MT8192 unused clock
From: Stephen Boyd <sboyd@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>, drinkcat@chromium.org,
 matthias.bgg@gmail.com
Date: Thu, 17 Dec 2020 00:55:35 -0800
Message-ID: <160819533548.1580929.12545650149091991895@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_035538_103222_D52B9CF0 
X-CRM114-Status: UNSURE (   5.75  )
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
Cc: weiyi.lu@mediatek.com, srv_heupstream@mediatek.com, erin.lo@mediatek.com,
 Tinghan Shen <tinghan.shen@mediatek.com>, ryan-jh.yu@mediatek.com,
 linux-mediatek@lists.infradead.org, nathan.chung@mediatek.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Tinghan Shen (2020-12-09 00:39:21)
> From: "Tinghan Shen" <tinghan.shen@mediatek.com>
> 
> Remove MT8192 sspm clock
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
> v2: resend patch to linux-mediatek because blocked by wrong mail setting.  
> 
> This patch depends on series "Mediatek MT8192 clock support"[1].
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=379955 

Can this be rolled into that series?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
