Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DD4C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 17:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0uzB2tSOvyjjeg6f76hQq+qaT0eB3kXVI5fZEewRTY=; b=QW7glW/IDvLfsNhne6ItaO9duE
	EIyQ/+inwm7jK/CzP5+mTDwNBbHb4O2rDwsHILWs3G/jSYjkVA2Hna3aJsh/qrHydv6vqay6qyJcp
	qgKyTypdhfC5a+CJ37LQqZzSNZwZox9+e8VtN2AVa9pYW7r+mB4zYWPBssMwfgb9caanw1MKbt7mp
	6YDuT1Q0LrAHgCA+WjJrFWV0Ci0DQR6aShaNAbga6kXeX4SrmxHFSFK0eBwFuzWGGUTnQU6fhwkGQ
	AU0XpQNZIdXXFcvJVZO9wjAjCPbSeIcdgcXGrjGnbmF5949hztdmKzU7QvJRWKDLPXaG5nwytJ8tg
	gT/uLTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEBfA-003yfo-2u;
	Fri, 15 Dec 2023 17:07:48 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEBf7-003ycJ-2c;
	Fri, 15 Dec 2023 17:07:47 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id ADB5C20640;
	Fri, 15 Dec 2023 18:07:37 +0100 (CET)
Date: Fri, 15 Dec 2023 18:07:33 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Jiri Slaby <jirislaby@kernel.org>, linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org,
	linux-iio@vger.kernel.org, netdev@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Alex Elder <elder@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
	Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1] treewide, serdev: change receive_buf() return type to
 size_t
Message-ID: <ZXyH1Zv3Pxd6S3ag@francesco-nb.int.toradex.com>
References: <20231214170146.641783-1-francesco@dolcini.it>
 <ZXxWX-Fw1InID2ax@hovoldconsulting.com>
 <ZXxa7yzKzG6048vw@francesco-nb.int.toradex.com>
 <ZXx8bCVyxJ9Ddvqm@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXx8bCVyxJ9Ddvqm@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_090746_042886_1A6B6D29 
X-CRM114-Status: GOOD (  22.19  )
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

Hello Johan, Greg

On Fri, Dec 15, 2023 at 05:18:52PM +0100, Johan Hovold wrote:
> On Fri, Dec 15, 2023 at 02:55:59PM +0100, Francesco Dolcini wrote:
> > To me the change is correct, with that said probably this should have
> > been explicitly mentioned in the commit message or a separate
> > preparation patch.
> 
> It's a separate change and should not be hidden away in a tree-wide
> change that goes through a different maintainer.
> 
> Please drop this change from this patch and resubmit it separately to me
> if you want and I'll review when I have the time.

Fine, I agree.

I see those options (let me know if you see other options I have not
mentioned):

1. I add this change (taking into account also intel ice) as a separate
   patch in this series and you may just ack it and Greg could merge
   together with the serdev one.
2. I prepare an independent patch for the GNSS change and only once this
   is merged I'll send a rebased v2 of this one.
3. I update this patch without this GNSS API change, that mean I will
   have to cast away the signed type from a few GNSS drivers.

1 is my preferred option, 2 is fine, but it seems a little bit of overdoing,
3 I would avoid, we are doing this cleanup to be a little bit more
strongly typed and to prevent the kind of bugs that is the original trigger
for this patch.

What would you Greg and Johan prefer?


> And when doing tree-wide changes, please try to follow the style of the
> driver you are changing (e.g. do not introduce inconsistencies by
> changing to open parenthesis alignment of continuation lines in code
> that do not use it).

ack, sorry about that, looking back at the archive is seems a recent
pain point, also Jiri fell in this trap.

Francesco


