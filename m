Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCB8C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 00:33:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3900760295
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 00:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3900760295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U52uItu2gfNx+7Hk8nYfjGeevn+/ZIsvo0nHYQqifxQ=; b=adW69OJV2Xtst12Zg4AIYKizy
	8J1BX9bZ0S5YHqpJA9/NDnGExbMrLFB2TNxPn6qP5n80Hkjd9GjepLga2yBYn/Rg50byt/vBxlJd6
	j7NLbXbshUSX0tHResGFcw01FGNEJVdgshbzJBu+vsh++ui4UjKh+FVIX2jAnIvkgXu1el9UCgk/B
	yNlxF9frg/CBeT3JJwWk0FojkQAO73wQ3v05is3pIUvAkgsbx9QTjf3SxwFlOqsJCUjHIz6Kc42UM
	GqXd6u5Nw/SwucPvDcV6mKpwK0bi+W7O/sbJV7p/mZPvIg5V5vZbRzcbEuvtVaqlvZ6iuLif2sUiw
	oLZNTtIAg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lROmy-005BJH-Ln; Wed, 31 Mar 2021 00:32:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lROmt-005BFf-2K; Wed, 31 Mar 2021 00:32:50 +0000
X-UUID: 8f37db9c8b824f10ba325c7972f2d612-20210330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DXPc7QmuVWhuN+C5z7frEfmFSAwLLesUieWs9jVeZXQ=; 
 b=ZIUjiD6L4vqVXZL6sF9W5z1cQ+GG+yJwtNzRFFccFvvos3aGDxvyJucFTBhvmKLirF7rToRkeBRiFEClwxVX6lk6zmFVmokpXQ3sPGhR4wMeqwWMPDZ29Jv40COPEpX+FjWG7dWFyEswAwWhax9bpPXKJQS9e0855HtOICh6Kl8=;
X-UUID: 8f37db9c8b824f10ba325c7972f2d612-20210330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 282455676; Tue, 30 Mar 2021 17:32:37 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Mar 2021 17:32:34 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 31 Mar 2021 08:32:24 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 31 Mar 2021 08:32:24 +0800
Message-ID: <1617150743.10316.18.camel@mhfsdcap03>
Subject: Re: [PATCH Resend v0 2/6] dt-bindings: pinctrl: mt8195: add binding
 document
From: zhiyong tao <zhiyong.tao@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <biao.huang@mediatek.com>, <linus.walleij@linaro.org>,
 <hongzhou.yang@mediatek.com>, <srv_heupstream@mediatek.com>,
 <jg_poxu@mediatek.com>, <devicetree@vger.kernel.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@mediatek.com>,
 <linux-gpio@vger.kernel.org>, <erin.lo@mediatek.com>, <hui.liu@mediatek.com>, 
 <sean.wang@kernel.org>, <sj.huang@mediatek.com>, <eddie.huang@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <seiya.wang@mediatek.com>
Date: Wed, 31 Mar 2021 08:32:23 +0800
In-Reply-To: <20210330133913.GA212608@robh.at.kernel.org>
References: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
 <20210329113103.11003-3-zhiyong.tao@mediatek.com>
 <1617045684.216718.2905695.nullmailer@robh.at.kernel.org>
 <1617095128.10316.14.camel@mhfsdcap03>
 <20210330133913.GA212608@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A48D422117B9453A0B782F79C39ADB8FF7E7B8CFD789280697FA7F235F1D758D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_013247_734491_847C023B 
X-CRM114-Status: GOOD (  28.12  )
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

On Tue, 2021-03-30 at 08:39 -0500, Rob Herring wrote:
> On Tue, Mar 30, 2021 at 05:05:28PM +0800, zhiyong tao wrote:
> > On Mon, 2021-03-29 at 14:21 -0500, Rob Herring wrote:
> > > On Mon, 29 Mar 2021 19:30:59 +0800, Zhiyong Tao wrote:
> > > > The commit adds mt8195 compatible node in binding document.
> > > > 
> > > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > > > ---
> > > >  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 152 ++++++++++++++++++
> > > >  1 file changed, 152 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > > > 
> > > 
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > > 
> > > yamllint warnings/errors:
> > > 
> > > dtschema/dtc warnings/errors:
> > > Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dts:19:18: fatal error: dt-bindings/pinctrl/mt8195-pinfunc.h: No such file or directory
> > >    19 |         #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> > >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > compilation terminated.
> > > make[1]: *** [scripts/Makefile.lib:349: Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dt.yaml] Error 1
> > > make[1]: *** Waiting for unfinished jobs....
> > > make: *** [Makefile:1380: dt_binding_check] Error 2
> > > 
> > > See https://patchwork.ozlabs.org/patch/1459558
> > > 
> > > This check can fail if there are any dependencies. The base for a patch
> > > series is generally the most recent rc1.
> > > 
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > > date:
> > > 
> > > pip3 install dtschema --upgrade
> > > 
> > > Please check and re-submit.
> > > 
> > 
> > ==> I set the patch file "mt8195-pinfunc.h" patch in "4/6". so we should
> > add the file "mt8195-pinfunc.h" in this patch ? or we should put it
> > before this patch(2/6)?
> 
> It is part of the binding, so it belongs in this patch.
> 
> Rob

==> Thanks for your suggestion. We will add it in this patch in next
version.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
