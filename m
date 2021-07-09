Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D80C07E99
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 10:24:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39648600D1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 10:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39648600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3mYc5ZJMpshaGnipvBOB3B9ezc/1aMziSmKYfnfn+k=; b=OH5h4jiFdo2uga
	nW1VIZTx5dTq8LDZhmLU/aVLYXrGczyy7uV+Y9KntGwadfSC056G9JCNn0E1tO7QfPY7LAr7hLxKF
	x5NK0oV+C6xX0zNECDlWlKgNSeD8J3cpyD6vujMn9OMHZcoutTQabFonaCcgBkxg+bn2oXuxczSpL
	HKSxMTuL21amLdWB1r6Phml0D9WLifnqj+Mu+Jl/tq5NDLevbqOpMCWCEh756O/6DZ7lP8icHEbou
	CD5phtzAJpugPgaytA8OmMU5SYn6m4GjvJ8f1awOk/cUvEcnaTyAdyA3c53xsHGbFcBkw4vsBSnu2
	3velOumjrWdD/hcxD+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1ng9-001UnE-K1; Fri, 09 Jul 2021 10:24:17 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1ng5-001UlQ-PK
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 10:24:15 +0000
Received: by mail-oi1-x231.google.com with SMTP id u66so5830487oif.13
 for <linux-mediatek@lists.infradead.org>; Fri, 09 Jul 2021 03:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LrFysvGtZpqXVqpBVFoh0317yBisoNGnai+6UrvUk7k=;
 b=TH32T0AvvOADtM+gmhIZoLk/+/VEDgzB5+2M0dUWVpSlBWUGlcOaz0BiLzu9BEvsI+
 Wl3Ao7p2GuOroM7UgOJtOTW/Nrwu0d12j/xKbLQrT9HNu0oCj2PsRAH6kg9nA/4D1yRq
 jxtGLz58Ov6MihaI1QaS8RgtshCmSicenMxWvy4G6ArIxwlL2fRM2NYNfluSsDBfFU35
 hV5Lqt9gMApLQccW3XUIEmRS7e9METSeTqQ33tUz5Mh7JVlvDODuEU0z0aa+Mu28EfSQ
 IsilitjiyfVYBBHAn8g/Pv19QG/EupZX7p9md9W2Ot7f9uJz4JgIWCi1uonZ0ZALvKHw
 yaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LrFysvGtZpqXVqpBVFoh0317yBisoNGnai+6UrvUk7k=;
 b=K1tasj6mEKG5QTJmuMFY+NaSw0E/BgaszD2wBkPecewU0q7KI/kJpKu7MZX9uJHrgx
 Mahhk+m1kT87TPiuuiBsQ8MT4nFeWstACuo3/ZiiTAvIHDCLzMwbyKHf8LHugtcBd4fP
 BwSd9U3kfGkXzEredO68zOe1boTZyzmJXpLBXs2Y/5VNQCJqUGQaGk6gPizYJiu31rFe
 Px1rJIt+u1eMQvHrL3Qgcz/KWxpfm25YRIHZZA5Ad7DOsNxFvfohjhQshOmYSDyfJz0p
 GnMe+yKYSgq6Aj7DTmqnxMvMmK2YExeSOm5dTVrm7H70Y+/rJB1uejbY34G9Aqm2aDhY
 lcgQ==
X-Gm-Message-State: AOAM5307Y8kvhZqi+NSyLxMSMptTKtzsJpj5JJ8OsEYJnHOwnkasqNmV
 XPzfND2XI5iANFyOt2qnMkMr9ljzZd9wOZmnBlA=
X-Google-Smtp-Source: ABdhPJxayM4pdC8nMdAa1QJHD34ol8ekXE74iF0w0jDTquH5U6cu1w+75WuKowH+FhvxWQKWfZclSxqZJROIrKg+E2E=
X-Received: by 2002:aca:cf82:: with SMTP id f124mr20633162oig.47.1625826251840; 
 Fri, 09 Jul 2021 03:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
 <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
 <trinity-3f4f4b55-7e39-4d80-8fc3-7d0e2b3026de-1625758259993@3c-app-gmx-bap19>
 <trinity-fd86a04e-81b6-45f0-8ab4-5c21655bdf53-1625824929532@3c-app-gmx-bap43>
In-Reply-To: <trinity-fd86a04e-81b6-45f0-8ab4-5c21655bdf53-1625824929532@3c-app-gmx-bap43>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 9 Jul 2021 12:24:00 +0200
Message-ID: <CAFqH_52OdB+H+yLh-b8ndbS_w3uwFyQEkZ-y2RQ2RnKnMEt6vQ@mail.gmail.com>
Subject: Re: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
To: Frank Wunderlich <frank-w@public-files.de>
Cc: CK Hu <ck.hu@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 chunkuang Hu <chunkuang.hu@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Collabora Kernel ML <kernel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_032413_922469_7236D7DE 
X-CRM114-Status: GOOD (  15.30  )
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

Hi Frank,

Missatge de Frank Wunderlich <frank-w@public-files.de> del dia dv., 9
de jul. 2021 a les 12:02:
>
> Hi,
>
> i've found it :)
>
> hdmi-problem is caused by
>
> commit 440147639ac79f699a4eb9811d0bc39d3cc815f4
> Author: CK Hu <ck.hu@mediatek.com>
> Date:   Wed Mar 17 19:17:10 2021 +0100
>
>     soc: mediatek: mmsys: Use an array for setting the routing registers
>
> but i cannot revert it alone, but after reverting all mmsys-patches hdmi works (ovl irq-handler called)
>

If this is the offending commit, could you try if the following patch
fixes the issue for you?

https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.13-next/fixes&id=db39994e0bd852c6612a9709e63c09b98b161e00

If not, and that patch is the offending commit, it probably means that
the default routing table doesn't work for mt7623. Needs a specific
soc table.

Thanks,
  Enric.

> $ git logone v5.12..v5.13-rc1 -- drivers/ | grep 'mtk\|mediatek' | grep mmsys
> 060f7875bd23 2021-04-05 soc: mediatek: mmsys: Add support for MT8167 SoC
> 1ff1270fca33 2021-03-30 soc: mediatek: mmsys: Add mt8183 mmsys routing table
> 440147639ac7 2021-03-17 soc: mediatek: mmsys: Use an array for setting the routing registers
> ce15e7faa2fc 2021-03-17 soc: mediatek: mmsys: Create struct mtk_mmsys to store context data
>
> git revert 060f7875bd23 1ff1270fca33 440147639ac7 ce15e7faa2fc
>
> and after reapplying them one-by-one it stops working on commit above (440147639ac7)
>
> @Dafna can you confirm it solves your issue too?
>
> btw. watchdog issue is caused by
>
> commit bbece05c0d3a96817483e0b249ad1e302ba95117
> watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem
>
> have already contacted author
>
> regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
