Return-Path: <SRS0=R22q=EG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24CBC4742C
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Oct 2020 11:39:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C11B20719
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Oct 2020 11:39:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1aBD9VQO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="MzPO9MZk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C11B20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1D0mI3eaNxlC/SCbaZvB2/cnfuZKoBZeRlLwlMPND0o=; b=1aBD9VQOe10fPt3EpbYg3zolp
	kVnFcX+xR51LsotQvLd3I0veLueVsHoH5G2MZxudk+lxuCxOo+rvE/xpvjkFeHI5ydKDxItOTd6c9
	QsXtRHC+XAd+kUgoXOOG0a8ssBPJJVkxHyNx1p/Hbyw9LLWVP9jIWO85T8Kwh1zuvpeMnL6OKmgbD
	ghhphcC2pWHxygCPbtpa6+kIxCAkF6UnlHpCI4QAHU/fd7EBXpaOrCL3TajEYkSQxbv9+7F4/xGRp
	KT2bLUJWqb+GfZkWukO4Nk4jjPz6bCAWs8CsaRq81+rDEu5A3TXE62SuXzE10T7N2xhwhzDSsvY+9
	kWMEFnrNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYpDu-0005Jk-Ib; Sat, 31 Oct 2020 11:39:06 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYpDq-0005IS-L9
 for linux-mediatek@lists.infradead.org; Sat, 31 Oct 2020 11:39:03 +0000
Received: by mail-il1-x143.google.com with SMTP id k1so8773058ilc.10
 for <linux-mediatek@lists.infradead.org>; Sat, 31 Oct 2020 04:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iWr+b4d6vRwF0t5pomRiiNEuuSgjMZV6gdO6R0PGLGI=;
 b=MzPO9MZkXm8AlGd0bbcmenmj7NNR02MYFGX58iMzgPYBVdibEAsD6rhrnBbLTiSN2e
 QJ2+W9cgZrEAyuJKQuK8CSpJMY29IJKDaQEnU8V6duBohUzStWQhsAsy6k2z+6hSU12u
 ASW0Uzerm/BtVE/Ah1sBFrIxjkP3lrHBg9XwGiCigGkMGA3+4mY06kR6JZwSsXnonGrn
 eQwZ2wbLdZQokDrDN8o+VLv9+LBf6tOHq1JqxalVnAd1sENv2Pbv0tDw4quoHb2w6lY2
 rRQpLQ2F6ppixFa5jX8QaNEAX9JhEfoqJmr1Ocgvpg+tgLg4XYSYqPpx94/Mqhv9JKmC
 FDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iWr+b4d6vRwF0t5pomRiiNEuuSgjMZV6gdO6R0PGLGI=;
 b=FXjeN1RWYgW1XVyc7ejvdaG4S59YJzOVr8DAx7+SXZLYnmYAQhHRtN4JDh9nv2Pqi5
 elMw1+/4wFoPxbqJBRf8MQIgLeB/1vjKU+OzrjsadwoXiKJuL+F3MAaMV0WwhSVbQ1L7
 4jSjqYQiH/R3I03EwAfiAc+3QxPa527G5CSOAaqqXYmEtleHwflxPWVMEaUPBqLlhhvx
 I7KjY8rrRdvaa+nEu9tEfF9pYsbv0ROWkkhF0G8ZIhoc7YS8+YhmX5pnKe9oYEKFohuD
 Oqt6VCTo1qH0sre3E0V2s2L8H31nt2KnfYWrQkX5oScOb8DkBL61m/KA66llXrB4+Wo2
 Am3Q==
X-Gm-Message-State: AOAM532Nd3WVcPgvHPuaE5dtKSnyakoG6YWaiNXXwzaQvc/g4J7qwMFD
 ItqTL64pYxm/kylVLZAK6Za6HxQwKWwyMOQ0Lz7VCw==
X-Google-Smtp-Source: ABdhPJxbtHT4iEyYwAkR4uBqXRY1zR99kXZQu5XEK1tkG0oSS3Wtm3zR0200hnrm2sMfkJJaP+DMIB2xXM3V68/vRfQ=
X-Received: by 2002:a92:480e:: with SMTP id v14mr4468180ila.218.1604144338898; 
 Sat, 31 Oct 2020 04:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603521686-13036-3-git-send-email-jiaxin.yu@mediatek.com>
 <20201030182339.GA4069524@bogus>
In-Reply-To: <20201030182339.GA4069524@bogus>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Sat, 31 Oct 2020 19:38:48 +0800
Message-ID: <CA+Px+wV5v2NK5hQ7sqHHFXVE34iLmi8+7caHZpD5Y=SX5x57ag@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: mediatek: mt8192: add ul-delay-ms
 property
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_073902_765741_DCCCEE0F 
X-CRM114-Status: GOOD (  10.25  )
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
 <devicetree@vger.kernel.org>, ALSA development <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 shane.chien@mediatek.com, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Oct 31, 2020 at 2:23 AM Rob Herring <robh@kernel.org> wrote:
> On Sat, Oct 24, 2020 at 02:41:26PM +0800, Jiaxin Yu wrote:
> > +  mediatek,ul-delay-ms:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      Skip first time data at the beginning of DMIC recording
>
> What does 'ul' mean? Nothing tells me this is DMIC related in the name
> and 'ul' is not used anywhere in the description.

UL stands for Up-Link.

Please ignore the patch series.  We won't implement the delay in
mt6359.c.  Instead, we'll leverage generic dmic.c.  See
https://patchwork.kernel.org/project/alsa-devel/patch/1603521686-13036-2-git-send-email-jiaxin.yu@mediatek.com/#23716495
for previous discussion.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
