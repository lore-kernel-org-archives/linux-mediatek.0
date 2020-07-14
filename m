Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC296C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 20:47:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89CEC2065D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 20:47:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bFqrNXn1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sYIvu3f1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89CEC2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mhcwWgkf8Wt35q6w2SgENluM7z5lZyVfmuowk1dBinQ=; b=bFqrNXn15pC4IAySo0dRlnDxN
	aXlLPLYgDm6ts0hANU4Xvg+LKHcA+5RMb1neMacvHcp4fD5KDKUqwCP8yKur/BNNMaFg4JxOKuR47
	vghBC+c1M+R01TFNueVGGxFQBuPnGtjdktbK6IQEAYmdxOoWobdKcC9JiWf3V7TpGSznFssDgpCaW
	rIJlzFlC+f/qAPNzvmL6dToY0bhLcjKDBZI/KTXf+hwAk2yeSJ94U3AgR68mhvk3Y7jVum3Ml5Vf3
	q5rPNLjWB9VXqbdAiEPaK1v7dQqaWFdkQjm1PBYs9g7A5D0Vvv9W+yizmRczmi3djj1u8ZoOxeNmr
	Ck06PCP6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvRpy-0000kE-NA; Tue, 14 Jul 2020 20:47:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvRpv-0000jI-2x; Tue, 14 Jul 2020 20:47:35 +0000
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2493520656;
 Tue, 14 Jul 2020 20:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594759654;
 bh=AW8Fhw54zyXMIIci6R4Vy13WT2UOAWtC/jxlBSMDeZA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sYIvu3f173B017/4ldlM0SC5lETWMyt6khC6MQ5xwhlIu0Ndqh3De7uCSwP+2rpVC
 vnUGQHRaoYn47Eqjcm2O4taCzxYq6uFKmVPiy2GPCO73etSHnkH01hOy1PmbO6a4Wh
 VyAXCWP+Jq3GSfPFE7nYN96XRbQYXtiOemHgPwe0=
Received: by mail-il1-f171.google.com with SMTP id a11so38826ilk.0;
 Tue, 14 Jul 2020 13:47:34 -0700 (PDT)
X-Gm-Message-State: AOAM530hflAh1Kz+MT6LUMjDMX3KxorZ8zC19UBfYYK8Um92ctm+IbE3
 ZJUJuvnR0LA1IC2RqLVMJFw+Qy3O70ekfP5mVBY=
X-Google-Smtp-Source: ABdhPJzl2OnjW2TOVxFJ4nevMOUG50uYeQKfvJWwJjF+KRZ1tWxKUJfykO8UjV6vDxvWahYyVdWRu++GdlpKhdVr3T8=
X-Received: by 2002:a05:6e02:f42:: with SMTP id
 y2mr6628078ilj.264.1594759653637; 
 Tue, 14 Jul 2020 13:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
 <1594718402-20813-4-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1594718402-20813-4-git-send-email-hanks.chen@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Tue, 14 Jul 2020 13:47:22 -0700
X-Gmail-Original-Message-ID: <CAGp9LzqhFr2R4D00s4WCbPRwEsMjrY2RKg_OyFv-tTEQ7axTjg@mail.gmail.com>
Message-ID: <CAGp9LzqhFr2R4D00s4WCbPRwEsMjrY2RKg_OyFv-tTEQ7axTjg@mail.gmail.com>
Subject: Re: [PATCH v8 3/7] pinctrl: mediatek: avoid virtual gpio trying to
 set reg
To: Hanks Chen <hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_164735_199348_370D0FB8 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 Loda Chou <loda.chou@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mars Cheng <mars.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2020 at 2:20 AM Hanks Chen <hanks.chen@mediatek.com> wrote:
>
> for virtual gpios, they should not do reg setting and
> should behave as expected for eint function.
>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 25 +++++++++++++++++++
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  1 +
>  drivers/pinctrl/mediatek/pinctrl-paris.c      |  7 ++++++
>  3 files changed, 33 insertions(+)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
