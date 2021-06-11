Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DF8C48BD1
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 16:13:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3918361285
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 16:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3918361285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jh1ErpGBht5G4npHT7WXPtxlMNiMqwXaPqDeqBU/Gx0=; b=kiorFuZdIQ2XQI
	y3RpfoXtiRj2sDaF3AaFRbiZt6hn47PnQK92mUgANPWb8k9Yt4QOnKhINj8yBYdRYhCwRq4bPdMMu
	odnFss4pvY33/Gj6gi39sqRRdSyGBiUtfPrTiy7xKtVCNAlao1epAAQmr5WeE0SG0jdEnUgt4Te5y
	haTiUJzJRJBTuzgK/fBzOrmKU/wrP+JxEy74TIx+IEGv0QgWVFNeUaw4AS5ADByQMbLltCesn6phX
	pZFc+HsH/bWXByKlRrsAAQa+Xls3vit7/w/pzSUfDEKCfAmdKBBLgZ6Q138w9x8OLuegZTHjM4qbX
	NvXPGpuTRU18S0xg11YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrjm3-005vv3-Vr; Fri, 11 Jun 2021 16:12:48 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrjlp-005vsF-P4; Fri, 11 Jun 2021 16:12:35 +0000
IronPort-SDR: wou0jhXWBdrbgISW350v9dapau4iWCd0e69qYUyycvmzh1CgzfDVNNOfonBDRIYTMOzDReCr7t
 gk1eWDpnK4sg==
X-IronPort-AV: E=McAfee;i="6200,9189,10012"; a="192865604"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="192865604"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 09:12:29 -0700
IronPort-SDR: hYweaGxaI7yIu9RoJ5cDtL4ZzMjbpf6PDj6vl8pQKBonCgwUo3XoTke2a2/hBCPki0E+XgCvwG
 fodlEZNQ1BEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="483316279"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga001.jf.intel.com with ESMTP; 11 Jun 2021 09:12:28 -0700
Received: from lcsmsx601.ger.corp.intel.com (10.109.210.10) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 11 Jun 2021 09:12:27 -0700
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 LCSMSX601.ger.corp.intel.com (10.109.210.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 11 Jun 2021 19:12:25 +0300
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.2242.008;
 Fri, 11 Jun 2021 19:12:25 +0300
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: "trix@redhat.com" <trix@redhat.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "tsbogend@alpha.franken.de"
 <tsbogend@alpha.franken.de>, "jic23@kernel.org" <jic23@kernel.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "nbd@nbd.name"
 <nbd@nbd.name>, "lorenzo.bianconi83@gmail.com"
 <lorenzo.bianconi83@gmail.com>, "ryder.lee@mediatek.com"
 <ryder.lee@mediatek.com>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>,
 "davem@davemloft.net" <davem@davemloft.net>, "kuba@kernel.org"
 <kuba@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "apw@canonical.com" <apw@canonical.com>, "joe@perches.com" <joe@perches.com>, 
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, "chenhuacai@kernel.org"
 <chenhuacai@kernel.org>, "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>, 
 "zhangqing@loongson.cn" <zhangqing@loongson.cn>, "jbhayana@google.com"
 <jbhayana@google.com>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>,
 "shayne.chen@mediatek.com" <shayne.chen@mediatek.com>,
 "Soul.Huang@mediatek.com" <Soul.Huang@mediatek.com>, "shorne@gmail.com"
 <shorne@gmail.com>, "gsomlo@gmail.com" <gsomlo@gmail.com>,
 "pczarnecki@internships.antmicro.com" <pczarnecki@internships.antmicro.com>,
 "mholenko@antmicro.com" <mholenko@antmicro.com>, "davidgow@google.com"
 <davidgow@google.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: RE: [PATCH 2/7] mei: hdcp: SPDX tag should be the first line
Thread-Topic: [PATCH 2/7] mei: hdcp: SPDX tag should be the first line
Thread-Index: AQHXXkH6CZWhH34xEEKudrvKO6IQEasO/INA
Date: Fri, 11 Jun 2021 16:12:24 +0000
Message-ID: <22a4dc49b49348438d71be0fb02e3ab1@intel.com>
References: <20210610214438.3161140-1-trix@redhat.com>
 <20210610214438.3161140-4-trix@redhat.com>
In-Reply-To: <20210610214438.3161140-4-trix@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.184.70.1]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_091233_879159_AB54EB95 
X-CRM114-Status: GOOD (  14.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> 
> From: Tom Rix <trix@redhat.com>
> 
> checkpatch looks for the tag on the first line.
> So delete empty first line
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
Acked-by: Tomas Winkler <tomas.winkler@intel.com>
> ---
>  drivers/misc/mei/hdcp/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/misc/mei/hdcp/Kconfig b/drivers/misc/mei/hdcp/Kconfig
> index 95b2d6d37f102..54e1c95269096 100644
> --- a/drivers/misc/mei/hdcp/Kconfig
> +++ b/drivers/misc/mei/hdcp/Kconfig
> @@ -1,4 +1,3 @@
> -
>  # SPDX-License-Identifier: GPL-2.0
>  # Copyright (c) 2019, Intel Corporation. All rights reserved.
>  #
> --
> 2.26.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
