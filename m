Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D533C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 00:15:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8917F20656
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 00:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="woBFp4En";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XinFr6mm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8917F20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xYqk4VcURnAW6uKDgnhopVuvI1SogSOdZWrJ/emmEX8=; b=woBFp4EnxLl2wzDyHW5OnIW4S
	UE2V5tvHaBWFk3KyyzrS3BFrrurDC184LJckTK13YpFaDbioRxzGgxJJ6NP/CDLVIyn2T973NB+O6
	lC1DyUIBsPgHvxC3VClC73LpedhvuhYJU+LHk6D9hTa597zCx3lRs6buWr0/pY1NCT6peCB9hciu2
	S/JCekVCGTcvMZ2eclBlmlaWWBQgVmnQhcJKayDIT+11YHS0fjR7xDHin2HLkZUkIca9dlPumRKbm
	TUu17pRWfFn8oX7AjJZj0dMRhuH9LLqYYfj9LhBs2Nt6nmvoTaEyyRVUsDKNl3mqEE8NAO2RipIXQ
	XF1JSqyJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2kc0-0005OK-2D; Tue, 04 Aug 2020 00:15:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2kbx-0005NK-8h; Tue, 04 Aug 2020 00:15:22 +0000
X-UUID: 5bf7f77b6c344cb38486874a076fa2ef-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3spY01kwf4O6wv7cicumcVELIxjbsq4/eTGUCLDHWqw=; 
 b=XinFr6mmrVN0Q5O7bKYQJPJO8TT9FPpJ0Gy02/VbSxVKidrAchUt5dSoPu1FGIp+L7KEZPSSwFSH8kw4yV1J9XQruu8OSwk+OVKYSbF0Fwd4Bt7TkG8xAsKoOjeQ5B3zDpSbrwTOov3CwZRHM2VCZGaW8pS84ofNl4KUdS2VAEg=;
X-UUID: 5bf7f77b6c344cb38486874a076fa2ef-20200803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 165826656; Mon, 03 Aug 2020 16:15:15 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 17:15:09 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 4 Aug 2020 08:15:04 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 08:15:05 +0800
Message-ID: <1596500071.20778.0.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: mt8192: add binding document
From: zhiyong tao <zhiyong.tao@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 4 Aug 2020 08:14:31 +0800
In-Reply-To: <20200803214054.GA3184946@bogus>
References: <20200801043303.32149-1-zhiyong.tao@mediatek.com>
 <20200801043303.32149-3-zhiyong.tao@mediatek.com>
 <20200803214054.GA3184946@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7534D64DA8CF1C4E84B2CC352E2ADD1F41974CB8CC880301656CE46078BDEF9C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_201521_503138_1C24BFC2 
X-CRM114-Status: GOOD (  15.19  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 hongzhou.yang@mediatek.com, srv_heupstream@mediatek.com,
 chuanjia.liu@mediatek.com, seiya.wang@mediatek.com, erin.lo@mediatek.com,
 sean.wang@kernel.org, linux-kernel@vger.kernel.org, biao.huang@mediatek.com,
 sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 eddie.huang@mediatek.com, linux-gpio@vger.kernel.org, matthias.bgg@gmail.com,
 hui.liu@mediatek.com, jg_poxu@mediatek.com, sean.wang@mediatek.com,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-08-03 at 15:40 -0600, Rob Herring wrote:
> On Sat, 01 Aug 2020 12:33:02 +0800, Zhiyong Tao wrote:
> > The commit adds mt8192 compatible node in binding document.
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > ---
> >  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 175 ++++++++++++++++++
> >  1 file changed, 175 insertions(+)
> >  create mode 100755 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:

==> Dear Rob,
I will fix it in v3. Thanks.
> 
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:0: [0, 268455936, 0, 4096] is too long
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:1: [0, 297926656, 0, 4096] is too long
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:2: [0, 298909696, 0, 4096] is too long
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:3: [0, 299040768, 0, 4096] is too long
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:4: [0, 299106304, 0, 4096] is too long
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:5: [0, 300023808, 0, 4096] is too long
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:6: [0, 300351488, 0, 4096] is too long
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:7: [0, 300548096, 0, 4096] is too long
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:8: [0, 301072384, 0, 4096] is too long
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:9: [0, 301137920, 0, 4096] is too long
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:10: [0, 268480512, 0, 4096] is too long
> 
> 
> See https://patchwork.ozlabs.org/patch/1339661
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
