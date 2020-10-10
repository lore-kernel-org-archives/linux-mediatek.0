Return-Path: <SRS0=AZ7y=DR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBFEC433E7
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2020 09:50:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1DB21D41
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2020 09:50:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qW+bUuD0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gE+R6o0W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B1DB21D41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TkOEq4waiIYIoZ1+7ndeEf963iCs62B6acBB2GWwjAQ=; b=qW+bUuD0ce83diRNVi9QxLQsa
	bLOzFHPKG+18DHuDfxx1D3/zUsaqAysL6ChuZcsasTnAhITdHeqGy2NkfT406q+Jj8GRGUb+gA+7N
	dOaKLJ9236NIzyzLeIQ0nUBUYnPZuFs6Zx06wVXi2zVZaIippzijmVYqIXg0O9yZxVu1stekLXgHK
	HBDS3DQKt6RAv7GG25sY3lShZxRCeBFKkK5Su/N4iihyBu7zmrbP4E7/vjtplTjWK5EW6AV3xpvEz
	VsO2zMUIhVU+YNnUyXguYN1zvd9M46P8Diz9a9kkh2b3zzSOT8KipyoyJPjyOQUVUls3HZ2v81dl2
	HKA77o3kg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRBW3-0003gu-E9; Sat, 10 Oct 2020 09:50:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRBVz-0003gM-N5; Sat, 10 Oct 2020 09:50:12 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C05622184D;
 Sat, 10 Oct 2020 09:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602323408;
 bh=RXC5xfWPGap97Kf/8w9E8um1wI1s4p6TDrC8nncf/W8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gE+R6o0WgK+hfLUR6OQqXr8LKb9PIamD5KL6oqMOvRkPZaNzPy8vGdhdPh6t/UhVi
 h7bVtfOrwctRlEiv5bGHWvS8Qe702zkL3CrGxTrzmdIX3D6X4hILxg29c+qOo1F8wV
 syyPaWy543VBm7D2tBfb4b0ba+xMexpCi+PCROFQ=
Date: Sat, 10 Oct 2020 11:50:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: usb: use preferred license tag
Message-ID: <20201010095052.GA989257@kroah.com>
References: <3db52d534065dcf28e9a10b8129bea3eced0193e.1602318869.git.chunfeng.yun@mediatek.com>
 <d76ca8b2d64c7c017e3ddaca8497eb38ee514204.1602318869.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d76ca8b2d64c7c017e3ddaca8497eb38ee514204.1602318869.git.chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201010_055011_822001_A09CFB1E 
X-CRM114-Status: GOOD (  18.02  )
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Oct 10, 2020 at 04:43:14PM +0800, Chunfeng Yun wrote:
> This is used to fix the checkpach.pl WARNING:SPDX_LICENSE_TAG
> 
> See bindings/submitting-patches.rst:
> "DT binding files should be dual licensed. The preferred license tag is
>  (GPL-2.0-only OR BSD-2-Clause)."
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: new patch
> ---
>  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> index 42b295afdf32..11b9b9ee2b54 100644
> --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> @@ -1,4 +1,4 @@
> -# SPDX-License-Identifier: GPL-2.0
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

Are you sure you are allowed to change the license of this file?  Last I
checked, you did not write this file, and so, you can't change the
license of it.  You need to get the owners of the file to do so.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
