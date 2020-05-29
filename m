Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5C3C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 04:27:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C5B720814
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 04:27:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VkF6fFsO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uR/4VKmj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C5B720814
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5FU5l7F6nXqef4mvAaFP16jAYy2By158O5XP6rARyU=; b=VkF6fFsO4rZNaa
	NO64RHZxyl8u23D7vF4OPAa83YV66xL9AIe2syNff6tCvYMUuoEwi3W9xj26Z6T1cvTI4ouwQjmZp
	eVOSpC443gJr1ZTdNsxEp4yHKhtpZ3d2CNEGuRxFPWVf4vbKvE6Jlm8pdvT4n/3VJeOc32ZusypPZ
	Bq/jLLqVW9UEz0BKQ9M1yQarhyGOACljPuAmF1Lw7jb5XACknGF17vEQVYNjlhXu6Ca1tLXqeF8yw
	v8FtrCag9dvWek7tNhn6/+xQ9kW2kyocUhIDx9/26vUuXt7b5KJDNgMz2iGjEkXsnSsS1Jo+Iwbgo
	Rb0T04G8AZLNMIukPmeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeWbg-0005ey-KU; Fri, 29 May 2020 04:26:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeWbN-0005Sp-CX; Fri, 29 May 2020 04:26:38 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F0B7E2074D;
 Fri, 29 May 2020 04:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590726397;
 bh=biY26RlQtZl+eOvAa3r0qNI+95AZPiHE6MWy69incsQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=uR/4VKmjPeu7nUm0lkHtc5fQuVyg9Cv8k9mjBTofLk9uGIZ+gv7NcC1inBtBriBu5
 ydFYWUvxalNlqlw/nKCPjTvH8jWZ1TRiCEu7pDvB5+NSVdzR97iRZSQekgx7ct8aTp
 2NgFtT9YMZWTQ17NB/enzc0fLu2TBOXJ+pMrMYyw=
MIME-Version: 1.0
In-Reply-To: <1590560749-29136-1-git-send-email-weiyi.lu@mediatek.com>
References: <1590560749-29136-1-git-send-email-weiyi.lu@mediatek.com>
Subject: Re: [PATCH v2] clk: mediatek: assign the initial value to
 clk_init_data of mtk_mux
From: Stephen Boyd <sboyd@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>
Date: Thu, 28 May 2020 21:26:36 -0700
Message-ID: <159072639634.69627.7492835408539422310@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_212637_453838_76DB30EA 
X-CRM114-Status: UNSURE (   8.08  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Owen Chen <owen.chen@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Weiyi Lu (2020-05-26 23:25:49)
> When some new clock supports are introduced, e.g. [1]
> it might lead to an error although it should be NULL because
> clk_init_data is on the stack and it might have random values
> if using without initialization.
> Add the missing initial value to clk_init_data.
> 
> [1] https://android-review.googlesource.com/c/kernel/common/+/1278046
> 
> Fixes: a3ae549917f1 ("clk: mediatek: Add new clkmux register API")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
