Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C35C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 12:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cLfdN+DRyJjTA5YTKFOsJ36ci70b0HSgPn5Y6ELZSww=; b=ILtiRa2MyKbpvg
	KzIWF9OhT2maRzcyUDN9CcBlpWHwG0QS9N++OwzDtGSeZyxXSouHn/WCTiWH6xpU9u4ktxBXJaQ3B
	V8Icbrruq4V8JOCdnuqTKxXt43FQ4djGZczoZbrprIQ/mRfzs0z+gggEMieCIXtioclXclYjYfSqg
	N1PT7WfE2pwaK72rbKGOswsAXjjZPslASfuTVPlIX2H8HKWR+TsliiNpH4RDAEHvOngV0dnOFE4rK
	UvKmbUCEvPnIj9cLgbwL1C4xXdvbs8YmFdzofXDXhxW2ww/ozFyDf0XUmhvuaDxLA2HCW+DJIDCtB
	H/j/xkRwXcxT3qxRU0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njKFR-00EFRK-CG; Tue, 26 Apr 2022 12:24:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njKF6-00EFLF-Cn; Tue, 26 Apr 2022 12:24:34 +0000
X-UUID: 6287fcc07267455fbaa574a9bda85cfd-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:b4249b87-426c-426e-956f-7c74398ccc4d, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:f881c22e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 6287fcc07267455fbaa574a9bda85cfd-20220426
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1224865044; Tue, 26 Apr 2022 05:24:26 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 05:24:24 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 26 Apr 2022 20:24:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 26 Apr 2022 20:24:10 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <rostedt@goodmis.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <mark-pk.tsai@mediatek.com>,
 <matthias.bgg@gmail.com>, <mingo@redhat.com>, <yj.chiang@mediatek.com>
Subject: [PATCH v4 0/2] tracing: make tracer_init_tracefs initcall asynchronous
Date: Tue, 26 Apr 2022 20:24:05 +0800
Message-ID: <20220426122407.17042-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_052432_491904_BBBF4A79 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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

Move trace_eval_init() to subsys_initcall to make it start
earlier.
And to avoid tracer_init_tracefs being blocked by
trace_event_sem which trace_eval_init() hold [1],
queue tracer_init_tracefs() to eval_map_wq to let
the two works being executed sequentially.

It can speed up the initialization of kernel as result
of making tracer_init_tracefs asynchronous.

On my arm64 platform, it reduce ~20ms of 125ms which total
time do_initcalls spend.

Changes in v2:
- Fix the use of ftrace_eval_maps in INIT_DATA after initmem_free().

  In v1, a kthread is create for tracer_init_tracefs() which
  might cause kernel crash if initmem is free before it finish.
  In v2, the work of tracer_init_tracefs() is separated into 2 parts,
  one is put to subsys_initcall and the other is queue to eval_map_wq
  which can make sure it always finish before initmem is free.

Changes in v3:
- Avoid adding tracer option before __update_tracer_options finish to fix
  the warning report by kernel test robot.

Reported-by: kernel test robot <oliver.sang@intel.com>
  https://lore.kernel.org/lkml/20220322133339.GA32582@xsang-OptiPlex-9020/

Changes in v4:
- Set `tracer_options_updated = true` before calling __update_tracer_options().
  Otherwise, __update_tracer_options() will skip all the tracer in trace_array.
- Init tracerfs_init_work only when eval_map_wq is successfully created.

Mark-PK Tsai (2):
  tracing: Avoid adding tracer option before update_tracer_options
  tracing: make tracer_init_tracefs initcall asynchronous

 kernel/trace/trace.c | 39 +++++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
