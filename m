Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5733CC2B9F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:32:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12137613C9
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12137613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qK/SrvhOwhj6nCiA8cZbwWxpH6ePgo7kQfjEOFfSLpU=; b=b91QXT8DXruDt0
	Wu325R/d+FHBkI1PSv21sg80tmfIbfmF/8PB0ZuK707vub/5WTrKCflQ/iPJLGWXED5FI6e3m71sW
	rePfNiiXjc9k5TpJY8qOdp3C3R8HLqRHTLSlGRpey2kt2e+1avYvPzhOWnXZmHvRPRSBEoXjmG/xc
	+4V9x3EepEgHcSTf72pnc/WqkrAV9Kr0cFIVACZgq/N8iVY5rJtK5nxNNrYfBkWum3Q+FHv/XP0da
	OJ4uxmtP3mGi368e8g4swWZXCWN0BFMl/xEepxtd2k9820M7qTaMt5h9vsK4SOBk8EJhoEcZExZl6
	cj/1J5Oe1VUj9zZh+Scg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lln5X-00Bdah-WF; Wed, 26 May 2021 06:32:20 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lln5K-00BdU2-D1; Wed, 26 May 2021 06:32:07 +0000
IronPort-SDR: I5rCz6cPkjgQE46RTY3R4wT0AEC7nUZPeezEx4YR8YctSlNi+aCF7z9i50vE8SFnNKyAHsw0si
 kPgjbqtU/fLw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="199339790"
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="199339790"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 23:32:00 -0700
IronPort-SDR: lyhjnbscqwWOtB2Ue8vR+6xPh+qHKNVBYRF+E0FVbCNPTTo3D5k8xVEJGJaUN+4Dn5KjxSUisO
 TUTImWWgD1Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="547077456"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 25 May 2021 23:31:56 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Wed, 26 May 2021 09:31:55 +0300
Date: Wed, 26 May 2021 09:31:55 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Paul Cercueil <paul@crapouillou.net>,
 Lee Jones <lee.jones@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] usb: roles: add helper usb_role_string()
Message-ID: <YK3rW6NjED+07IdC@kuha.fi.intel.com>
References: <1621932786-9335-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1621932786-9335-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_233206_480856_CE51E726 
X-CRM114-Status: GOOD (  21.39  )
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

On Tue, May 25, 2021 at 04:53:05PM +0800, Chunfeng Yun wrote:
> Introduces usb_role_string() function, which returns a
> human-readable name of provided usb role, it's useful to
> make the log readable.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/roles/class.c | 9 +++++++++
>  include/linux/usb/role.h  | 6 ++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index 33b637d0d8d9..dfaed7eee94f 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -214,6 +214,15 @@ static const char * const usb_roles[] = {
>  	[USB_ROLE_DEVICE]	= "device",
>  };
>  
> +const char *usb_role_string(enum usb_role role)
> +{
> +	if (role < 0 || role >= ARRAY_SIZE(usb_roles))
> +		return "unknown";
> +
> +	return usb_roles[role];
> +}
> +EXPORT_SYMBOL_GPL(usb_role_string);
> +
>  static ssize_t
>  role_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
> diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
> index 0164fed31b06..031f148ab373 100644
> --- a/include/linux/usb/role.h
> +++ b/include/linux/usb/role.h
> @@ -65,6 +65,7 @@ void usb_role_switch_unregister(struct usb_role_switch *sw);
>  
>  void usb_role_switch_set_drvdata(struct usb_role_switch *sw, void *data);
>  void *usb_role_switch_get_drvdata(struct usb_role_switch *sw);
> +const char *usb_role_string(enum usb_role role);
>  #else
>  static inline int usb_role_switch_set_role(struct usb_role_switch *sw,
>  		enum usb_role role)
> @@ -109,6 +110,11 @@ static inline void *usb_role_switch_get_drvdata(struct usb_role_switch *sw)
>  	return NULL;
>  }
>  
> +static inline const char *usb_role_string(enum usb_role role)
> +{
> +	return "unknown";
> +}
> +
>  #endif
>  
>  #endif /* __LINUX_USB_ROLE_H */
> -- 
> 2.18.0

-- 
heikki

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
