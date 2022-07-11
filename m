Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A0AC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 06:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HDuEgq2FUEhXSTE+lf6ONXSJYSYS3T2w9KcPw52uiY=; b=EeFCtQSvQqYOeXquIkb3xXv3oM
	UWl1pIdFI4WZieFYX5lNDjh50VbnNQ8J6IkyR9rtg+I82z2/qyxrg2GBf/uehNatalZZVSCqLY/H6
	L9HTuoXfPY8+ePHxj8TSurbVh3XxIEZat4aym3ThP+Em02+EFyc4t9uja8Uk+UMzPuS+pyPclIRKl
	qr0bu7LzRoyYoCYzH1a3MxUZkHZaj3IO7szEguU5P3G2ZUEkTmm/hcsAVVZRScKQC7pvDpt+YMhCn
	JRZkT6mnXY+87LX7WuQvUvqK+LCgNBCSSnQEMKfIQiVtjuJ1EFhjjynpWoKd4/1WO+Tl+yq9beLjQ
	O9T1BbCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAnB0-00GVM8-5a; Mon, 11 Jul 2022 06:45:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAnAp-00GVGJ-Ev; Mon, 11 Jul 2022 06:45:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A79016120A;
	Mon, 11 Jul 2022 06:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FB0C34115;
	Mon, 11 Jul 2022 06:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657521938;
	bh=Ovz0oMFCzUxed5tqrGHDygD5Uxy+oLIyQGwPoBJ7dOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vIhTM/WIYvfvFd3tYQZQjY+xMo39WcW5td+wL9IHZfdBZoz6Mpp/KwcWBMhbSh8CY
	 BvvQslaCEuWXbxaAkzC5+kxiZfadf4PAtdt17djEL7vZauScVSbf9bmRL9lS7ANnDQ
	 0gFHD1g4lCPL6vrluOhaNzNMyAzzR3UvVun+O0eQ=
Date: Mon, 11 Jul 2022 08:45:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Felipe Balbi <balbi@kernel.org>,
	Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH 1/5] usb: mtu3: fix coverity of string buffer
Message-ID: <YsvHD6dpU3O7gQD4@kroah.com>
References: <20220708071903.25752-1-chunfeng.yun@mediatek.com>
 <YsfcFXtkDxe6ndFT@kroah.com>
 <9bbc0472bafa6116618e9861c3566d470c30c619.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bbc0472bafa6116618e9861c3566d470c30c619.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_234539_564348_5FD1C349 
X-CRM114-Status: GOOD (  12.24  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 11, 2022 at 02:39:10PM +0800, Chunfeng Yun wrote:
> On Fri, 2022-07-08 at 09:26 +0200, Greg Kroah-Hartman wrote:
> > On Fri, Jul 08, 2022 at 03:18:59PM +0800, Chunfeng Yun wrote:
> > > Use snprintf instead of sprintf which could cause buffer overflow.
> > 
> > How can it cause an overflow?
> Maybe I didn't describe it clearly, this patch is used to fix coverity
> check warning of string buffer, in fact no overflow happens.

Then perhaps the coverity warning is useless and
yet-another-false-positive that that tool is known to spit out?

Don't make code changes just because broken tools say to do so.

thanks,

greg k-h

