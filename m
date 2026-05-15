Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA080CD343F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 14:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQxJjtW9NoHteCK0AjadT0ZiWp4xMo5S2G7yHBWhKm0=; b=sGuV2jk1UnuXCjeKFPjfkIOIZK
	dV/ubGd9Y3BfwYvLcdfVzxLzkYjdQSehEtHHw2GbfTJvqnJhcQ5cRUF6CrSelMlRWAsreEkLBxda+
	i7fP6Tt/D+F7KUaLhSCSxV7KK2iHWakoK1U6HlCn7hl08wh6ekuIcrWH/b5MngdTVSJL3tUwHPZvM
	xDhsxfWOLPLwQMa9ZGR4bJKGUl+XhzHlW5ZG3vGJdtWhIYcodFxdE2tYc9QH4mddNmoIrF/56HY4w
	QNP8dqyIDGeYTqRSC1VxzdIuBmA2RJGZtTLRpZ/xmJRyEbWWbm5YQqA30lIGYP7kQNT8VuL695p24
	vYFrP6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNth3-00000008b0J-3DYp;
	Fri, 15 May 2026 14:39:13 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNth0-00000008azE-2TpR
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 14:39:12 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-9568159ee07so5728187241.1
        for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 07:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1778855949; x=1779460749; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BQxJjtW9NoHteCK0AjadT0ZiWp4xMo5S2G7yHBWhKm0=;
        b=imaVH3T7dY+23c2W+ANkWrSJBMknaW8AKgJiAuN0mDAgnv8L6XRZCHwiigsBykHAWR
         DjfgRi430mv5APc9vPT3DZuX+0rlhqZNcW2y7d2ZylexrnpHulH2gV1SACuw3PrXbBVi
         JpQUw+eHRJdPy9PJ/M1Ka37h57bjQpSijT0l19wl4HuyqaQIWJ2GGQW/pZbvplzMfjLe
         CCkXXviJ4gxbfn0F5LdzJr9kgtCTbTjpphDS8WO0ezkyxm3vEmmHNqjVFmfXUd0AUVqR
         OBdeQmmmS91ctEtaZpQI5kTgxTaTy9g5ly7EG41Q9dcDI9E0u2SKwWIEEScc9778zi4b
         itJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778855949; x=1779460749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQxJjtW9NoHteCK0AjadT0ZiWp4xMo5S2G7yHBWhKm0=;
        b=PnGx5oreuUPuPKm8UraearEviteM1nX1skyXWQmnEOf7B0MwHPdNBTED6a6wcngigb
         sXoJWY+ZNVj/OIqRGjoIQ6I6xigxIZG5KgwFPg3EtIPZP6+ZBFAIvMhG+j3d251OaPKc
         uUGvvnQX+a9Pe6I4tfw7jBUNnlHApKSP7L5aIQgQjsm43Eu88zdDL/H+BioBA6i0+FyQ
         cDa4Jcokdwz9eozq/r90R1E2TS6y6xsw231t00AtUlvAZEOxNzf35DJKikDOjPbKdauq
         SIx5VeyQR7rvFL0AzT+TC6gK1UN/w+Ks+K7BRpR12unKHk3/VdoivxEiQhMN5Xwnq405
         HtPA==
X-Forwarded-Encrypted: i=1; AFNElJ+kYE89+oN5EmHvxezwnky6Kp9wLBYMR/5fpa9LWqP4Tf2MSfEMQHFw2wTSLzjTsByF2dNWj1Z5v3dQJb5TFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpKTmjSYrps8JlSFaxpRae3WbKr2+NN6r/3nukWTXrWjx3Hz53
	7vLqTjyF0Z54WDl4ocTr5Cu20V7mYAso6u6Sx/ujIzuNwHv09mxC8h8n6rZBVveLHQ==
X-Gm-Gg: Acq92OHtDAvziX6lFmwKFeGcCr2IXfohqX5hT1KMGIEQP88IF4ULFYvOpkbByhZqNRS
	Wvt8njIDwe6myVHakwTytb09AA7BToOD21eBwnDrTQSHLaRlsOtGByLT/v2LRYt4l6ZSEF00pss
	C+lxZdQPBIGF1pW3FC+9L5bD4gYPZEFHjHAeRkGV8wArFBKaRRmRJSdRyIDLKDQoT/TR3hC5l32
	O6KJe9mANfAWGi1PX6GxufigeX+fyozT7mg7cmIArWd+ovW83SU99uXlSL5/nYlPfEMyqpBnJEO
	Pg/tB8y3Q0szxTwkazau/xQTFFoEAmOYuvWEf98pt+i89Zwuo6ki7SCDvgT8oHHnnoFoEsh5R+Y
	8IS9COBf/WZUM+L3PjtRWqDtfnTXzTUHytfuzQ4mRHMIMpd9h4SXx9Y0wciK2lylUFlbZT06k8i
	JVqeWeThxUc+UOOR0dIXc7cXlvSI9hrn4BZe9f9PNy82g=
