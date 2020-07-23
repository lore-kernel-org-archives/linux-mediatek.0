Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43895C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 08:50:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F6B32086A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 08:50:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1Bt9NopI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F6B32086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=piemCWvQSAlDACc2icy+cmvrsSA1T0lyBgHbX98jjgc=; b=1Bt9NopIGoA+nF9Go3K66xGUL
	OMf6NwTvx8XEpK10ASVncWHS8gTZmbhqCK34jf7kvLurvm6NYEHlM7QdvKlKL6l3G5UGQCB8J5B81
	JFCGx73S9pBLs0JaLJZQeSdH0KgjRfAFAwS2Hd9L75POpTD+qoihQygFXKVoz0h05NakZE7tc2Hr1
	krYmMvha4gb7wn3d/KoC/5ExTfPE2kLjN91QGe846u939o7HjU29tGCXcIkeFyGnPVYccvcCYb3LG
	EFQGBU7US+B+2h2FCOjQ2aCEeKNhpYBL0ywSxkqMgJS1wp/sVXxC2fD4h3IVtOUpa0jXemTovDAEk
	VFrhUMpZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyWvz-0007a5-V7; Thu, 23 Jul 2020 08:50:36 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyWvs-0007Wz-HF; Thu, 23 Jul 2020 08:50:29 +0000
Received: from mail-qv1-f41.google.com ([209.85.219.41]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mo73N-1kaNez36Vv-00pch3; Thu, 23 Jul 2020 10:50:26 +0200
Received: by mail-qv1-f41.google.com with SMTP id h18so2257968qvl.3;
 Thu, 23 Jul 2020 01:50:25 -0700 (PDT)
X-Gm-Message-State: AOAM533aFENff6gxVs9jaNAMVib2GMph118qVjSBCZRxMsyK4xllU4Op
 eXUeS/Yg3x7g0mx7cKNcR97Md7cJSv4s+8UZ2Ao=
X-Google-Smtp-Source: ABdhPJx/8iMOoQeuagptb1XxDW3qWIfpAYP9JEOH9O/fasuWg4WHNOHmGUtLnKRpZtu6H/lGAICf6WUPWzlQb7/e0Ec=
X-Received: by 2002:a0c:f802:: with SMTP id r2mr3732657qvn.197.1595494224298; 
 Thu, 23 Jul 2020 01:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200723073744.13400-1-krzk@kernel.org>
 <20200723073744.13400-19-krzk@kernel.org>
In-Reply-To: <20200723073744.13400-19-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 23 Jul 2020 10:50:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1TSTX9ATUuyWyqJ1xtd6GP13JM-RQkhGCi1BSTiM9X9A@mail.gmail.com>
Message-ID: <CAK8P3a1TSTX9ATUuyWyqJ1xtd6GP13JM-RQkhGCi1BSTiM9X9A@mail.gmail.com>
Subject: Re: [PATCH 18/23] memory: mtk-smi: Add argument to function definition
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:mDl7VlfunwXndG8XSS4hTD/GTdfubloRrbdDTFnyCLBBn90N4Rm
 4m1SZks/aUVBBS3HiiaDRKrDNXg+hnP43LEnqq1y1SZYAd4nksbA1Mi4yF5gwpJ72NSgK54
 QS5A0nWiKiYPtY2JOrzTBeo26CsZFHNIx+YpwQBzdOIy/5BzluZZxf+VALmpDRXIKB8t+Ve
 D0oGeRU0/eydN6G9JTcJA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HUVquBbZIaE=:zzU5oDeoR3A18S23y4ZJwN
 xYwrYM8CYaWKOQ7GO3Y/VBaE9RtXBpKr/ZkiqBdl30+jAIsPYGzjui5McqCdJ1SdkK296WbSa
 QNnfyVQBYYGWXMuKcZb8KwxNgX+f/6Fn2yT49Q/zsE2WtYq+vUAKJrBeWO2Q546Ogevq+/dC8
 6ykcszhdOK8BwM2Rjg4jLH8NVrlrBL0Ot3axOlOTQvYZvSBA9NhFNrF8lbvJ5d4CP5gLPElzB
 l+6lkqHZx5PzKFPJYpOI1TU3kBucWtAWbfvcQj2mZHrj0uwhSVv4u9ow6xc84JKg4LxqFx/GE
 WxuK242DKaPKV3/CceBxgywslXH6oidhkAGJQxSEQWRaQFvr9Rb7xsPln8rVKqBCqgpHfq1MX
 WB8yDf8jgpyF0fSgtuWc9wlCjnReexyuhKi4o2pYOUC/AzX0x6lm/Odlr75hfd0p3Nllz3VPF
 Jxiptpg0G0VPYifmoWABK8A2x8kXhu3jLZ1KuUz8sdPFCuJ0Yb82KzBymu3bbWFb9Z6RRRtz9
 zGJ0XxWYhydwoCdpvaRtAxUWOxj4Mi8JfuPZUmK6xFmmIzXAaJ7/ZolND8f/dPidpYuXl4iio
 4L+AdM9Xc9l1vqVReBj83dVdNjyRkqxEMYCtJVZVRBU/79zby9Ywy4fjgLRcFZrtBSVQtx77Z
 vxYHel7RZdv6G5lpVBl6hboZgwMH8rFwxJ57USCxWqMdmD836DPjIT2z70rpfNffa6ZFHouHr
 94UMNL5sKLnzCFR7aw4ptRwi7A5xTqq+08OqGN76IZudcfulwRHIFXkNk2ZjacWgCJ0G1o6AL
 2VxrjGG2SDQp8klYkk3IRy0eqt+5AIdS3nTDau+22aukt9cUt2cUnT+uPly/CEMnTWlLwI7TD
 dbUzNqOLG+oy4AV0R/HA86J/6CTPGjJhjo/YiTCunuqytIUfdmJNhkCsZZt9IQaxCbnSy7zf0
 ne4RAbYSOLAZEoUu7cVjzZP5GJpIEzV9jgykgwnwKIiQYcguEyLr7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_045029_024905_48534AD5 
X-CRM114-Status: GOOD (  19.13  )
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
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Markus Mayer <mmayer@broadcom.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Olof Johansson <olof@lixom.net>, Thierry Reding <thierry.reding@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Fix checkpatch warning:
>     WARNING: function definition argument 'struct device *' should also have an identifier name
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Is this a bug in checkpatch? I don't see why it should warn about this,
as there is no function definition here.

Your change is clearly harmless, but I wonder if we should fix
checkpatch instead.

      Arnd

> ---
>  drivers/memory/mtk-smi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index 109c7e51d551..c21262502581 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -60,7 +60,7 @@ struct mtk_smi_common_plat {
>
>  struct mtk_smi_larb_gen {
>         int port_in_larb[MTK_LARB_NR_MAX + 1];
> -       void (*config_port)(struct device *);
> +       void (*config_port)(struct device *dev);
>         unsigned int                    larb_direct_to_common_mask;
>         bool                            has_gals;
>  };
> --
> 2.17.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
