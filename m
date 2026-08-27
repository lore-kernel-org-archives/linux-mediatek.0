Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8628CC61DB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 11:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYUvIldewK6PvTP1rIkGVol761Yt1VpaE72Hq+Vq9o0=; b=iO6VG0kdzzlcIuhsFtqAWvf36Q
	D4aRkZMsGl/nTWBSB9dTc2ZofexE3zUOB/IPTa3rc3MPmzQKrkkymIGerYB7fT2u47MGAimXF39hE
	lsH9b719zk6nKiK+m5b+Xj5B0DZbMMUqcnfiNX3sSPGKjLh0pVa/yR21rMZ3OV4uvZQ+7KCuzFYE/
	V52LY3d3CfKkWU9o/m2ycJ1m8oDnIWzV8wqOPm8jQsfAa6zlcU5F61kMegRcHGq/pa0d5vVQnEEdm
	Y13rMOOTejyM87+dwOlNzhngsuzWuX2bljfdUhWH41O7sOeCBg+ztfuLLlvzntPoDPzopnwW1D8Au
	hzB1LaJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXuH-00000003rkn-1qzy;
	Thu, 27 Aug 2026 11:04:29 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXuE-00000003rjm-22Nz
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 11:04:27 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-97cc20c05d3so495912241.0
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 04:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787828665; x=1788433465; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VYUvIldewK6PvTP1rIkGVol761Yt1VpaE72Hq+Vq9o0=;
        b=iaFkDy/FKBSX7k0A+jpXBdtn0vp4anJEkEE/OvHHMEl8kV3riAISkjDEKx8XBQvFuI
         v5M/ZIRN3xWUMQ3E9KRBD3WJtQMMQ6HVuPhpymQC5syO8G3qwmWZu0aXWGsW1+fAapuu
         iuvqJbhoZ3nfWyfXnwZmplX4P/b+NvUEp9ENM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787828665; x=1788433465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VYUvIldewK6PvTP1rIkGVol761Yt1VpaE72Hq+Vq9o0=;
        b=oVVGKgk8M+sm+PyovyzqfeCMoStcNebyjf8XcPrIWyKo4A2NbNzVsyTKSdIbkrEer9
         MzcPpwhSIQ110NDafqhMD2UfHxeF1E+pwRUeRwVdUkdPu1k9DjqydhQHoDZ8UtaE2YQf
         9RoV37uIcFIlQYrrZptorrPRYgR+GCxO02J4NJ3dssXN4rw9qAWn5F4ywJrexzu/5JjH
         0SgUEgrOFgup4XdquKol5CW9zMRgEvP/u12mYfOlPY31iiO0Owl8M1FrgCetMW/ll90Y
         +6+i6tkXMunzwqh5C/rirl+8U3u0aQrj/QEwC0f0AePpfS/d3IrsO0hLvf1cLWYzRnqZ
         L/og==
X-Forwarded-Encrypted: i=1; AHgh+RqZMzKL0B0EHtIomQDbgSiHeUK/qkAlex7xRDan/DrkgXlUjzcX880mp3barX0yPMMwnxipav4EHUYOQK6qKg==@lists.infradead.org
X-Gm-Message-State: AFuF++m4ndJC0vFtBb6i/Z4tk/LirZZQpmCinalBsBp+2PsiBtSjtZYn
	bIr/xt8uGEBm5ILbbF3Aw6mWet509B7wXkYGQTz8L4oynzQrh+ttLphFDSxWo2ZTk1m+KKComHn
	PA4Q=
X-Gm-Gg: AR+sD11l+0D1OjAFIyWDBZkXWaQMdKwIdpo8EULxGajkPzrjmg6xqmruxOUDZWmVJxR
	Wiruh72sDYUvrpZ+tnDFzg1rFlMH0eksVGApdmyYaRJ/Q8uoo4gkFaAUZNgBF1D13Rrwx6rhTXP
	ioVg7CcLOer9q0VNR3wZzbSaE1PjnaXfuY5flZY7fsCX1sMu/bH8yugM60HCVLAqjusaRKDYbtJ
	c7Tl9Q1oObGOr1ZQTRWvG9o5CoPSltBOdwjZxCNcfJRExbXQxNEkj1Q1mpy/04BpytnPaGb6tyt
	ZDwyQS4GC/sVET6Jg1K+FpNpyJs76f3ziEbsnAXmzFA0ruRCQGrUvPwnNoLD9NhyKngu0outm06
	CCSXldXDAWsue1lRggBWHERZyK0/1R+JUv9JS6fkV7tKDaPBESs9SQrWqxgjDpP3147WYx0I8Cn
	/G6pb2zepix6gBYydIJfXIbH1960EDUeBwtcckithZz0gNvuLE0iZnjXaImOhAsfxgEzSmT7kgb
	rIM47AHG3yLDOSpfJDq1Fh7
X-Received: by 2002:a05:6102:8617:10b0:782:e392:2b30 with SMTP id ada2fe7eead31-782e3922dd5mr2357478137.9.1787828664962;
        Thu, 27 Aug 2026 04:04:24 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cbe0ae5d2sm4567911241.2.2026.08.27.04.04.23
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 04:04:24 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97cad2f51edso594835241.1
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 04:04:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpSmsctB49lzEUD7ZYlmU/eyPu1LD3JlU/ogYvxgj8i86fVbuMbPEI3r5rjwUHSsEIivZC5i8fYPbKksqRqLA==@lists.infradead.org
X-Received: by 2002:a05:6102:3c9f:b0:779:dc0d:2b2d with SMTP id
 ada2fe7eead31-782c0bf8c46mr4363524137.8.1787828661149; Thu, 27 Aug 2026
 04:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260827105738.8570-1-wenst@chromium.org>
In-Reply-To: <20260827105738.8570-1-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 27 Aug 2026 19:03:43 +0800
X-Gmail-Original-Message-ID: <CAC=S1niht1VnNpZrqVaAb87FLVM7ZtJLOiDgCroGVRg2w09WBw@mail.gmail.com>
X-Gm-Features: AcwNN1XxLwZk6xI-YXSc5CYXIrMIXfGVUxLqoDEmpH_birCWDntEpyOtQassyDE
Message-ID: <CAC=S1niht1VnNpZrqVaAb87FLVM7ZtJLOiDgCroGVRg2w09WBw@mail.gmail.com>
Subject: Re: [PATCH] pwm: mtk-disp: Fix period readback
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pwm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_040426_525426_B2753416 
X-CRM114-Status: GOOD (  11.34  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2026 at 6:57=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The period value stored in the register is the number of clock cycles - 1=
.
>
> Account for the offset when calculating the period in nanoseconds. This
> fixes the discrepancy reported by the pwm core when CONFIG_PWM_DEBUG=3D1:
>
>     mediatek-disp-pwm 1100e000.pwm: .apply is not idempotent
>         (ena=3D1 pol=3D0 281500/499875) -> (ena=3D1 pol=3D0 281500/499750=
)
>
> Calculation discrepancy in the driver was found by AI run by a colleague
> while debugging another PWM related issue. Check against SoC datasheet
> and fix done by the author.
>
> Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
> Cc: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Fei Shao <fshao@chromium.org>

