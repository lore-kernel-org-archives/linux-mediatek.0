Return-Path: <SRS0=kVE3=AW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2087C433E4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2020 16:27:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1A45207D4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2020 16:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lr8EWlWK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="w/AS+ZTG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1A45207D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FsXuFiDeoiGs+k7QBtloIxJh0vrtJP8DMRqqe902wVc=; b=Lr8EWlWK6aLwtDxKiXfIHODrv
	Nh8fzNcusnQV1p5FQmtWiyIr/xE+rwqaq+zkZQsTi2W2/dg/caDsABoyM9554uqlbHRpc+flnXPqC
	MBF9vp+SVNf2hB5cFObVTHJNWiDtktAijPIv3xusnIPGpKFo32LhwU2zZHZ+Tnj3cX2pB47ePtga5
	BP4iWCqKkJq11v9llWdcVkRfZKPyPnvGR/zZsjjxbQ/JGk91nduTzZKHkmzmAyRiLITErdwxpxIpm
	MzXZ4FT5/OERUHz+o8XubDIJtpt+KndKdheaEdiAgyM1SQC5ST4vej7QMuYge5QpQrGfKoGf0j26e
	gIbNRBPFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juILA-0002sw-U3; Sat, 11 Jul 2020 16:27:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juIL7-0002s9-SV; Sat, 11 Jul 2020 16:27:02 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3EC81207D4;
 Sat, 11 Jul 2020 16:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594484820;
 bh=QdgmgyHsnWWDRikFOV9j9mPiLF+83cg5Wvfr+sH5Lko=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=w/AS+ZTGMx7OcgcjAco9fdtofh9wBp2cwTzG22wFz37i3qsrhrhAp++/4JQjUIWrX
 IHlAiTjXnZsEnNJL/4NaXIGIexggdDWHSCSpwG30E/QJfIMKT9iqVFDxL5rSUaHlKu
 Bg2fGzM/Obu3PjTbDieHbM8zXyg/QUO5Lz3S0ypk=
MIME-Version: 1.0
In-Reply-To: <1593588382-19049-3-git-send-email-wendell.lin@mediatek.com>
References: <1593588382-19049-1-git-send-email-wendell.lin@mediatek.com>
 <1593588382-19049-3-git-send-email-wendell.lin@mediatek.com>
Subject: Re: [PATCH 2/2] clk: mediatek: Add EXPORT_SYMBOL for kernel module
 support
From: Stephen Boyd <sboyd@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 mtk01761 <wendell.lin@mediatek.com>
Date: Sat, 11 Jul 2020 09:26:59 -0700
Message-ID: <159448481956.1987609.4970524569331045099@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200711_122702_001647_EF776E0E 
X-CRM114-Status: UNSURE (   7.25  )
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
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Wendell Lin (2020-07-01 00:26:22)
> Export common APIs from Mediatek clock driver.
> 
> Signed-off-by: Wendell Lin <wendell.lin@mediatek.com>

Is this needed for something? I'd prefer to see some sort of mediatek
modular patches that included this patch in it before this is applied.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
