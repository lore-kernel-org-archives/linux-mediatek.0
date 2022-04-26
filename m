Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F94EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 08:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jt+AZQGvXrdzoTaJzJ+Rz/9RNWbfrhmhm0aftcxKFYI=; b=rXL+XFgzIGQByh
	aAejG/1PehRMuB+USwqQlXdJxoat7prwdJUcA48FXQXjpgCmakf9Ky+WlptrVeR8+PDjzi+Hg2POt
	kQxtrCOR2dBnYWk1SCZ0O4kkK1lhVeDpwm0bHohJ3F+rhAzzoSGaLgv63JvMQWGGz9zfylQlkD3ea
	1VFjp9AKUqipwXfpKPaXcFkhLv+/3U/Ypa1k+3pfxxKtb/nKCa/eooy9OKTXlaOne5kqSODDNUrTk
	41FrU4V1tIpdZTN7bjMulSarCQzDrlr64RWtr1sBVNvXbRCBUrSTtVIuL53flgQP7cXz2Fheni/qE
	FHcrro+arMsq5bCXtaQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njGJ1-00DD5S-Pw; Tue, 26 Apr 2022 08:12:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njGIm-00DCza-OA; Tue, 26 Apr 2022 08:12:06 +0000
X-UUID: df25bef23069480f9a990a85eec6666e-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:65f43584-3dba-4b94-b5e8-f60185b4f599, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:74f982c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,File:nil,QS:0,BEC:ni
 l
X-UUID: df25bef23069480f9a990a85eec6666e-20220426
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1166641075; Tue, 26 Apr 2022 01:11:56 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 01:05:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 26 Apr 2022 16:05:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 26 Apr 2022 16:05:54 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <rostedt@goodmis.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <mark-pk.tsai@mediatek.com>,
 <matthias.bgg@gmail.com>, <mingo@redhat.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH v3 2/2] tracing: make tracer_init_tracefs initcall
 asynchronous
Date: Tue, 26 Apr 2022 16:05:54 +0800
Message-ID: <20220426080554.13180-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220422180734.225718b7@gandalf.local.home>
References: <20220422180734.225718b7@gandalf.local.home>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_011204_817960_A17AB413 
X-CRM114-Status: GOOD (  11.28  )
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


> > +static __init int tracer_init_tracefs(void)
> > +{
> > +	int ret;
> > +
> > +	trace_access_lock_init();
> > +
> > +	ret = tracing_init_dentry();
> > +	if (ret)
> > +		return 0;
> > +
> > +	INIT_WORK(&tracerfs_init_work, tracer_init_tracefs_work_func);
> > +	if (!eval_map_wq)
> > +		tracer_init_tracefs_work_func(&tracerfs_init_work);
> 
> Why go through the bother of doing the INIT_WORK if eval_map_wq is not
> created? Just do:
> 
> 	if (eval_map_wq) {
> 		INIT_WORK(&tracerfs_init_work, tracer_init_tracefs_work_func);
> 		queue_work(eval_map_wq, &tracerfs_init_work);
> 	} else {
> 		tracer_init_tracefs_work_func(NULL);
> 	}

Got it, I will update it in v4.
Thanks!

> 
> But that's just a nit anyway.
> 
> -- Steve
> 
> 
> 
> > +	else
> > +		queue_work(eval_map_wq, &tracerfs_init_work);
> >  
> >  	return 0;
> >  }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
