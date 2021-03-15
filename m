Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC73C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 17:31:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF6F864E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 17:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF6F864E99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JmcGVIlHLhaDaS/y56xEvhZ98Cvxn+oX6E+08Gms6Ic=; b=LzZfMq3aRy3NhX4gtH0Gm2wch
	lkduudQ9970KmltcQnn2dlW2t1uKcs2kFQpna8obIQL8ekR2PmGsVDMi14lHkbxSqDUWO7nc0uw38
	JEnc1X3z0e5SzO5gxerabJ/UZuaWWs6no/5GQsKgVp/YSED6r/URdvMclEAVyuF1mH7xnJQLmB7tW
	Rf/RO4ErRUsfm9fXN+BSK40olTyLsCrNVh/N+3nsSk14JYtvGH/UYIXUIqmfmcw25nUsEY8/Jcir1
	8/hvQtGQOk7lh+MWaiBK+hRuooqcjgUe6Ku6bh01oh45/SP077u4MkJRnwxRimZ0rQIXN8GmKEBNQ
	K98GQZvPg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLr3G-00GWF3-Ds; Mon, 15 Mar 2021 17:30:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLr39-00GWCl-5V; Mon, 15 Mar 2021 17:30:44 +0000
X-UUID: b1d2fe091040472cbecdc52aeb9c2f1f-20210315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=r9FRBMB1nJgQB9Ktvs2Hm5ModFYF6hmKvuOFmqaVDZY=; 
 b=W9oi7zKdhJxpS81saoB6NIBfwCmSaspWZr6qku5JOwR1CNvwhH/HOm6YXSGVos5GRMH5gv6OJd3+FVD60XdYlP3FGn1FjWE/jT/HJjeszg+WY1REukT4ccB1yO1hR+On2uA7dCKuEut6+zcb6d1CJN1G1LIzNgTwhX6MpeQI0cI=;
X-UUID: b1d2fe091040472cbecdc52aeb9c2f1f-20210315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1368541852; Mon, 15 Mar 2021 09:30:29 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 10:30:27 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 01:30:25 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Mar 2021 01:30:25 +0800
Message-ID: <1615829425.2591.1.camel@mtksdaap41>
Subject: Re: [PATCH v7 2/4] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>, "Rob
 Herring" <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Stephen
 Boyd <sboyd@kernel.org>
Date: Tue, 16 Mar 2021 01:30:25 +0800
In-Reply-To: <1615818177.192018.876373.nullmailer@robh.at.kernel.org>
References: <1615658453-3989-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1615658453-3989-3-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1615818177.192018.876373.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_173040_329469_A62E7EDB 
X-CRM114-Status: GOOD (  19.39  )
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

Hi, Sir

On Mon, 2021-03-15 at 08:22 -0600, Rob Herring wrote:
> On Sun, 14 Mar 2021 02:00:51 +0800, Hsin-Hsiung Wang wrote:
> > This adds documentation for the SPMI controller found on Mediatek SoCs.
> > 
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> > changes since v6:
> > - no changes.
> > ---
> >  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 74 +++++++++++++++++++
> >  1 file changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dts:19:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
>    19 |         #include <dt-bindings/clock/mt8192-clk.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:349: Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1380: dt_binding_check] Error 2
> 
> See https://patchwork.ozlabs.org/patch/1452529
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
Thanks for the review.

This series is based on Weiyi's patches.
https://patchwork.kernel.org/project/linux-mediatek/patch/1608642587-15634-7-git-send-email-weiyi.lu@mediatek.com/


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
