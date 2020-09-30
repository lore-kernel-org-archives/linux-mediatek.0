Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067B7C4727C
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 02:26:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A28E620773
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 02:26:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X41XOX9j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GwV4YRWn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A28E620773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5bPpfuW+dbr66Z9JyCmbNmIGrw1r88OSY97MVRou2P0=; b=X41XOX9jflkeam5YHoIPwyTUh
	4+J8heENOC/L19cA5NxaTxEA1ggSt2nywNEu12EsDmuYqzIunXiep+E3iFzfYzJvuMdXH3Ssx4DKL
	nnf/tgrozUYCOasuKWMyIXenzT0sdDQ/K5bwdkIwVyHqkATGv1PrPEFutfVCcCCqBWtRKHFKJ+5qe
	2ymEbe4ELCihJeSmrnoWwYcwHScKWYT6VchP97Mp0P9oLmmpiauIWkn77d3VSy6gIipRHIML6P9A7
	/9+JHSpLfHrfE5V7hnQKGjlcLYU/ESCTE1JM3plLd1dYbfU4kaIzvPPIGPd+nV0c4fmn85tH5srd/
	SDPEl6AXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNRol-00082B-5N; Wed, 30 Sep 2020 02:26:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNRog-000817-QX; Wed, 30 Sep 2020 02:26:03 +0000
X-UUID: 3187bec0267241a7bbf454df17701553-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FPhHR58XeaLRoJ4yRG0FFx7jDt7EJ3VRl8a75Zvvs3o=; 
 b=GwV4YRWnVvSNUyEh/57CZrSCJPacuk3fzz4B+Ui152nZIeWlxxvm9XT4E0aVN1g3MOXMcCF926gcVeYU3jGNKmIm5qPOSopTa9ngsoYkZin/Wx3P1NVrwpUAMb/0+dZXzj5/4Wjh0xBv6SKksp0NYJoOHvlblM7NNhjjkZBnzV4=;
X-UUID: 3187bec0267241a7bbf454df17701553-20200929
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1980805520; Tue, 29 Sep 2020 18:25:58 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 19:25:56 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 30 Sep 2020 10:25:45 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 10:25:48 +0800
Message-ID: <1601432748.14806.39.camel@mhfsdcap03>
Subject: Re: [v5,1/3] dt-binding: reset-controller: mediatek: add YAML schemas
From: Crystal Guo <crystal.guo@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 30 Sep 2020 10:25:48 +0800
In-Reply-To: <20200929154845.GA662033@bogus>
References: <20200929134642.26561-1-crystal.guo@mediatek.com>
 <20200929134642.26561-2-crystal.guo@mediatek.com>
 <20200929154845.GA662033@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7E20F32A211AA1F1D02E05A08D0CC71DFBC3DC598235B15E6056F5EF68E72CC72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_222602_991717_D4B36985 
X-CRM114-Status: GOOD (  15.81  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Yong Liang =?UTF-8?Q?=28=E6=A2=81=E5=8B=87=29?= <Yong.Liang@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fan Chen =?UTF-8?Q?=28=E9=99=B3=E5=87=A1=29?= <fan.chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, Yingjoe
 Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?= <Yingjoe.Chen@mediatek.com>,
 Stanley Chu =?UTF-8?Q?=28=E6=9C=B1=E5=8E=9F=E9=99=9E=29?=
 <stanley.chu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-09-29 at 23:48 +0800, Rob Herring wrote:
> On Tue, 29 Sep 2020 21:46:40 +0800, Crystal Guo wrote:
> > Add a YAML documentation for Mediatek, which uses ti reset-controller
> > driver directly. The TI reset controller provides a common reset management,
> > and is suitable for Mediatek SoCs.
> > 
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > ---
> >  .../bindings/reset/mediatek-syscon-reset.yaml | 51 +++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/reset/mediatek-syscon-reset.example.dt.yaml: example-0: infracfg@10001000:reg:0: [0, 268439552, 0, 4096] is too long
> 	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
> 
> 
> See https://patchwork.ozlabs.org/patch/1373428
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
> 

Thanks for your remind, re-submit at:
https://patchwork.kernel.org/patch/11807721/


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
