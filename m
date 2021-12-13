Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D53FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 14:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYw2BOYFZgmfYPNF2iH7xgIwzPT+ZW8sXi6rqfV5yZA=; b=HyFnJxvUWIjdGx
	ZJoTMuUvcnSN8aWx9aG0YtJWoJaCC6GMSeWnEizYNSySYmlkhKK0Yck4rZ7IyluPmQqGy35lDxSYU
	CvKjeclw8osZgISuN058u04yeToSNvUT1d4XfKFApbtkZqeck74inIPEhzym+9IjzUgkwepC+FXih
	ezNTRHOkYeC9zZcGswe4toqRHQ2OOGRkTl1rEl2iuHUCcJAxgrQzXK5MwVHu2klXDKyJK8CYkz8So
	dKTkTTkYsmrr8gdw2VxSxbVlBPo4gbDsaTSvtvqDCySViTpnguK0ElPuYgEQ35nUqSND726CYbKDZ
	814rwDJXXVRxbwCoYnGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwmSB-00A6Sw-6Y; Mon, 13 Dec 2021 14:37:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwmBY-009zmc-7j; Mon, 13 Dec 2021 14:20:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B489A61073;
 Mon, 13 Dec 2021 14:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E6AC34602;
 Mon, 13 Dec 2021 14:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1639405211;
 bh=B0f4nv+4/uiTH9I2yU8r9fZqoURURZ8b4UkT4yxqh3w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HepktJOmnXAiikWrordvHKZaDchiJ2iL3Nhl/7achqqm6umEeRRm9IHGC9qk7feBm
 0gqhr1cCfvatHpDqlXE2O7pZFt85+cKK1VrbnDBcnfd2f/FHe3IXobkRQB9Gq6zpmA
 pFJir67Bwi9e+C4gr1JCT7yygPg6I6rFXHZTZAYU=
Date: Mon, 13 Dec 2021 15:20:09 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>, Yuwen Ng <yuwen.ng@mediatek.com>
Subject: Re: [PATCH 1/3] usb: mtu3: fix interval value for intr and isoc
Message-ID: <YbdWmQMck/WGYJ4/@kroah.com>
References: <20211209031424.17842-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211209031424.17842-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_062012_375052_D80815C7 
X-CRM114-Status: GOOD (  12.82  )
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

On Thu, Dec 09, 2021 at 11:14:22AM +0800, Chunfeng Yun wrote:
> Use the Interval value from isoc/intr endpoint descriptor, no need
> minus one. But the original code doesn't cause transfer error for
> normal cases, due to the interval is less than the host request.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/mtu3/mtu3_gadget.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

What commit does this fix?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
