Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D8CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 02:21:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9EB16108F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 02:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9EB16108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZ3myiOGBaWvJ5pdNlA1PNfan5g42EZSaA+FdYJxfqc=; b=UprSGrQnnRAO9f
	I2NTSLpBadBqPtodZF7M/qof57Xv5TIkWqRPi1WGfzh9p0S7aiiLma9ZeRUoCcCIVakNcmADtLCPO
	J3H7HUkwhHYJe4tG83kbUnEukbre3eyDnby5va+aTX1z5LzkPFG6FJWMS2x7ELjZHYbncqSUNBRaT
	3XpgG6/j1CppgzT6pIy1qY9A6tXi2zf8pMkhHtrpGWmu8jH/3tw0JQq/kunTFDp9faIAiF3NBWpOI
	K1J4dCD3TTMks0pK4YBWPtekCbhrmj23zXdzAmygIJI5OMHIy3HWastZUP/P+cO2J6t3I4c3fIUzo
	VlhONE35Q8WEB353Wt/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgHVi-009ZSU-Js; Fri, 29 Oct 2021 02:20:50 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgHVg-009ZRR-Ij
 for linux-mediatek@lists.infradead.org; Fri, 29 Oct 2021 02:20:49 +0000
Received: by mail-pf1-x42f.google.com with SMTP id b1so4300952pfm.6
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Oct 2021 19:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mhB6LkCbsKUbE+bUIvR/Nrpsu2M4JaioKKngIejiLhc=;
 b=jlVG+VO1wHjL5B0Hkj2SEVVcUAGh7PrcbCyhNPcuXTVpP/NRyZrpYh2RlHOO6oYrTW
 PbR1GOeMbg8NcIQgJRX5w78F9Knr93d2yQFXq2kJM0zWiWhnU9TgrsBNd9bFt+d6Nk2r
 GjFs3JECWpH3fOdXFBWqqYTy/2L2M2iH/srfKEogAcW+JqlnBw8bFWlF5HgnlTIy44Wy
 YFfHhdrDo4URqFGKHh0fb3WB2p3WUxS0Nk9QTXO4kNy3r2hmmJixp8x2tDyOhL1bPYfD
 epKiICmzzvtTja91yNZDRFSpqL4TrY3h3VbVAcFNy1UHxrZUIbzek9ezqph5ss7aJmGj
 vKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mhB6LkCbsKUbE+bUIvR/Nrpsu2M4JaioKKngIejiLhc=;
 b=RjhVrnXUjX+dYy8MA36z5sQnBFWZkDKoPI1COPgsDQZ1RkhJCpEf1D1QhK4sU8pbuw
 MrkI5rYneRxOA78fWINvaHHolxx0bOz0CzKHwYHt3KrCD4yzMYrnd7uF9nKgXTRaTPj/
 EuQb2jO4kNVSuDwWaJDnAO+0dffI0yM2l1JzDN4W4eQyc2N3BVn3nrUs4La2vKtyjesW
 HY2nxRLcmUV944DWT826UmInxx0VAVjsPbjXoAa4ibh4pqPAbrlrrCz/qBU5iaFYFMWG
 lWCPhPIhlkfQ6ccmyYaoukS+uj/nlch3Hizf6fZ7MgzdAHKogIYd2JUslVPPPajDM6A3
 mdEA==
X-Gm-Message-State: AOAM5302IfUwUgSiVC4qv58plEhibo8UszXvOmzqF9VqqQwFUZbL9dpV
 BBhzjtR2UxFM5DJB0FjJjIsmJUPmHdtzzf623FhpCw==
X-Google-Smtp-Source: ABdhPJwRHndRNkI7bhtBce/eYA5HiHNlGa+O3E5HB7Z9RmPlWNKvOeozIVu/Q5CdowIzhda3z/o19UtPjQ3coB7P6Gk=
X-Received: by 2002:a63:7418:: with SMTP id p24mr6095486pgc.204.1635474044247; 
 Thu, 28 Oct 2021 19:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211029001225.27218-1-julianbraha@gmail.com>
In-Reply-To: <20211029001225.27218-1-julianbraha@gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 29 Oct 2021 10:20:33 +0800
Message-ID: <CA+Px+wUi6t3n64EPWqX0Q3vMUkBw7UrRBK_5RwnVtNsa-ZuLGw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fix unmet dependencies on GPIOLIB for
 SND_SOC_RT1015P
To: Julian Braha <julianbraha@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, Jiaxin.Yu@mediatek.com, 
 arnd@arndb.de, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 fazilyildiran@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_192048_658150_C9506A46 
X-CRM114-Status: GOOD (  10.74  )
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

On Fri, Oct 29, 2021 at 8:12 AM Julian Braha <julianbraha@gmail.com> wrote:
> WARNING: unmet direct dependencies detected for SND_SOC_DMIC
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
>   Selected by [y]:
>   - SND_SOC_MT8192_MT6359_RT1015_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8192 [=y] && MTK_PMIC_WRAP [=y]
The block is not for RT1015P but it can also be fixed by the patch.

[...]

> This is because these config options select SND_SOC_RT1015P
> without selecting or depending on GPIOLIB, despite
> SND_SOC_RT1015P depending on GPIOLIB.
>
> These unmet dependency bugs were detected by Kismet,
> a static analysis tool for Kconfig. Please advise if this
> is not the appropriate solution.
>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
Acked-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
