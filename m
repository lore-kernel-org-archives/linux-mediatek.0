Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30756C4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 09:17:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC0A6238A1
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 09:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC0A6238A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MZvjsj5/Puxow7zFeZdE9QW2HsEyujNpqzd+oKC84Z8=; b=GdqOcTwg4yS3qgId8R07hS9G+
	bryn/qRLcU1Pr7t1NCOqL7ZgLr7dyKwhkO5ZbeD0qWwLX9+IXRk//+Z+G6SpmxxTfZHEYJpkMuG5y
	i3QM7Yp9rX2b4KGvxsC4Mwf/vD+t/TsbAUgGbyU2IOmWoXLPRV9dgyRmz1iEGGtojiGaYDI6jbu5J
	wgRDENX/vM1YszdN6OoUXjRSi+oRoLDppCCYEdvgNEyfbCgkVY1rGedpMk6lpKZ52ZLgTHSBK6h1A
	+Zv5jn7kqmphChBCuObi3PFgxn52tiwC1Da61fqpd7KkyoIt62AJwHJOJla9Lqea3uFDJmH4K5JLl
	kJaN8TlyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kppPQ-0000YE-NI; Thu, 17 Dec 2020 09:17:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kppPM-0000XN-UZ; Thu, 17 Dec 2020 09:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608196631;
 bh=R6g6Z0pwtVwhv0Im1uYbyUOKndQuYTxtS1kTz8w3CJc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=O7Gyw1jcbJ/CpfCg4hWz3ZMw2SrNWUG/iITAIjuCC3tTZrMT6GXLS1c4sX58hOSqL
 unTtatDjyR7baUfWju+DhrS0Oak4C+arDvw+T6AWRhtmcvxi7vhh2qqoKFQreOgRQ1
 Nr44KiMSug9KTA+G5psEtpYcvgWArij2RPcA5NvpTTD3Ekb7G2qeCQcOJHUsrSxO3H
 w4TTIJvvXZzqPeNMXcy7Nn1m1Sd/9cZNK1ihR0inU8vQkF0NthUyHnoBQoEQPqRbwv
 3Y9YYSrYliYV0ZlGINCB7vyuFaL5svd2o3LY/gYlH9IJzGVoTxfnRoFeDh0Ut9gctf
 EXTx7aSuD7qtA==
MIME-Version: 1.0
In-Reply-To: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
Subject: Re: [PATCH v2 00/13] Clean up the pll_en_bit from en_mask on all the
 MediaTek clock drivers
From: Stephen Boyd <sboyd@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>
Date: Thu, 17 Dec 2020 01:17:10 -0800
Message-ID: <160819663020.1580929.10943444401319221382@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_041713_060665_4DBDC0E6 
X-CRM114-Status: UNSURE (   7.42  )
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
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Weiyi Lu (2020-11-08 18:13:15)
> This series is based on v5.10-rc1 and
> [v5,07/24] clk: mediatek: Fix asymmetrical PLL enable and disable control[1] in Mediatek MT8192 clock support series
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/1604887429-29445-8-git-send-email-weiyi.lu@mediatek.com/
> 
> change since v1:
> - add patch for MT8167

The last patch doesn't apply. Also the whole series is base64 encoded
and confuses my MUA. Please resend.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
