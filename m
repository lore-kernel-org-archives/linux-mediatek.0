Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC20C47089
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 01:29:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A40D61360
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 01:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A40D61360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vyug1I1r/31AtOMkfIczexK+E6ztofKnyJ4yLdylrfI=; b=cJSmb68eRPr3to
	4vnv+ulwX05WRz8SiIOJmi39mHPSgPS0BBtv0SMhMme0wQNkYoDQ2u6oL/K9OHxa8qUBtz1Fi3w9I
	RvRERopWHMc/z4Gssn9K3h94bziJFcp2hLdkasrm0H3ZgRWwbFwyqiBvqERyJ10dHRzL2PLSZjxtR
	RUdJ/2Jl+rqJ1NrcpyQ6rpHROPGFNOP2bJV5U56i1SDW9j22vo157MVDkvHG7jbkpV+XZOVmuPbar
	n9XCL5E63/nvHIJjfI7yxoxMG1a+RhF3jBfRqv9lwNdzYbNFsOK6FvveiIorFkFYNFYmZ19Uc8a14
	h/+Gj+nB9AkQvRRxnSgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lm4q1-001TNE-E3; Thu, 27 May 2021 01:29:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lm4pf-001TBb-LS; Thu, 27 May 2021 01:29:11 +0000
X-UUID: 0183d55bff3940829c74f8e8e51bc30e-20210526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nDV4+Q0St+9RugwqaQ3M5/UdGbXUypt9kmgTr0rwGic=; 
 b=EH7anMN/AJ2UzpVZdnLXGH8vn2tnE4Ir7Gqlc52qyq0NXxoiJfYxRDZ84X7r9x+7Rxb+Lj76rTwK2SGqm+fHSfmDxzP+UxRtTshdgROWraPr1rdLGlw0tHY83g5UZnWpyLY7t6lB+UOfQrpaNAoYNfHJ3GjByAegKNKOU7bve00=;
X-UUID: 0183d55bff3940829c74f8e8e51bc30e-20210526
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 988106442; Wed, 26 May 2021 18:29:04 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 May 2021 18:29:03 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 May 2021 09:29:01 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 May 2021 09:29:01 +0800
Message-ID: <1622078941.17674.3.camel@mtksdaap41>
Subject: Re: [PATCH v8 2/4] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>, <srv_heupstream@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Thu, 27 May 2021 09:29:01 +0800
In-Reply-To: <1622033763.799295.2377040.nullmailer@robh.at.kernel.org>
References: <1622025344-31888-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1622025344-31888-3-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1622033763.799295.2377040.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_182907_737911_C4806E9E 
X-CRM114-Status: GOOD (  19.93  )
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

Hi,

On Wed, 2021-05-26 at 07:56 -0500, Rob Herring wrote:
> On Wed, 26 May 2021 18:35:42 +0800, Hsin-Hsiung Wang wrote:
> > This adds documentation for the SPMI controller found on Mediatek SoCs.
> > 
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> > changes since v7:
> > - no change.
> > ---
> >  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml           | 74 ++++++++++++++++++++++
> >  1 file changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dts:19:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
>    19 |         #include <dt-bindings/clock/mt8192-clk.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1416: dt_binding_check] Error 2
> 
> See https://patchwork.ozlabs.org/patch/1483989
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

Thanks. for the review.
This series is based on Chun-Jie's patches[1].

[1]
https://patchwork.kernel.org/project/linux-mediatek/list/?series=488239

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
