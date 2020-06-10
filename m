Return-Path: <SRS0=3/N7=7X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 994D6C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 07:26:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C72D2064C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 07:26:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e28uyeeZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IUTBTpaB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C72D2064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uOaBR0D85d9M48tatnSxlR1OSsXCYkhyw9GzPk33VzE=; b=e28uyeeZdudc9H
	24UQtuQ5Yp52RHPof1bEcgUAmQUv3qKqEJLF/ifYa3D/4QID9DtjhLweGlHBkL81mXTN20lxUy2Ol
	lEuYW/WTbitq974CwzIK0+QaZor3fVtOK0d7RSlWrqd+OHjiQyMkkThmBnP0rXckYkGydcPBgGfOu
	Mxoz/BIAryK56EPO7bptZlvTpCwTy0D2zo55jIPdZsVpjTATkVrHJ59vT9duIbfbD29KCstPzZjQw
	QhReQnzEAcz2c+pZ+ep12cDbpDhg52Np2M77uNhBfAwbqNVOmFWSb+7KYDhfXA1zHwTezac8k3MT4
	EzyOXAqy6Yi3136OtczA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiv8A-0004aB-FM; Wed, 10 Jun 2020 07:26:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiv81-0004RT-DH; Wed, 10 Jun 2020 07:26:30 +0000
X-UUID: 09cf866490b64c8fac84ade77dae2ce1-20200609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=oVjcbyJtHSMVDm6RhFxQD8NCsbEcu2YvovIvKyEf9WA=; 
 b=IUTBTpaBBmuA2LUlB2T48toWx3CdAIxf4jwMN/vX+EWykLSG+cW3QoD+NTz4iRPhdqNM6a6v2iqe40C8qev9NQ3RkkD0D7pWCTNMzoZM9DaFxdOHyylza95xCUc8rZyztB63F/bl4/TLPY8pahpKqjhvwQyWLQydopZGE1GTH6c=;
X-UUID: 09cf866490b64c8fac84ade77dae2ce1-20200609
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1054550146; Tue, 09 Jun 2020 23:26:07 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Jun 2020 00:26:26 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Jun 2020 15:26:22 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 10 Jun 2020 15:26:24 +0800
Message-ID: <1591773984.14659.14.camel@mtksdaap41>
Subject: Re: [PATCH v9 1/4] dt-bindings: power: avs: add mtk svs dt-bindings
From: Roger Lu <roger.lu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 10 Jun 2020 15:26:24 +0800
In-Reply-To: <20200609173636.GA1125574@bogus>
References: <20200609104534.29314-1-roger.lu@mediatek.com>
 <20200609104534.29314-2-roger.lu@mediatek.com>
 <20200609173636.GA1125574@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_002629_453336_D579AACF 
X-CRM114-Status: GOOD (  13.95  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Angus Lin <Angus.Lin@mediatek.com>, Kevin Hilman <khilman@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 YT Lee <yt.lee@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, HenryC Chen <HenryC.Chen@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nishanth Menon <nm@ti.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear Rob,

Thanks for the feedback.

On Tue, 2020-06-09 at 11:36 -0600, Rob Herring wrote:
> On Tue, 09 Jun 2020 18:45:31 +0800, Roger Lu wrote:
> > Document the binding for enabling mtk svs on MediaTek SoC.
> > 
> > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> > ---
> >  .../bindings/power/avs/mtk_svs.yaml           | 141 ++++++++++++++++++
> >  1 file changed, 141 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/power/avs/mtk_svs.yaml
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Documentation/devicetree/bindings/power/avs/mtk_svs.example.dts:22:18: fatal error: dt-bindings/power/mt8183-power.h: No such file or directory
>          #include <dt-bindings/power/mt8183-power.h>
>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> scripts/Makefile.lib:312: recipe for target 'Documentation/devicetree/bindings/power/avs/mtk_svs.example.dt.yaml' failed
> make[1]: *** [Documentation/devicetree/bindings/power/avs/mtk_svs.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> Makefile:1300: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
> 
> See https://patchwork.ozlabs.org/patch/1305800
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.

Oops, mt8183-power.h is added in below patch which is still under review
in patchwork. In order to have complete SVS description, mt8183-power.h
is added in mtk_svs.yaml.

Therefore, this issue will be fixed after patch including mt8183-power.h
is merged.

#dt-bindings/power/mt8183-power.h
https://patchwork.kernel.org/patch/11562521/

> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
