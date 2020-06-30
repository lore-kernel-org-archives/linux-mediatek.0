Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A4DC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 09:30:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FED82073E
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 09:30:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z6GW0VoX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dYwznZ8Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FED82073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jUM8TyJIATdsO5fwQ5/a7r6fxoacXpWMauQ1owuKTio=; b=z6GW0VoX5/W5/kEtayBEr0HqT
	w3Xxlrcc7BZGulf+ywP7vwE/axJCnwWRIPBzxvLOKblld2zanOnhT5D/+WOOeEAD2QqT631KsnaF3
	V1iLDRWh46Of9/AMhs02XurfaeoctXqQib4Q616sKR2vwBEGKPUzjVnmjh/qVdD+7eyvIQhx65LkZ
	J+f2R9BGJ3LW3S/YpaZw6FKbEAEP7YObskhsDznweh0cexLb7nAjQB6Wy+alWRBxwig8N+C1E1pVp
	MpYhVBIFZhp31LiG59Ex++yAR09uyg+gLS/QLBtNga6mnWx0ilhGAOpVD0ReoB3qUfkJeVjTNXFGF
	Plmm0GtLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqCat-0005mI-DE; Tue, 30 Jun 2020 09:30:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqCaq-0005ll-2o; Tue, 30 Jun 2020 09:30:21 +0000
X-UUID: a2041689e9b04ab8b30c6d6a6626c711-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qWezObeQUl2l9qNQFUNHf2rax4BUh9tFvDVgI6m22bM=; 
 b=dYwznZ8YP/LHBxn1267ZqK5zW70isCJDsHqF26+mzHhAKp6HxunfsocMGiwcws++SXhyuMW0Qn7cdm1GCLN/c87mrP7KCp3TLQ1rBAWBf6RL8kyd9767HuXNAeP2tAdZsmHtssr9umUcA4DHSEvUqdnMPiD01rQYSDq01ld/i1Q=;
X-UUID: a2041689e9b04ab8b30c6d6a6626c711-20200630
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 941587857; Tue, 30 Jun 2020 01:30:08 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 02:30:08 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 17:29:59 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Jun 2020 17:30:00 +0800
Message-ID: <1593509401.4597.2.camel@mtkswgap22>
Subject: Re: [PATCH v2 1/2] dt-bindings: devapc: add bindings for devapc-mt6873
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 30 Jun 2020 17:30:01 +0800
In-Reply-To: <20200629215606.GA3000557@bogus>
References: <1592559720-8482-1-git-send-email-neal.liu@mediatek.com>
 <1592559720-8482-2-git-send-email-neal.liu@mediatek.com>
 <20200629215606.GA3000557@bogus>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3175C1BF43F1CAF0F6007F915B1493F2B7BBFB5C28F83E2A1A19B3F75235C5422000:8
X-MTK: N
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, Neal Liu <neal.liu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-06-29 at 15:56 -0600, Rob Herring wrote:
> On Fri, 19 Jun 2020 17:41:59 +0800, Neal Liu wrote:
> > Add bindings for MT6873 devapc.
> > 
> > Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> > ---
> >  .../soc/mediatek/devapc/devapc-mt6873.yaml         |   61 ++++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.yaml
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.example.dt.yaml: example-0: devapc@10207000:reg:0: [0, 270561280, 0, 4096] is too long
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.example.dt.yaml: example-0: devapc@10207000:reg:1: [0, 271007744, 0, 4096] is too long
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.example.dt.yaml: example-0: devapc@10207000:reg:2: [0, 271011840, 0, 4096] is too long
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.example.dt.yaml: example-0: devapc@10207000:reg:3: [0, 285343744, 0, 4096] is too long
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.example.dt.yaml: example-0: devapc@10207000:reg:4: [0, 270589952, 0, 4096] is too long
> 
> 
> See https://patchwork.ozlabs.org/patch/1312741
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
> 

I just pull the latest dt-schema from github, and it's still successful.
Is there any other clue for this difference?

$ PATH=~/virt_test/python36/bin:$PATH ARCH=arm64 make dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.yaml
  CHKDT
Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.yaml
  DTC
Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.example.dt.yaml
  CHECK
Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.example.dt.yaml

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
