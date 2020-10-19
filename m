Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E086C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 19:52:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C0EF2223C
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 19:52:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zsgqEa63"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C0EF2223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rlJDF33iNNMSiztXH2okpyKg+JKty8d0nu6j4U8qXDo=; b=zsgqEa630lqJ5B3epzHb3DWTq
	jNtbUH4Gy4+Q7E0ZwUvixOupxycOek+Sh4wcAmsESYMD62W3xlmJi+BfAsVOptXyohIYQiP4/fgej
	y8L+7pbIUzr1nlxUmQyWNwHEQxAnnZT2vZEfPbdcnzaQVcZX5ogF6Mhh8g+yY80BXQv9g76mHQCqZ
	MvoCOA/vdUjUPwuJn9ccEUL3Y+jwjMLx8ANW4vZZb8/E+9w9wAOVKElDYT7lhNIQQDJIysbBzzdlC
	lk7o8riDPzcAW41QJloKu4Q9uDi5MuxDp0vaGCgkKb94fv5rgxKMz0FLQWoU3UolNv4RKkzB4n5xu
	lWNXguwlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUbCa-0000Py-Dw; Mon, 19 Oct 2020 19:52:16 +0000
Received: from mail-oo1-f67.google.com ([209.85.161.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUbCW-0000PE-R5; Mon, 19 Oct 2020 19:52:13 +0000
Received: by mail-oo1-f67.google.com with SMTP id c25so189059ooe.13;
 Mon, 19 Oct 2020 12:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ew7/s5Mi9EkVfqC8BR7HcDgW3goCt7jOkM9uew3ofiU=;
 b=WjmRE4MifEBZ21nw+1+AScEmIfo3L3Y7crTPs57JIjBRCbl3B3fZ7M3ur2DQlPV9qA
 QtVdAvCDr20Rzu7/bBnG/a1GykeQebVIlbWUYShq2KYL63Giun/m95q+CoO5F4v6eTHF
 zItZ0qShhyrKSuIJ6X7CKzTbJAqTtOzjQQFoqu7H+pqTcuUYlIs1OpS8N1XVfIxEEsCs
 sxjEVcRG9+8HrK6ZB/0RizarIbRWIx15AUjsf709LKltHfBQffN+6iYTkhFCo18T6csn
 FPFZy55FFhnKFO+Bkj3/66DYxMiam9s6RIHYdnthgI/bsiebw//l8M03rv1b0s1qhQPO
 sBBg==
X-Gm-Message-State: AOAM5319bGo8hH3dL8W/1KM/v9SeUtcGdPBlhHXkQd8gHowWnC/b4+zj
 l+uJZrZZbFct4/cuAESE1g==
X-Google-Smtp-Source: ABdhPJx+NoGSxSoi6odZZ4oAHUazygsVlzgZNKOkBE39HHPuHBmnPyEk+8k3NTDuCDyeWFPZvZSRXw==
X-Received: by 2002:a4a:5a06:: with SMTP id v6mr1100844ooa.69.1603137130314;
 Mon, 19 Oct 2020 12:52:10 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t84sm201473oih.35.2020.10.19.12.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 12:52:09 -0700 (PDT)
Received: (nullmailer pid 3500572 invoked by uid 1000);
 Mon, 19 Oct 2020 19:52:07 -0000
Date: Mon, 19 Oct 2020 14:52:07 -0500
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
Message-ID: <20201019195207.GA3499610@bogus>
References: <1602864634-23489-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1602864634-23489-2-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602864634-23489-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_155212_894364_0B572EBF 
X-CRM114-Status: GOOD (  13.93  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 17 Oct 2020 00:10:33 +0800, Hsin-Hsiung Wang wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dts:19:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
   19 |         #include <dt-bindings/clock/mt8192-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1383441

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
