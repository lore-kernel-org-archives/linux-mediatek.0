Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF34C47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Feb 2024 12:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bw4ZMjJozQ5YqOJcTt3gKT2Vcee0B19IAYRWRCMPhmw=; b=d8Vf4QPKbjk3h+J9cqFzuleFCF
	3jWetYlT7lthwjHG9WQ0OW3/BMDqY/E8ndGXMmlhhsOA6HnSHgJcoEr/spdgi7s8dKvwbk/6Fq4I+
	DOOHWzGBwF+qqWJHzg1+DjUcGcHBLxrV7W0JL/jfd63uJt2EKlfI4DLzhjqd0DWL86/QjlZq6aQJk
	pjD5674q8wQQgn9kQgf7kkecbum2PsUsUsn+cg1hFmXKWoXUS237pUJbWoXUDA5b3eUmBqgF69Omg
	RD/JNjuDVNPjpKZ4qm54bKYRjCSSDNLkv99KwZr7zhH7fkYeyj1F+oVjrPhn6wFzT0/3+w2sZU/fa
	889Qe9JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfIea-00000009Av9-1NpN;
	Wed, 28 Feb 2024 12:03:16 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfIeW-00000009AuI-35y4;
	Wed, 28 Feb 2024 12:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709121793; x=1740657793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MpZ+7FpSdhy1jX1Eb1448QYNsWBInrp8KzudyioVXOg=;
  b=Qt+O4LpRQMfF6w1FL8+tv+H0Mr8UKsCbJUQsFpp0W4kMNtHsmCK2zVJt
   7t7XBnRjGr0mHGLqsthIgh6UNOgVZNlqmcKZA88ERWRgcaMNYuN7oLi0w
   +3nVKNnubCm0ziCBFVSkpuQjTkyfkudOo7lgEz1AP5RDvxd9EAatqDg/7
   D+AhyFXoPzn2yzH21/pfRMAle3sKzkveGPmPsyrAZkO+8gtG+NZMKZTZO
   UaPCFk8K/TQAZW1DxQDgCz/jQ4MwamUS0igvUXn18mobDmmYoopg36zTc
   Ec7d3vbHZlWrF8olTwWkTPdxqayIc/KbUwpSmH+WDfAiRFFmKsz+lFf3B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="7297426"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7297426"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 04:03:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="11988943"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 04:03:02 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F167911F855;
	Wed, 28 Feb 2024 14:02:59 +0200 (EET)
Date: Wed, 28 Feb 2024 12:02:59 +0000
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Zhi Mao =?utf-8?B?KOavm+aZuik=?= <zhi.mao@mediatek.com>,
	"heiko@sntech.de" <heiko@sntech.de>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
	"gerald.loacker@wolfvision.net" <gerald.loacker@wolfvision.net>,
	Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= <shengnan.wang@mediatek.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Yaya Chang =?utf-8?B?KOW8tembhea4hSk=?= <Yaya.Chang@mediatek.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"bingbu.cao@intel.com" <bingbu.cao@intel.com>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"10572168@qq.com" <10572168@qq.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"macromorgan@hotmail.com" <macromorgan@hotmail.com>
Subject: Re: [PATCH v6 2/2] media: i2c: Add GC08A3 image sensor driver
Message-ID: <Zd8g81wBXyfMvPhB@kekkonen.localdomain>
References: <20240227013221.21512-1-zhi.mao@mediatek.com>
 <20240227013221.21512-3-zhi.mao@mediatek.com>
 <CAHp75VciCJuoOwC8ozanWYqSCM=vWpiaqymJ2-gQfrSt5Ts6fQ@mail.gmail.com>
 <b4889fad324ec88eb3a22f51b0aa512cc93bd2cb.camel@mediatek.com>
 <CAHp75Vd=X9e4rOJabF4AbzGRZAF4BiNJa-C4ivOoQb7kAMy3vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd=X9e4rOJabF4AbzGRZAF4BiNJa-C4ivOoQb7kAMy3vQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_040312_843979_A0E8AC49 
X-CRM114-Status: GOOD (  18.38  )
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

Hi Andy, Zhi,

On Wed, Feb 28, 2024 at 11:22:13AM +0200, Andy Shevchenko wrote:
> > Another, I also reviewed some other sensor driver code(such as
> > gc0a08/gc2145 and imx/ov), they are all the same.
> 
> They are also problematic. So what?

The situation is the same in a large number of drivers, also outside the
media tree. It's also not trivial to figure out which header should be
included and it tends to be that if it compiles without warnings,
developers won't bother trying to figure out what should still be changed.

I wonder if this could be automated by using the C pre-processor and a
small Perl script. :-)

> > Can we keep this coding style and follow with most of those
> > image sensor driver?
> 
> Why? We do NOT want to continue developers to avoid decreasing their
> technical debts.

I agree. People tend to copy the code from existing drivers and argue "it's
just a driver, why bother?". That code will be soon found in a dozen other
new driver patchsets and every time must brought up in review and fixed,
leading to extra work for reviewers and developers. We've had quite a lot
of work improving the current (sensor etc.) drivers and fixing up the use
of bad patterns but this area has so far received little attention.

-- 
Regards,

Sakari Ailus

