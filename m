Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4579DC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 12:29:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3498619B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 12:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3498619B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uTsGTzYGRza8t+qlA8hFlbE9+f2NdvXY+j1VZDh+F6E=; b=bkSlU1ccHeqX7R1FJSPfq3gMH
	rPWNmiJqGC/9YvU/jAjkma+X+//Wv4othp2dJsA2YroBF1YF4+W9JHULkpyvTBuq/1ehDLbaJ906w
	mjMo3bfUUV9EtifARAxysB8KMsxrkgyReSTHXKD8XtXwNJ5uTE4S/YXRKvnvVnAQLNmV+jDI96x/J
	lueFy26AfUNDR+LQzuGmNL4UaG4MWBJdAR2WxLaCmBNnQi0e2q78Fcr3RtK/z0yNy/Dw4yp1Hk3ER
	xyVsxceYTwcmxqYcGy9DcWUAio3MDGTDMbbO2sv3aXEixVEyiCRLFlIX2wTnxHb5Iy/ggJy/AZsfV
	vxAy+6zZQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOg9w-00Exf0-MX; Tue, 23 Mar 2021 12:29:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOg9l-00ExdL-Qs; Tue, 23 Mar 2021 12:29:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FA2D61931;
 Tue, 23 Mar 2021 12:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616502547;
 bh=afEw5y8ZIUORMbnuRr1rExjsMs7f6XInz5bFs4zNxZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YMw+OIF5fnt72yaWF4Y9ZxmaCZRLKiNAH8AAXM8pgi9dpWgmDQU9y8ZWeehCjTiaL
 0NApS562xcXw1HD7XqpImblhiINdsFZftUM3bPqC3IiMvp5EsarDNkMPXa0+7W3SYz
 NaL7V0oSqREsxOYZDRKTFMtktVRgxZ1UTTyO0oiM=
Date: Tue, 23 Mar 2021 13:29:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: caizhichao <tomstomsczc@163.com>
Cc: matthias.bgg@gmail.com, jirislaby@kernel.org,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 caizhichao <caizhichao@yulong.com>
Subject: Re: [PATCH v3] tty:serial: fix spelling typo of values
Message-ID: <YFnfEaaM8R5vlUhy@kroah.com>
References: <20210323115327.1199-1-tomstomsczc@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323115327.1199-1-tomstomsczc@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_122910_211533_1A50104F 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 23, 2021 at 07:53:27PM +0800, caizhichao wrote:
> From: caizhichao <caizhichao@yulong.com>
> 
> vaules -> values
> 
> Signed-off-by: Zhichao Cai <caizhichao@yulong.com>
> ---
> v3: use full name and capitalize personal name.

But now your From: and Signed-off-by: lines do not match :(

Trivial patches are best learned in the drivers/staging/ area, please
try working there before going out into the "real" part of the kernel.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
