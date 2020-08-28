Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6927EC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 14:39:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 276B320757
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 14:39:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="soud63MV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bthwUPub"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 276B320757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xZJ0ei+97iY39bhJDTMMb4s0EY68O5aUx9/i8bLdRMM=; b=soud63MVUPK9vOH/gO4ggRmCg
	IY0r2e4zmCQaHBkW6j+JSPiLk/ikq1I1IX6CpS2sDRd9oN5GDiZvzkVwcyIb0OE+8rNIZExRKY95W
	tDJ02fJ8CMgt1n9yOudAuSI/aihtY58c+zH2Bcum6OlBcnGkhX4bLrzF7WrZZyIZPIKrESjmeYcGt
	dETyZ/RyzmqD9dRLtOIS6mdMwV2rVUdLUeRIZLISyoavcH/w3ErkGcSxmJEVWYCePWpmIA82uyf/t
	IkvRCHcMX5MYxCuyqTGW4X1OfSmRo822bxaiPNwonDz6amnGSFTNW782XXo8Chm/em67QRVlpp5/D
	Liiwl4WyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBfWt-0003u6-Pp; Fri, 28 Aug 2020 14:38:59 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBfWr-0003sv-2Q
 for linux-mediatek@lists.infradead.org; Fri, 28 Aug 2020 14:38:57 +0000
Received: by mail-lj1-x242.google.com with SMTP id m22so1576854ljj.5
 for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2020 07:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z+TaixqXEGVGQ2T/QrWllmigc9Bn2yBozBpoORD/TJw=;
 b=bthwUPubnbhn6YaESsUooZlnlA4AAH2u5bkxHyDnFmhCm7Kh8U+RM/LdfdzTy1rYap
 u44U0H4icDS300YJtLrAeN/7futTwYEW9VcOBuA4MuLVEaALI8PfhMowA05SL1w4Aht9
 EJ2c2krhGZEMNpmqLnZCHr6FP5hI4iwU/AKWJelCBMzkKU5f+mZY9UODyo7eprjDDebs
 O9ZHQCcn+Y4eCdnY+/38i5UVPDt5HBdr12ZRgh8q2eFBE/mFaM9AMXRKlxfxAn0quOPM
 bjoy/WikU5yTdZRSThu37hA3MaGWPoh5PN6jQeqLm+WZnnKTMUmXjqT3ChLDKmm4LnUk
 xFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z+TaixqXEGVGQ2T/QrWllmigc9Bn2yBozBpoORD/TJw=;
 b=gQ/zsIoOXodPz0fiBUYccRkZMRtGdXCE4Kqr1QNaupAxCnCXJtTM97vCIkVZf9IFqU
 f3BlocUlNvH5ZPN7rgxo3ihue9AVXp8PSTeOJTbnEIdpFx8JCRP8WXZUNXsIyGbDRgZP
 ZNqJBPXpzPGThm51fnGj2sABVzBRJT0D7bk+WWoclfgnp0cqwfnaFMgFGaRTr3RfnJTY
 ml/uF4+zgJvaNxulQSdDvjyKMMd7/fkRrW4WJ7AE8qBIBmWfi0YaH6+yhEo0a6SowxB9
 9KSmvkmDZZ7Wkb6wfUeFVx2fl5/tyNDrJOJU0dPyj6kxLDut1vdXXfvcn80e4xYFkbHX
 TZHg==
X-Gm-Message-State: AOAM532lwReA5/GwAqfxIq9u4F20pbbIYraiJ/WkjdcoeeONaOFW4VVT
 aNLF/WllvyTtJawXUsB5uTGNnlrpcaLEixUuAPEbTQ==
X-Google-Smtp-Source: ABdhPJwaDJ3Gr/qcSUh/+gWWdKq8kAihgP6kukxSpzeXwrAWcBQEZ3gQKkku9u7kwQPG+FNQX7jTEbu12MB2QtmIP4I=
X-Received: by 2002:a2e:81d9:: with SMTP id s25mr1013703ljg.104.1598625535585; 
 Fri, 28 Aug 2020 07:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200817001702.1646-1-zhiyong.tao@mediatek.com>
 <CACRpkdYedyDcnL5DUD33Z2iT1jEJ_W1gvB_a8VaFnNAH1mKgzQ@mail.gmail.com>
 <1598581434.5835.2.camel@mtksdaap41>
In-Reply-To: <1598581434.5835.2.camel@mtksdaap41>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Aug 2020 16:38:44 +0200
Message-ID: <CACRpkdY9hbLOTjzQm34xL32PU01tRMkcB4_qTeFqwQM9Yam75A@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Mediatek pinctrl patch on mt8192
To: CK Hu <ck.hu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_103857_156580_65C9F5AB 
X-CRM114-Status: GOOD (  14.69  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>, seiya.wang@mediatek.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Biao Huang <biao.huang@mediatek.com>, hui.liu@mediatek.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, sj.huang@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 huang eddie <eddie.huang@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, srv_heupstream@mediatek.com,
 Chuanjia Liu <chuanjia.liu@mediatek.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Erin Lo <erin.lo@mediatek.com>,
 Sean Wang <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 sin_jieyang@mediatek.com, jg_poxu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Aug 28, 2020 at 4:24 AM CK Hu <ck.hu@mediatek.com> wrote:
> On Thu, 2020-08-27 at 10:52 +0200, Linus Walleij wrote:
> > On Mon, Aug 17, 2020 at 2:18 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> >
> > > This series includes 3 patches:
> > > 1.add pinctrl file on mt8192.
> > > 2.add pinctrl binding document on mt8192.
> > > 3.add pinctrl driver on MT8192.
> >
> > Patches applied for v5.10!
>
> I does not see these patches in your tree [1], have you applied them? I
> would like to pick these patches from your tree.

They are on my harddrive while testing, then they do onto the
server for testing, then they go to linux-next for testing.

Give it some days and some patience.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
