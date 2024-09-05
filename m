Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8B0CD5BA2
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 09:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kGH80ordyv20AcZCJJKyTo4JdPjwcej8QohhqZgdvY=; b=mn5Hof52IbX1yKF7ecPBhPF7YQ
	N5y21qaDIlPH7kTUe+YdXGDxx32/HRNP/gxwtTGkJ1pl4eRPD4ZTNgAL6NkH+pbwWq1G0o4Qln+LQ
	gLKAWdOO1Ir5pYC2IZLjrNPuePhz4JeFb3tpSQiwyOYC57KR6T91D7Y7+qWzm90YSY09JSU3kx28O
	xzcuDjpKhGE0vGvJb8vHcDch5axzVQN7NdlR1SfeoKRvRsV3I1U7fzkE2D+u4fLRyVPm4VJhXEvwf
	pm1/c6y2kXSf3h7haxgjbtmxk7I5LAfVtG43RdhscPTEOloP/Z9u9IE/aej/gRk+ivdOcQwk4wBup
	rvsbf1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8tZ-00000007nTn-1mQv;
	Thu, 05 Sep 2024 09:35:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8tW-00000007nSW-2rXu;
	Thu, 05 Sep 2024 09:35:15 +0000
X-UUID: 247c5f206b6a11efba0aef63c0775dbf-20240905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4kGH80ordyv20AcZCJJKyTo4JdPjwcej8QohhqZgdvY=;
	b=t2VoHsTMZ4CWxVCvLzLnAlcQ0LFjqwR+TK9nnZcVxLw4efD21oh817RTue6OtnHi9o/R31fDUgx/c0vwAEe7yx51vm11qTFi99yKmkBYkkuJQpPisaduZnyXxtzXso6kNB66BVzFQdpNeTST47vFWmfSx+hm6k3bfVnXN5j3Ylw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:b8f73a06-2ea9-49c1-8b16-c57580778c20,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:a5cfbccf-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:817|102,TC:nil,Content:0|-5,EDM:-3,I
	P:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
	,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 247c5f206b6a11efba0aef63c0775dbf-20240905
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <yenchia.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1945671038; Thu, 05 Sep 2024 02:35:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 5 Sep 2024 02:34:33 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 5 Sep 2024 17:34:33 +0800
From: Yenchia Chen <yenchia.chen@mediatek.com>
To: <gregkh@linuxfoundation.org>
CC: <angelogioacchino.delregno@collabora.com>, <len.brown@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<matthias.bgg@gmail.com>, <pavel@ucw.cz>, <rafael.j.wysocki@intel.com>,
	<rafael@kernel.org>, <stable@vger.kernel.org>, <yenchia.chen@mediatek.com>
Subject: Re: [PATCH 6.6 1/1] PM: sleep: Restore asynchronous device resume optimization
Date: Thu, 5 Sep 2024 17:34:33 +0800
Message-ID: <20240905093433.4798-1-yenchia.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <2024090420-protozoan-clench-cca7@gregkh>
References: <2024090420-protozoan-clench-cca7@gregkh>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_023514_748727_7F2B234C 
X-CRM114-Status: GOOD (  14.06  )
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

>> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>> 
>> commit 3e999770ac1c7c31a70685dd5b88e89473509e9c upstream.
>> 
>> Before commit 7839d0078e0d ("PM: sleep: Fix possible deadlocks in core
>> system-wide PM code"), the resume of devices that were allowed to resume
>> asynchronously was scheduled before starting the resume of the other
>> devices, so the former did not have to wait for the latter unless
>> functional dependencies were present.
>> 
>> Commit 7839d0078e0d removed that optimization in order to address a
>> correctness issue, but it can be restored with the help of a new device
>> power management flag, so do that now.
>> 
>> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>> Signed-off-by: Yenchia Chen <yenchia.chen@mediatek.com>
>> ---
>>  drivers/base/power/main.c | 117 +++++++++++++++++++++-----------------
>>  include/linux/pm.h        |   1 +
>>  2 files changed, 65 insertions(+), 53 deletions(-)

>Why does this need to be backported?  What bug is it fixing?

>confused,

>greg k-h

Below is the scenario we met the issue:
1) use command 'echo 3 > /proc/sys/vm/drop_caches'
   and enter suspending stage immediately.
2) power on device, our driver try to read mmc after leaving resume callback
   and got stucked.

We found if we did not drop caches, mmc_blk_resume will be called and
system works fine.

If we drop caches before suspending, there is a high possibility that
mmc_blk_resume not be called and our driver stucked at filp_open.

We still try to find the root casue is but with this patch, it works.

Since it has been merged in mainline, we'd like to know it is ok to merge to stable.


