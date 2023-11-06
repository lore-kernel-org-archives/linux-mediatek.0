Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D52C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 12:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qBAXrYySG6gKAUgAaqB0D2cyXPEZ9RG8xo9I9FYLfQ=; b=sRgCH/yPAbATDHnDudKYwokQCW
	rG/TuFLebb3psZ8XYifHiEPkUr6y9rLOr9s6QlxI796RfEKJLEZXz0sTy3BY2IoqtEDP63mfd7sBD
	khruDNJI6gaKr0bDKIECgWGagtm+7G81xiKR7aH3Qgw/GWynnlkYt8orYZX4gLB+TF59S1Uivq5rF
	zm6FNi+ycKwUSU7gCEF7cf793fOAugJ8YjZW96x/LWcziRNOAsqyvNZZEKqAw3XRBK/ajeBKagUst
	E9QiV8pWKADp4MpiLJnwB8wxHz4wm05x13/fCX/q4xjs8ZzQNZkhhTVVtG5fPx5J6N7DzhCThfQv9
	mSHX9rdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzymQ-00Gdm4-1B;
	Mon, 06 Nov 2023 12:32:34 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzymO-00GdlQ-0i
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Nov 2023 12:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273952; x=1730809952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tlgggN3W4d6dfZnKBFVMDarO3TDJrGS0z905ubna8TY=;
  b=gqnZ3uqclQC0nCLfcYD5gbO/hDr4TINLAQRg8OOTUMVoUI7ZlTPJFtLN
   wPjyfYXlHtpQ9RUO3ZRdqec/JOIABeJjAjBsgn8gHHJ4dPK+Uhlq/XgOy
   xVOkeWwO2bZCJO9gt8NMTU3LixP4yM8O5TX69j/L4V7Y6QtXa7JsxW+Hl
   6TL8ZmsgLcYrqp+O3E8YbDsbDU03v8rVUCkTvplSuOFZrte4jawv3cUT/
   mls74237FcpIW7rCk8bcrf98ie6Eswl1ARMa/lkLGFNxTn6Op30NTozVv
   QUTEKHxcbd+qOo2tmMVFGmXr8s2pyu069OCQ06zQVIrcHLxQtqc08S4jX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="393158895"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="393158895"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:32:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="712187400"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="712187400"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:32:24 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B256011F724;
	Mon,  6 Nov 2023 14:32:21 +0200 (EET)
Date: Mon, 6 Nov 2023 12:32:21 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, rafael@kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 1/1] device property: Add fwnode_name_eq()
Message-ID: <ZUjc1amZ9YfPwpNZ@kekkonen.localdomain>
References: <20231103070631.1223643-1-sakari.ailus@linux.intel.com>
 <ZUjOEsQSjom4SdOg@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUjOEsQSjom4SdOg@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_043232_443641_CEE081BB 
X-CRM114-Status: GOOD (  12.95  )
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

On Mon, Nov 06, 2023 at 01:29:22PM +0200, Andy Shevchenko wrote:
> On Fri, Nov 03, 2023 at 09:06:31AM +0200, Sakari Ailus wrote:
> > Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> > on fwnode property API. The same convention of ending the comparison at
> > '@' (besides NUL) is applied on also both ACPI and swnode. The function
> > is intended for comparing unit address-less node names on DT and firmware
> > or swnodes compliant with DT bindings.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I believe I gave already the tag...

I guess I've missed it earlier... Thanks!

-- 
Sakari Ailus

