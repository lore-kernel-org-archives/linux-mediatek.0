Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D3AC35274
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 13:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Zjm1E8KT2bo3QvUPaqEY3WUWOCnZ6CMxur5aILLxzU=; b=SbMJN/mcSERq+IEoSqcR59ubGL
	fMFD0xf00MIGl7o6YZ5RBlK3pMoo6F3fiD7nkUycVnxluxcJxal+kLr9OYdZyi0Gn4msvf6OvimTD
	js8pCFPhmOVhnMct9kr+++Mw84iAqZgPhgaizM7/R3FKgrxj2AycrC+K+sYrQq0yfR5piUTR5IIzd
	BSEqo7q7mvKhsz9GvmusI7DAMtKD/+lZQaxsU+B/+YKgw3C3Xf6tESD2u4uOamFJIP7eNDKYVzrJ8
	+8vqoU7v8JIHnhmTd8LFvctJLPUbLpZFq+nZIP5yJabu4NCUU/BvxzN98A3g7kmPKoUOyu8ES2voR
	Y1sp7+ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8DQ-003MvQ-0O;
	Fri, 15 Dec 2023 13:26:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8DN-003Mtz-0J;
	Fri, 15 Dec 2023 13:26:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5D22BB827D8;
	Fri, 15 Dec 2023 13:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36AADC433C7;
	Fri, 15 Dec 2023 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702646810;
	bh=00ZkD0cu7HBjZVGkRek2lsYzXAxF35Yjjr+hicSHu5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1Yo+W8ptX+67SOYAVONFRcrHI+q2aCFD7vEjWVSvPiznqrNEBN0RX7AuxQA8Fq9o3
	 JJ3FNRJdXfsJ1lSkc+ATqb8/6/Ogg1HVpfhKJNCDv8PhCin6QqABrwy3PGC7WSyanW
	 q3/sJsi8ph1KA5HU1TJgqgS1QPZxq8wiwlyCJz+Q=
Date: Fri, 15 Dec 2023 14:26:48 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org,
	linux-iio@vger.kernel.org, netdev@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1] treewide, serdev: change receive_buf() return type to
 size_t
Message-ID: <2023121535-coveting-destruct-f567@gregkh>
References: <20231214170146.641783-1-francesco@dolcini.it>
 <ZXs94Mf1eOMCmGpT@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXs94Mf1eOMCmGpT@francesco-nb.int.toradex.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_052653_275995_3822EAEE 
X-CRM114-Status: GOOD (  24.10  )
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

On Thu, Dec 14, 2023 at 06:39:44PM +0100, Francesco Dolcini wrote:
> On Thu, Dec 14, 2023 at 06:01:46PM +0100, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > receive_buf() is called from ttyport_receive_buf() that expects values
> > ">= 0" from serdev_controller_receive_buf(), change its return type from
> > ssize_t to size_t.
> > 
> > Suggested-by: Jiri Slaby <jirislaby@kernel.org>
> > Link: https://lore.kernel.org/all/087be419-ec6b-47ad-851a-5e1e3ea5cfcc@kernel.org/
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> > hello,
> > patch is based on current linux next.
> > 
> > It has an obvious problem, it touches files from multiple subsystem in a single
> > patch that is complicated to review and eventually merge, just splitting this
> > would however not work, it will break bisectability and the build.
> > 
> > I am looking for advise on the best way to move forward.
> > 
> > I see the following options:
> >  - keep it as it is
> >  - break it down with a patch with each subsystem, and squash before applying
> >    from a single (tty?) subsystem
> >  - go for a multi stage approach, defining a new callback, move to it and in
> >    the end remove the original one, likewise it was done for i2c lately
> 
> whoops. I just noticed Greg applied commit 475fc6e2de6f ("tty: serdev:
> convert to u8 and size_t") that touch the exact same files without much
> of an issue.
> 
> Probably the "keep it as it is" is just the way to go.

Yeah, looks good to me, now queued up, thanks!

greg k-h

