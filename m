Return-Path: <SRS0=2t6o=GD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B02C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 03:05:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00C4620B1F
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 03:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00C4620B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=leVcFAzlrbP56V7JUEK1VtJ6kFR0oedJWrefTr0RBqs=; b=BK5JYztUaKGvQC/mmpSDvG0Do
	DP/+cFmgxbqCgcfvCjvg6rQ+Zd7omkf0PG6EmSUtgLQLOZP9IuZfq6JxSCdx87Gwxnm6sKi9x/Z5t
	nohPjmBbUdxDyZuTaCYaTjT/I84yftZTcVOF795pqfRKqBMChGT+1sQK+w9srbZyvbRKv4zHv/CBV
	ZEwoUZeEbAdzzb3i1/GyCH8NB4bsxIiZ6icP6t0zL2uozmhRne7JAnsit5rN3wRhOGmys3EcykUdt
	/aCq+YV1wSNpdE9xzZZcNeejHz0Qk9lZ4KYCYn5wdNmCQ0QmwLRxwRHGzViMgAqFkgW4/xaj5t5IR
	+jqkzmgTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuoHX-00035y-MZ; Thu, 31 Dec 2020 03:05:43 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuoHU-000356-8O
 for linux-mediatek@lists.infradead.org; Thu, 31 Dec 2020 03:05:41 +0000
Received: by mail-io1-xd32.google.com with SMTP id i18so16254380ioa.1
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Dec 2020 19:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Eh0LYyioy3C3UVC9bwYubsDJdeJ6pKMdFF5bTDt6YkI=;
 b=TdwHg7F/YVh3cN8PVMIQ+oWuBWKeEigWj/hFDBYkaxozMfZ7KRhZV8NB24QPpMxZVK
 xP3TNC2izS62C735GRSAXt/qTtQMNg7nBjEHOWTRKP1X5oZMcq3dMRgdbzQrH/TzGBQ+
 SHM5HmfZirh22LlNPpXWW5PHSmqTU1/ts1e8j4qndJlm0ZcHX7mtgmz7VmvebMzPeZ5E
 ftVVCPZJmNM8NzK+7HhYtl/TCiTuP/yl52CogDcqU7OrPzzEDGipEEGYXYxi23MHUGpc
 Q4tu2j8nNkWSBI30ztNyCm8ZY7Uq4FW8S3wpY0Td3GVO1U4XtfLJ+Bu/4Y3gS5VhOuX6
 108w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Eh0LYyioy3C3UVC9bwYubsDJdeJ6pKMdFF5bTDt6YkI=;
 b=KDvV4ggkBrxU5pl4o2nva6CmMTkOt3MelqMJPYMaf4+e5zzze1tw1my2KrhOShEXSY
 SMYpscqLhpPkpiBP/fgZEnbt0FnwfnipjZHI7YESGhsSaM88MZlW2TO1rFRLyghcFCS/
 Ep0PtooagRnQsqW1i/X0qTKmd8CAC5NGZh/W+JXpiOCDu2zGLIQRDdpWlUOLtciTSFjS
 xAMy4ANmeyDZnYqopcDIu95y0Go6VRgVYoHgQjr+vSL/kv6qMez51EoaGikP5VqaiQ7G
 tpY5bz12XGtzLZKF+B0Dvis1Wb9NYWrtFAbBV189JbHc5xFIOmBOnRd650fKJIceJhnn
 4QBA==
X-Gm-Message-State: AOAM533rDclhW7uMiRvPPY6uhtWMbQ2eORITtM7HOz9GwlT13iFIxnW+
 oHt0VehtFSQXjxk+G4SiWNDBMYFT6Mb5eFY2lwNsyA==
X-Google-Smtp-Source: ABdhPJxN3b3LpOts6FmTvL8wbWxbWHHukhWKA4JsuemgJC0/GdUY8dN5ynrejN4PSioTS9QR8vw0smV+ayjN/GeXNak=
X-Received: by 2002:a05:6638:1202:: with SMTP id
 n2mr48302031jas.85.1609383936067; 
 Wed, 30 Dec 2020 19:05:36 -0800 (PST)
MIME-Version: 1.0
References: <20201230154345.639122-1-arnd@kernel.org>
In-Reply-To: <20201230154345.639122-1-arnd@kernel.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 31 Dec 2020 11:05:25 +0800
Message-ID: <CA+Px+wXEjm+yb+8g2qdv8+WUWXJf+MPKpLL7ovS_08f0ch_Wnw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: add MTK_PMIC_WRAP dependency
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_220540_331030_380C3235 
X-CRM114-Status: GOOD (  10.44  )
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
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 30, 2020 at 11:43 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Randconfig builds often show harmless warnings like
>
> WARNING: unmet direct dependencies detected for SND_SOC_MT6359
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && MTK_PMIC_WRAP [=n]
>   Selected by [y]:
>   - SND_SOC_MT8192_MT6359_RT1015_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8192 [=y]
>
> Add a dependency to avoid that.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
