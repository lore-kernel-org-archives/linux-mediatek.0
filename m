Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF74C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 08:51:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1B7D603E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 08:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1B7D603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tGgy40/WFfPjHoSELg+1yyyDtQSbTesmWNfLKhdyj8=; b=tqo4brSIaBp7yB
	3kWEQpNWvGxtAv8E0jTqjZYKb3Akm52LlDyhebI1wvsTtwoHyGc4KOa+hJBWTdYgMNP96e579yKMm
	PtIgcZckgzg31gbevsJNEA7HcqTFSYM8Wdfwe67o5FGa1LfhUBgMNsyToACW0+50AI8Ves1wzzi+G
	LBf8VxiZo3vN/+hg4fNmzQ3FAEyic1QnxQfPtjDB3QAKG+X3r51V7latJv/EkKAPktXFkQ6R7sM1m
	5EQPaMPbCiVA7RwxonXw7b2BiMyFbK8cXMcPPWh+fllk76XLK3nl/U4821erx7bcYbrNlhMSxG2JA
	7rQR2EkwhsgT64y2VS3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7wKJ-00AIRL-Fa; Mon, 26 Jul 2021 08:51:07 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7wK7-00AIQQ-0K
 for linux-mediatek@lists.infradead.org; Mon, 26 Jul 2021 08:50:56 +0000
Received: by mail-il1-x12d.google.com with SMTP id z3so8111674ile.12
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 01:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=etHnoGQzq47ZbynR6VywyxbslQdcHyhoH/zh/8FN3v4=;
 b=aIG5zAsePtKUiKEs+FQ2KuXU0hUSBthKszmmcGaxvZmMgRWvAOFZQt0BPPVtbshcpz
 PSrR2WA2Qg8v7Vv5UPSoesnLqCpcj8peq+o7vriSGh64BJMez+n8DFrpTcn68sbdSAzp
 WddMRXm8Usz/CiMQPwt4gk2JuAT1IUHM2SYwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=etHnoGQzq47ZbynR6VywyxbslQdcHyhoH/zh/8FN3v4=;
 b=PpXRlL1kWkWJNAyBEZRvYf8U9zqCvfYkND/wPqbuheICONpBiCugKRKO9bhq5SuSU7
 emQ7wKFbQEi5//Jfx1jl26pT0Mr3ZmM2uYEqKXBMyltush2M/KjRKYT4E9XgEXaxC4dI
 up7qrpFHGTHQNBmbVroRUkXbRFmYFW7NI6sakxCVCGx4Tt4sUUblOYwx9prkSEyGxqvm
 YzPr/RlzdzuwYxw0SIb5Ssjm8uiNDOwiJga6SFJWMkdiEkmTUVGD6Hdfj4cap1BfKmQC
 wvQ6hMRgsU70+vRs3JGjxPNB8ryPKHjHSB5TJAuXjt8zmzqOR9FoIm32C1hWqEi6t0dt
 AHLg==
X-Gm-Message-State: AOAM533XlYFKS9jC+AH49/vfR4GVqljhJJNp/VmrYSrLnd4F90FzsooY
 RT/k7k5Wufof3Hxn25/nX/9sFC4JTPSnD+jr1S12NA==
X-Google-Smtp-Source: ABdhPJyf3HOQ4rIWmbymbwS4Lo1gx39HDWnmdLabEGO/SfTi3dLLNw40jleJ1klLdqzruzc0SrV4mCWJIyRwhVtTl2U=
X-Received: by 2002:a92:d251:: with SMTP id v17mr11970560ilg.283.1627289454063; 
 Mon, 26 Jul 2021 01:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5Ev4QU72cMqMW7sA=dijzh7-DCsfHY+Lmqd36uzg_7Nww@mail.gmail.com>
In-Reply-To: <CAGXv+5Ev4QU72cMqMW7sA=dijzh7-DCsfHY+Lmqd36uzg_7Nww@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 26 Jul 2021 16:50:27 +0800
Message-ID: <CAJMQK-hH5HM5iN4q6UgUf8T5fwj+0oULKPw=XafYOPrki-aDkg@mail.gmail.com>
Subject: Re: arm64: dts: mt8183: Incorrect mediatek,pull-*-adv values
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, 
 Devicetree List <devicetree@vger.kernel.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_015055_113495_65FB023C 
X-CRM114-Status: GOOD (  15.25  )
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

On Mon, Jul 26, 2021 at 4:20 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Hi,
>
> I was looking at MTK pinctrl stuff upstream, and it seems there are a few
> `mediatek,pull-*-adv` entries that have invalid values:
>
> arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> mediatek,pull-down-adv = <10>;
> arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> mediatek,pull-down-adv = <10>;
> arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> mediatek,pull-down-adv = <10>;
> arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> mediatek,pull-up-adv = <10>;
> arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> mediatek,pull-down-adv = <10>;
> arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> mediatek,pull-up-adv = <10>;
> arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> mediatek,pull-down-adv = <10>;
> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
>  mediatek,pull-down-adv = <10>;
> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
>  mediatek,pull-down-adv = <10>;
> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
>  mediatek,pull-down-adv = <10>;
> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
>  mediatek,pull-up-adv = <10>;
> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
>  mediatek,pull-down-adv = <10>;
> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
>  mediatek,pull-up-adv = <10>;
>
> According to the bindings, the values should 0~3. <10> is probably a
> incorrect attempt at using binary representation, which is wrong. This
> probably leads to the pull-up/down getting disabled or ignored.
>
> Cound people still working on these two devices take a look?
>
Thanks for pointing this out. It's an incorrect value but 10=0b1010 so
the result is same as 2, since the driver test the value by checking
the last 2 bit. We should still fix this in dts.

>
> Regards
> ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
