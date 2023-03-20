Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13443C7618A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 11:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrE5cdqUstI8iKRiryP7sVnrGPgtccnDlGp+MCkjdto=; b=GPG5JBtGCk/w8VeHfwxFH5WmIY
	GPe9MvTpJNahJWTf+7/Fw6PCD5B7pCLgJ6b6uwdEvrHXRkm33BdCUlHRDSNW23pa76ncEwoY4Dc6+
	c9KGWgiP7xpeJG5DnLXqLay7I0qXgK2SwAyZ262UQF6KP91Oe0ikHhlaa90y8W+agioGzjttsfyl7
	j3sXtaKDpsGBXZ+FGZS8r1VqBPmkL5innoRhgzTdcIJOpupt36OrO1p6GQoZCkYDe8C7omseQdykY
	F+ClHojNiR3IVOSV9BwxdYSWTAKidmi2H4E7LyRCkQzKUwGmVjxaBZRPSEIXUW3jn3iRCrE0+/roe
	gZ17G1RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peEAe-008uoB-29;
	Mon, 20 Mar 2023 11:59:24 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peEAa-008umx-2N;
	Mon, 20 Mar 2023 11:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679313560; x=1710849560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ae9Y8B1H3DR2CpwT8EmI0bUU2kuCt5ev5+Cua1MKlY4=;
  b=jHC6iK+OFy2z0Z76f4N17DCVIT79E+wkRoicV3lM/39El1C+fZ1K/vnH
   wvlBY4mjEu0nD/Gy8OCnhGk54O0ggWB5rUT54ya3eho0/c8cMEgAenKm6
   5+8N69/sbcpsJrQFaDrPSZGnl7H7Lzmyd6dAd++Qcd8uOGaq7jui2Fdjt
   YdRH2bv/XWEg8RuDYXJMPaeJsv/e2VRJT+XNA9OqcmhkyS+kZUml8/3xy
   TOUE/d3cnoXGVgMe2xpRM4qBWzHhNiU9mQxmzrn105AL763INPwTn28gb
   1Jk0Z6+Mp1ju+2ChmUud2dg8Bo8ovroMKmW9a81cHCGr2OslsoT4qzlwZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="403511846"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="403511846"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 04:59:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="824451370"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="824451370"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 20 Mar 2023 04:59:15 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 20 Mar 2023 13:59:14 +0200
Date: Mon, 20 Mar 2023 13:59:14 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Tom Rix <trix@redhat.com>
Cc: linux@roeck-us.net, gregkh@linuxfoundation.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, nathan@kernel.org,
	ndesaulniers@google.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] usb: typec: tcpci_mt6360: remove unused
 mt6360_tcpc_read16 function
Message-ID: <ZBhKkqqoSkmBueaO@kuha.fi.intel.com>
References: <20230319141053.1703937-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230319141053.1703937-1-trix@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_045920_860326_26151992 
X-CRM114-Status: GOOD (  15.54  )
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

On Sun, Mar 19, 2023 at 10:10:53AM -0400, Tom Rix wrote:
> clang with W=1 reports
> drivers/usb/typec/tcpm/tcpci_mt6360.c:46:19: error: unused function
>   'mt6360_tcpc_read16' [-Werror,-Wunused-function]
> static inline int mt6360_tcpc_read16(struct regmap *regmap,
>                   ^
> This function is not used, so remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci_mt6360.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> index 1b7c31278ebb..6fa8fd5c8041 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> @@ -43,12 +43,6 @@ struct mt6360_tcpc_info {
>  	int irq;
>  };
>  
> -static inline int mt6360_tcpc_read16(struct regmap *regmap,
> -				     unsigned int reg, u16 *val)
> -{
> -	return regmap_raw_read(regmap, reg, val, sizeof(u16));
> -}
> -
>  static inline int mt6360_tcpc_write16(struct regmap *regmap,
>  				      unsigned int reg, u16 val)
>  {
> -- 
> 2.27.0

-- 
heikki

