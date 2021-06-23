Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D531CC4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 08:11:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AC426100B
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 08:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AC426100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GCAUlQL8uDvQNyq3658okmMmM/OjrSz7YR2BG5O8Tvc=; b=3yziQtKqZAGZLT
	xFQ4UqypNn2532a3WF0NdwpxwR/8SjUbrHgS52ly0rF6YQgOw+8qZdfdruXjF/dDhoUrtVzB0oKjM
	77l3+mHwRK5Tu1zi8qBz5mKF11nMK3CqjgMEED/u7pHo/rHwrmN0FIZ8l//JppMhZ4AAsutq8KjGb
	qFpGJijigF3m2EFQmIcZU0oKx/H2frpuWuPlxJJ7jGviT+OcIdC81Pyz0fjsmBFa28OJjPyGShBhV
	A1Qd5mPz6SibgmZSbArx3qjN1PgKUGFE1kcQbEkwvuia92hoiHsSaD/qbzYJOcwe7T88NutLX93sh
	so1fQEz/xht+jTQBC3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvxyf-009uIU-4H; Wed, 23 Jun 2021 08:11:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvxyS-009uHH-Hi; Wed, 23 Jun 2021 08:11:06 +0000
X-UUID: f5fe40792e88499cbc124a87082708d8-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SKYmo8MiSbxF2eqHWz+6lxTmMnXCOR0tQK4sP3HO040=; 
 b=rVG575ii9f1xM7j1pmpejioH7gVYeKy5k0I1vmBZYtxlCgigpgN2mTps7t1SMP5B6wcyIfsz8T2CcABLAVchfRzF5Vkz7glGqCoYhMTyLMBEFz7Ld1pDYf0my0C/ZbpKLSqkgfdAQzXYlq2SY57nwZJo3PIxEFYM0zoY20l1K+I=;
X-UUID: f5fe40792e88499cbc124a87082708d8-20210623
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1400418756; Wed, 23 Jun 2021 01:11:00 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 01:10:58 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 16:10:56 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 16:10:56 +0800
Message-ID: <8344d089562052a6f9ee3245856bbc8516bb6619.camel@mediatek.com>
Subject: Re: [PATCH 6/8] dt-bindings: mediatek: mt8195: add audio afe document
From: Trevor Wu <trevor.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <broonie@kernel.org>, <bicycle.tsai@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <robh+dt@kernel.org>,
 <cychiang@google.com>, <jiaxin.yu@mediatek.com>, <tiwai@suse.com>,
 <matthias.bgg@gmail.com>
Date: Wed, 23 Jun 2021 16:10:56 +0800
In-Reply-To: <1623965184.501241.3336112.nullmailer@robh.at.kernel.org>
References: <20210617054740.8081-1-trevor.wu@mediatek.com>
 <20210617054740.8081-7-trevor.wu@mediatek.com>
 <1623965184.501241.3336112.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_011104_629320_3142445B 
X-CRM114-Status: GOOD (  21.11  )
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

On Thu, 2021-06-17 at 15:26 -0600, Rob Herring wrote:
> On Thu, 17 Jun 2021 13:47:37 +0800, Trevor Wu wrote:
> > This patch adds mt8195 audio afe document.
> > 
> > Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> > ---
> >  .../bindings/sound/mt8195-afe-pcm.yaml        | 72
> > +++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/mt8195-
> > afe-pcm.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml:10:4:
> [warning] wrong indentation: expected 2 but found 3 (indentation)
> ./Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml:14:7:
> [warning] wrong indentation: expected 4 but found 6 (indentation)
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/sound/mt8195-afe-
> pcm.example.dts:19:18: fatal error: dt-bindings/clock/mt8195-clk.h:
> No such file or directory
>    19 |         #include <dt-bindings/clock/mt8195-clk.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:380:
> Documentation/devicetree/bindings/sound/mt8195-afe-
> pcm.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1416: dt_binding_check] Error 2
> \ndoc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1493197
> 
> This check can fail if there are any dependencies. The base for a
> patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up
> to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

Sorry, I missed the dependency declaration in the patch and I didn't
install ymallint, so I couldn't find indentation problems.
I will fix all binding problems on v2.

Thanks,
Trevor
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
