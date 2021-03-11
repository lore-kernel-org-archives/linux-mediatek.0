Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD84BC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 06:54:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4550B64FBB
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 06:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4550B64FBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E7S7AYmstKEmuO+nbyV/3Q4YY6Uht9Vy1S2C1JAt7QM=; b=U+4SDShAKrl+JShKAiQT3x+hv
	HvnCq6mt8BU1w39x0q354d7aVMQfT/fj9U/r44vn2X47qbIvhiri20VlNAqMfBpxC8q9sQVIgElKz
	hGFL0A+osqoYLc2RvrmBpgX7xdhKC1a7o5UlaVuf8JLmvR5vZ+CbeXBRAPCi5jPPewQZ4U0faCwua
	pflPjeo3wct6GiBlbAVqAOmC4y5M5wr9XJ//M8Rb1Ug/U4tE8rVQNd/kB9Pmh1dDzf6HUTiPaORBq
	fF/h42sQbMj4E7LmPa93MLu73L9NozbhWaGT9eKAdd3yuQJ0C3UX29VD4oebhAVfiFl0XfUfLdt5Y
	rnCkqap/g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKFD7-008YiT-MT; Thu, 11 Mar 2021 06:54:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKFCv-008Yh8-Lj; Thu, 11 Mar 2021 06:54:09 +0000
X-UUID: bacc31823d9849828cde1b62c554f56d-20210310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HXvdSSzvJwcQp7ImGoV9GE6S8/ULPWjlIYaMv49d5ww=; 
 b=P7CldvCc3W040ZNMb+d1SxK4QyW8fXjz0VOPsvhZ3w6yUaKs1Eo7IGM8XDGzuzdH9q916ViHLLMlQNQ47eu7biSRbO/wdYWRh8OiN8V668Sj3fcVADu7blkgUkKrPRHl5UUjNjfL2+EmA+a8iXDzCz3+eiox8fwPSXE/8hLdfTU=;
X-UUID: bacc31823d9849828cde1b62c554f56d-20210310
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 548667077; Wed, 10 Mar 2021 22:54:02 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 22:54:00 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Mar 2021 14:53:52 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 11 Mar 2021 14:53:52 +0800
Message-ID: <1615445632.13420.2.camel@mtkswgap22>
Subject: Re: [PATCH v4] usb: gadget: configfs: Fix KASAN use-after-free
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Jim Lin <jilin@nvidia.com>, Thadeu Lima de Souza Cascardo
 <cascardo@canonical.com>
CC: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>, Felipe Balbi
 <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Ainge Hsu <ainge.hsu@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>, Kuohong Wang
 <kuohong.wang@mediatek.com>, Mediatek WSD Upstream
 <wsd_upstream@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 <stable@vger.kernel.org>
Date: Thu, 11 Mar 2021 14:53:52 +0800
In-Reply-To: <1615444961-13376-1-git-send-email-macpaul.lin@mediatek.com>
References: <1484647168-30135-1-git-send-email-jilin@nvidia.com>
 <1615444961-13376-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1AFDD4A18497C1AB79C36991DF15FA0620D45CD5E2DE115D246BC0D32C71F9902000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_065406_304247_85B79358 
X-CRM114-Status: GOOD (  25.68  )
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

On Thu, 2021-03-11 at 14:42 +0800, Macpaul Lin wrote:
> From: Jim Lin <jilin@nvidia.com>
> 
> When gadget is disconnected, running sequence is like this.
> . composite_disconnect
> . Call trace:
>   usb_string_copy+0xd0/0x128
>   gadget_config_name_configuration_store+0x4
>   gadget_config_name_attr_store+0x40/0x50
>   configfs_write_file+0x198/0x1f4
>   vfs_write+0x100/0x220
>   SyS_write+0x58/0xa8
> . configfs_composite_unbind
> . configfs_composite_bind
> 
> In configfs_composite_bind, it has
> "cn->strings.s = cn->configuration;"
> 
> When usb_string_copy is invoked. it would
> allocate memory, copy input string, release previous pointed memory space,
> and use new allocated memory.
> 
> When gadget is connected, host sends down request to get information.
> Call trace:
>   usb_gadget_get_string+0xec/0x168
>   lookup_string+0x64/0x98
>   composite_setup+0xa34/0x1ee8
> 
> If gadget is disconnected and connected quickly, in the failed case,
> cn->configuration memory has been released by usb_string_copy kfree but
> configfs_composite_bind hasn't been run in time to assign new allocated
> "cn->configuration" pointer to "cn->strings.s".
> 
> When "strlen(s->s) of usb_gadget_get_string is being executed, the dangling
> memory is accessed, "BUG: KASAN: use-after-free" error occurs.
> 
> Signed-off-by: Jim Lin <jilin@nvidia.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Cc: stable@vger.kernel.org
> ---
> Changes in v2:
> Changes in v3:
>  - Change commit description
> Changes in v4:
>  - Fix build error and adapt patch to kernel-5.12-rc1.
>    Replace definition "MAX_USB_STRING_WITH_NULL_LEN" with
>    "USB_MAX_STRING_WITH_NULL_LEN".
>  - Note: The patch v2 and v3 has been verified by
>    Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
>    http://spinics.net/lists/kernel/msg3840792.html

Dear Cascardo,

Would you please help to confirm if you've tested it on Linux PC,
Chrome OS, or an Android OS?

Thanks!
Macpaul Lin

>    and
>    Macpaul Lin <macpaul.lin@mediatek.com> on Android kernels.
>    http://lkml.org/lkml/2020/6/11/8
>  - The patch is suggested to be applied to LTS versions.
> 
>  drivers/usb/gadget/configfs.c |   14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 0d56f33..15a607c 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -97,6 +97,8 @@ struct gadget_config_name {
>  	struct list_head list;
>  };
>  
> +#define USB_MAX_STRING_WITH_NULL_LEN	(USB_MAX_STRING_LEN+1)
> +
>  static int usb_string_copy(const char *s, char **s_copy)
>  {
>  	int ret;
> @@ -106,12 +108,16 @@ static int usb_string_copy(const char *s, char **s_copy)
>  	if (ret > USB_MAX_STRING_LEN)
>  		return -EOVERFLOW;
>  
> -	str = kstrdup(s, GFP_KERNEL);
> -	if (!str)
> -		return -ENOMEM;
> +	if (copy) {
> +		str = copy;
> +	} else {
> +		str = kmalloc(USB_MAX_STRING_WITH_NULL_LEN, GFP_KERNEL);
> +		if (!str)
> +			return -ENOMEM;
> +	}
> +	strcpy(str, s);
>  	if (str[ret - 1] == '\n')
>  		str[ret - 1] = '\0';
> -	kfree(copy);
>  	*s_copy = str;
>  	return 0;
>  }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
