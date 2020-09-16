Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E71C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 17:38:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19CD720708
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 17:38:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H9JBENob";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0QHBVY1k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19CD720708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oQ0l1ozHuIAPFypyrKQ5SHQZwKjXxSVYtfHnAbOpDcg=; b=H9JBENobV9jBuLX/qCNfEJRg5
	biMMzV859lXsfw7isW2q1du99uycHtmUYoQMTAnj2IjQP/uRfB/s/GitFeDlseMcxUYx1VhAlWrU2
	IH3jnSi1AmIJo+U2r3ZHURG18ZoltRMlgh8nMjbE9nEnifOVBxKxHiTZ7A5hdF0Q4IqejoyoZY0p8
	cMLyuDDTWR6bPbUjQpV2v7Ce35ZPVcl60jR4jnLvuCVknhSuda5bApz2iVIxJKAsQj7WbEUPi0DYG
	fGt4FauyToJM74cLBpMpB3x/XkYPswOHdeqsplh7aPdotXWvZKj3QGv6Az6jRuqXKKPOe/VaMZmFl
	TeOPhZveQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIbNu-0002Vy-1A; Wed, 16 Sep 2020 17:38:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIbNl-0002Re-FW
 for linux-mediatek@lists.infradead.org; Wed, 16 Sep 2020 17:38:17 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 69DA620672;
 Wed, 16 Sep 2020 17:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600277892;
 bh=T8tYVDP8vYL3zSWdyAYaRjsi3VZOcNV3TAge+s8PUOU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0QHBVY1koqMLfZailt+SFVSodB2A3eMh85e1FH2OdmGNY4DDdCeUt/Vdn/7AHKTT4
 y/dAXePOAX2ztYNmnhpv6JZa4T90nQZZvdjwiFln4a87ZXR5N7yEkDwAgIMyYYrK1/
 XB4dKtRp6HbbJVr0sfK9LoEB51Pp8MlVL641yskE=
Date: Wed, 16 Sep 2020 19:38:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frankie Chang <Frankie.Chang@mediatek.com>
Subject: Re: [PATCH v9 3/3] binder: add transaction latency tracer
Message-ID: <20200916173845.GA3072065@kroah.com>
References: <1599543504.16905.65.camel@mtkswgap22>
 <1599574008-5805-1-git-send-email-Frankie.Chang@mediatek.com>
 <1599574008-5805-4-git-send-email-Frankie.Chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599574008-5805-4-git-send-email-Frankie.Chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_133813_693575_73151B5A 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Jian-Min Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>, Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 08, 2020 at 10:06:48PM +0800, Frankie Chang wrote:
> +#if IS_ENABLED(CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING)
> +#include <linux/rtc.h>
> +#include <linux/time.h>
> +#endif
> +
>  struct binder_context {
>  	struct binder_node *binder_context_mgr_node;
>  	struct mutex context_mgr_node_lock;
> @@ -524,6 +529,14 @@ struct binder_transaction {
>  	 * during thread teardown
>  	 */
>  	spinlock_t lock;
> +	/**
> +	 * @ts and @real_ts are used to record the time
> +	 * that the binder transaction startup
> +	 */
> +#if IS_ENABLED(CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING)
> +	struct timespec64 ts;
> +	struct timespec64 real_ts;

Why isn't this ktime_t?  Is timespec64 really something to be using
still?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
