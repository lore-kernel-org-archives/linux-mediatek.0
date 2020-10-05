Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E084AC4727D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 08:49:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 853352064C
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 08:49:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U6ZpaFsz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 853352064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NdStN6e8bcrMWXXjXgcT3wHVgfeivyUC3UCHYTPF/kg=; b=U6ZpaFszXbBriBH8N+gpAGpJD
	lQg5D9d5twvgfNCqQl4A+F67k2od4m0KCZgRf8IFdPnuBP6fL/rKH4JwX145aUhkWwM5UJ1OdZFEm
	MsQMLXPaiSpAXhT1tH17KBSxZ0PmgVTBqlB7lHtkHOOz8qZanOhlxEm2G4F4Alflmz6iNkobHbstV
	E78ZHp0L6Z9JszzIZ1Fd/DeBOw+RCfXtkE0gkrCTGXCLO3FZTrYuzcmQBEIWrevmAXfhTr/e8JWFD
	PawsXICszW1bd/myR3z/nl4VllR/ZYobF31GVz9RokcfEqUSgWovvScnLSZVHzeGi8F4mzMhw812s
	uVFQFLRrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPMBC-00043X-OT; Mon, 05 Oct 2020 08:49:10 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPMBA-00042r-UK
 for linux-mediatek@lists.infradead.org; Mon, 05 Oct 2020 08:49:09 +0000
IronPort-SDR: mhxiuDrRvQ1CiFM3xGY+a4t+cq0cXmVnbXUM3f1UzTKopLlecjiJnAnE6h0m+8fQUijzPsxlIp
 4okrl9aYyj3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="227492885"
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; d="scan'208";a="227492885"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 01:48:58 -0700
IronPort-SDR: UPd8fX2UVZGZuWU587nv6Y5qXeQGSdpctqkoRfk2qW9uO47f/ntw6qFjqksYNiLg5cgddKIsE+
 j4TNDqJjK8VA==
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; d="scan'208";a="515922828"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 01:48:54 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 741AF205CA; Mon,  5 Oct 2020 11:48:52 +0300 (EEST)
Date: Mon, 5 Oct 2020 11:48:52 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH v2] media: mtk-vcodec: fix builds when remoteproc is
 disabled
Message-ID: <20201005084852.GD26842@paasikivi.fi.intel.com>
References: <20201004122234.802044-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201004122234.802044-1-acourbot@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_044909_108941_4DA26FFD 
X-CRM114-Status: GOOD (  17.90  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Alexandre,

On Sun, Oct 04, 2020 at 09:22:34PM +0900, Alexandre Courbot wrote:
> The addition of MT8183 support added a dependency on the SCP remoteproc
> module. However the initial patch used the "select" Kconfig directive,
> which may result in the SCP module to not be compiled if remoteproc was
> disabled. In such a case, mtk-vcodec would try to link against
> non-existent SCP symbols. "select" was clearly misused here as explained
> in kconfig-language.txt.
> 
> Replace this by a "depends" directive on at least one of the VPU and
> SCP modules, to allow the driver to be compiled as long as one of these
> is enabled, and adapt the code to support this new scenario.
> 
> Also adapt the Kconfig text to explain the extra requirements for MT8173
> and MT8183.
> 
> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks for the patch!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I wonder if this driver suffers from similar object lifetime management
issues than V4L2 and MC do, albeit not related to either. Say, what happens
if you unbind the other device while mtk-vcodec is in use?

-- 
Regards,

Sakari Ailus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
