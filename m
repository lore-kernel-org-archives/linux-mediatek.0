Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCDBC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 20:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9wav6j4uAMOhm4n6VzjVy16SyFEsX/ss5tc8UpbNY+U=; b=X36ErKooalqQjB
	PlLerQinAWucMr2I52p/ncizs95ezCsnWRtOUpVU6Erar2Bt26owQorkmkdCSYXDfUftRtEFlTJQO
	XD+u+EzNhbYhk7QAIKZ88E6id4hLSWDuKz7imUfCYrFH8cSSor7AwFeIeW5NrZwQ7ZE2IjyVfB6K5
	RAEGhxQuz4uapBLRdlEov/c1IKYGADQ5BSrN363mrP2d0sEAqocZh1tFWhMBTsODvst8KKr5T32KK
	ygbdd/5nBDi0HPFe5Ei60wFPmrCzRAEgTxijZTC/lSpElZnmihWX9CGzqd0wGTHfz6b1MrCjjq+WW
	YQcqSiSbmIxmkFcmM2Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJh1-002moP-3R; Mon, 06 Jun 2022 20:51:19 +0000
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com ([46.30.210.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJgn-002mkH-Te
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 20:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=Ka1TstOWIq/uwWbI0ltivqnySUBaQmYAJjhs5L+uFtQ=;
	b=LNfDtB4wj+D5BF2YFa+dsimjUyIRcnBqRJuc1gWVJJ2WQRGzCCK2/Fp7XmPd2x8CwqX3VFpy7xGJe
	 /twRS6RP+Jl9wjBLOaLoykj2E48IOEbfGQSxCBTJDrEqg3uIods5z0+kmNkajaDRdqnOrnqSDY4qCx
	 Z7wC90armxFFwKN1QPDnWZwnNU9QUjjxp6CcnFFNY6qKV5fkoqXbbcmEd2CFqPBPXOBt5WDEnY84on
	 dEXQ9z8KV9CJfh/NIDcEZEDP+QyNzhjajPIn+xnm1zeFt7P5A0zYvsCMIq49UUrrPdQ6QUbM0ZlPUv
	 tB3uf3WfVLZng5ZEHrh46QhC9oo7lww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=Ka1TstOWIq/uwWbI0ltivqnySUBaQmYAJjhs5L+uFtQ=;
	b=03czCzu+A+UQWWKkvZaMDlWN9f8keJg9Lub74nSGWSf9HSwJrZ5ek2baj1eWVW6pVVOJ0jqCx4tEJ
	 OkQd9zXAw==
X-HalOne-Cookie: 21ab51b31a6fe080a3deed71589524505420b830
X-HalOne-ID: 5e400a0c-e5da-11ec-be77-d0431ea8bb03
Received: from mailproxy1.cst.dirpod3-cph3.one.com (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
	by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 5e400a0c-e5da-11ec-be77-d0431ea8bb03;
	Mon, 06 Jun 2022 20:50:59 +0000 (UTC)
Date: Mon, 6 Jun 2022 22:50:57 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Rob Clark <robdclark@chromium.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/8] drm/panel: Add an API drm_panel_get_orientation()
 to return panel orientation
Message-ID: <Yp5osTQK+HCN2Ads@ravnborg.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
 <20220606152431.1889185-2-hsinyi@chromium.org>
 <Yp5Ti3ov/fnw0xeQ@ravnborg.org>
 <1c6e4d09-cf7a-2812-fd0d-09a21a275201@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c6e4d09-cf7a-2812-fd0d-09a21a275201@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_135106_209658_EA977E1E 
X-CRM114-Status: GOOD (  13.35  )
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

Hi Hans,

> > Please move this up so it is together with the other get_* methods, in
> > alphabetic order. That is, right after get_modes(), and then this also
> > matches the order in the .c file with is extra bonus.
> 
> The downside of moving this up is that it will break drivers which don't
> use c99 style named-struct-field initializers for there drm_panel_funcs.
> 
> I admit that no drivers should be using the old style struct init, but
> are we sure that that is the case?

There is no in-tree driver that uses old style struct init for
drm_panel_funcs - so we are safe here.

I just did a quick git grep -A 4 drm_panel_funcs to verify it,
browsing through the output did not reveal any old style users.

	Sam

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
