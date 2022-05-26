Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC35C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 09:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JX3b9BbrOHmY0xI/AyDbrLfwd6ufNs8+Q5ZK1RTrguE=; b=YsVhUaN2MDf/f1
	WQ9fDXziY1bfaDKB2vwyI/OIgGsp3Jj4Rv2EPw37FnerIxTwylzwi/hiCNMpkEdq0VBTN9mhtgiPi
	STaiQnmkkHa11a487Eng4YOArYCfV1s08xPKwQgCRG8mFdRs3UBOOGuDdYlLi+DejFUXhDQqYRFz2
	PgwyQ2Gn2jXbOjsog65c9+tawxzyKheinfySt+VRuh7wY8ERQQ1UlmamoFOSzNWeG3uaTFOlZZXQK
	fR4JxHDfeZ2gLoqwAxy08ABSot7SFUq0BhgH5CSBQUTp6medfF+ZD8z8YpsaqgCVEpKHfoPT4LP3s
	j0GNwZl1ZXqiM/Wn6kzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuA18-00EEii-SI; Thu, 26 May 2022 09:42:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuA0w-00EEfx-72; Thu, 26 May 2022 09:42:45 +0000
X-UUID: d76fbe3be3074122929088d31628038e-20220526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:f41d7d87-82cc-45d1-b18e-8e022059d8fc,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:7b449347-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:1,File:ni
	l,QS:0,BEC:nil
X-UUID: d76fbe3be3074122929088d31628038e-20220526
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <lecopzer.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2046746736; Thu, 26 May 2022 02:42:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 May 2022 02:35:42 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 26 May 2022 17:35:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 26 May 2022 17:35:40 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <pmladek@suse.com>
CC: <acme@kernel.org>, <akpm@linux-foundation.org>,
	<alexander.shishkin@linux.intel.com>, <catalin.marinas@arm.com>,
	<davem@davemloft.net>, <jolsa@redhat.com>, <jthierry@redhat.com>,
	<keescook@chromium.org>, <kernelfans@gmail.com>,
	<lecopzer.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <mark.rutland@arm.com>,
	<masahiroy@kernel.org>, <matthias.bgg@gmail.com>, <maz@kernel.org>,
	<mcgrof@kernel.org>, <mingo@redhat.com>, <namhyung@kernel.org>,
	<nixiaoming@huawei.com>, <peterz@infradead.org>,
	<sparclinux@vger.kernel.org>, <sumit.garg@linaro.org>, <wangqing@vivo.com>,
	<will@kernel.org>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH v4 6/6] arm64: Enable perf events based hard lockup detector
Date: Thu, 26 May 2022 17:35:40 +0800
Message-ID: <20220526093540.19223-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YodjucHQ3Nab5J/f@alley>
References: <YodjucHQ3Nab5J/f@alley>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_024242_310643_9358A64E 
X-CRM114-Status: GOOD (  15.45  )
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

> > to re-initialize lockup detection once PMU has been initialized.
> > 
> > [1]: http://lore.kernel.org/linux-arm-kernel/1610712101-14929-1-git-send-email-sumit.garg@linaro.org
> > 
> > --- a/arch/arm64/kernel/perf_event.c
> > +++ b/arch/arm64/kernel/perf_event.c
> > @@ -1390,10 +1391,15 @@ static struct platform_driver armv8_pmu_driver = {
> >  
> >  static int __init armv8_pmu_driver_init(void)
> >  {
> > +	int ret;
> > +
> >  	if (acpi_disabled)
> > -		return platform_driver_register(&armv8_pmu_driver);
> > +		ret = platform_driver_register(&armv8_pmu_driver);
> >  	else
> > -		return arm_pmu_acpi_probe(armv8_pmuv3_pmu_init);
> > +		ret = arm_pmu_acpi_probe(armv8_pmuv3_pmu_init);
> > +
> > +	retry_lockup_detector_init();
> 
> Does it makes sense to call retry_lockup_detector_init() when
> the above returned an error? Should it be?
> 
> 	if (!ret)
> 		retry_lockup_detector_init();

Oh I think you're right, I'll add a checking here.
> 
> > +	return ret;
> >  }
> >  device_initcall(armv8_pmu_driver_init)
> 
> 
> I am not qualified to ack the arm-specific code. But otherwise
> the change looks reasonable.

Thanks for your help, I'l rebase on 5.19 -rc1 and seek reviewing for
ARM relative part.


thanks
BRs,
Lecopzer



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
