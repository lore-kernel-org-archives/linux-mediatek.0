Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3173C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 03:42:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C11160FA0
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 03:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C11160FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4GofcnQ5OVlZ2wzpCqvTq+LcJbsIF9Z700gxgAvhwyI=; b=2PdISjpByZxvkG
	VbuTljKqCsNYpDRsTvDLqOnR9vilKnaFeWG09QhonxKkxlfedfEzJ5FxC2I7iFTOwqs9o+zNgyjrs
	LmjyM+GjI8fFApdtnTQUnBAkhD89CRjdwcl+Rws0xz3zME/Ubp3qpyh30rf338bZfXiHH0ceSXTmT
	aHP/LYeYLyHUhVRsTrjQEW5lUshJsxz2TXO0tQf19U8cz1MFifkuLG1sXvlyG0z+LEqtk2Uzu8N+A
	Q0YK+QnkljDvwZ65RPME/oj8MXdOMVFwxbUWh9Wvp3ELs7gNewwSNHt12q+WaLU0qNWULyDl9gzFU
	PGfqDuswiDAD6JZ799Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFpzC-000zTR-66; Tue, 17 Aug 2021 03:41:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFpwS-000yTR-K4; Tue, 17 Aug 2021 03:39:12 +0000
X-UUID: 36c476d0988b475b9fc640beca310a6a-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZUQNFXr5FuKXewOx8S7z3P+aw6QvJPCFepRGuOLx3Rw=; 
 b=oI1rkoI7jAHlX2gyV+B/ulTxcBBzRL/bQv74OkKi292s0hpOGO4leSoe81x+j9cLPdZ95VfR/6oxJJcuZZvgI1RY6FUlEDaF7vJSPDtF38hN6I5JANGgrMjLUWNk8fBZw+65JeTGNFJWcjBVx1aPoZo+SxMQeoqrUa7HkLeCzDA=;
X-UUID: 36c476d0988b475b9fc640beca310a6a-20210816
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1392090614; Mon, 16 Aug 2021 20:39:02 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 20:39:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 11:38:58 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 11:38:57 +0800
Message-ID: <2f680f94ef4d41f7a916ba0c920ec1c9121fe583.camel@mediatek.com>
Subject: Re: [PATCH v5, 13/15] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8192
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, Alexandre Courbot
 <acourbot@chromium.org>, <linux-kernel@vger.kernel.org>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Tomasz Figa <tfiga@google.com>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Rob Herring <robh+dt@kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, "Hsin-Yi
 Wang" <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 George Sun <george.sun@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Irui Wang
 <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>
Date: Tue, 17 Aug 2021 11:38:58 +0800
In-Reply-To: <1628702693.304754.3975941.nullmailer@robh.at.kernel.org>
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <20210811025801.21597-14-yunfei.dong@mediatek.com>
 <1628702693.304754.3975941.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_203908_713661_568B166C 
X-CRM114-Status: GOOD (  25.20  )
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

Hi Rob,

Thanks for your detail suggestion.

For the header file(dt-bindings/clock/mt8192-clk.h) is included in:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=511175

Need to depend on this patch, do you have any suggestion about how to
add it?

Thanks.

On Wed, 2021-08-11 at 11:24 -0600, Rob Herring wrote:
> On Wed, 11 Aug 2021 10:57:59 +0800, Yunfei Dong wrote:
> > Adds decoder dt-bindings for mt8192.
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> > v5: no changes
> > 
> > This patch depends on "Mediatek MT8192 clock support"[1].
> > 
> > The definition of decoder clocks are in mt8192-clk.h, need to
> > include them in case of build fail [1].
> > 
> > [1]
> > https://patchwork.kernel.org/project/linux-mediatek/list/?series=511175
> > ---
> >  .../media/mediatek,vcodec-comp-decoder.yaml   | 172
> > ++++++++++++++++++
> >  1 file changed, 172 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,vcodec-comp-
> > decoder.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-
> decoder.yaml: $id: relative path/filename doesn't match actual path
> or filename
> 	expected: 
> http://devicetree.org/schemas/media/mediatek,vcodec-comp-decoder.yaml#
> Documentation/devicetree/bindings/media/mediatek,vcodec-comp-
> decoder.example.dts:22:18: fatal error: dt-bindings/clock/mt8192-
> clk.h: No such file or directory
>    22 |         #include <dt-bindings/clock/mt8192-clk.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:380:
> Documentation/devicetree/bindings/media/mediatek,vcodec-comp-
> decoder.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1419: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1515556
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
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
