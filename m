Return-Path: <SRS0=4tSC=Y7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF31C43331
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 20:11:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DF072166E
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 20:11:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RwUxmi1Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DF072166E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TgMkz1p4gIbTNhzK7fqgBz677vBvaoqj8kfE+E2txsA=; b=RwUxmi1ZSmueq6
	gL21Lv2uUNmOyNoNL7lotGnkcedhy+T9kJ2kMgtAFcGO7s194gDzZ15GTLIMHZ3knuABERdVGCGYu
	SAMwbMgIWQ1RC+pv+j24mLjQ+LDEayJFmaKgyVPMwTKSZKIibRjThMiNIKCktO8NYzXLTsUZEWmt6
	P75psnpeJDzjQrhAMQLYFAD2DPHsaVseoebQogv4/c6l9tEtuEo5Vjh0wr+83guHAn9AxL01477Tq
	h/soIQrNzvCWYgh4n1+1QIPVI26HM4TCyb4ljmw95v33ZRhq0SecZKNZjdbyeMgbbWe1B1VJfB8LT
	PPRTUXV6uioCotwYyUFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSo7L-0003t3-7a; Thu, 07 Nov 2019 20:10:55 +0000
Received: from ms.lwn.net ([45.79.88.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSo7J-0003sW-6X
 for linux-mediatek@lists.infradead.org; Thu, 07 Nov 2019 20:10:54 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id D35BD2C1;
 Thu,  7 Nov 2019 20:10:52 +0000 (UTC)
Date: Thu, 7 Nov 2019 13:10:51 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH] docs: printk-formats: add ptrdiff_t type to printk-formats
Message-ID: <20191107131051.61308a05@lwn.net>
In-Reply-To: <20191001100449.19481-1-miles.chen@mediatek.com>
References: <20191001100449.19481-1-miles.chen@mediatek.com>
Organization: LWN.net
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_121053_243717_072D30F5 
X-CRM114-Status: UNSURE (   7.19  )
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 1 Oct 2019 18:04:49 +0800
Miles Chen <miles.chen@mediatek.com> wrote:

> When print the difference between two pointers, we should use
> the ptrdiff_t modifier %t.
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  Documentation/core-api/printk-formats.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Applied, thanks.

jon

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
