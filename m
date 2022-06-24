Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC48AC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 11:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIfk4bPKftmym7znn+O0LdKeK67RQc3I5TBcdOOP0Ak=; b=LtGwcl16vJHjmC1XErEXLKNvyd
	Vabb33CHxiAfJLAoMLOmRrmLQyy8OBtf4J1POB/eu/+6rm0cm2TY6lKKG/aqFARqp8lLdcmMoQmN9
	c8fG1rJkXN1Jw1Mp+NKyo/0K4Agq2xzVvYvjD9LV11sKGxhm3gzH85+xbt9efZOADb/e5stMAD85k
	OoLlTIZSHpa9EceTi1qab8T86q5Na88weUk63XhbuoOHwDvLWR8CXm6EuyKSR0peaumSVyALToeYL
	jY0mTSWCK48SYQU6FBFfqQmp4ZaL96M+k+cly6LMkpVSgq1gYOgYS+j07HYFS3dvjAPwGd/7ZCGIp
	KamrZOQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4hko-001zYN-4A; Fri, 24 Jun 2022 11:45:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4hkF-001zGy-Ig; Fri, 24 Jun 2022 11:45:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 14E1562231;
	Fri, 24 Jun 2022 11:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D09C34114;
	Fri, 24 Jun 2022 11:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656071102;
	bh=2OdxBW7zOQDflGPS+i+6wvl/FUJ2680bq4VvcnCLOvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=10zZhcC3sv1Ebk8gLwIOBVQc0ANNaJGC6wMd597qmtQ6C/Xhugkc+N1cb41qIx2Ba
	 D0GrQEy3DUWE5l1fz1kzeJvyhSfFMiPZR/0O2TlffcnCby6+fFQF5lzaDk46iwj2uV
	 F/THNDBAfuArcsXYouK85ba37aTQXvjrlvCN1NyM=
Date: Fri, 24 Jun 2022 13:39:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Felipe Balbi <balbi@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Pavel Hofman <pavel.hofman@ivitera.com>,
	Julian Scheel <julian@jusst.de>, xin lin <xin.lin@mediatek.com>,
	Yunhao Tian <t123yh.xyz@gmail.com>,
	Ruslan Bilovol <ruslan.bilovol@gmail.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH] usb: gadget: f_uac1: add IAD descriptor
Message-ID: <YrWif4oeelZrctmr@kroah.com>
References: <20220622085757.23437-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622085757.23437-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_044503_745972_F476C6F9 
X-CRM114-Status: GOOD (  21.48  )
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

On Wed, Jun 22, 2022 at 04:57:57PM +0800, Chunfeng Yun wrote:
> From: xin lin <xin.lin@mediatek.com>
> 
> Win10 can not enumerate composite device of UVC+UAC1+ADB without IAD descriptor
> in uac1.0, so add it.

I do not know what this means at all, sorry.  Can you please provide a
better changelog text that describes what all of this is in more detail?



