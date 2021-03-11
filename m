Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F66FC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 10:52:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9ABC64EFD
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 10:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9ABC64EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U462imvwBmSj82fNhjZpGj4wLHynmBNmSM+5OUMBs/Y=; b=LDGx8S9L76YluRsQGK+hxkRQW
	OPi5QWG7VyyLobxMoIF4qQpujuH+m1SOvGHPEm7CWwyg+wxXA783tgO0V7XxZFQKwNuguzvdvKGrx
	iDd7Yn2QDXjfcxFuTlUjSp7eSSxoLtALa+7hn8a2ibWfK14Hpv42NxuDxYOYjbro2ikx8XJCN3nOp
	rAVfKNVnsXZ0/UDS+3fxQ7SX7Hocoux5Mk2oh3BUc8nCMwe5bWnnYNEQWpd/+sHHV78JB2eoiXLqX
	oPT+q1GX0e5TbbRW1EatgdAvRhhzbiUqvNnRnRt4NDcmErSFTHrfXcurXeNm4j6V+CzTD9EY5J4dg
	WmqXz8eYA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKIvn-008sqf-MG; Thu, 11 Mar 2021 10:52:39 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKIvZ-008soY-TE; Thu, 11 Mar 2021 10:52:30 +0000
Received: from [179.93.213.27] (helo=mussarela)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cascardo@canonical.com>)
 id 1lKIvR-0008VO-Pm; Thu, 11 Mar 2021 10:52:18 +0000
Date: Thu, 11 Mar 2021 07:52:10 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Jim Lin <jilin@nvidia.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Ainge Hsu <ainge.hsu@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v4] usb: gadget: configfs: Fix KASAN use-after-free
Message-ID: <20210311105210.GS10958@mussarela>
References: <1484647168-30135-1-git-send-email-jilin@nvidia.com>
 <1615444961-13376-1-git-send-email-macpaul.lin@mediatek.com>
 <1615445632.13420.2.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615445632.13420.2.camel@mtkswgap22>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_105226_955032_52126F5D 
X-CRM114-Status: GOOD (  28.74  )
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

On Thu, Mar 11, 2021 at 02:53:52PM +0800, Macpaul Lin wrote:
> On Thu, 2021-03-11 at 14:42 +0800, Macpaul Lin wrote:
> > From: Jim Lin <jilin@nvidia.com>
> > 
> > When gadget is disconnected, running sequence is like this.
> > . composite_disconnect
> > . Call trace:
> >   usb_string_copy+0xd0/0x128
> >   gadget_config_name_configuration_store+0x4
> >   gadget_config_name_attr_store+0x40/0x50
> >   configfs_write_file+0x198/0x1f4
> >   vfs_write+0x100/0x220
> >   SyS_write+0x58/0xa8
> > . configfs_composite_unbind
> > . configfs_composite_bind
> > 
> > In configfs_composite_bind, it has
> > "cn->strings.s = cn->configuration;"
> > 
> > When usb_string_copy is invoked. it would
> > allocate memory, copy input string, release previous pointed memory space,
> > and use new allocated memory.
> > 
> > When gadget is connected, host sends down request to get information.
> > Call trace:
> >   usb_gadget_get_string+0xec/0x168
> >   lookup_string+0x64/0x98
> >   composite_setup+0xa34/0x1ee8
> > 
> > If gadget is disconnected and connected quickly, in the failed case,
> > cn->configuration memory has been released by usb_string_copy kfree but
> > configfs_composite_bind hasn't been run in time to assign new allocated
> > "cn->configuration" pointer to "cn->strings.s".
> > 
> > When "strlen(s->s) of usb_gadget_get_string is being executed, the dangling
> > memory is accessed, "BUG: KASAN: use-after-free" error occurs.
> > 
> > Signed-off-by: Jim Lin <jilin@nvidia.com>
> > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > Cc: stable@vger.kernel.org
> > ---
> > Changes in v2:
> > Changes in v3:
> >  - Change commit description
> > Changes in v4:
> >  - Fix build error and adapt patch to kernel-5.12-rc1.
> >    Replace definition "MAX_USB_STRING_WITH_NULL_LEN" with
> >    "USB_MAX_STRING_WITH_NULL_LEN".
> >  - Note: The patch v2 and v3 has been verified by
> >    Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
> >    http://spinics.net/lists/kernel/msg3840792.html
> 
> Dear Cascardo,
> 
> Would you please help to confirm if you've tested it on Linux PC,
> Chrome OS, or an Android OS?

I tested v3 on Ubuntu GNU/Linux. I will test v4.

Cascardo.

> 
> Thanks!
> Macpaul Lin
> 
> >    and
> >    Macpaul Lin <macpaul.lin@mediatek.com> on Android kernels.
> >    http://lkml.org/lkml/2020/6/11/8
> >  - The patch is suggested to be applied to LTS versions.
> > 
> >  drivers/usb/gadget/configfs.c |   14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> > index 0d56f33..15a607c 100644
> > --- a/drivers/usb/gadget/configfs.c
> > +++ b/drivers/usb/gadget/configfs.c
> > @@ -97,6 +97,8 @@ struct gadget_config_name {
> >  	struct list_head list;
> >  };
> >  
> > +#define USB_MAX_STRING_WITH_NULL_LEN	(USB_MAX_STRING_LEN+1)
> > +
> >  static int usb_string_copy(const char *s, char **s_copy)
> >  {
> >  	int ret;
> > @@ -106,12 +108,16 @@ static int usb_string_copy(const char *s, char **s_copy)
> >  	if (ret > USB_MAX_STRING_LEN)
> >  		return -EOVERFLOW;
> >  
> > -	str = kstrdup(s, GFP_KERNEL);
> > -	if (!str)
> > -		return -ENOMEM;
> > +	if (copy) {
> > +		str = copy;
> > +	} else {
> > +		str = kmalloc(USB_MAX_STRING_WITH_NULL_LEN, GFP_KERNEL);
> > +		if (!str)
> > +			return -ENOMEM;
> > +	}
> > +	strcpy(str, s);
> >  	if (str[ret - 1] == '\n')
> >  		str[ret - 1] = '\0';
> > -	kfree(copy);
> >  	*s_copy = str;
> >  	return 0;
> >  }
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
