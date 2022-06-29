Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3067C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 09:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EmOXlCPF2PKnBhpQ/luPJrSUkqjOxGD13NDVBnopNTk=; b=BLpSYqcQ6ZyhEWj8euYqkbZESF
	ce5wMGnz9ZOI9FKj3Q6/E0rmAREh68siVQ8wLixDM1yl8XfpX5m8Zy3/o7ko+r3QMLRtOMQX0/DUn
	DoU1HyPAeSBywLMqxzZgZvjMX0lOAsvj+hctytjwIKuYhpOSfRbABdsNQz3PqpwZ/8Al91fxPKMov
	M5E9bwp4aTUHMeagVfxRkkXdzyHITZMvkmXl5JO/+uRQLetM9LW0ecUBb/usUUMZTpu+Nz7MatC8c
	S3alzVSKHXEzcbXrBAP/5sH4Y/xsQM61EQKRxVbiCGJCxheGglr6OFHQm9gFvD6ybF+2/LfN3pIgS
	30Nu10wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6UMC-00AnWa-8P; Wed, 29 Jun 2022 09:51:36 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6UHq-00AlW0-0W; Wed, 29 Jun 2022 09:47:08 +0000
Received: by mail-yb1-xb35.google.com with SMTP id r3so26972638ybr.6;
        Wed, 29 Jun 2022 02:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EmOXlCPF2PKnBhpQ/luPJrSUkqjOxGD13NDVBnopNTk=;
        b=oDeMmnlCMTQvwXgm78D0pQRHhja+Ivd+N2hnel6/zhLoaRW5etlOls2REHUUBBbxiU
         6l5jO+KyaLfcVkIx9mK5+THqtbCE14MXYjrmFL3sq/H+6dwhLMQO80vCeAz+zoyQ6tD4
         /sWVN2VSVQiH58CXv/s/btxvwH9NpB+wLdHCiYrGdZSp1lqQHEe94WrDw6VCsh/tiS7K
         NipsDv97v242DKFzN3XNuoV1K7QUj6cBVQ6l3X+zme3htAyNlxEQ1M0ZiBiezEgSY5kH
         I2NkpkIjtahsqUm+/nZluwhgZxbvHL7ojm2Waao7yrYgQ7tZmB7WJKTeQ2RkU+nrkOtf
         Fcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EmOXlCPF2PKnBhpQ/luPJrSUkqjOxGD13NDVBnopNTk=;
        b=ffQDwb1ow0e0ZSYIr36z7nSJvXJWRUOEsrP9pcSf1A9rth9PK+zFtTDfhs6ERqQn8w
         skPGdrOQOtGVD/5e+GAOf5g9ibTUUX9BVxgGA9ilcEBP7eYtaOW/a1d/mIvTdq/Cw08l
         HRdesWl5izDsXkMBBya433dsksx0dxlX477fWLQhk0rQ66I0YWvUTX856bPvnYJlbcsi
         6BM8+nA+Q4/jDBynrUmdHoVmCBKQdo590XFqSrwQsdz6sGLV3E0ddRiOIsZAwaPC6qeA
         a7vSXbZf28kWA8QI0yXDhoIq4RqOnhv/w4CupXS8MS8Mq1gNRMpQonY4KHek59LT9yq3
         /CzQ==
X-Gm-Message-State: AJIora9EGDMF7emNRoYOe0OXgi8EBZ9zkp4drmzzDEvS2oJvvrY+M9n4
	WIPLwpS8JfekS1GzVbSh6Gw+J3P7BbrimOzozGA=
X-Google-Smtp-Source: AGRyM1sCbYX6F5EQnDbOdSwxx4LX2Emni3Xa+5wghs4B8uexCocrG6wMB0Y10Gvfw6NCcvdJhV5sqqKPrCnk4EpsKxM=
X-Received: by 2002:a25:3383:0:b0:66b:6205:1583 with SMTP id
 z125-20020a253383000000b0066b62051583mr2289015ybz.387.1656496023486; Wed, 29
 Jun 2022 02:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220629021304.21725-1-chunfeng.yun@mediatek.com>
In-Reply-To: <20220629021304.21725-1-chunfeng.yun@mediatek.com>
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date: Wed, 29 Jun 2022 12:46:51 +0300
Message-ID: <CAB=otbQ3L0G6NYvFwBe268auGG3iS6shk9z+SpgKrkLthn-qGg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: gadget: f_uac1: add interface association descriptor
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Pavel Hofman <pavel.hofman@ivitera.com>, 
	Julian Scheel <julian@jusst.de>, Yunhao Tian <t123yh.xyz@gmail.com>, xin lin <xin.lin@mediatek.com>, 
	Linux USB <linux-usb@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_024706_102421_0943CF07 
X-CRM114-Status: GOOD (  25.83  )
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

 On Wed, Jun 29, 2022 at 5:13 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> From: xin lin <xin.lin@mediatek.com>
>
> When we want to use a composite device that supports UVC, UAC1 and
> ADB at the same time, encounter that UAC1 can't work when connected
> to windows 10 system.
> From the online documents of microsoft, "overview of enumeration of
> interface collections on usb composite devices", it recommends that
> vendors use IADs (interface association descriptor) to define
> interface collections.
> After addding IAD, we can fix the issue.

