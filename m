Return-Path: <SRS0=cDU4=FX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A809C4361B
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Dec 2020 15:04:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27163233FC
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Dec 2020 15:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27163233FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SXcU7LxFjkBrg4koD5Utf68tx0YBlvPzK5FDVOfPGLg=; b=fuV1CbZafZjYi9W3suO/5LmaI
	CqteKuTZGpv1ciw3HKk5zKZ4s3w2eSkosUsNDf7Q3lAtrUgzRzXRfr79lmZQrm2jOm5ij1RrlDOVI
	w7MPC4+Ng1ve7zwT+FwabOtE7l3JFu5Bhm6eTNFHw2Ke/v+GGPrysTdQuTZoEfDAUsbTSQn3zNLgU
	o/6s8lnYZE+DS6Bq+yRZn3lfwy8DDmzolhoKkNxJNnyoFid17pfkctk9hQW+OJ4Qc5XEV6cp6B2sq
	uweYDw6fd72eLjg3FKnhpnxe4+TUOsea2B2Umx1rtQ2+XpWLtzB7bvMa6DP4Sr003GDawRgwpXXpA
	4JM0DSOBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqdmU-0000fl-5i; Sat, 19 Dec 2020 15:04:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqdmR-0000f5-2d; Sat, 19 Dec 2020 15:04:24 +0000
X-UUID: 604d47efdadd4668a93f63e96d7e9b31-20201219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=C4/cJcay2xH9BgD17UjpZiDNunmS0uPQrgtdb1abt30=; 
 b=bHLD7P9sRhpmgma5zxqyukW6itUqal9o69aXqNOjZZmD8q55l7nkzNeeqTaliyHHjqctSlSMn7aBu6XbrFpPsXtbMOhy5rm5lWuSbtS6P3DRV+sDkPEqp2StpTfOYll+hwc7QLqMdVKZhK+PfW+LvpxadfVCPJf/TsXlYmoowQ0=;
X-UUID: 604d47efdadd4668a93f63e96d7e9b31-20201219
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 440796336; Sat, 19 Dec 2020 07:04:16 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 19 Dec 2020 07:04:13 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 19 Dec 2020 23:04:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 19 Dec 2020 23:04:04 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <oliver.sang@intel.com>
Subject: Re: [PATCH] kernel/watchdog_hld.c: Fix access percpu in preemptible
 context 
Date: Sat, 19 Dec 2020 23:04:06 +0800
Message-ID: <20201219150406.16925-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201219135917.GA26344@xsang-OptiPlex-9020>
References: <20201219135917.GA26344@xsang-OptiPlex-9020>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_100423_261556_AB5A4221 
X-CRM114-Status: GOOD (  10.17  )
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
Cc: sumit.garg@linaro.org, lkp@intel.com, will@kernel.org,
 yj.chiang@mediatek.com, linux-kernel@vger.kernel.org, lkp@lists.01.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 alexandru.elisei@arm.com, linux-arm-kernel@lists.infradead.org,
 lecopzer.chen@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Thanks a lot, I'll try to fix this in anthoer way(patch v2) to avoid
regreesion other than arm64

BRs,
Lecopzer


> Greeting,
> 
> FYI, we noticed the following commit (built with gcc-9):
> 
> commit: 6e37d53a67753bcb12a0b9102cac85d98f8a0453 ("[PATCH] kernel/watchdog_hld.c: Fix access percpu in preemptible context")
> url: https://github.com/0day-ci/linux/commits/Lecopzer-Chen/kernel-watchdog_hld-c-Fix-access-percpu-in-preemptible-context/20201217-211549
> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git accefff5b547a9a1d959c7e76ad539bf2480e78b
> 
> in testcase: boot
> 
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 8G
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
