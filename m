Return-Path: <SRS0=O6hk=3K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BB1C33CAA
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 04:37:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7403A217F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 04:37:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ANWaQmno";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y437XdOv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7403A217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wls/ltKF7eeAyXE/MsYFxUTAx73vaJzW5Mv2k/xFm18=; b=ANWaQmnomTqeT5
	Fi2EwfzbYp0jNelttCSnu/SzTn0JK6oPjKdiTsKW9lw2Z9uNap59+AM2yj1Q+OaqJKrsIL0UPQaYc
	kNPVpYvHwOw9zgh8ZFjC3IEFZDwowPZLSZG5m5tVwbh+Ds0OzMMlXL3yubIOTZGCO1qfWHAw5WeiW
	rckEax+7wdsmZWEhPzTdkprVyjOQ70b1eLFje+QlXRrnRP/Gkj62KdrXaE0Fo36QTz1F3J/j/PwE9
	VpuZr//Rj5N0AsJfQxSHT8kmywNo+tia2nl/UG07I6EKqvBzF6XyAUdMZYW6xn0rsK38+zOMKh35t
	OlKhNmdpkSyC93KoUFgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itlIM-0003hC-1y; Tue, 21 Jan 2020 04:37:42 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itlIB-0003Z4-Gz
 for linux-mediatek@lists.infradead.org; Tue, 21 Jan 2020 04:37:32 +0000
Received: by mail-qv1-xf41.google.com with SMTP id m14so860981qvl.3
 for <linux-mediatek@lists.infradead.org>; Mon, 20 Jan 2020 20:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tE6t4zYqaVXPST4AhwIQ9GsXTC/ddB8hjT5O44X4X2A=;
 b=Y437XdOv0Hto2lq+dzGstZ/dDsYcyHpK4I+DVf73M1v48j1EjilwkEp0HlSg8Iu9gL
 0tTOS38rUYrM9yCpro7VwAwprgAfaJvNt0icSyt0cimanM+SnEp2Xre2R1C/rtGm8iVZ
 lRVWu7xtrpg+9KP77O5tLZX+QnE1zQQIxeaZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tE6t4zYqaVXPST4AhwIQ9GsXTC/ddB8hjT5O44X4X2A=;
 b=MDaXy+ZSYxa7E5JCXt+U/OQwBhm435UFab3qgVooUcaxhXCmQBCwRWaVKe74ZEJykX
 esHilAZYcrKQzN00LmVSd5mizHT+j94XHqEIGCf6Yo12YJAEEh6eBhcOVXQPK4V46Yok
 +RtVXLPRIDmTdtE6YqGZmK4EiLMPueNjTWEefDRnwtnWjrOp9zwmK0fdMhxjX5W51eEM
 NC1G/g1es5lT4790Ir6XzBFYTIPPlY+GBdtymmBrEYv34cyucHJzl3dFqdx93U5qGH9j
 Rm9+tJK84A6Cqy7IxL8c30iUF7gUyZSTFmVdq6qRaC6vwuzOms7LklhVUFUXPLLzkirQ
 RQKQ==
X-Gm-Message-State: APjAAAW/LNfmtZXS1thNPcq/VUpwqmJgL7vfTzYsR4aBqPTuCO7LJHiU
 w+9Nvf1X7gkb8xETHDydeLqEBHicxsz//keokXDrKQ==
X-Google-Smtp-Source: APXvYqzdl4VdxIrAynyQuScJnrpT9ZczyRYljUJVkw1OCPfHpQClTp+aKVQtQGPPLLXXuyebvlkJ/h7fxsuCkIoPT4Y=
X-Received: by 2002:a0c:f703:: with SMTP id w3mr3120793qvn.6.1579581445521;
 Mon, 20 Jan 2020 20:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20200114071602.47627-1-drinkcat@chromium.org>
 <20200114071602.47627-5-drinkcat@chromium.org>
 <20200114151643.GW3897@sirena.org.uk>
In-Reply-To: <20200114151643.GW3897@sirena.org.uk>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 21 Jan 2020 11:37:14 +0700
Message-ID: <CANMq1KC_-g45wdGgGiBmEyVXAJMkKwsJBJXGBHOMJk_=NyfpYw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] drm/panfrost: Add support for multiple regulators
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_203731_561808_1390DA9E 
X-CRM114-Status: GOOD (  13.41  )
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
 Devicetree List <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 14, 2020 at 10:16 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Jan 14, 2020 at 03:15:59PM +0800, Nicolas Boichat wrote:
>
> >  - I couldn't find a way to detect the number of regulators in the
> >    device tree, if we wanted to refuse to probe the device if there
> >    are too many regulators, which might be required for safety, see
> >    the thread on v2 [1].
>
> You'd need to enumerate all the properties of the device and look
> for things matching *-supply.

I see ,-) I was hoping for something slightly cleaner, or maybe an
existing function in the core.

Steven: How strongly do you feel about this? If so I can add that
check in the next revision.

Also, just a heads-up, I'm out for the next 2 weeks, I'll send v4 after that.

>
> Reviewed-by: Mark Brown <broonie@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