It is incorrect to add Interface Association Descriptor to the UAC1 function.
The UAC1 specification was developed much earlier than IAD was invented, and it
implements this functionality in another way - by describing number of
associated
interfaces and interface numbers on Class-Specific AC Interface
Descriptor level;
see *bInCollection* and *baInterfaceNr* fields of UAC1 Class-Specific
AC Interface
Header Descriptor in 4.3.2 section of UAC1 specification.

This is already implemented in f_uac1.c (see where *bInCollection* and
*baInterfaceNr*
are updated), along with support of dynamic capture/playback endpoints
enablement.
Adding IAD to the UAC1 driver is duplicating that functionality and
isn't supported
by UAC1 spec.

On the other hand, the USB orgcommittee switched the approach of
interface collection
definition from a class-specific descriptors level to IAD in the UAC2 spec.
So why not use UAC2 function for the same purpose, it already has IAD
implemented
and is supported by Win10?

Thanks,
Ruslan

>
> Signed-off-by: xin lin <xin.lin@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: modify commit log suggested by Greg
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
> +       .bLength = sizeof(iad_desc),
> +       .bDescriptorType = USB_DT_INTERFACE_ASSOCIATION,
> +
> +       .bFirstInterface = 0,
> +       .bInterfaceCount = 3,
> +       .bFunctionClass = USB_CLASS_AUDIO,
> +       .bFunctionSubClass = 0,
> +       .bFunctionProtocol = UAC_VERSION_1,
> +};
> +
>  /* B.3.1  Standard AC Interface Descriptor */
>  static struct usb_interface_descriptor ac_interface_desc = {
>         .bLength =              USB_DT_INTERFACE_SIZE,
> @@ -259,6 +270,7 @@ static struct uac_iso_endpoint_descriptor as_iso_in_desc = {
>  };
>
>  static struct usb_descriptor_header *f_audio_desc[] = {
> +       (struct usb_descriptor_header *)&iad_desc,
>         (struct usb_descriptor_header *)&ac_interface_desc,
>         (struct usb_descriptor_header *)&ac_header_desc,
>
> @@ -293,6 +305,7 @@ static struct usb_descriptor_header *f_audio_desc[] = {
>  };
>
>  enum {
> +       STR_ASSOC,
>         STR_AC_IF,
>         STR_USB_OUT_IT,
>         STR_USB_OUT_IT_CH_NAMES,
> @@ -310,6 +323,7 @@ enum {
>
>  static struct usb_string strings_uac1[] = {
>         /* [STR_AC_IF].s = DYNAMIC, */
> +       [STR_ASSOC].s = "Source/Sink",
>         [STR_USB_OUT_IT].s = "Playback Input terminal",
>         [STR_USB_OUT_IT_CH_NAMES].s = "Playback Channels",
>         [STR_IO_OUT_OT].s = "Playback Output terminal",
> @@ -1058,6 +1072,7 @@ static void setup_descriptor(struct f_uac1_opts *opts)
>         as_out_header_desc.bTerminalLink = usb_out_it_desc.bTerminalID;
>         as_in_header_desc.bTerminalLink = usb_in_ot_desc.bTerminalID;
>
> +       iad_desc.bInterfaceCount = 1;
>         ac_header_desc->wTotalLength = cpu_to_le16(ac_header_desc->bLength);
>
>         if (EPIN_EN(opts)) {
> @@ -1068,6 +1083,7 @@ static void setup_descriptor(struct f_uac1_opts *opts)
>                 if (FUIN_EN(opts))
>                         len += in_feature_unit_desc->bLength;
>                 ac_header_desc->wTotalLength = cpu_to_le16(len);
> +               iad_desc.bInterfaceCount++;
>         }
>         if (EPOUT_EN(opts)) {
>                 u16 len = le16_to_cpu(ac_header_desc->wTotalLength);
> @@ -1077,9 +1093,11 @@ static void setup_descriptor(struct f_uac1_opts *opts)
>                 if (FUOUT_EN(opts))
>                         len += out_feature_unit_desc->bLength;
>                 ac_header_desc->wTotalLength = cpu_to_le16(len);
> +               iad_desc.bInterfaceCount++;
>         }
>
>         i = 0;
> +       f_audio_desc[i++] = USBDHDR(&iad_desc);
>         f_audio_desc[i++] = USBDHDR(&ac_interface_desc);
>         f_audio_desc[i++] = USBDHDR(ac_header_desc);
>
> @@ -1217,6 +1235,7 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
>                 }
>         }
>
> +       iad_desc.iFunction = us[STR_ASSOC].id;
>         ac_interface_desc.iInterface = us[STR_AC_IF].id;
>         usb_out_it_desc.iTerminal = us[STR_USB_OUT_IT].id;
>         usb_out_it_desc.iChannelNames = us[STR_USB_OUT_IT_CH_NAMES].id;
> @@ -1302,6 +1321,8 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
>         status = usb_interface_id(c, f);
>         if (status < 0)
>                 goto err_free_fu;
> +
> +       iad_desc.bFirstInterface = status;
>         ac_interface_desc.bInterfaceNumber = status;
>         uac1->ac_intf = status;
>         uac1->ac_alt = 0;
> --
> 2.18.0
>

