Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613FBC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 05:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PknBuTZr0FbgH0swf5hFiHuXgYTaMvN22ZAv7CpcJ8Y=; b=PYYjdyQiYQp+OgqyEjeVo6lcuo
	h2tdMUNhHKKcbXWNq3qPgprpGG2QCeSNusSz2bJF/mbjSEbef5/JTHqZALCbIBfx+SXRP54RSC6e0
	Ae++EfCQauWlaa4Rf4ft9N8NJ2cPMjXiwoC5lXsV5JB2jqL5Wg/4jpK0Q7NXUqb95ILOg5OtOGFcY
	UhYRMtpfhk0UK1nlycWVL39F1FThyQvxz+w9cvIhsrx9x5LEmf6ftlSA7Gxn7sgpKSvo0FiiwdSxc
	fpUvvQpUUlFq7IDEVbYy8aORYnoWlj6mo3HryUzplzVITJ/AHb5pt91SHllgTFA4d3Q/b0WZJChCM
	rze4AaAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovu9l-0025OF-Qm; Fri, 18 Nov 2022 05:43:17 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovu9i-0025NU-JD
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 05:43:15 +0000
Received: by mail-lf1-x135.google.com with SMTP id j4so6586605lfk.0
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Nov 2022 21:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PknBuTZr0FbgH0swf5hFiHuXgYTaMvN22ZAv7CpcJ8Y=;
        b=Z+j1JGrIcXFWgvLfYoL2pm6aQ8Ilb6U6izVwzYosCWSl+RpUe1YftGgB1bwBbv9SR0
         5k+PdvTBml+yMs2N18073QvPvL9yw3GdDAOZJOppxOVNPrW+XAnLZdkoKxdQoyXQv5xU
         Oi8dYWTr5IWBB1pkQW/7nMlHLlpQZW9Nt/+s52bVpyo5kgAoDAzqjnNX7fYBDn9GU9mg
         4Sp88iHeBfjuM42Z2Dd3/ZqwBCI63QXpmUsu+4G8VCVZD4lkqTEPW0k5TrAqCGLpnKbt
         0syavJCcT22PuWL0m2zFyJbnQ2xZ5qu3FNBYpoFv4pFF6f0Lc3oTC/6VtMRHmJl4dvSA
         6JlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PknBuTZr0FbgH0swf5hFiHuXgYTaMvN22ZAv7CpcJ8Y=;
        b=4+kXsaOC7ZfQ4RIXiPjcb0ZxZWBEei4mW2tae611TI29DFk1Y5zn0BIWsK3UHDth+l
         NTvAZ8E08kwPEv3/CK6fbdLa+z/ABOOybhLeMFy0TIxFnlTwCXWIMnKZoQXuGGe8iu6o
         o762e1cHXVARU3+UNHJcMJe8B6ISr/Z5XapJhQsMzQUMzkW58Z17NG9L8B3B7VoM7Piv
         lSKm4ztfBB/nr2h11GEAes8q2+ZcQOtd3Z8y91H/8+3eSYSl/pmZ5JVMw0yTQOe1drA4
         RsYONZ9oCgp4YzzBcC48DrJIV5SLCFidSALpD7cDulo9bdyEWb2HeqGMr/d8M2Ii1CyC
         kJkw==
X-Gm-Message-State: ANoB5pkgH8IHk+yWT3M1T/DCBTvQ/TiU0qwUx3eo35butMGWLovtB4mi
	Iklvjs2izZl2FfMGXAkfw9oijO7mVNhsaYYWNg==
X-Google-Smtp-Source: AA0mqf4StMWwt3iJHTzVw0CF0Y0XvqTbQVw98z8nfJyQ5d2bNSU0LmbrgYKxcuOfjY4aurPEwf9wV1sJ+zGHmI35kKk=
X-Received: by 2002:a05:6512:3f10:b0:4b1:5463:a55f with SMTP id
 y16-20020a0565123f1000b004b15463a55fmr2172729lfa.215.1668750190785; Thu, 17
 Nov 2022 21:43:10 -0800 (PST)
MIME-Version: 1.0
References: <CGME20221118045326epcas1p408c9e16a58201043c9eb3c99110fab0c@epcas1p4.samsung.com>
 <20221118045242.2770-1-cw9316.lee@samsung.com>
In-Reply-To: <20221118045242.2770-1-cw9316.lee@samsung.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Fri, 18 Nov 2022 13:42:59 +0800
Message-ID: <CAGaU9a_uRWrQfVQjOh_KnfhQJvwkx_0G367t_R3audP0B6nVow@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: ufs-mediatek: Modify the return value
To: Chanwoo Lee <cw9316.lee@samsung.com>
Cc: stanley.chu@mediatek.com, jejb@linux.ibm.com, martin.petersen@oracle.com, 
	matthias.bgg@gmail.com, linux-scsi@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_214314_652915_83525C4C 
X-CRM114-Status: UNSURE (   6.68  )
X-CRM114-Notice: Please train this message.
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

On Fri, Nov 18, 2022 at 12:57 PM Chanwoo Lee <cw9316.lee@samsung.com> wrote:
>
> From: ChanWoo Lee <cw9316.lee@samsung.com>
>
> Change the same as the other code to return bool type.
>   91:   return !!(host->caps & UFS_MTK_CAP_BOOST_CRYPT_ENGINE);
>   98:   return !!(host->caps & UFS_MTK_CAP_VA09_PWR_CTRL);
>   105:  return !!(host->caps & UFS_MTK_CAP_BROKEN_VCC);
>
> Signed-off-by: ChanWoo Lee <cw9316.lee@samsung.com>

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

