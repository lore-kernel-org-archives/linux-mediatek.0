Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C48C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 04:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcxqsl0CXt4YmHe2GybS1LZYSP8y4V9JuwvGQx9VeUE=; b=qDWSJ2Qib4AGGG4ehuQRg+6xH7
	NGe6w+fpmqkdwGk2jxzh9YRktWvKXaUhvkNfcrMg1oJL1JD5y7UrD8tOE2zyk3KWc3gYt3X42+IsJ
	JqM+6jHlMmQ+UvR1SHjIZi493SxSdTT1/h8qIeTOZ6UsuvJTcMq1lw3PTP9vhRTnMn1O6RPBmVhH6
	/4fNz5K2ud0GEUjijxGyXfQnQX6ZiL+eq12yGQTnL7QaqVoC/esESoZreCyKZ9egvvuHtjfi+vTX+
	XhuEv+vkc1TUTupqBarbqZx4xCX9IA9YJ3qxZLbvgrDftvhaN56zOhMIAbAScQiDyTnjouVlQ1Zu5
	sD6rE6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o23ML-005Owx-8x; Fri, 17 Jun 2022 04:13:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o23MA-005Osd-62; Fri, 17 Jun 2022 04:13:16 +0000
X-UUID: 0f630d0f4c6b40949e96e618da6b1eae-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:8af61e46-4530-4164-add2-ee60589f262d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:bfb2d848-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 0f630d0f4c6b40949e96e618da6b1eae-20220616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <lecopzer.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 828334491; Thu, 16 Jun 2022 21:13:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 21:07:44 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 17 Jun 2022 12:07:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 17 Jun 2022 12:07:40 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <mark.rutland@arm.com>, <will@kernel.org>
CC: <lecopzer.chen@mediatek.com>, <acme@kernel.org>,
	<akpm@linux-foundation.org>, <alexander.shishkin@linux.intel.com>,
	<catalin.marinas@arm.com>, <davem@davemloft.net>, <jolsa@redhat.com>,
	<jthierry@redhat.com>, <keescook@chromium.org>, <kernelfans@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<masahiroy@kernel.org>, <matthias.bgg@gmail.com>, <maz@kernel.org>,
	<mcgrof@kernel.org>, <mingo@redhat.com>, <namhyung@kernel.org>,
	<nixiaoming@huawei.com>, <peterz@infradead.org>, <pmladek@suse.com>,
	<sparclinux@vger.kernel.org>, <sumit.garg@linaro.org>, <wangqing@vivo.com>,
	<yj.chiang@mediatek.com>
Subject: RE: [PATCH v6 0/6] Support hld delayed init based on Pseudo-NMI for arm64
Date: Fri, 17 Jun 2022 12:07:40 +0800
Message-ID: <20220617040740.25631-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220614062835.7196-1-lecopzer.chen@mediatek.com>
References: <20220614062835.7196-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_211314_259552_0D32F54A 
X-CRM114-Status: GOOD (  14.31  )
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

Hi Will, Mark


Could you help review arm parts of this patchset, please?

For the question mention in both [1] and [2],

> I'd still like Mark's Ack on this, as the approach you have taken doesn't
> really sit with what he was suggesting.
>
> I also don't understand how all the CPUs get initialised with your patch,
> since the PMU driver will be initialised after SMP is up and running.

The hardlock detector utilizes the softlockup_start_all() to start all
the cpu on watchdog_allowed_mask, which will do watchdog_nmi_enable()
that registers perf event on each CPUs.
Thus we simply need to retry lockup_detector_init() in a single cpu which
will reconfig and call to softlockup_start_all().

Also, the CONFIG_HARDLOCKUP_DETECTOR_PERF selects SOFTLOCKUP_DETECTOR,
IMO, this shows that hardlockup detector supports from softlockup.


> We should know whether pNMIs are possible once we've completed
> setup_arch() (and possibly init_IRQ()), long before SMP, so so I reckon
> we should have all the information available once we get to
> lockup_detector_init(), even if that requires some preparatory rework.

Hardlockup depends on PMU driver , I think the only way is moving
pmu driver at setup_arch() or any point which is earlier than
lockup_detector_init(), and I guess we have to reorganize the architecture
of arm PMU.

The retry function should benifit all the arch/ not only for arm64.
Any arch who needs to probe its pmu as module can use this without providing
a chance to mess up the setup order. 


Please let me know if you have any concern about this, thank you


[1] https://lore.kernel.org/all/CAFA6WYPPgUvHCpN5=EpJ2Us5h5uVWCbBA59C-YwYQX2ovyVeEw@mail.gmail.com/
[2] https://lore.kernel.org/linux-arm-kernel/20210419170331.GB31045@willie-the-truck/


BRs,
Lecopzer

