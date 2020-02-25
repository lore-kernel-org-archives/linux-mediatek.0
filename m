Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E735C35DF9
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 08:45:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60F7620CC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 08:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n83IrlXf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60F7620CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qdX6fVt0t1uja/NO/2x3p0+jHuoGoFTJXrJfH66npHk=; b=n83IrlXfpvp0mg
	HwiF9ePB5S6XwXtgynNVLzjse6VDHqMO9q428B1GirWaO3y+1+OWPNhduyAbTPROA2T4MTFzY0yhF
	a+usHzOuJr23xjoPVMBJ3CAa5gWrL7hbwT2p9SO7mLuxmUOqanxjWAcvR+FyWNnGjQfmj4vI4phkm
	AWTyRoDldL/0KDoSIXKQBULxfDzrCTE/AZGP3j7TKMQG/E1yvEKQ8D/6oXAHKrnNgRVcwYcGDMacV
	HkrPf2QqaeQ3K3uIBhho0+H8rEFX5LUZkix4R8QPvAemG8DCooE2vkW5ukhikmV2gTFs8Q3JIJWM/
	2lh+6Kc0ASmneSR+x/oA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6Vq4-0006JQ-HJ; Tue, 25 Feb 2020 08:45:12 +0000
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Vpz-0005bv-8z; Tue, 25 Feb 2020 08:45:10 +0000
Received: by mail-lj1-f195.google.com with SMTP id a13so13059556ljm.10;
 Tue, 25 Feb 2020 00:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fiv9myvgkw7xumEgeJGJ5mKNPtyekzHsqGUH5eUSRc4=;
 b=lf/7MW4Mf6Tg+Om3sjs3DdOf0Lum6SRGuOf6xsZosvpsvg8A9Ao33ZuFs9x+keIFk2
 dR2Fc9bOlx2CyUdsKfHFUPHhKvNIhxojmhrm7XZsXRamKiq6hsFoGpKvr3lt6wEEdo30
 Ju7Aic4zV6MPRy8Sb7jAhWlLNnadciSVA+1y7M2vYSusfeAyiYJ1cWPGFL5DwTnxjddX
 MSKzSIt/HQoCZsFs1ERRxz/tFK2F1gSf5VEgurAmfXzihsFXdzSzhuh+8GOkLGZfRWtE
 sAgv1BzvwP8c1Mn3wbfHTkpZEfOyA/HD6Mi084vpQm3XWiB+7/pBcqyBYWdT2C+TgS00
 +J7w==
X-Gm-Message-State: APjAAAWjkPbi8+i8d+nAqnyeMkQRVT6th8II1HHLDyWfbiNTK45ttkJv
 s6NlPzXmXY0XJd+wxx6wYLc=
X-Google-Smtp-Source: APXvYqzGgTQlZDTjc/WdsduCx/ZBfzNVw6Bsa4sPCaQ5okT0MJQT0iJdL306dKc+VA7rZExFnSr49w==
X-Received: by 2002:a2e:80d1:: with SMTP id r17mr33212112ljg.292.1582620302745; 
 Tue, 25 Feb 2020 00:45:02 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.170.18])
 by smtp.gmail.com with ESMTPSA id d24sm7300090lja.82.2020.02.25.00.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 00:45:01 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1j6Vpp-0004Ni-IX; Tue, 25 Feb 2020 09:44:57 +0100
Date: Tue, 25 Feb 2020 09:44:57 +0100
From: Johan Hovold <johan@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] USB: Replace zero-length array with flexible-array member
Message-ID: <20200225084457.GO32540@localhost>
References: <20200220132017.GA29262@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220132017.GA29262@embeddedor>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_004507_344658_42E4233D 
X-CRM114-Status: GOOD (  14.14  )
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-tegra@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Johan Hovold <johan@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>, linux-arm-kernel@lists.infradead.org,
 Minas Harutyunyan <hminas@synopsys.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 20, 2020 at 07:20:17AM -0600, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/usb/atm/usbatm.h              | 2 +-
>  drivers/usb/dwc2/hcd.h                | 2 +-
>  drivers/usb/host/ehci-tegra.c         | 2 +-
>  drivers/usb/host/ehci.h               | 4 ++--
>  drivers/usb/host/fotg210.h            | 2 +-
>  drivers/usb/host/ohci.h               | 4 ++--
>  drivers/usb/host/xhci-mtk.h           | 2 +-
>  drivers/usb/host/xhci.h               | 4 ++--
>  drivers/usb/serial/io_usbvend.h       | 4 ++--
>  drivers/usb/serial/ti_usb_3410_5052.c | 4 ++--
>  include/linux/usb.h                   | 4 ++--
>  include/linux/usb/audio-v2.h          | 2 +-
>  include/linux/usb/audio-v3.h          | 2 +-
>  include/linux/usb/gadget.h            | 2 +-
>  include/linux/usb/hcd.h               | 2 +-
>  include/linux/usbdevice_fs.h          | 2 +-
>  16 files changed, 22 insertions(+), 22 deletions(-)

Looks like your scripts still doesn't catch every instance. A simple
grep like 

	git grep -A1 '\[0\];$' drivers/usb/ | grep -B1 '}'

found at least three more in 

	drivers/usb/atm/ueagle-atm.c
	drivers/usb/gadget/function/f_phonet.c
	drivers/usb/musb/musb_host.c

Johan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
