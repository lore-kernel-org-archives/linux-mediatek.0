Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B1BC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 09:06:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69F5B61929
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 09:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69F5B61929
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=41N6kTXB49DGiBGnHh94MbWq4dXOuXuuOVhlPuISP5w=; b=TK4DhOdFMTFKatKiCddJe6pIu
	vUN+qHE5Tx1IQh+D5gNi9Da5HpJPWiRKTA8Xc+IFDzA7kmIP0nJb3HnLtmDdesSgtfEJUszYJURFr
	VTizmBZI0WoE1wBn7874T0jt1phXMaTM/BgDR0ev4k5I+B4jvxUDDrd5pKyXZpp/JkZHyTPMrbpIH
	2tafScrM9kVYSiPcL/JFGBJo8nec3CMW6518OAyA+hH/oZz0XdG7OCen61FfGh7njYw3/om2SnYX0
	76z8uwGeMsiOfDBJ3KotzfjrHXRsN/pmn8PEivHDQoh/6qg0n7Si9a0CB8PaUQhP0cw0YYwswx5FN
	PnOWalMKA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRAJt-0038vl-Q4; Tue, 30 Mar 2021 09:05:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRAJo-0038tl-Mv; Tue, 30 Mar 2021 09:05:51 +0000
X-UUID: 61a8ae8750334969a3b2300d9c23c4b6-20210330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=0jO6xeRsQ4jm7S6lv/3PLYAMuG5ayJ2hlvYykhUxsUg=; 
 b=Vyfl9nsEiTWpQhRA0JlqN2sAQIkhCIe9fvrw0YKx6R1TPoF1lmtczwzG0LdCzltKY4kE/CwGUkUn8WpfbCY0q1kdyW28nwNelM74NhUQGy+cmVjqPwTWhB9Bjy1iI+WbdLV7FIqDQjAAc9m6BVmPnFhYzqlQVKVPjKNLIm/bQok=;
X-UUID: 61a8ae8750334969a3b2300d9c23c4b6-20210330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 237833900; Tue, 30 Mar 2021 01:05:45 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Mar 2021 02:05:43 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 30 Mar 2021 17:05:29 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Mar 2021 17:05:28 +0800
Message-ID: <1617095128.10316.14.camel@mhfsdcap03>
Subject: Re: [PATCH Resend v0 2/6] dt-bindings: pinctrl: mt8195: add binding
 document
From: zhiyong tao <zhiyong.tao@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <biao.huang@mediatek.com>, <linus.walleij@linaro.org>,
 <hongzhou.yang@mediatek.com>, <srv_heupstream@mediatek.com>,
 <jg_poxu@mediatek.com>, <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <mark.rutland@arm.com>, <matthias.bgg@gmail.com>, <sean.wang@mediatek.com>,
 <linux-gpio@vger.kernel.org>, <erin.lo@mediatek.com>, <hui.liu@mediatek.com>, 
 <sean.wang@kernel.org>, <sj.huang@mediatek.com>, <eddie.huang@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <seiya.wang@mediatek.com>
Date: Tue, 30 Mar 2021 17:05:28 +0800
In-Reply-To: <1617045684.216718.2905695.nullmailer@robh.at.kernel.org>
References: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
 <20210329113103.11003-3-zhiyong.tao@mediatek.com>
 <1617045684.216718.2905695.nullmailer@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0EE61755A50B7A5DFF0EE25D2179DAD17B45A583EA5951AF67F4FD18FEE88B562000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_100549_500695_CB12C438 
X-CRM114-Status: GOOD (  20.42  )
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

On Mon, 2021-03-29 at 14:21 -0500, Rob Herring wrote:
> On Mon, 29 Mar 2021 19:30:59 +0800, Zhiyong Tao wrote:
> > The commit adds mt8195 compatible node in binding document.
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > ---
> >  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 152 ++++++++++++++++++
> >  1 file changed, 152 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dts:19:18: fatal error: dt-bindings/pinctrl/mt8195-pinfunc.h: No such file or directory
>    19 |         #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:349: Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1380: dt_binding_check] Error 2
> 
> See https://patchwork.ozlabs.org/patch/1459558
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

==> I set the patch file "mt8195-pinfunc.h" patch in "4/6". so we should
add the file "mt8195-pinfunc.h" in this patch ? or we should put it
before this patch(2/6)?

Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
