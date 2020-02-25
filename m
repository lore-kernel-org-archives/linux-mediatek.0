Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BFDC35DF5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 11:08:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00D3F20726
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 11:08:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n7xUTtxR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ipz4bO+D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00D3F20726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAYqmhNN9D78WMFkgzR7QH6E0+oom4tvnJSFxA6nBRs=; b=n7xUTtxR3VURCd
	eyTXuj5IbkYMoVT0wZ6zYn4SsUn2RZx4AwS9fHhGZn2xetJ2Q7LDzWEBhvXzuqYdOTlydOKJk+BcB
	ZjkredLaQmHCWDXBdL40BZPzkGLZWaMDxkXwsX8Oldb+LQcaf2qqrz8oOzB6gOxYmTPK7DEwGTTkS
	bwGTkOc/PqL9DVjYPvm5TFlwNohuCi+SEWIPuevRN3cG3wOFh5KPKj0PVFrrszU1Oyq7+OKyV7wBe
	qqsn6lstusqVm08f2A1k6KIsjON0wnScqIPsAWxrNV5w/oKUwJtXTuI4ins8QC/InThuq/27aMpvR
	88GzsVGo+CPDQSVT0Fyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6Y4N-0000HB-JE; Tue, 25 Feb 2020 11:08:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Y4C-000082-M6; Tue, 25 Feb 2020 11:07:58 +0000
X-UUID: 57e6f028456641f387ff3079bccd1239-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NIVA4F3l7yQpEwqBqiJgTY82QKy3hO5czh6wpcjlijk=; 
 b=Ipz4bO+D3YZ9Y9KXCCPN+lEr4fmGYyzfYDpyIEMemegZZoCB71iSkjODWd04jRlkz6ssb/WsobqN8qZ3hgvHrs5XRU022KA0ciirYZz68kmqxRd2euDvEGEu7KXMgW+/sYnCraC93eFjoGE8RdDJ92ZekTE1Eu+8gPnXy2j6g+g=;
X-UUID: 57e6f028456641f387ff3079bccd1239-20200225
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 315484505; Tue, 25 Feb 2020 03:07:52 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 03:08:26 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 19:03:29 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 25 Feb 2020 19:07:22 +0800
Message-ID: <1582628855.31160.3.camel@mtkswgap22>
Subject: Re: [PATCH v3] usb: gadget: f_fs: try to fix AIO issue under ARM 64
 bit TAGGED mode
From: Miles Chen <miles.chen@mediatek.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Date: Tue, 25 Feb 2020 19:07:35 +0800
In-Reply-To: <1582627315-21123-1-git-send-email-macpaul.lin@mediatek.com>
References: <1582472947-22471-1-git-send-email-macpaul.lin@mediatek.com>
 <1582627315-21123-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4C2CF332432AB414CFC0F2323587578A8A6BD2A698FE908B77F606313F3EF5E22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_030756_728857_D5A29586 
X-CRM114-Status: GOOD (  19.10  )
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
Cc: Sasha Levin <sashal@kernel.org>, Shen Jing <jingx.shen@intel.com>,
 CC Hwang <cc.hwang@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Jerry Zhang <zhangjerry@google.com>, linux-usb@vger.kernel.org,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 John Stultz <john.stultz@linaro.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Vincent Pelletier <plr.vincent@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-02-25 at 18:41 +0800, Macpaul Lin wrote:
> This issue was found when adbd trying to open functionfs with AIO mode.
> Usually, we need to set "setprop sys.usb.ffs.aio_compat 0" to enable
> adbd with AIO mode on Android.
> 
> When adbd is opening functionfs, it will try to read 24 bytes at the
> first read I/O control. If this reading has been failed, adbd will
> try to send FUNCTIONFS_CLEAR_HALT to functionfs. When adbd is in AIO
> mode, functionfs will be acted with asyncronized I/O path. After the
> successful read transfer has been completed by gadget hardware, the
> following series of functions will be called.
>   ffs_epfile_async_io_complete() -> ffs_user_copy_worker() ->
>     copy_to_iter() -> _copy_to_iter() -> copyout() ->
>     iterate_and_advance() -> iterate_iovec()
> 
> Adding debug trace to these functions, it has been found that in
> copyout(), access_ok() will check if the user space address is valid
> to write. However if CONFIG_ARM64_TAGGED_ADDR_ABI is enabled, adbd
> always passes user space address start with "0x3C" to gadget's AIO
> blocks. This tagged address will cause access_ok() check always fail.
> Which causes later calculation in iterate_iovec() turn zero.
> Copyout() won't copy data to userspace since the length to be copied
> "v.iov_len" will be zero. Finally leads ffs_copy_to_iter() always return
> -EFAULT, causes adbd cannot open functionfs and send
> FUNCTIONFS_CLEAR_HALT.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
> Changes for v3:
>   - Fix misspelling in commit message.

Could you say "thank you" to Peter for his comment and add 
"Cc: Peter Chen <peter.chen@nxp.com>" to this patch, please?

> 
> Changes for v2:
>   - Fix build error for 32-bit load. An #if defined(CONFIG_ARM64) still need
>     for avoiding undeclared defines.
> 
>  drivers/usb/gadget/function/f_fs.c |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index ce1d023..728c260 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -35,6 +35,7 @@
>  #include <linux/mmu_context.h>
>  #include <linux/poll.h>
>  #include <linux/eventfd.h>
> +#include <linux/thread_info.h>
>  
>  #include "u_fs.h"
>  #include "u_f.h"
> @@ -826,6 +827,10 @@ static void ffs_user_copy_worker(struct work_struct *work)
>  	if (io_data->read && ret > 0) {
>  		mm_segment_t oldfs = get_fs();
>  
> +#if defined(CONFIG_ARM64)
> +		if (IS_ENABLED(CONFIG_ARM64_TAGGED_ADDR_ABI))
> +			set_thread_flag(TIF_TAGGED_ADDR);
> +#endif
>  		set_fs(USER_DS);
>  		use_mm(io_data->mm);
>  		ret = ffs_copy_to_iter(io_data->buf, ret, &io_data->data);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
