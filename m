Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB55C43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 18:49:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37A8A2067C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 18:49:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WYre8s6M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmSGh740"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37A8A2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ixp8IREvgEFUoxQx2FtqQsebxF+un11E3aWVi1wsCmM=; b=WYre8s6MwR+p6H7e4pBw8YEH0
	sEy552dEb4iygbzD/qPMyIXn3Yk1N7dTjonrqSafd8C75ObfgWgBYPY2NLjnB93J3mFTnbIiGsJpi
	ycwHdgIrxOFU6ex/4HSgUSi98CWmay21yboj+GIC126mdhmXj9An4uGvestPh7ILQ8qSKtmUxKGpM
	rDaG9ox6naNOzpb99L80013I7IB4KEidpypTsPKyPriEb9l+4O0ZcoJCCtW5VKff+RUIsR1PXBWxC
	CYxguW7Rj4vWgzSQtWkogz1bjFXhXXeAXiSIKBkAxF8pTLq9/YGqKF12Pnc6xtTksaxwloDaCuOdu
	wFaC/8kwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFigP-000831-7h; Tue, 08 Sep 2020 18:49:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFigL-00082C-H4; Tue, 08 Sep 2020 18:49:30 +0000
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ECC0C2087C;
 Tue,  8 Sep 2020 18:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599590968;
 bh=/PlDYc73I5PrW5B6uIA1VQLp4BTV4oHIIammujpUcdc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HmSGh740yu0BG3o8RZaACSnauoPWIiTMdYNbvbpK4Xfg6Qt9yp/9PbedxzmcGP1yU
 gjizIm8AsQYWnKT1w1+JMCOEXMD/RPG6Jr9ca5fIF/zf5pk2X5m86NCTO0LFqcI8lB
 P6LtCYENiYCraQuMzg/RpFnCp6zLi/BfcHykm6AI=
Received: by mail-oo1-f41.google.com with SMTP id 4so4174462ooh.11;
 Tue, 08 Sep 2020 11:49:27 -0700 (PDT)
X-Gm-Message-State: AOAM530nBvwwtcT9SzXqRSJcsnhCFAvIZj1yzH4LDazNTiQlxAt4BY0g
 TJckqlIRmIahDBZPQCs+L4XfbcxnBefhyIVI6A==
X-Google-Smtp-Source: ABdhPJya9363hct12OY48mS3oy3MugvGqPp1r0CFLg7IaMo8S66bOWAkKXuaqZ594ecf4YPBAZ2NNNnWHCf5O70mBZA=
X-Received: by 2002:a4a:d38c:: with SMTP id i12mr3445oos.81.1599590967271;
 Tue, 08 Sep 2020 11:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200817030324.5690-1-crystal.guo@mediatek.com>
 <20200817030324.5690-3-crystal.guo@mediatek.com>
 <20200825190219.GA1125997@bogus>
 <1598440183.30048.14.camel@mhfsdcap03>
 <6c292056-1cb1-bc6c-0422-46e047dcf08f@ti.com>
In-Reply-To: <6c292056-1cb1-bc6c-0422-46e047dcf08f@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 8 Sep 2020 12:49:16 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKuL7XM2CL3z0OQdRua5YJO2ZRdsoE3fdAH948mKGfWnA@mail.gmail.com>
Message-ID: <CAL_JsqKuL7XM2CL3z0OQdRua5YJO2ZRdsoE3fdAH948mKGfWnA@mail.gmail.com>
Subject: Re: [v4,2/4] dt-binding: reset-controller: ti: add
 'mediatek,infra-reset' to compatible
To: Suman Anna <s-anna@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_144929_680465_630E389A 
X-CRM114-Status: GOOD (  24.14  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?WW9uZyBMaWFuZyAo5qKB5YuHKQ==?= <Yong.Liang@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 =?UTF-8?B?U2VpeWEgV2FuZyAo546L6L+65ZCbKQ==?= <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?RmFuIENoZW4gKOmZs+WHoSk=?= <fan.chen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?UTF-8?B?WWluZ2pvZSBDaGVuICjpmbPoi7HmtLIp?= <Yingjoe.Chen@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Crystal Guo <crystal.guo@mediatek.com>,
 =?UTF-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?= <stanley.chu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 2, 2020 at 5:26 PM Suman Anna <s-anna@ti.com> wrote:
>
> Hi Rob,
>
> On 8/26/20 6:09 AM, Crystal Guo wrote:
> > On Wed, 2020-08-26 at 03:02 +0800, Rob Herring wrote:
> >> On Mon, Aug 17, 2020 at 11:03:22AM +0800, Crystal Guo wrote:
> >>> The TI syscon reset controller provides a common reset management,
> >>> and is suitable for MTK SoCs. Add compatible 'mediatek,infra-reset',
> >>> which denotes to use ti reset-controller driver directly.
> >>>
> >>> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/reset/ti-syscon-reset.txt | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> >>> index ab041032339b..5a0e9365b51b 100644
> >>> --- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> >>> +++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> >>> @@ -25,6 +25,7 @@ Required properties:
> >>>                         "ti,k2l-pscrst"
> >>>                         "ti,k2hk-pscrst"
> >>>                         "ti,syscon-reset"
> >>> +                       "mediatek,infra-reset", "ti,syscon-reset"
> >>
> >> You need your own binding doc. If you can use the same driver then fine,
> >> but that's a separate issue. There's also reset-simple driver if you
> >> have just array of 32-bit registers with a bit per reset.
> >>
> >> Don't repeat 'ti,reset-bits' either.
> >
> > Do you mean I should add a Mediatek reset binding doc, although Mediatek
> > reuse the TI reset controller directly?
>
> Hmm, how do you envision not repeating the same bits in a separate binding?

I mean 'ti,reset-bits' isn't really something that should have been in
DT in the first place, but rather implied by the compatible string.

> Does it help if I convert this to YAML first without a ti, prefix in the file name?

No, I don't think this should be a shared binding. The driver may be
able to be shared, but that's independent from the binding.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
