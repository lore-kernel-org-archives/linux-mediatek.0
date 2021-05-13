Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A8AC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 08:21:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 705E461185
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 08:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 705E461185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0DJsvrtHuDV+xdhHMtncd45dFpufjR2dd7uXUxtP9Ag=; b=ZU3AGj5OKX/slxC4nhk5xDcKq
	LJ+7y4pOIc4cc/yKSY2aiC1JRE4ixE45rjVrVfVBSEor5vfZDDiVbf1C1kUTwmF93FpPeXHicCBdh
	lf3uWzdHh85JIH/QjeVvZVE4RppgGutJ20sL3nVI5w69KRFPua5AIF2Mr2o/HLtvmvYwcG62T+kUp
	g/9wJX9XHqKjnVnhZEkERZeNxEBgAoAhY84V+prYJ+earZmUEmYVy8Bedq8KuMsCZSMCgg/XU0UTO
	JOgSylRLeNIlvGZyIRbNCK2O89L3m8M4hkk/wWCkvUr65UO+0NqqmlqiOHy4qGGNJZzD4X353PqUT
	rtza9o/BA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh6b5-0055YP-H0; Thu, 13 May 2021 08:21:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh6b3-0055XO-EJ
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 08:21:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+1/k0C0U/4PbCo991QeF2hoImjtMAGcUEqpPrZUi0VU=; b=2t/65Rug9OjQdT7ADr3LUusFVY
 SIjmvnnTBMjd4WuPiG+ahq6iCQinCCYEzLGhCRJtMJrgm925pueM3UFpWgN654/5nJ6SuS5brE6pI
 szuPMPxnvkBX89JZWWIslGib8mWg6HOoLykzDScIL7LQaok0pbDEMUW62UHAM89PoJx0m5RSIi8sv
 NWJbe35kuDRUe4fUHsp9qzBsiKsHI/OtkIOaYXYiT5U51G0qwoWNXum1vbP3GQzeGwg7ng188yMCx
 Mw6+aNi9Vs6rmCYwY4TJNlgQ0RYrarW+dcX1klKOLRLnOSW2QNa3URSf/PCUa5tXewvI531/efjDb
 ZccUfdZg==;
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh6b0-00B6RI-Gb
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 08:21:28 +0000
Received: by mail-lf1-x135.google.com with SMTP id a2so16446959lfc.9
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 01:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+1/k0C0U/4PbCo991QeF2hoImjtMAGcUEqpPrZUi0VU=;
 b=jvrERVq6t/rzqVFu5XXz1l714GDGaw+rZ2nZkXdo5ZA4kxNgtgacNNYTqgBq7ljbPt
 ZQzQrX1xchRvSyhS+xX5bX5e8o7ab0h1+adzpkLXYEF+bHLaoI+EAiKAvganCkziUM6g
 YF3zBMriWEJL1Py4KmP7dyRYufrukQ14QIzk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+1/k0C0U/4PbCo991QeF2hoImjtMAGcUEqpPrZUi0VU=;
 b=hVB/o/EcCsVAeGTuC3pSu/+u2lmn2CoarJg0I0gO04bF8iXXr5gBbh6x7UASf814oW
 IngzwsTrZekQrKRPK8gd7Jo/nhopVLYfFgUUhdtyFxhsQCvJNinALFisfpQh0oFAQE8g
 fSEmj/mSQzTDC0XNX2L9ryMZ8842RPRZszdVvQujiVybCHeEOoUyJD9Um9k9RzeCiF3x
 44Loa+XP+diEbSkFjP+Ir4VfjloKXIzK4lCWttTN7Fwiy1hNcD2YJkHPldXFAjxsqgr4
 coIgYRhzaG/p5znuwH18JONh51CPoD0+iCyOtbtVqW9oqK5tfBFb5vT3z8S3xwZ4+uMW
 B4vA==
X-Gm-Message-State: AOAM531bQDA7LnnBJjkRum376zUgXr1Ytur2ACC45rsq0xIleIGypHt7
 fHYQRdKt+PU3ud2DhKOqtwxyfWj1o57G8w==
X-Google-Smtp-Source: ABdhPJzUyUaIvyavmdaFjbuuC6lF+Xacc+84aehe+8qUN1HdnuXfhccNoKn6MasWPWf2Iuuw2lelaw==
X-Received: by 2002:a05:6512:15d:: with SMTP id
 m29mr28468419lfo.515.1620894083978; 
 Thu, 13 May 2021 01:21:23 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id q24sm216907lfc.261.2021.05.13.01.21.23
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 01:21:23 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id m11so21017096lfg.3
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 01:21:23 -0700 (PDT)
X-Received: by 2002:a19:c10:: with SMTP id 16mr24165709lfm.332.1620894082924; 
 Thu, 13 May 2021 01:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <976d420c-b4fc-bc23-c398-9b3a7ab4ffc9@collabora.com>
In-Reply-To: <976d420c-b4fc-bc23-c398-9b3a7ab4ffc9@collabora.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Thu, 13 May 2021 17:21:11 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVcnei2OLFYG-2YyqZrY8JvA-CJN6SUv=vGRmOZ2Af47g@mail.gmail.com>
Message-ID: <CAPBb6MVcnei2OLFYG-2YyqZrY8JvA-CJN6SUv=vGRmOZ2Af47g@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] media: mtk-vcodec: support for MT8183 decoder
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_012126_597306_7E332DCA 
X-CRM114-Status: GOOD (  24.56  )
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

Hi Dafna,

On Thu, Apr 29, 2021 at 9:07 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> Hi,
>
> On 27.04.21 13:15, Alexandre Courbot wrote:
> > This series adds support for the stateless API into mtk-vcodec, by first
> > separating the stateful ops into their own source file, and introducing
> > a new set of ops suitable for stateless decoding. As such, support for
> > stateful decoders should remain completely unaffected.
> >
> > This series has been tested with both MT8183 and MT8173. Decoding was
> > working for both chips, and in the case of MT8173 no regression has been
> > noticed.
>
> I am trying to test the decoder with this patchset using v4l2-ctl on mt8173.
>
> I am trying to decode an h264 file into V4L2_PIX_FMT_MT21C format.
> I am not able to do it. It seems that the driver expects each buffer to start
> with a nal starting code, and the v4l2-ctl command just read the files into
> buffers without any parsing.
>
> Can you share the command and the files you used for testing?

I have been using the Chromium test suite (aka
video_decode_accelerator_tests). I had doubts after reading your email
but I tested the series again using this tool and confirmed it was
working.

Unfortunately this test is not easy to build, but maybe if you have a
Chromium environment ready you can run it. mtk-vcodec does expect the
input buffers to be split by NAL units (as per the spec [1] IIUC), so
that would explain why v4l2-ctl failed (I assume that it also fails
without this series?).

Maybe ffmpeg can also be used to exercice this driver with properly
split NAL units, but I am not familiar with its use with V4L2. I'm
also not sure it would be happy about the MT21C format that the driver
outputs, or that it could pick the MDP to convert it to something
readable...

Cheers,
Alex.

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-compressed.html#compressed-formats

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
