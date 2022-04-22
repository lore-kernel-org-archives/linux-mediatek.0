Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEA2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5QIAn2iMaATJBITXleo2Sp9MA2sgW2CNm7T9rG8VSo=; b=z0pPja5NR2LnFq
	GdtVq5X2ej6LiZg6EOKUVo6cvFCL3p+WoqdRmULbdPQMjVlT7AsFrCQuetwRMhN4Y1iHCmDeVh4Fj
	Wo6b6hDyek8KrMpS4UE29T3CtUjajsap1CtaldwhG1fC/8p3mN14g9H3dQLFWhH0eaVvh8FwGEpsF
	3Yb1e/KCnmIc/dbCafwmcBf5BZptJ5abiqZ8Z+gX3ie9m+J+UuJ47CEHInfILgUMeFNEC3Hz4UwoO
	SSeQszwMgDG92msInb9qfBGotYoQIuPJwD4W36t8QcUhwfbH1i6l3alzfA5SJ3EBr3w0HKTjXy5bU
	FbnPik2gaTRIIdN7nyIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhpaK-00HPlq-6T; Fri, 22 Apr 2022 09:28:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhpa7-00HPgB-4V; Fri, 22 Apr 2022 09:28:04 +0000
X-UUID: 30aaa94e3cf740a9856421e5e6096770-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:557b4e70-9540-4c50-84bd-cda0043913e9, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:a7f9c4ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 30aaa94e3cf740a9856421e5e6096770-20220422
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 444827497; Fri, 22 Apr 2022 02:27:57 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 02:27:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 17:27:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 17:27:54 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <mark-pk.tsai@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mingo@redhat.com>, <rostedt@goodmis.org>, <yj.chiang@mediatek.com>
Subject: [PATCH v3 0/2] tracing: make tracer_init_tracefs initcall asynchronous
Date: Fri, 22 Apr 2022 17:27:51 +0800
Message-ID: <20220422092751.19386-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220323152257.7871-1-mark-pk.tsai@mediatek.com>
References: <20220323152257.7871-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_022803_203796_3C6D7690 
X-CRM114-Status: GOOD (  11.79  )
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


Hi Steve,

Could you please help to review this patch?
Sorry to disturb you, I just want to make sure it has not been
forgotten.

> Move trace_eval_init() to subsys_initcall to make it start
> earlier.
> And to avoid tracer_init_tracefs being blocked by
> trace_event_sem which trace_eval_init() hold [1],
> queue tracer_init_tracefs() to eval_map_wq to let
> the two works being executed sequentially.
> 
> It can speed up the initialization of kernel as result
> of making tracer_init_tracefs asynchronous.
> 
> On my arm64 platform, it reduce ~20ms of 125ms which total
> time do_initcalls spend.
> 
> Mark-PK Tsai (2):
>   tracing: Avoid adding tracer option before update_tracer_options
>   tracing: make tracer_init_tracefs initcall asynchronous
> 
>  kernel/trace/trace.c | 38 ++++++++++++++++++++++++++++----------
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