X-Received: by 2002:a05:6102:e14:b0:633:1fbe:79c8 with SMTP id ada2fe7eead31-63a3f597eb4mr2246407137.23.1778855948736;
        Fri, 15 May 2026 07:39:08 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90b3d0bdbsm51850896d6.24.2026.05.15.07.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:39:08 -0700 (PDT)
Date: Fri, 15 May 2026 10:39:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH RFC 05/12] usb: hub: Power on connected M.2 E-key
 connectors
Message-ID: <41260a6d-46fa-4a45-9906-e1bc5e5dd83a@rowland.harvard.edu>
References: <20260515090149.3169406-1-wenst@chromium.org>
 <20260515090149.3169406-6-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515090149.3169406-6-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_073910_974568_B31EF2EE 
X-CRM114-Status: GOOD (  19.28  )
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

On Fri, May 15, 2026 at 05:01:41PM +0800, Chen-Yu Tsai wrote:
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 90ea597d42ae..4165f71e212b 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -31,7 +31,9 @@
>  #include <linux/minmax.h>
>  #include <linux/mutex.h>
>  #include <linux/random.h>
> +#include <linux/of_graph.h>
>  #include <linux/pm_qos.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/kobject.h>
>  
>  #include <linux/bitfield.h>
> @@ -888,13 +890,25 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
>  {
>  	int ret;
>  
> +	if (set)
> +		ret = pwrseq_power_on(hub->ports[port1 - 1]->pwrseq);
> +	else
> +		ret = pwrseq_power_off(hub->ports[port1 - 1]->pwrseq);
> +	if (ret)
> +		return ret;
> +
>  	if (set)
>  		ret = set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
>  	else
>  		ret = usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
>  
> -	if (ret)
> +	if (ret) {
> +		if (set)
> +			pwrseq_power_off(hub->ports[port1 - 1]->pwrseq);
> +		else
> +			pwrseq_power_on(hub->ports[port1 - 1]->pwrseq);
>  		return ret;
> +	}
>  
>  	if (set)
>  		set_bit(port1, hub->power_bits);
> @@ -1867,6 +1881,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  	struct usb_host_interface *desc;
>  	struct usb_device *hdev;
>  	struct usb_hub *hub;
> +	int ret;
>  
>  	desc = intf->cur_altsetting;
>  	hdev = interface_to_usbdev(intf);

This change is totally useless.  Didn't you get a warning from the 
compiler when you built it?

> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> index 9ebc5ef54a32..6039e5f5dcd7 100644
> --- a/drivers/usb/core/hub.h
> +++ b/drivers/usb/core/hub.h
> @@ -85,6 +85,7 @@ struct usb_hub {
>   * @port_owner: port's owner
>   * @peer: related usb2 and usb3 ports (share the same connector)
>   * @connector: USB Type-C connector
> + * @pwrseq: power sequencing descriptor for the port
>   * @req: default pm qos request for hubs without port power control
>   * @connect_type: port's connect type
>   * @state: device state of the usb device attached to the port
> @@ -104,6 +105,7 @@ struct usb_port {
>  	struct usb_dev_state *port_owner;
>  	struct usb_port *peer;
>  	struct typec_connector *connector;
> +	struct pwrseq_desc *pwrseq;
>  	struct dev_pm_qos_request *req;
>  	enum usb_port_connect_type connect_type;
>  	enum usb_device_state state;

The fact that hub.h uses struct pwrseq_desc indicates that it ought to 
#include <linux/pwrseq/consumer.h>, instead of making the .c files do 
so themselves.  Then you wouldn't have to add the #include lines to 
hub.c and port.c.

> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b1364f0c384c..2d09037fee93 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -7,11 +7,14 @@
>   * Author: Lan Tianyu <tianyu.lan@intel.com>
>   */
>  
> +#include <linux/cleanup.h>

Why is this needed?

>  #include <linux/kstrtox.h>
>  #include <linux/slab.h>
>  #include <linux/string_choices.h>
>  #include <linux/sysfs.h>
> +#include <linux/of_graph.h>
>  #include <linux/pm_qos.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/component.h>
>  #include <linux/usb/of.h>
>  

Alan Stern

