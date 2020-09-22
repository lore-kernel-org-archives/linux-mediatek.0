Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9573C2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 19:56:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76AEC2388B
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 19:56:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="amfqJx16";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCziGGe6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76AEC2388B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s9AbMPIqNb58alXJnP2Kk4zfn4qZVAyacO+7jqAeai0=; b=amfqJx16jJZsPOQHSc5Xie5Wx
	k7l6I8wS6zc0R7Q8e4FUZWmZvmFNPe/YjDJ68pnWhBjHHZYa1+XmrwBGhdoQSqVSyDYzAHVe8tarF
	s8UYKcjB/IMjfUtWYUOggdBUf+7UrT1nlH/EXwz7mxqlhA0tzz6EuAB/+sP/i7dtXyzf3F4GfcV3g
	rzaGlQTnXsNtuMLtR9HSZR/TVRDQwNCjTBE2Ys/y+03e2W8KkVtzVvmAB0Is2n+i+c0TmwKsQNLyG
	j4PAURUaLC1NrJud4dVryGRLljE80KYt0R0gQNTO6u7ncxjxiVMz56umijL3u7tbhj2+CjCZ8Y09R
	nJyFvKb4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKoOz-0007zO-7H; Tue, 22 Sep 2020 19:56:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKoOt-0007xZ-VD; Tue, 22 Sep 2020 19:56:32 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6BCA820888;
 Tue, 22 Sep 2020 19:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600804590;
 bh=q6tNcCWJ6KKNtBVHb8CAdaDosWLH+l1iuGIjDMwYFVE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=XCziGGe6IR46B5iBOPzpfBpKr2zPiO3npHm+nFSj1NmkJAlk4uHmscRr9HSOcngl2
 LiktYFuxgLseqjlDOo1uI3lJnJKnvF5I0SmzgcLKkB2hDBzIArjb2KFMndJPG6sFfL
 yUGV6wyD/f0h4UNH0o4jsERI6UhchQvXzMquSe3o=
MIME-Version: 1.0
In-Reply-To: <20200921082425.2590990-1-liushixin2@huawei.com>
References: <20200921082425.2590990-1-liushixin2@huawei.com>
Subject: Re: [PATCH -next] clk: mediatek: mt6797: simplify the return
 expression of mtk_infrasys_init
From: Stephen Boyd <sboyd@kernel.org>
To: Liu Shixin <liushixin2@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>
Date: Tue, 22 Sep 2020 12:56:29 -0700
Message-ID: <160080458901.310579.5223613357760220356@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_155632_114694_685925CE 
X-CRM114-Status: UNSURE (   7.36  )
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
Cc: Liu Shixin <liushixin2@huawei.com>, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Liu Shixin (2020-09-21 01:24:25)
> Simplify the return expression.
> 
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
