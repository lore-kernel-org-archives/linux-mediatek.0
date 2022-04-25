Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B9BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Iw7JCSnAbQO6SPHqvHg7SpIb+Ak/pIkyf1vFIdSo2g=; b=1QF1XIfE6LSqK2
	lSpywoNDeWETYyzjcAXOaqFAGFJLL8hmw7u/RPFcg4dTY8n4quO/g2f95iVbdjNs0j3bB9PbaksyW
	URQuxqzNTYAyKAxThkiGsDXTsZD6P6MTz/pfp016C25t/R0m6ZvKJ/07fdcTtKGZoG/m02Hi71x2R
	SU6zj2XGFd9Fw9UT+j18nopGpCveOifV9X6XBNStXWdGe1X8ZoLbnHauD+G2AFGCki2n0AMc/CI9c
	6LWxPovHirX8gOPmPQ8Rpn5vEJqslwS62udzpFJdJK9YgzpotpHAmnKtb+vfpBhj5TykY1Uu3byLo
	C9+Hg9568GGjsPWWSTCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj1Av-00AEJ5-2H; Mon, 25 Apr 2022 16:02:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj1Ag-00AECD-Io; Mon, 25 Apr 2022 16:02:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C3238612DD;
 Mon, 25 Apr 2022 16:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BBD1C385BD;
 Mon, 25 Apr 2022 16:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650902557;
 bh=ibAp6Qdurhq2UaINptVowpGDRoELicExS9BcLP47wrw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bPprMwkwmyDxvOqb490NX6HiwrlcOOMNTSO7fdIBQ97pBBEw2PoHYFF1CbPEg6yko
 6To47/fpvROzmLuJFip3Ofa8QjXz+esrwMWOIO1e9PonXm8OPPkYw0wO/iwqy0Ld3T
 l3bYbwrFtDWJqts4QENV31+xfaA/kdTxrNBHp3GxHocbcFN/0ue77gZs/XHZe54FIb
 6sddFMEi7Fa/uO2YQVi4bTlN36o9kfXqBz5tNA2HGuSrdYeA8vUnZOWbC141HH4Ych
 loBINSTeTh34pG3/nffGd/gJRMOF+XkOMhi9NhJ5/vzxJrQ0vhcOlmca6Oghs6wupo
 di39+Eg3a4YQw==
Received: by mail-pl1-f172.google.com with SMTP id d15so27575561pll.10;
 Mon, 25 Apr 2022 09:02:37 -0700 (PDT)
X-Gm-Message-State: AOAM531jOHFVMgPXYMenK/Ie4yaJnZJqysqyPijLAr1kh9G7+Fn6UDX3
 lQ3kf06weeDoVeXXeoW4N2WcioPRHWtrn5Ij2g==
X-Google-Smtp-Source: ABdhPJwiET3dMMmtNpcl3m0Jao6U9LdDUHuMBgi/c2Wo3MntkfVL4gztMAOSkvWGxBOAgFL47WvVLxfV4VMa5JbKeaU=
X-Received: by 2002:a17:90b:1e08:b0:1d2:8bb4:f565 with SMTP id
 pg8-20020a17090b1e0800b001d28bb4f565mr32241726pjb.4.1650902556770; Mon, 25
 Apr 2022 09:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220422121017.23920-1-allen-kh.cheng@mediatek.com>
 <20220422121017.23920-3-allen-kh.cheng@mediatek.com>
 <e2e4ead0-d8eb-1302-93e9-f330807d811e@linaro.org>
In-Reply-To: <e2e4ead0-d8eb-1302-93e9-f330807d811e@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 25 Apr 2022 11:02:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKU98F0wD=cmayq_k-uwP=M5nQrjmG1kd5SJtdv41nsCg@mail.gmail.com>
Message-ID: <CAL_JsqKU98F0wD=cmayq_k-uwP=M5nQrjmG1kd5SJtdv41nsCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: mediatek: Convert binding to
 YAML
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 devicetree@vger.kernel.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Ryder Lee <ryder.lee@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_090242_706774_6D6724B0 
X-CRM114-Status: GOOD (  19.83  )
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

On Fri, Apr 22, 2022 at 10:44 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 22/04/2022 14:10, Allen-KH Cheng wrote:
> > Convert Mediatek watchdog devicetree binding to YAML.
> >
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 42 ----------
> >  .../devicetree/bindings/watchdog/mtk-wdt.yaml | 76 +++++++++++++++++++
> >  2 files changed, 76 insertions(+), 42 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > deleted file mode 100644
> > index 762c62e428ef..000000000000
> > --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > +++ /dev/null
> > @@ -1,42 +0,0 @@
> > -Mediatek SoCs Watchdog timer
> > -
> > -The watchdog supports a pre-timeout interrupt that fires timeout-sec/2
> > -before the expiry.
> > -
> > -Required properties:
> > -
> > -- compatible should contain:
> > -     "mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
> > -     "mediatek,mt2712-wdt": for MT2712
> > -     "mediatek,mt6582-wdt", "mediatek,mt6589-wdt": for MT6582
> > -     "mediatek,mt6589-wdt": for MT6589
> > -     "mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
> > -     "mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
> > -     "mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
> > -     "mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> > -     "mediatek,mt7986-wdt", "mediatek,mt6589-wdt": for MT7986
> > -     "mediatek,mt8183-wdt": for MT8183
> > -     "mediatek,mt8186-wdt", "mediatek,mt6589-wdt": for MT8186
> > -     "mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> > -     "mediatek,mt8192-wdt": for MT8192
> > -     "mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195
> > -
> > -- reg : Specifies base physical address and size of the registers.
> > -
> > -Optional properties:
> > -- mediatek,disable-extrst: disable send output reset signal
> > -- interrupts: Watchdog pre-timeout (bark) interrupt.
> > -- timeout-sec: contains the watchdog timeout in seconds.
> > -- #reset-cells: Should be 1.
> > -
> > -Example:
> > -
> > -watchdog: watchdog@10007000 {
> > -     compatible = "mediatek,mt8183-wdt",
> > -                  "mediatek,mt6589-wdt";
> > -     mediatek,disable-extrst;
> > -     reg = <0 0x10007000 0 0x100>;
> > -     interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>;
> > -     timeout-sec = <10>;
> > -     #reset-cells = <1>;
> > -};
> > diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mtk-wdt.yaml
> > new file mode 100644
> > index 000000000000..5788617027c8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.yaml
> > @@ -0,0 +1,76 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/watchdog/mtk-wdt.yaml#
>
> File name: mtk,wdt.yaml

mediatek,wdt.yaml

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
