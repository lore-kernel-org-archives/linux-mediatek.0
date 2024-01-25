Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB95C47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 07:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsS/dsIwAaZFIt52jP71l9pGgb4TQJklZkcjw8mEMJo=; b=oTJuXoA3aex9Q15Qrci0mhxwdc
	WlLqeywNTAeZHjjjVULdUIRyQJYE72+B/8/+2TR/FA6wBIQG3TYDzWcfS9hN4j+0Xhkp0kkIHZA6x
	7S9ZCGilRWG9dG/YN9sNfdIXSbdr6NMwBbEtvjwP1WOn7yduTNPJs6eFpGVywCQ2nMpD0MN7SVFxR
	IZYsG9SOrG86R4b6OvnIPttG5eF+lmXQJ98eJdxARZUQoL5/csNaivHJ/O6Iq5COcn0QYndB1i8Uk
	Uw2pIvv0crd4WgWgaQAo0Nxaco38RsiO4JIUWESu8fYt2nGcWkjBeG1eE2YVgKQIr8S9F0HZ+M9oF
	E5Jy63Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSuIL-0075Jh-27;
	Thu, 25 Jan 2024 07:37:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSuIG-0075Hh-2P;
	Thu, 25 Jan 2024 07:37:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 43F05CE323C;
	Thu, 25 Jan 2024 07:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7012AC433F1;
	Thu, 25 Jan 2024 07:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706168215;
	bh=Q0JfeFCfMgWrfWnzoium/IVe2Po+3kpp7VAaqloEz1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udGMN9yUHMrxmaVOhoVNPCuuuvuWNxMNgTYMLtmrJz/NohKEw40gPBGRhBk/o8z66
	 SunP1i24pgaoednuaG5F0URxtAEbFYmKrN7DQxL/d6lRtm2lJ73Tthj4pKgcfmHWi3
	 AdnAQPY1/9hH3bJlR/zHWLCX+L3FVD0dNnpDdW/SYjNEMPpDH90yd7ulOM3KkkpOq6
	 SE+jiunstsmfRYgX6YIB7AzVU0H9FoJ78OeMZwt21R/vpFuYIhv8uw988w0ER9Y5UK
	 BP7El39bEffgeKuj8WbQKV3dMX8XgshWr87G5PEh+J/T5P1vqAWS8Qp4MJVvujaz2A
	 fuQDuh1Cn24UA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rSuIL-000000005sx-1MRL;
	Thu, 25 Jan 2024 08:37:05 +0100
Date: Thu, 25 Jan 2024 08:37:05 +0100
From: Johan Hovold <johan@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Rob Herring <robh@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2] treewide, serdev: change receive_buf() return type to
 size_t
Message-ID: <ZbIPoW2LKXJVz3oV@hovoldconsulting.com>
References: <20240122180551.34429-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122180551.34429-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_233701_161804_B679A876 
X-CRM114-Status: GOOD (  19.71  )
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

On Mon, Jan 22, 2024 at 07:05:51PM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> receive_buf() is called from ttyport_receive_buf() that expects values
> ">= 0" from serdev_controller_receive_buf(), change its return type from
> ssize_t to size_t.
> 
> The need for this clean-up was noticed while fixing a warning, see
> commit 94d053942544 ("Bluetooth: btnxpuart: fix recv_buf() return value").
> Changing the callback prototype to return an unsigned seems the best way
> to document the API and ensure that is properly used.
> 
> GNSS drivers implementation of serdev receive_buf() callback return
> directly the return value of gnss_insert_raw(). gnss_insert_raw()
> returns a signed int, however this is not an issue since the value
> returned is always positive, because of the kfifo_in() implementation.
> gnss_insert_raw() could be changed to return also an unsigned, however
> this is not implemented here as request by the GNSS maintainer Johan
> Hovold.
> 
> Suggested-by: Jiri Slaby <jirislaby@kernel.org>
> Link: https://lore.kernel.org/all/087be419-ec6b-47ad-851a-5e1e3ea5cfcc@kernel.org/
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> #for-iio
> ---
> v1:
>  - https://lore.kernel.org/all/20231214170146.641783-1-francesco@dolcini.it/
> v2:
>  - rebased on 6.8-rc1
>  - add acked-by Jonathan
>  - do not change gnss_insert_raw()
>  - do not change the code style of the gnss code
>  - commit message improvements, explain the reasons for doing only minimal
>    changes on the GNSS part

Looks good to me now:

Reviewed-by: Johan Hovold <johan@kernel.org>

