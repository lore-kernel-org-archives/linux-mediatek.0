Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20716C61D92
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 08:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oa6TpxPzfV3k8mu0Hdb2ZrLb2s8T6dq26vXFs6ikOeA=; b=AgfZV0Nk9u6YOfll/nB3lWzQW4
	hOptXE37pUyvqwqkNl6OS8wqlpRvA+4l6uL1XWo0oqylOg9ZiKxlpirHJMYHZ3SwpFVxH0d/Y9fHZ
	88RNywctkVBXAPkQ4EETkIPK1CLU6EGiW+NkGzZxy2N8P/nWWDliNkKgWcXTYpYSVUgXWoDtf8NTy
	GBMIzLHGKIYGxCAJmkHTXifWKuP9vIaLsUyRMV3ICyVUvGFUNQ8ohu3Rf/jgd49JyXQ+CrT2sUhc5
	6phnQGeyNM95k6H4svD/B9UdvqkPD+cjR3XFRAj9PRRTD7wBuuXUIw0l7AWRu89xvyUdd0MjD5/26
	FRTGu7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5MaZ-00G3oF-27;
	Tue, 21 Nov 2023 08:58:35 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5MaW-00G3mn-3C;
	Tue, 21 Nov 2023 08:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700557111; x=1732093111;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=htt+X8f+FjchoXwuJTnW2vNFwbgd57Lg5mit0MjBw8w=;
  b=dPxal1Du0rnvFmc9rxdGCPCdoEdiIg9WIcSEye/QnHVIOTCIX2rYSSrx
   9RdQCmlHFcG6fT1b64siZpX8YArD+kWvnV64Fg0GqALQLnwhMDifWn9BI
   sVe3L9TAiqHXYWdtIzJIsFC4X8PNF7UT9cCFfj5HuPln8CYG8hfs0eJul
   HOlaBv5Wn4cs/NbL4y8Ya2anp17SIexd3C9OOVJYiddpX9vhoJjbw0xEg
   ZnAfDhL2XwMdqeRX6C7Adfg/VxN4jR4n9ykSNu9Q4+ovFOQld7p7VYsnX
   Nn8iQ4K1Fc8gyhmnuDBLyREbB6BnW9E8XuynewmSf3oq2tqKTZDgkvR97
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="456132999"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="456132999"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 00:58:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="890195495"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="890195495"
Received: from cdeakx-mobl.amr.corp.intel.com (HELO localhost) ([10.252.58.54])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 00:58:23 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 intel-gfx@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Yongqin
 Liu <yongqin.liu@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Xinwei Kong
 <kong.kongxinwei@hisilicon.com>, linux-sunxi@lists.linux.dev, Jonas
 Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jocelyn Falempe <jfalempe@redhat.com>, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, John
 Stultz <jstultz@google.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 freedreno@lists.freedesktop.org, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>
Subject: Re: [Intel-gfx] [PATCH v4 00/20] remove I2C_CLASS_DDC support
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231120214624.9378-1-hkallweit1@gmail.com>
Date: Tue, 21 Nov 2023 10:58:20 +0200
Message-ID: <87h6lfo53n.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_005833_088040_3377D754 
X-CRM114-Status: UNSURE (   5.12  )
X-CRM114-Notice: Please train this message.
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

On Mon, 20 Nov 2023, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> v4:
> - more ack and review tags

Please do not send new versions just to record the acks and
reviews. They should be added while applying the patches.

Thanks,
Jani.

-- 
Jani Nikula, Intel

