Return-Path: <SRS0=JbG7=YO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C8FCA9EAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2019 01:28:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB0AA21A4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2019 01:28:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NPRTp+c2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB0AA21A4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3l5nGxT4xdH9/ltJlEJaU0MkJ5L1WMF1NWhTM+CWyI=; b=NPRTp+c2j+tYz2
	5cbHqC3ZdIejfsmSBc/uj4KlUNf6e8TN9MWBX2SnsD86ie/5N4B8Zt5QmuKj1FrQYxEnUKiN7GSDw
	Yo+xS/+RUY9eOCS/Gu1NpVC22kEwplIt8lbc5I4S47vL9BbNHCnt/u8joS9NrLNFwpog1IsG6ct9H
	dTJJJX8DMyscr24yoLfTv3dgNkLVqQzji+htfY1vdtFyMeNDBW2Xd9/CrDMvaMka12Y/BR42i7KFI
	Jfi/pPlS+2DDzWfsVPQs4zOvxB3/5ME2JS344UY9Pl/srDYAbF4EBP/vgacooTLRJfXCkDU4DNYzw
	8JTydKaLK6wR8PpHiW0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMMUb-0002e2-Lt; Mon, 21 Oct 2019 01:28:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMMUR-0002V5-Fs; Mon, 21 Oct 2019 01:28:09 +0000
X-UUID: dad3cf6dfc9b4cf48e318730f3cafed0-20191020
X-UUID: dad3cf6dfc9b4cf48e318730f3cafed0-20191020
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2102486527; Sun, 20 Oct 2019 17:27:55 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 20 Oct 2019 18:27:56 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 21 Oct 2019 09:27:51 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 21 Oct 2019 09:27:51 +0800
Message-ID: <1571621272.31576.7.camel@mhfsdcap03>
Subject: Re: [PATCH] usb: mtu3: fix missing include of mtu3_dr.h
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Date: Mon, 21 Oct 2019 09:27:52 +0800
In-Reply-To: <20191017172717.31409-1-ben.dooks@codethink.co.uk>
References: <20191017172717.31409-1-ben.dooks@codethink.co.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 25F215405ED27AA9B6E03A344BF7268CD05F4EB00D98C9A18751FA822DAE4A042000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191020_182807_533326_48B5BA9E 
X-CRM114-Status: GOOD (  13.68  )
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
Cc: linux-kernel@lists.codethink.co.uk,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2019-10-17 at 18:27 +0100, Ben Dooks (Codethink) wrote:
> The declarations of ssusb_gadget_{init,exit} are
> in the mtu3_dr.h file but the code does that implements
> them does not include this. Add the include to fix the
> following sparse warnigns:
> 
> drivers/usb/mtu3/mtu3_core.c:825:5: warning: symbol 'ssusb_gadget_init' was not declared. Should it be static?
> drivers/usb/mtu3/mtu3_core.c:925:6: warning: symbol 'ssusb_gadget_exit' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> ---
>  drivers/usb/mtu3/mtu3_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
> index c3d5c1206eec..9dd02160cca9 100644
> --- a/drivers/usb/mtu3/mtu3_core.c
> +++ b/drivers/usb/mtu3/mtu3_core.c
> @@ -16,6 +16,7 @@
>  #include <linux/platform_device.h>
>  
>  #include "mtu3.h"
> +#include "mtu3_dr.h"
>  #include "mtu3_debug.h"
>  #include "mtu3_trace.h"

Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks a lot

>  



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
