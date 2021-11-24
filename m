Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7EDC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Nov 2021 19:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tafXwcUptuE3VpzUPaHC/3J1gbxb5CS9BqtLiOVJlZg=; b=YqlK2xPjGEEMQV
	BcmBwONPY8EVnXF0PvTKiBNtxypdNW2RzplkyLLegBKi3Sv3HjUBXcu1iVUaoU9fCECknAwSt09dg
	HyfafbR09Y4pDk/OHQsOT0f/rE2VyedOTQmJBuveOZGAWtjcnqB4hHz+E56jx4DSvUGtvnqhZpTJX
	Ls/TYbHxR3l0qO2E6VSrtu92NljDwPlFuUgJ5QPhcmEY1fGTt9CJgtuem9M5MiNRbamYo5Y1uFSyX
	ZytQtDLp994QfPnfrg3RcJd/6TxRbR9f51DBYUkLOrTTppW3qXJuOW+GnnZM+v5otH89dU2q4FW41
	LkDyv+4Osvv8xURZ1EWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpxqd-005e5P-IK; Wed, 24 Nov 2021 19:22:27 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpxqM-005dvE-4e; Wed, 24 Nov 2021 19:22:11 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MA4ja-1mw3in1nh4-00Begy; Wed, 24 Nov 2021 20:22:07 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso6394865wms.2; 
 Wed, 24 Nov 2021 11:22:07 -0800 (PST)
X-Gm-Message-State: AOAM530cAHdbvZxC0beBtaGpNoOEFDJbuS6C6xeiGuFPe2NHCdEImYkq
 naHrOSYjIpXVozCS6doFSimfzQVRMTClz+zvbh0=
X-Google-Smtp-Source: ABdhPJyA967xXsVVOdLJdkVj5zYgmz3qs3/FxEAJIV2nNiYoRheYa4DjM+GWWKPY+38aCDJUPzvYqT2XNbgtE7c9kMM=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr17497596wmi.173.1637781726785; 
 Wed, 24 Nov 2021 11:22:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
 <63ecb865c4f2b81862f5e6ac0dea497d3e0baca3.1637781097.git.mchehab+huawei@kernel.org>
In-Reply-To: <63ecb865c4f2b81862f5e6ac0dea497d3e0baca3.1637781097.git.mchehab+huawei@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 24 Nov 2021 20:21:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2ez6nEw4d+Mqa3XXAz0RFTZHunqqRj6sCt7Y_Eqqs0rw@mail.gmail.com>
Message-ID: <CAK8P3a2ez6nEw4d+Mqa3XXAz0RFTZHunqqRj6sCt7Y_Eqqs0rw@mail.gmail.com>
Subject: Re: [PATCH 18/20] media: mtk-mdp: address a clang warning
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linuxarm <linuxarm@huawei.com>,
 Mauro Carvalho Chehab <mauro.chehab@huawei.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 llvm@lists.linux.dev
X-Provags-ID: V03:K1:ifwD+Y/1SSWxVMgnnMiM5zzD4C4pdDThsFYZQDxFc6A6yyKehag
 LBA8dQRo+YNfWs93wQd18inMUTmPKWinrNwjuZXuyzzzlseX0SKaZA1tINMdneEqeRhA6Yn
 YZXk4rlC/UVE5wMCjEakARQLGmjrC8+J1EFqbrwMcNkVUQQcxtE5i3nuhO07drUXakFQOQs
 o8m7WzvHi/r2hvewb/QJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5uRkG9OWEbM=:6jfJWlUBY4j63T1Y4EywM8
 prH/54a7iaZD9sLKModJLe7YjgUsvF2S4oIbXKQc7S1juOVLHXotngPaQFn7b6o5+mf+d1GN+
 svJnLXRdzgIvzzwxr42fSfg1QG0cp4zAJkaMOOFlx1XteENokAW170zzA/1UdloHF2/KqtFIM
 jkkdsQHG5bK17Y+PqC4CWNhO4O6UFr9PrSCyudBspR1OD5rDlrMpeJKtHEDkALu5WwUeR/1y7
 53uvA/gKkN7S9OOXFxugO4+ER65LgR7X+K1/JiGjUQfwpO1UiXzgUOTtWcpsQEdxbTQ1RZ4qP
 J4HOQoz9+SdohKSekGGEq/s6TvZlfLPtn/cOpNiGXbsPWNy0fxJiVm1KqDq1oxVLxmZwLz0c4
 6c3SAAdk3PPh2ill4jMHsbjcJWEnp2GzvwAJFSnuTsQUIpek6d6Wd4Hoqz09MCEUOLVCKZ4KD
 7o8ld6JiCHTqJUOdThuB7SzTZnJZwLRghUGIiVChy3cxBe9YE3DOMmJgf4VHkJraGU2Bbspw1
 JnB1oo1cRTA/1qDwfXRVUkZED5N+1FQfh9TV1oob3Bh5rJu0l2pVFmdsriI+mwmYulH08fXiB
 55h3+x1xlTZ1LFjWCOwy7qgzMv0f5WVdMqlP1ZVctNpYVuHL9V4BuTbtmbvHoOVCprIry4vPZ
 6ltwPs6evkozrBTFniJQ4U6chWFuCslQurCH0Q9YHkuOiWCYC4K5iy+t0o/XI0BcXwHveybwS
 663x6NbeH7oEir9hRvbAVBpombYHfZx7J0sFwDuh6UY92mAkbzIaO5I9bRTC1wEotGjH3nC8o
 YeAtrtZ4VANuYE+HTkVxgacmxMvwGcYqksaKMdbsgCmwJOm4mY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_112210_501004_48EE540C 
X-CRM114-Status: GOOD (  13.78  )
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

On Wed, Nov 24, 2021 at 8:13 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> The typecasts at the dvb-core generate clang warnings when W=1
> is enabled.
>
> Such warning is harmless, but it causes the build to break with
> CONFIG_WERROR and W=1 with clang, so do the cast on a way that
> it won't produce warnings anymore.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

>
> -               comp_type = (enum mtk_mdp_comp_type)of_id->data;
> +               comp_type = (long)of_id->data;

I would generally use (uintptr_t) for this purpose, but the effect is the same.

        Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
