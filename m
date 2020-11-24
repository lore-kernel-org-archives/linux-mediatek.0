Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8583CC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 08:39:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFFAB206FA
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 08:39:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PZenDRXY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFFAB206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hLwOqOIQROAuzTv9Diwprcc225DIX3iFvALsa6WUokM=; b=PZenDRXYeyCWzaP4mCNgAZa9j
	cuT1ZO0cGg/YVGqwc3QKLvldYzztdzV2jqzQPWP6mqnzi/duCaLGg4DaeI3sBJKZT25015XKc3AnD
	2Vmb0FfCyiBE7ZPMIGAU+LTnUVBRi4FEyOq5NY4QoLrD4czoLU/DnBVhHIpTRaa4MGyu0GdHs46+O
	LO3w7KAl9P75/BOTIuM8TscvZ+CxsXJ+fkxqAsWCu48nH2FTPI9+BlfG248uTA0EHiY57xrx9X0Wh
	fqf6QdO0nNciN+80RpDQ/hEWFSddVFFr3eAiuRfCUSe6GH8sstwJ8cp8QlopiGb4qm12/tt649y+R
	Mde80j3Sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khTrM-0004zS-JK; Tue, 24 Nov 2020 08:39:36 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khTrK-0004yo-R8
 for linux-mediatek@lists.infradead.org; Tue, 24 Nov 2020 08:39:35 +0000
IronPort-SDR: ER1DEzsPPb1mmYcLsJi52YYZ9BBv5ChYZRMQ45v2yADi9MWmie1+MU9uPwmvicWeR/GxTTZGkj
 4nLASPdI1YLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="169347936"
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; d="scan'208";a="169347936"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 00:39:31 -0800
IronPort-SDR: cKNWzGleNg8s9ZTNZKyg1HfAhsZt2mdGeoa+YbUF+no7uZSsz3ihOGBCXQSzwzgCJXwErcIYJi
 5sUjZDlkv9lA==
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; d="scan'208";a="327497228"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 00:39:27 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id CE74920461; Tue, 24 Nov 2020 10:39:25 +0200 (EET)
Date: Tue, 24 Nov 2020 10:39:25 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH v4 0/2] media: mtk-vcodec: fix builds when remoteproc is
 disabled
Message-ID: <20201124083925.GC3940@paasikivi.fi.intel.com>
References: <20201013124428.783025-1-acourbot@chromium.org>
 <CAPBb6MVM81dQyLJANUH7j8b5uhpk8ERdm9gpsGkF4k1Y-ZkYDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPBb6MVM81dQyLJANUH7j8b5uhpk8ERdm9gpsGkF4k1Y-ZkYDQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_033935_035913_BE7A2DCF 
X-CRM114-Status: GOOD (  11.59  )
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
 Tiffany Lin <tiffany.lin@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 08:56:00AM +0900, Alexandre Courbot wrote:
> Gentle ping about this - we are already well into the 5.10 cycle so we
> don't have much time left if we want to merge this build breakage
> fix...

Thanks for the ping.

For the set:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
