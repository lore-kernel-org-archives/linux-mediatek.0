Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE31DC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 03:15:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 795DE2065D
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 03:15:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XBYn79+J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iz5+7TZu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 795DE2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zOWKj9kk98PUI6OGYFgRORgIPEVDco8/WdgeJ42PYdQ=; b=XBYn79+JjuWdB1+mIOalmml5Z
	V5EY16GkV4LbKtXkNa2kfYY/Vz4rAkRjSDBUNBigpqV0aWKbRcwRc7f1XiTS2+eVrN5z4l+4y2WHB
	YKz0nQLIdg71AcWu0ZtZBUi1YG0ozmuwx9IujKHz7IcCixOO7YB8sdXSiy3+oRKOTZiPTSHiXeAKt
	E9dS5CZ/Ci1rVLU9jPEFFWvkkHjIpXMwe/K+jFU8X9YdFSdh4C6wTXeAGXSdqf1DpCPHL8D/vxJxB
	togBkIJbiUiMhElRqpeZ0EDSxjkEaVRR7sk73/Q92PmgD+ry4zyjdzE28a+C0oc8K95gw5m21Gi/9
	S+/m3OmYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtjVI-0008TN-2b; Fri, 10 Jul 2020 03:15:12 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtjVC-0008S0-Sn
 for linux-mediatek@lists.infradead.org; Fri, 10 Jul 2020 03:15:07 +0000
Received: by mail-vs1-xe44.google.com with SMTP id p25so2236681vsg.4
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2020 20:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0xK96ZEj03BYxsiwTCEC7aLn5QyV2i1PW83BHZdlgiE=;
 b=iz5+7TZuV43ycSJaAM7QXsHXHZMrqwe1VHhvH7nzaLRNqyuSzRIKsTm9ZY6hcyT6xL
 rUeURvW6GTpfMb+6hgPG7XBznhNpcnfnoWcODmOEsJARCaoCb5xul+H0TsOjwz8m0Gpt
 8etFgsVIuVEHJxU8FqnuyA13ZWtKyl5k05Cmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0xK96ZEj03BYxsiwTCEC7aLn5QyV2i1PW83BHZdlgiE=;
 b=nkIwFiM4AUbgBruqXLXBBHsV9EKniLG4EBv+LM6TERaf41TRUPHUYpVbhpM890yRLm
 EaiU3Sjav3kMgOSBQ59jDfWK65PXBK/BJkTXBbVbaPyOyzKBvdFijyP9VQtSSczYgnPI
 dwMRgoxUGhOtAAFH9pUeVrMlSL5fomY9IEp6mzeJ+WQZm7BqcF1UY3yb3rjpMqxhNFUn
 xrhgHNT8VFZfsLNk1w8NzNcH3Kp+np1QQNdMzK+kaIZ0TtFHxfkxcwpeJ9j03J8ifJz8
 LgbUCHLeqkHGOxnpFDBpiss2wpb2LXCS8ZBlDnoV7ORF6ILlfPaPEqAl4Xb6FzhnahUa
 9UcQ==
X-Gm-Message-State: AOAM533UEnlTpr3T8FD4NMGp0trr2Ptj+Lv4hnFgnNRkvvoqtZch4VBw
 CJmyaC3We+5U7lyKctxOAc+rbEghybS/u3q2OQXckw==
X-Google-Smtp-Source: ABdhPJwwWTRG9i6cMBcyGYThfNXEyr1KpiR5j0/N7lIP76+Rz5QR86zchLcWA1ir6x7GGNOpx8rJ1ZOQxoECbAD4Myo=
X-Received: by 2002:a67:e0c3:: with SMTP id m3mr52687562vsl.1.1594350903351;
 Thu, 09 Jul 2020 20:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <1594348182-431-1-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1594348182-431-1-git-send-email-chunfeng.yun@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 10 Jul 2020 11:14:52 +0800
Message-ID: <CANMq1KA2kT1yLGqhJFBKt4sRzzE6r=ABkSX59S-Mjr8Dg8sTOQ@mail.gmail.com>
Subject: Re: [PATCH] usb: xhci-mtk: fix the failure of bandwidth allocation
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_231506_970748_40BCA18D 
X-CRM114-Status: GOOD (  14.73  )
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
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 10, 2020 at 10:30 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> The wMaxPacketSize field of endpoint descriptor may be zero
> as default value in alternate interface, and they are not
> actually selected when start stream, so skip them when try to
> allocate bandwidth.
>
> Cc: stable <stable@vger.kernel.org>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Add this?
Fixes: 0cbd4b34cda9dfd ("xhci: mediatek: support MTK xHCI host controller")

> ---
>  drivers/usb/host/xhci-mtk-sch.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> index fea5555..45c54d56 100644
> --- a/drivers/usb/host/xhci-mtk-sch.c
> +++ b/drivers/usb/host/xhci-mtk-sch.c
> @@ -557,6 +557,10 @@ static bool need_bw_sch(struct usb_host_endpoint *ep,
>         if (is_fs_or_ls(speed) && !has_tt)
>                 return false;
>
> +       /* skip endpoint with zero maxpkt */
> +       if (usb_endpoint_maxp(&ep->desc) == 0)
> +               return false;
> +
>         return true;
>  }
>
> --
> 1.9.1
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
