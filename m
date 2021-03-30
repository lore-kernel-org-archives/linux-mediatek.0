Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FCEC433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 13:39:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9F6B614A5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 13:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9F6B614A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4iVmkQEjmGidwqyvSNPAO9yBov596cX9tyI/iyQ/W30=; b=pWrLrSFQeJDgnzmH8ESrnb7Mn
	l2+9UrAOCKSE0DuaIIt4MFrWLHsFR8XArZDvng1Pt+TaBrVHBv8YA+WJEK+NuYEdSBWcld6On0ViK
	cYf33AW4ha5nTyBOw7iyRUyT24sRl3Alg0H+e1+6qBhHjd0/o+iaMgwiQNAQjyCcUauB0eG9CCtrU
	Z3/c9etOgHheQySpT8YN2qJMbpm7ckV6CS3dL4Ym6/BCvvmVEz4xqFFc1RjIA7tTvKYesGcIrALjY
	herOPNDMY9ocQHCsi8nCNeqTlA95+sOSlQuRcRO7O5G7+DypPMuKhidNZzzXUOXcUBPq3S8pA/hUD
	vpSdhl/TA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lREag-003qVO-7N; Tue, 30 Mar 2021 13:39:30 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lREaT-003qTG-Vr; Tue, 30 Mar 2021 13:39:20 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 s11-20020a056830124bb029021bb3524ebeso15640597otp.0; 
 Tue, 30 Mar 2021 06:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lqijnVOuWfbRRkSa+v/huuzx4aTqy+55BzNMNQYQOmw=;
 b=fmYwJnFqhe6t9zc204yDL0RZue8ViTSFD1QSi+Pe3xkS+qip7vo5H37FLpmzX/ijp0
 irzGrmTQsdFRI/tgxmmYkmWICcqIzRv0yUPqtmn3fRo6oZ9BKtKrv9ytkjZ57neU6yS9
 dMq02c/QCpwpnypWk3ovMNuvbI/okuQp1BswVfLIRZd6uGPe8jAlv4x/LqL3dYvuFTwr
 xTAXh9HbaezAbN85qp5EV47/hHECx9DyfKJLvHOYOq7zF+OSQKgMZfENwa8Iv6I4K2AK
 gti25QWHCheRFKbRIU1PYG4VnHzv9Hb2mBvg7MpXj7kUZIRCN0eBapltgQCk/VL5ErsZ
 Whvg==
X-Gm-Message-State: AOAM532If3iExBC+EiLaVu69CSB0JrLFGcQotcH+ThP6xBIYFjlKozIV
 1CqVffRt+gQgfXJTHXXoBA==
X-Google-Smtp-Source: ABdhPJwxbZu8AQOzk0/3hMyaBD5iHVfWxjEtg8coy9Y5Y7UZGJOiPS0TYB4uByeZgog5mUBaiuue9A==
X-Received: by 2002:a05:6830:4121:: with SMTP id
 w33mr11854225ott.153.1617111556881; 
 Tue, 30 Mar 2021 06:39:16 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 62sm3360563oto.60.2021.03.30.06.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 06:39:15 -0700 (PDT)
Received: (nullmailer pid 213349 invoked by uid 1000);
 Tue, 30 Mar 2021 13:39:13 -0000
Date: Tue, 30 Mar 2021 08:39:13 -0500
From: Rob Herring <robh@kernel.org>
To: zhiyong tao <zhiyong.tao@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 biao.huang@mediatek.com, linus.walleij@linaro.org, hongzhou.yang@mediatek.com,
 srv_heupstream@mediatek.com, jg_poxu@mediatek.com, devicetree@vger.kernel.org,
 mark.rutland@arm.com, matthias.bgg@gmail.com, sean.wang@mediatek.com,
 linux-gpio@vger.kernel.org, erin.lo@mediatek.com, hui.liu@mediatek.com,
 sean.wang@kernel.org, sj.huang@mediatek.com, eddie.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, seiya.wang@mediatek.com
Subject: Re: [PATCH Resend v0 2/6] dt-bindings: pinctrl: mt8195: add binding
 document
Message-ID: <20210330133913.GA212608@robh.at.kernel.org>
References: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
 <20210329113103.11003-3-zhiyong.tao@mediatek.com>
 <1617045684.216718.2905695.nullmailer@robh.at.kernel.org>
 <1617095128.10316.14.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617095128.10316.14.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_143918_155187_0FEC24A3 
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

On Tue, Mar 30, 2021 at 05:05:28PM +0800, zhiyong tao wrote:
> On Mon, 2021-03-29 at 14:21 -0500, Rob Herring wrote:
> > On Mon, 29 Mar 2021 19:30:59 +0800, Zhiyong Tao wrote:
> > > The commit adds mt8195 compatible node in binding document.
> > > 
> > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > > ---
> > >  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 152 ++++++++++++++++++
> > >  1 file changed, 152 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dts:19:18: fatal error: dt-bindings/pinctrl/mt8195-pinfunc.h: No such file or directory
> >    19 |         #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[1]: *** [scripts/Makefile.lib:349: Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dt.yaml] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [Makefile:1380: dt_binding_check] Error 2
> > 
> > See https://patchwork.ozlabs.org/patch/1459558
> > 
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit.
> > 
> 
> ==> I set the patch file "mt8195-pinfunc.h" patch in "4/6". so we should
> add the file "mt8195-pinfunc.h" in this patch ? or we should put it
> before this patch(2/6)?

It is part of the binding, so it belongs in this patch.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
