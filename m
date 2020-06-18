Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94774C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 14:03:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 664852082F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 14:03:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NOkwu+M/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AsekxYtZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 664852082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6gN133nSHYhbiD9/STFkA3m4yCtWHSsfwhvqq+rtsk=; b=NOkwu+M/fgkOek
	DkA9tw+m16fzJ5Cm5SA9WJWDrqH3nn11KzluEnDYPOHfp1cCUUM1DXSKbUt0EeUb4dB7qpd0YkvIA
	IBwIh/ulAN98UJkqP/R7sA3uqIO4DJMCNlJqAOXIc532RVgde2c4uN7LnvAN0KrqKd82Rz33oZ5/2
	W6w193yNUkVovO8G+HTz4olPHYXLMCE8z+K/a7Mg3NeUqrZ/VzKAOqgw1EuR0lHJq1hthb3ag08/3
	qktLZgneFNwMNgjdceSrTY88vfcK6Y7tjnYsfT2qH0h1jUQ6aIwWncE8R3geh4MFYOShzjMqOGIOD
	Qra0Rh7zfQcsOmbimf2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlv8E-00005t-Pt; Thu, 18 Jun 2020 14:03:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlv80-0008NC-T3; Thu, 18 Jun 2020 14:02:54 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82C5920773;
 Thu, 18 Jun 2020 14:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592488972;
 bh=Zi1nm8yHfREwF4pP+1YaTpENFiQVaBW3aml0Ie6+ioc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AsekxYtZ+W3shsJuZkhmOP8ftSzIZWj3LdaIR+n5JPw6tmfCXYtPBkJ/L4wq7rkta
 OqOCFXwnqjKTC7lMgkrVyAMoQWa1P1kEI++WrlwahA/AcYRIVSI6UVTiGHRgq5mMP+
 Kq4HWK8AvQRD7fT5XAdYkXybufco8nXjhaURPVy0=
Date: Thu, 18 Jun 2020 16:02:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH v3] usb: replace hardcode maximum usb string length by
 definition
Message-ID: <20200618140244.GA2576793@kroah.com>
References: <1592201855-8218-1-git-send-email-macpaul.lin@mediatek.com>
 <1592471618-29428-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592471618-29428-1-git-send-email-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_070252_981648_352FDCEE 
X-CRM114-Status: GOOD (  17.64  )
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>, linux-usb@vger.kernel.org,
 Jim Lin <jilin@nvidia.com>, linux-kernel@vger.kernel.org,
 Alan Stern <stern@rowland.harvard.edu>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Macpaul Lin <macpaul.lin@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Siqi Lin <siqilin@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jun 18, 2020 at 05:13:38PM +0800, Macpaul Lin wrote:
> Replace hardcode maximum usb string length (126 bytes) by definition
> "MAX_USB_STRING_LEN".
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> ---
> Changes for v2:
>   - Add definition "MAX_USB_STRING_LEN" in ch9.h instead of in usb.h.
>     Thanks for Alan's suggestion.
> Changes for v3:
>   - Rebase to 5.8-rc1 and resolve conflict.
> 
>  drivers/usb/gadget/composite.c |    4 ++--
>  drivers/usb/gadget/configfs.c  |    2 +-
>  drivers/usb/gadget/usbstring.c |    4 ++--
>  include/uapi/linux/usb/ch9.h   |    3 +++
>  4 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> index cb4950c..d0de016 100644
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -1041,7 +1041,7 @@ static void collect_langs(struct usb_gadget_strings **sp, __le16 *buf)
>  	while (*sp) {
>  		s = *sp;
>  		language = cpu_to_le16(s->language);
> -		for (tmp = buf; *tmp && tmp < &buf[126]; tmp++) {
> +		for (tmp = buf; *tmp && tmp < &buf[MAX_USB_STRING_LEN]; tmp++) {
>  			if (*tmp == language)
>  				goto repeat;
>  		}
> @@ -1116,7 +1116,7 @@ static int get_string(struct usb_composite_dev *cdev,
>  			collect_langs(sp, s->wData);
>  		}
>  
> -		for (len = 0; len <= 126 && s->wData[len]; len++)
> +		for (len = 0; len <= MAX_USB_STRING_LEN && s->wData[len]; len++)
>  			continue;
>  		if (!len)
>  			return -EINVAL;
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 32b637e..70dd4ba 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -115,7 +115,7 @@ static int usb_string_copy(const char *s, char **s_copy)
>  	char *str;
>  	char *copy = *s_copy;
>  	ret = strlen(s);
> -	if (ret > 126)
> +	if (ret > MAX_USB_STRING_LEN)
>  		return -EOVERFLOW;
>  
>  	str = kstrdup(s, GFP_KERNEL);
> diff --git a/drivers/usb/gadget/usbstring.c b/drivers/usb/gadget/usbstring.c
> index 7c24d1c..8a8d647 100644
> --- a/drivers/usb/gadget/usbstring.c
> +++ b/drivers/usb/gadget/usbstring.c
> @@ -55,9 +55,9 @@
>  		return -EINVAL;
>  
>  	/* string descriptors have length, tag, then UTF16-LE text */
> -	len = min ((size_t) 126, strlen (s->s));
> +	len = min((size_t)MAX_USB_STRING_LEN, strlen(s->s));
>  	len = utf8s_to_utf16s(s->s, len, UTF16_LITTLE_ENDIAN,
> -			(wchar_t *) &buf[2], 126);
> +			(wchar_t *) &buf[2], MAX_USB_STRING_LEN);
>  	if (len < 0)
>  		return -EINVAL;
>  	buf [0] = (len + 1) * 2;
> diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
> index 2b623f3..cc02d05 100644
> --- a/include/uapi/linux/usb/ch9.h
> +++ b/include/uapi/linux/usb/ch9.h
> @@ -364,6 +364,9 @@ struct usb_config_descriptor {
>  
>  /*-------------------------------------------------------------------------*/
>  
> +/* USB String descriptors can contain at most 126 characters. */
> +#define MAX_USB_STRING_LEN	126

Nit, as this is part of the userspace api, we should make this
"USB_MAX_STRING_LEN" as we should be using "USB_" for all exports here.

That seems to be the case already except for one really odd set of
"TEST_" defines, which I'll go fix up after this...

I will just hand-edit this patch to make that change so you don't have
to respin it again...

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
