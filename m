Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DFBC55ABD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 10:19:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11E9920684
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 10:19:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lKSqnRh1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjmKBgS8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11E9920684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=noNe7Af0swSyv/L6vI1/5xsiIvhdEI+Su+TWNP/Eb14=; b=lKSqnRh1Cs1D2eqTq1Clupfob
	GdEJlIHx3BVOFKSW0MvMkUNUA4bdtDTa4fW4t0BLq450cs6VR9IyUt1M74MtgOT5uDXb4T/sU+cfx
	b6LOgxbdC70RHRl+zHOUjFfxAKfzWbBVnWJWCKjKgi2XV21uo75FJnrcum9IBBurDYtQUpgPB7e8d
	Yl4TNVjOr69H/kSl9HESgsZI4lxQV3II++j1zPsNoatedcVuch2GGwDZs77g/UQLXVQdkDTo9PA88
	fhP3+KPL4wMNGiUv2KhGrpfDuwYNYVA6dzJsj7OnzXOdzL7/WQ7b7L1Ae8xBFpFtOOx4DGie29/ny
	SDx8eNVlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc4Gy-0006Y5-79; Mon, 09 Nov 2020 10:19:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc4Gu-0006XN-LD; Mon, 09 Nov 2020 10:19:37 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC70020684;
 Mon,  9 Nov 2020 10:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604917175;
 bh=ujdtjONW6IMNC9nuw+sGKzRyA8g09Lt4MGCnjePFh/o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fjmKBgS8WrHpIl2O8dJ0a8cIhDE1OYrlZzMEZclXByLig/MGB43JCIt99psN3y3U/
 3hvOTQA1fPAGyHz69hORtqMSiZz5n0ikDRW1hfiITnK5Qpzv9+CogDs8f0k7hgNwdh
 rF0Ia6SgNh0KdwUNsqJRXV+bQXNK8XyQMN2WYvKo=
Date: Mon, 9 Nov 2020 11:20:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH] clk: mediatek: fix mtk_clk_register_mux() as static
 function
Message-ID: <20201109102035.GA1238638@kroah.com>
References: <1604914627-9203-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604914627-9203-1-git-send-email-weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_051936_798307_64E70D06 
X-CRM114-Status: GOOD (  10.78  )
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
Cc: srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Owen Chen <owen.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 09, 2020 at 05:37:07PM +0800, Weiyi Lu wrote:
> mtk_clk_register_mux() should be a static function
> 
> Fixes: a3ae549917f16 ("clk: mediatek: Add new clkmux register API")
> Cc: <stable@vger.kernel.org>

Why is this for stable trees?


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
