Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8497C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Nov 2023 10:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYIwEi2Wd+4TePNzi94mb6f7lO2b/AohyfB/LcSkyNU=; b=Ef8auOaWuGGGaIiMClWSNYC/3x
	NZE1rDRaTm7W6LsAUs/wju0aVi50pVKwuYFQYWPL7GenLfxuw3aso+EvZFup4B1ULyNciWJki2wNA
	iahE3r+1WmZyTnDJrH4JbfB/E3GEyykXpjzazzucTWtc/wvgorMxp3zOy5S2uW/YHlQ7W4chiyJT8
	N2pOwcCSEMlm7s8qZErKqIFT0sESeKvgnWKTxCaRdI24zsCy9LxFYrHK/KBerIg/yQIYIwulMq8fs
	iYGFZQPdzPyYfjNEZvZUHH96FRieP5UI1I1VzTiYyAOsy0N77Ab/+qgovl2kvfjGmZDeJQGxQptUi
	jPw7PAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy88W-0070nf-04;
	Wed, 01 Nov 2023 10:07:44 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy88Q-0070ka-1q
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Nov 2023 10:07:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698833258; x=1730369258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/G6YHPcZjKp/CrBMDSSrt2epiYSXFZcrqUWw6QsDyWY=;
  b=KlUp3GNSt7hjbcSsGg8e016t9dyBOk6rqhBFosZgXyTliaXQjhJMOSD6
   I4UftPMPKo/yuCTWvreQlUBq0fl1ZYKYIbnMacGpd56kOT1qFnW02eNXx
   ZyhuFos+ub2Gjhn49hGcB3i7avBEI06sBrdLaVnYbnWW7sIOD/RkvGwlw
   1gZKiG41MTzvLahKw4skJcwPnaFWQvcPGveDG2rbwTRv0dvdmYTxhr4dj
   1jyGEji8nV+oBGwhqlPuECPokwMrdvrR0asSxFJNDzw9V3KoiGJYj6+PJ
   9vDrb3giAAVl43oz53LF979tM1DrEgbHGnAq2Pp00uBzVNSry2XDMX849
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="452756083"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="452756083"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 03:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="851533391"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="851533391"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 03:07:33 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F006C1207A3;
	Wed,  1 Nov 2023 12:00:15 +0200 (EET)
Date: Wed, 1 Nov 2023 10:00:15 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-acpi@vger.kernel.org,
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
	linux-mediatek@lists.infradead.org, rafael@kernel.org
Subject: Re: [PATCH v2 1/1] device property: Add fwnode_name_eq()
Message-ID: <ZUIhr1Wiy96PMEKx@kekkonen.localdomain>
References: <20231101072729.1142578-1-sakari.ailus@linux.intel.com>
 <ZUIfSIWze4llNJfd@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUIfSIWze4llNJfd@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_030738_662797_760B2480 
X-CRM114-Status: GOOD (  16.79  )
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

On Wed, Nov 01, 2023 at 11:50:00AM +0200, Andy Shevchenko wrote:
> On Wed, Nov 01, 2023 at 09:27:29AM +0200, Sakari Ailus wrote:
> > Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> > on fwnode property API. The same convention of ending the comparison at
> > '@' (besides '\0') is applied on also both ACPI and swnode. The function
> > is intended for comparing unit address-less node names on DT and firmware
> > or swnodes compliant with DT bindings.
> 
> ...
> 
> > - Use size_t type for len.
> 
> Strictly speaking it should be ptrdiff_t according to the code.

It'll be compared to size_t right after. ptrdiff_t is signed and we know we
have a positive number here so size_t seems like a better choice.

> 
> ...
> 
> > + * the comparison to either '\0' or '@' character
> 
> NUL is a human-readable substitution to less parsable '\0'.

I can send v3 with that but I'll wait a bit if there are more comments.

-- 
Sakari Ailus

