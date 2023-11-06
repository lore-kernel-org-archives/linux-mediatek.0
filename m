Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E359C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 12:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQXP9Uoh0Ry5m5wZIHZFzONQg2qKwu1M7yvy3zh7BFo=; b=JOYZSGGyRE886HrfSNnNYP8PWz
	fz3l0TM7PVLNetTohT8G13YgOkYtJA4hGlFYrNUlggrPfL9SS3vM/2cLEDg2JMO7w+ONth6qH2Gp9
	NKn98pFwgX+pA8Gjl7Xhnu72onlrF70DmugeOsnCbRDBGw9yGxOljOPqPu8oIrFueTLXWE5cOZ8R0
	KHbDWoHmm2kagfIo3iuUUSnjhFgn+N7Ndks86w/1cdG3I8RhgMZrXaTCHdX79RqWSNG/qhRRV8OvO
	1FDg2U1n4kaLdPuV8PmV0OVqMJNG1qmwSw+GvdF1iHuqeOcvOCyZsVxuVR7yXEdM4E9DOY2qDzami
	K+12BYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyly-00GdiE-16;
	Mon, 06 Nov 2023 12:32:06 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzylv-00GdhS-1O
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Nov 2023 12:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273923; x=1730809923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=trKSJFRQ56/vfO4ua26lccDk+qC8F3ce04ec6I2TXcQ=;
  b=SKYNVWpEvqnYO3h6wMzoDFHg9Go5ZIRcVoEsKV3x0dBPlb60t5/Ai8BV
   2J9oimMeXZgH54T373tMiiQVmCXvuuGYhvecmNVnDb2WED5AzaooVB0EB
   CiXGC2Uxk7AaQoRsEJaNMqbfaqb3bEZXjZNJ+0NewLzbr2X2j79gE7LQC
   8yYKEy5GbnMmYyFj9o0PzmNPlLHUSJvY4lPvRV8m8+DRYQfkzgfmne1ZD
   rBZdG/DkOxXQXCrz/2g8Rk6IHMGGzzN1lvnsbq+qECPwoLGvbY7Ib63TC
   ee42Cwu4juilPgzEqKD9MnNj6hIR8vxupTRRFKek0VLrFueHGc5PXKp1X
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2173677"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="2173677"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:31:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="852985262"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="852985262"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:31:55 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 53FB511F724;
	Mon,  6 Nov 2023 14:31:53 +0200 (EET)
Date: Mon, 6 Nov 2023 12:31:53 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-acpi@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org, rafael@kernel.org
Subject: Re: [RESEND PATCH v4 1/1] device property: Add fwnode_name_eq()
Message-ID: <ZUjcuc52NRudNola@kekkonen.localdomain>
References: <20231106073141.1250344-1-sakari.ailus@linux.intel.com>
 <2023110623-alongside-credible-833d@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023110623-alongside-credible-833d@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_043203_548507_D2F2213D 
X-CRM114-Status: GOOD (  13.82  )
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

On Mon, Nov 06, 2023 at 09:45:45AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Nov 06, 2023 at 09:31:41AM +0200, Sakari Ailus wrote:
> > Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> > on fwnode property API. The same convention of ending the comparison at
> > '@' (besides NUL) is applied on also both ACPI and swnode. The function
> > is intended for comparing unit address-less node names on DT and firmware
> > or swnodes compliant with DT bindings.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Acked-by: Rafael J. Wysocki <rafael@kernel.org>
> > ---
> > Hi Greg,
> > 
> > Could we merge this via the media tree?
> 
> For 6.8-rc1?  Sure, feel free to:
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Yes, 6.8-rc1 is the target. Thanks!

-- 
Sakari Ailus

