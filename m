Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B37C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 09:29:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38A3320722
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 09:29:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kDGGCMPz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38A3320722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d5B3DHKnQLTG+3Ba1jcS2AIFQprJQZppgFoqmPsg67I=; b=kDGGCMPzMPyCCeNv34egfax5z
	5B+kyHAqZIwEJ8G0m57FSrlpoie0LF6C5wYoNbO+VY8vTeOwCe6xQ3e59LAmQMJF5J9fIlupajjTd
	mKgEGwLu/6+BZKD4qgNd/8ifoAcRznYeVxxgP2SuB4WZ8zKZCxkw8/oNkOZZBIYwjuNrttF+5zqYl
	xjXjSFshj5tlmj4cXLAcfarJsnhiPoOoMYn7XCnN54g7/YQm8yvJkMPZ4F1NP2isY+UfRAk3B5jkR
	oV6YY3npRA5yZEoM86tUzkKrIHA7BXyl+mWAjQNAaBA7ST2cbz4h1Wn5CluWTS7R+Pu2sLvshmuMx
	4rKADnThw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqZ3m-0005mo-MC; Wed, 01 Jul 2020 09:29:42 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqYqv-0005hz-Eu; Wed, 01 Jul 2020 09:16:27 +0000
IronPort-SDR: u6yR5/EeaiG1aWLutuAqu1v+oyIssqG2Qte5nEH6yRwxChPdxLe92uMcv+Z8rFSztt4qLcAtfg
 X207vF07E1wg==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="144689084"
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="144689084"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 02:16:24 -0700
IronPort-SDR: Nbl7zm0UC4Q0tOalM8IapjeJbZy3GvjOB3grt6wLAxXu6vAIm/hp2QstzuSPYNdFYsvvlTsHB0
 ETX1pUk8u9sg==
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="321182597"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 02:16:20 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 2AB0C20760; Wed,  1 Jul 2020 12:16:18 +0300 (EEST)
Date: Wed, 1 Jul 2020 12:16:18 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH V9 0/2] media: i2c: Add support for DW9768 VCM
Message-ID: <20200701091618.GN16711@paasikivi.fi.intel.com>
References: <20200630062211.22988-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630062211.22988-1-dongchun.zhu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_051625_693502_F715F293 
X-CRM114-Status: GOOD (  14.76  )
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
Cc: mark.rutland@arm.com, drinkcat@chromium.org,
 andriy.shevchenko@linux.intel.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linus.walleij@linaro.org,
 shengnan.wang@mediatek.com, tfiga@chromium.org, bgolaszewski@baylibre.com,
 sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 louis.kuo@mediatek.com, matthias.bgg@gmail.com, bingbu.cao@intel.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dongchun,

On Tue, Jun 30, 2020 at 02:22:09PM +0800, Dongchun Zhu wrote:
> Hello,
> 
> This series adds DT bindings and V4L2 sub-device driver for Dongwoon's DW9768,
> which is a 10-bit DAC with 100mA output current sink capability.
> 
> The driver is designed for linear control of voice coil motor(VCM).
> It creates a V4L2 sub-device and provides control to set the desired focus.

Thanks for the update.

There seem to be trailing whitespaces at least in the first patch, and a
conflict in MAINTAINERS vs. current media tree master.

Could you address these, please?

-- 
Regards,

Sakari Ailus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
