Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE419C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 13:26:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9E9C207F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 13:26:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HSAMRP5t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLYN4dQV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9E9C207F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hf5UnW2n+r9ot3ZvmQFxgj/HfwmYqucN4Q2im/KlTbQ=; b=HSAMRP5tFb78Mun/J8hS8d8AG
	fDGufWgmp61t84AEkmDWPc3BhOVP3gPq+MEmJnHgJXqZ/8wwfTdJiro4eSVjgaWu60eTmJT5a36Gh
	nKjvOWkIq0gLSm2tKZ6uvgl4qaNkwGUMz2PfrRf9ilXosutlsBvUBH26VCp6uZDxnw2bSKZklekqD
	zCKEgrq1t5UXZgj88FmmtcvPhTXy62UPQ5he5IykRuZOtMKPM1R2R4w3469FzWp/Dy/cIjQOt+D44
	edNqq/xXa3DENc76CQHZFKHvu0XvuPMVqOBHdDBIF9lHrp4LNpOAWA1wWewjYX/VM22/FWn5BaSjB
	X/E27jRRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqckq-0007gx-Kz; Wed, 01 Jul 2020 13:26:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqcko-0007f3-4O
 for linux-mediatek@lists.infradead.org; Wed, 01 Jul 2020 13:26:22 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF20D206BE;
 Wed,  1 Jul 2020 13:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593609980;
 bh=+PuAt1GcsWcVCIdMAT4isueNwyuOKhwz5N/3g/TfwlQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uLYN4dQVt/Vf2Ju08hqrAZSstU94sGlP+YeVgHDJVsEAapNbPEIhiORBA1axBTBbJ
 sBYnQPztCertMJJxQQEsyKf5JxbmnTv6RhDra/C9xROCHD5zWzwNkVE+/LV7tE2b2X
 r1V+jnl9LEQIAyBOQ838GzFOd+1q2+HnqWxFr8+Y=
Date: Wed, 1 Jul 2020 15:26:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Winkler <danielwinkler@google.com>
Subject: Re: [PATCH] Revert "serial: 8250: Fix max baud limit in generic 8250
 port"
Message-ID: <20200701132606.GA2363542@kroah.com>
References: <20200630164204.1.I2cc415fa5793b3e55acfd521ba8f0a71e79aa5f1@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630164204.1.I2cc415fa5793b3e55acfd521ba8f0a71e79aa5f1@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_092622_290288_49DFFAD8 
X-CRM114-Status: UNSURE (   8.85  )
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
Cc: chromeos-bluetooth-upstreaming
 <chromeos-bluetooth-upstreaming@chromium.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 Aaron Sierra <asierra@xes-inc.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 30, 2020 at 04:42:11PM -0700, Daniel Winkler wrote:
> This reverts commit 0eeaf62981ecc79e8395ca8caa1570eaf3a12257.
> 
> The change regresses the QCA6174A-3 bluetooth chip, preventing
> firmware from being properly loaded. We have verified that without
> this patch, the chip works as intended.
> 
> Signed-off-by: Daniel Winkler <danielwinkler@google.com>

No cc: stable?  No Fixes: tag?

{sigh}


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
