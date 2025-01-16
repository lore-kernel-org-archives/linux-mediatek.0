Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3A8C02183
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2025 16:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGPiUeQaDByXyGYfaiyGjoevsH3zwreWTmPpwDEUSo8=; b=CAZL8yDQ6n6iTEkMvV5T57ArIR
	bc76q1vv5OBHDnbsjQ9b2L0qBlaC6lHKeMvs/cUBbAzGPmLVPNkfaTBdqmHEhupqONl6Z++5JMEgv
	sjZYsSEvMvbq/NwDcCsQbyXYjxvyQaHmkzJeK03Q7s4ubigoOC/9AneJWJgmC7sNydFrObuvwPezc
	mntt45VNd0LA6lt50VhXWgkaxhFAkWxIZoaO4AHthdqTeX4vhIHHufEvg5eTUtUir+U7m64v03EYM
	EUSKLb+lmUVzdJQUtyQ2Yl68qxi3YN4fpSZX5urwN17cMedlNhoYJDrs4Yd1iGYPtw/E1/Yjvpb0G
	KtW33/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSLd-0000000FSEx-458K;
	Thu, 16 Jan 2025 16:03:57 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSGe-0000000FQ5Y-0xve
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jan 2025 15:58:49 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e4419a47887so1684234276.0
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jan 2025 07:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737043127; x=1737647927; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QGPiUeQaDByXyGYfaiyGjoevsH3zwreWTmPpwDEUSo8=;
        b=oY8+W8R6Ym7AeM8vUv7+7Eu66MVBPMA57lnzisPE4teL34ZoTzZzDBdPSC8PuJp5Fx
         rgrURwRjsgkWSh+4mCIJZXkd+W89kv/Z7NfXL5FZuVt45vPxgXiwCo5cfAcrSV5m6NUl
         PeevADCOUPG0Cxhkxt0axKcYZI2nPAzeG2mLKR06xyBiTkfCDvF13Vsn6+UXMZzXWYWV
         c5rqhDbgZ6pUc1RzwRLkV7doq8OqJ2r/zQw1lHxQ9xfFSzugEKu1K0bzi+nwb381ElTP
         DWkKgff8Bw92vxhTNQo6iFXxQqc+7/yYuS2zpHdjQued/rB/TRQFXOBgHuvA20ALG6ve
         kFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737043127; x=1737647927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGPiUeQaDByXyGYfaiyGjoevsH3zwreWTmPpwDEUSo8=;
        b=InPR08Bo7urQ21f1v/lTUw96BGg+SaOqWSoxPHlk91Y7Z//cw7864/y6cWXcXbPf/n
         oiZEZ9YyldRLibMr73q/yr5hY9QGeOwMEN81qjX7jG7FEhSf0QwnPAqzXeB1WoLLzhyD
         Oxi4FAFfJvo5QkCW/5+j6H5fMzz/ax+zQD0N5SSKI+mNarZUKFB4svETdQ4xj5fzYgI9
         WhbievHNN5zoZCzUJigz+yE4B1V2XTe6zV6ZUbKm76TrdYndFPvZ3rRF+QCOR0v/WRWy
         fclVVLa1Tbnacuzepmvk1X3fUwHS+lTDxevOGDRQvy9hpQ13TvCR7w9tUviKSQ8r8cjd
         QDLw==
X-Forwarded-Encrypted: i=1; AJvYcCXxw4sfuRvpSeDi7m7cprQQI5V86tnWAR0q3I8oydxt/xeXhKjb6VRWTvdYldVFh2su+7ZDTM15SPvIQ5FqFA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg7DYKCyENlV6qQwm0976poiBV5zk2AvHYIW5ROPa0EgE1uKEO
	2ioMMr4Hg/SOJm9WlNkH6uqoNXiYJPEQAPpXOgkCupT8hRekVKIklYlD0oFI1yTHyDFzJ2YPiwb
	nb325WSt8Ymqk3jpx4VhN+wVi0LCyWHHSuXV7tg==
X-Gm-Gg: ASbGncsPpWRxF8yNP5BLXr1/09hBVtwu3TWw0bYf0HcPIYp9tnC6OiszcJHIazH6poe
	V1FUA0Sq1s72TbpWrLLvKMfo98lNZlrmBc5QZN9E=
X-Google-Smtp-Source: AGHT+IHzQbQYAi6FZO8GNmu8t3VQrhl2ccDWHjHOxE3SLBVC4VwnOsYtSa0UftO9WxJZ8AnPeBd+o1qUAP/ZQG8iuDk=
X-Received: by 2002:a05:6902:18c3:b0:e57:8814:13a6 with SMTP id
 3f1490d57ef6-e5788141804mr6901177276.17.1737043127387; Thu, 16 Jan 2025
 07:58:47 -0800 (PST)
MIME-Version: 1.0
References: <20250109131313.32317-1-ansuelsmth@gmail.com> <20250116070214.vdnbyyqnciifngha@vireshk-i7>
In-Reply-To: <20250116070214.vdnbyyqnciifngha@vireshk-i7>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 16 Jan 2025 16:58:11 +0100
X-Gm-Features: AbW1kvYjzgMKu3xCJVK7F5l29WK5ilTbahAEoFI6YcNzZrqQ5wXTPLxX0mm-M2A
Message-ID: <CAPDyKFr_z3WUyO2bTV7fPt8=ECdoHCERd=f5UN8MmNpyN=Rm_A@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] pmdomain: airoha: Add Airoha CPU PM Domain support
To: Christian Marangi <ansuelsmth@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, upstream@airoha.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_075848_269642_D65E0E2E 
X-CRM114-Status: GOOD (  13.46  )
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

On Thu, 16 Jan 2025 at 08:02, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Ulf,
>
> On 09-01-25, 14:12, Christian Marangi wrote:
> > Add Airoha CPU PM Domain support to control frequency and power of CPU
> > present on Airoha EN7581 SoC.
> >
> > Frequency and power can be controlled with the use of the SMC command by
> > passing the performance state. The driver also expose a read-only clock
> > that expose the current CPU frequency with SMC command.
> >
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> > Changes v10:
> > - Depends on HAVE_ARM_SMCCC
> > Changes v9:
> > - Fix compile error targetting wrong branch (remove_new change)
> > Changes v8:
> > - Add this patch
> > - Use SMC invoke instead of 1.2
>
> Any inputs on this ?

Apologize for the delay! This looks good to me! So, applied for next
to my pmdomain tree, thanks!

I assume Viresh will take the cpufreq patch via his tree? Please let
me know if you prefer another route.

Kind regards
Uffe

