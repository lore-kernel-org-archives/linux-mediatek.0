Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1379EC43461
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 15:29:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87901223E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 15:29:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pdaLtFiK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FaM46s0H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87901223E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xIyQw+KhLVy/m+ZPsupoXAioc6uVPZox0469ecwRjm0=; b=pdaLtFiKyuqiV90Ait1GH6kNy
	ssCTnE6GGqNg8o490QHlGlNi07bjZwnsuxmorCvHEs1XRd0FouumHJzgtk6PIGIFs7DjWYuzljvaZ
	oxs2i3T7pjLFUoDLi9vn4zfJwUcwBQjmeQuB/+fSdLFVB2T0/39s9iNNg8Edac7puKYnnWbj4SNpP
	4YvBluqM5q90XpLiIM8bxtI5qBvYaF0x78G+zP/vhQ9zcsyTfqhXDDk+JC9Jl56KvaaaCrgRd4bFl
	jPn2TfbS6LP2oylkO9Z607sQTYjcnqFMqxzGdAy0Oj9bqM8iBo74LBqPb38ug/cCVR9DXEMJj7zXV
	xxRoGFYMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIZNA-0008Am-1g; Wed, 16 Sep 2020 15:29:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIZN8-0008AM-6z
 for linux-mediatek@lists.infradead.org; Wed, 16 Sep 2020 15:29:26 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8CF9223E0;
 Wed, 16 Sep 2020 15:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600270165;
 bh=RB9ft3ey0/nl4nE0DnYdgU8sqKfHQq8asR+gs8IID/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FaM46s0HRSvFNiyCY2F3y9EamTmIzQm6/SIxtjUKZXe7dvMUh9haF+027s6z9G0mP
 vP/kizxamSHBXmDps9zNTLCDTVrKLnyx/pnFpTNsjrYHCNpUn07EXZidSQQVKsmJgC
 E1GnpfLRrWT0Xl+o9MWbmX1yK5zeJk/3i0hpyNlk=
Date: Wed, 16 Sep 2020 17:29:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frankie Chang <Frankie.Chang@mediatek.com>
Subject: Re: [PATCH v9] binder: transaction latency tracking for user build
Message-ID: <20200916152959.GA3020510@kroah.com>
References: <1599543504.16905.65.camel@mtkswgap22>
 <1599574008-5805-1-git-send-email-Frankie.Chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599574008-5805-1-git-send-email-Frankie.Chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_112926_330916_26672DF1 
X-CRM114-Status: UNSURE (   9.26  )
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Jian-Min Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>, Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 08, 2020 at 10:06:45PM +0800, Frankie Chang wrote:
> Change from v9:
>   - rename timestamp to ts in binder_internal.h for conciseness.
>   - change 'struct timeval' to 'struct timespec64' in binder_internal.h.

These just blew up in the 0-day testing, again, so I'm dropping them
from my tree.

Can you please fix them up and resend when you have them properly
building?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