> 
> Signed-off-by: xin lin <xin.lin@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/gadget/function/f_uac1.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
> index 6f0e1d803dc2..8390207bc513 100644
> --- a/drivers/usb/gadget/function/f_uac1.c
> +++ b/drivers/usb/gadget/function/f_uac1.c
> @@ -71,6 +71,17 @@ static inline struct f_uac1_opts *g_audio_to_uac1_opts(struct g_audio *audio)
>   * ALSA_Playback -> IT_3 -> OT_4 -> USB-IN
>   */
>  
> +static struct usb_interface_assoc_descriptor iad_desc = {
> +	.bLength = sizeof(iad_desc),
> +	.bDescriptorType = USB_DT_INTERFACE_ASSOCIATION,
> +
> +	.bFirstInterface = 0,
> +	.bInterfaceCount = 3,
> +	.bFunctionClass = USB_CLASS_AUDIO,
> +	.bFunctionSubClass = 0,
> +	.bFunctionProtocol = UAC_VERSION_1,
> +};
> +
>  /* B.3.1  Standard AC Interface Descriptor */
>  static struct usb_interface_descriptor ac_interface_desc = {
>  	.bLength =		USB_DT_INTERFACE_SIZE,
> @@ -259,6 +270,7 @@ static struct uac_iso_endpoint_descriptor as_iso_in_desc = {
>  };
>  
>  static struct usb_descriptor_header *f_audio_desc[] = {
> +	(struct usb_descriptor_header *)&iad_desc,

Why put this first?  Is that a requirement?

>  	(struct usb_descriptor_header *)&ac_interface_desc,
>  	(struct usb_descriptor_header *)&ac_header_desc,
>  
> @@ -293,6 +305,7 @@ static struct usb_descriptor_header *f_audio_desc[] = {
>  };
>  
>  enum {
> +	STR_ASSOC,

Again, why first?

>  	STR_AC_IF,
>  	STR_USB_OUT_IT,
>  	STR_USB_OUT_IT_CH_NAMES,
> @@ -310,6 +323,7 @@ enum {
>  
>  static struct usb_string strings_uac1[] = {
>  	/* [STR_AC_IF].s = DYNAMIC, */
> +	[STR_ASSOC].s = "Source/Sink",
>  	[STR_USB_OUT_IT].s = "Playback Input terminal",
>  	[STR_USB_OUT_IT_CH_NAMES].s = "Playback Channels",
>  	[STR_IO_OUT_OT].s = "Playback Output terminal",
> @@ -1058,6 +1072,7 @@ static void setup_descriptor(struct f_uac1_opts *opts)
>  	as_out_header_desc.bTerminalLink = usb_out_it_desc.bTerminalID;
>  	as_in_header_desc.bTerminalLink = usb_in_ot_desc.bTerminalID;
>  
> +	iad_desc.bInterfaceCount = 1;

Why this change?


>  	ac_header_desc->wTotalLength = cpu_to_le16(ac_header_desc->bLength);
>  
>  	if (EPIN_EN(opts)) {
> @@ -1068,6 +1083,7 @@ static void setup_descriptor(struct f_uac1_opts *opts)
>  		if (FUIN_EN(opts))
>  			len += in_feature_unit_desc->bLength;
>  		ac_header_desc->wTotalLength = cpu_to_le16(len);
> +		iad_desc.bInterfaceCount++;
>  	}
>  	if (EPOUT_EN(opts)) {
>  		u16 len = le16_to_cpu(ac_header_desc->wTotalLength);
> @@ -1077,9 +1093,11 @@ static void setup_descriptor(struct f_uac1_opts *opts)
>  		if (FUOUT_EN(opts))
>  			len += out_feature_unit_desc->bLength;
>  		ac_header_desc->wTotalLength = cpu_to_le16(len);
> +		iad_desc.bInterfaceCount++;
>  	}
>  
>  	i = 0;
> +	f_audio_desc[i++] = USBDHDR(&iad_desc);

Again, why first?

>  	f_audio_desc[i++] = USBDHDR(&ac_interface_desc);
>  	f_audio_desc[i++] = USBDHDR(ac_header_desc);
>  
> @@ -1217,6 +1235,7 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
>  		}
>  	}
>  
> +	iad_desc.iFunction = us[STR_ASSOC].id;
>  	ac_interface_desc.iInterface = us[STR_AC_IF].id;
>  	usb_out_it_desc.iTerminal = us[STR_USB_OUT_IT].id;
>  	usb_out_it_desc.iChannelNames = us[STR_USB_OUT_IT_CH_NAMES].id;
> @@ -1302,6 +1321,8 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
>  	status = usb_interface_id(c, f);
>  	if (status < 0)
>  		goto err_free_fu;
> +
> +	iad_desc.bFirstInterface = status;

Shouldn't this be needed without your change?

thanks,

greg k-h

