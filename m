Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980CDC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 17:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rk0QYks8nR4hhBaviySiMKPKuHdAJbTbN9Z7DIZpZ8A=; b=q1LP8fi46/mfVWhvAumTUvmV2K
	j5ejHQUl5YztBprL1ttU6LjaY9StO96qwYZ2JguOhkwyNmCFo7tZh3ICwrX5i+Rcs0pTLdQ2rTO4Z
	r/yFwSN4jEb9+fo9xJeEjHF9/Z0WqACCuXqrc+hqXKw209oLt5WYroVfONBzX9Tb/8e/O8H8jZLx/
	h2g/TGxakxZa/vsi8c1v4WttjIpDo2g1dYBexZIjg/Vpwep6EAoRibNPCKeM9U/CvksiMgOXWFMXw
	HuCs2Ydj3bPavt3URKdvIEZHc/31iBHI2cBhWfTvScgXadJechY2o9aGJ+z2AwI9OUtXhS4wG74+j
	+d7RFIBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxsOr-005py7-2P;
	Tue, 31 Oct 2023 17:19:33 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxsOp-005pxj-1I
	for linux-mediatek@lists.infradead.org;
	Tue, 31 Oct 2023 17:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698772771; x=1730308771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ynm4tfHqWXPDrSI6ig6/UG85d5Tsv2T74eFACMZiyBE=;
  b=dWC0mg4TgybhcCeHZu0bqnPulab94fbabK1A9Kr2ECcFlKD125Dqez85
   cUytbRZQv5q7CRRA71Iq6h7ltCTbcF1/j9Az/4TWkhrhVruhWYS0XVNYg
   uIWE0aL/PEkIxKL1I+Er+uwfbL4tJjgulTuMAt0xEKKiUycJUCOATj3jP
   D8Dd8Ml+tEcDogwRXq51ba6BQTkGuemxWp8gx6OVP2W39j68z2QenRhml
   TTfW9cxRFMWnJ7kAOa2030tCpsZ+WjAYcCbiHZ25XWZ406t38Bv9iuLtO
   5vYu18+6F0+DntfH7ETTmt8ii7pCatnUmP+brqkDkYwGbHh3YG/u/zjmT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="387221366"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="387221366"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 10:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="831116769"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="831116769"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 10:19:12 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 59FAA11F894;
	Tue, 31 Oct 2023 19:19:09 +0200 (EET)
Date: Tue, 31 Oct 2023 17:19:09 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-acpi@vger.kernel.org, linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] device property: Add fwnode_name_eq()
Message-ID: <ZUE3Dbq2p8JZGeE1@kekkonen.localdomain>
References: <20231031135306.1106640-1-sakari.ailus@linux.intel.com>
 <ZUEsEQQTTlXmOHPt@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUEsEQQTTlXmOHPt@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_101931_471832_B776E4B2 
X-CRM114-Status: GOOD (  18.11  )
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

Hi Andy,

On Tue, Oct 31, 2023 at 06:32:17PM +0200, Andy Shevchenko wrote:
> On Tue, Oct 31, 2023 at 03:53:06PM +0200, Sakari Ailus wrote:
> > Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> > on fwnode property API. The same convention of ending the comparison at
> > '@' (besides '\0') is applied on also both ACPI and swnode. The function
> > is intended for comparing unit address-less node names on DT and firmware
> > or swnodes compliant with DT bindings.
> 
> Some comments below.
> 
> ...
> 
> > Would you be able to use this to replace of_node_name_eq()?
> 
> Can you point out to the use case? Maybe it can be rewritten using existing
> APIs?

Parsing DT for THine THP7321 ISP:
<URL:https://lore.kernel.org/linux-media/20231030133247.11243-1-laurent.pinchart@ideasonboard.com/T/#t>.

The driver shouldn't be bothered with separating the node name from the
unit address (separated by '@').

> 
> ...
> 
> > +	len = strchrnul(node_name, '@') - node_name;
> 
> > +	return strlen(name) == len && !strncmp(node_name, name, len);
> 
> Seems like this is reimplementation of str_has_prefix().
> 
> 	len = strchrnul(node_name, '@') - node_name;
> 	return str_has_prefix(node_name, name) == len;

I'll use this in v2.

-- 
Regards,

Sakari Ailus

