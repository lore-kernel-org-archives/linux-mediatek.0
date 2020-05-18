Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D774C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 14:57:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 208DD2065F
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 14:57:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JAe1+Nk+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 208DD2065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSLqbOWLhvZLIja6u4KTllLFEGCtJqPtfLTvOupzKFc=; b=JAe1+Nk+tUR2SY
	52tR0c3hBLS6H42yXfEqrAB2lZ5PCP0F5NGA7jffYZ1wEUL25QzDNMVzX3X8IACbO+DpFvbCu5L3g
	+9GB943GQnvsZqf6jmZfGbAPj/qN9dk4eV5LLXyO1uLG4yD50Pikm4zlyRhBiKyVlvOdR9bgUhJP3
	A0nX/9OIi/olwCYsu3BodjY6vQaT3gDLQRqgl+FqSHkicStbwXoxc16iO1z/Ge75iSMk6+94/DgcJ
	clp9iZkTofrChoJ3KFBUgOIicXcjLUw4rq+NKLl0D3VBsetV2UNYYJgnGqVtnlznQSZpq9IbUvGtk
	JPtl1UsKh8YW/b84TBgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jahCR-0007gL-EM; Mon, 18 May 2020 14:57:03 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jahCP-0007fe-BU
 for linux-mediatek@lists.infradead.org; Mon, 18 May 2020 14:57:02 +0000
Received: by mail-lf1-x143.google.com with SMTP id 82so8347990lfh.2
 for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2020 07:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=py+NSpkp68bZvDketQ0LHFlU7cQ4OapcQ54P+6JzKs4=;
 b=hJ0W2sY6xY4h/4yPcIn+IueZcTnRcxkA1H+TTx694Z4BSYqsTLKp51KNvTyzHQRPW3
 Uu3bD7M3M0+vMTF7l00dL8VThyImgbjwNx/k3j9DMECaxKfrlBBLXMGrlVUICk7s5W0h
 n1fisBGuhuQNl2zIOagLrgFtrXVQ2UuqDOjruYzumbRgq5bcQIs8naign6KqN/IOyJOH
 BiDegZdQB6If9lZYWwn1ebh2w3LxvbMzWunzSJQd5/m+W+0LX2KnaU6R1Xd42I0sfC8L
 0jzuXDj4lu65yK0ShTbILhihWZYVz0pKS2birQkBH84vwfPi3fO8Cl2QcTHiNsaUQzRy
 qRWA==
X-Gm-Message-State: AOAM531I1nCes+xRkw38M2faLyyN6ukZm7iJVZBXpRzKVfg/jFaCwRIk
 zwcDSceOWtdLJ4V07VsPcds=
X-Google-Smtp-Source: ABdhPJx+XZWZVGWM9nNpq7eb8MJwagwl3MdlS+Oya7jXIfgJ6ix2JYoNLOYvub/lc0afK3SzKDkuUg==
X-Received: by 2002:ac2:4105:: with SMTP id b5mr12178529lfi.94.1589813807316; 
 Mon, 18 May 2020 07:56:47 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id x10sm3000527ljd.25.2020.05.18.07.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 07:56:46 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1jahCF-0004MN-Vd; Mon, 18 May 2020 16:56:52 +0200
Date: Mon, 18 May 2020 16:56:51 +0200
From: Johan Hovold <johan@kernel.org>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH 1/3] serdev: ttyport: add devt for tty port
Message-ID: <20200518145651.GL25962@localhost>
References: <20200506072314.112409-1-tientzu@chromium.org>
 <20200506072314.112409-2-tientzu@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506072314.112409-2-tientzu@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_075701_389117_4BB5519B 
X-CRM114-Status: GOOD (  12.22  )
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
Cc: robh@kernel.org, changqi.hu@mediatek.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, long.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 jslaby@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 06, 2020 at 03:23:12PM +0800, Claire Chang wrote:
> serial_match_port() uses devt to match devices. However, when serdev
> registers a tty port, devt has never been set. This makes
> device_find_child() always return NULL.
> 
> Assign devt in serdev_tty_port_register() to fix this.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  drivers/tty/serdev/serdev-ttyport.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/tty/serdev/serdev-ttyport.c b/drivers/tty/serdev/serdev-ttyport.c
> index d367803e2044f..9238119173a47 100644
> --- a/drivers/tty/serdev/serdev-ttyport.c
> +++ b/drivers/tty/serdev/serdev-ttyport.c
> @@ -267,6 +267,7 @@ struct device *serdev_tty_port_register(struct tty_port *port,
>  {
>  	struct serdev_controller *ctrl;
>  	struct serport *serport;
> +	dev_t devt = MKDEV(drv->major, drv->minor_start) + idx;
>  	int ret;
>  
>  	if (!port || !drv || !parent)
> @@ -282,6 +283,7 @@ struct device *serdev_tty_port_register(struct tty_port *port,
>  	serport->tty_drv = drv;
>  
>  	ctrl->ops = &ctrl_ops;
> +	ctrl->dev.devt = devt;

This is conceptually wrong. A serdev controller is not a tty class
device with a corresponding character device.

It seems you need to rethink how serial core should handle the wakeup
flags with respect to serdev.

>  
>  	port->client_ops = &client_ops;
>  	port->client_data = ctrl;

Johan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
