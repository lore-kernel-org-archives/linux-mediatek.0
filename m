Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC28C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 11:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qv2xqj88bLfmGhFzgIRj0ulACWJDYH6tYfKHarHAy30=; b=Acxo57vMXPYz/7r05f0ts1wiQD
	WK5bAUxkJPr+KniwMY3v7eJHjpGDqHnFGbSgAZCbYQjvxAJ+nQ42LmDLcTJB2PSYGQPy+Jd6XPD02
	+dZwXvocrG2U6MTXTawNN748md9cc25tFfmmVPvKk42XmSs9Kt9hsCXb9oqAkr9BafyAbXmr0ZqC2
	usvZaFAzLUMV3mrhX3NEkcy8vfPmmMiOMWsPN9aRsNNcGSnDjgM47s8ScTRurF0FtXpTPn05UWB+W
	whLRehTWoe9fnqAleF8lcBiqob8G57mEDNqUHTfpzM3YPnV+/mCZnkbQTwOH93sdW/+szmQK0NMQs
	9ib+vJww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odVIr-00Fy3g-EN; Wed, 28 Sep 2022 11:32:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odVIn-00Fy28-J9
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 11:32:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 06F8361E43
	for <linux-mediatek@lists.infradead.org>; Wed, 28 Sep 2022 11:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E98FC433C1
	for <linux-mediatek@lists.infradead.org>; Wed, 28 Sep 2022 11:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664364752;
	bh=hmfMTP0WcsGd/PnHLjljXy2GA3CuNA1ShavDDK3vWQs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Mu8CWMQKRe2mXEOGhc1mVcS0IPL+KSrTKPwLj1HSZ2NnX3agySZJhXFAEOVdQqVoC
	 iwu3/4sjEZSj9LN3oItYTq0i3EnyWemCPCMGHmW1EJHl5wdCLCxCm1rwLAxygEb1HH
	 TlDVsLY7/XkOysP/dM9pfxjf408+AeyfQEgZ2WRWfr8YUKbQMrP9qwMDH2R+5Hv4Ta
	 TFH641ueON32vlxB9zaa3di854MbK2KrNkJkCHAJj6GlsyaFbTUURcl6egkLfNKrUm
	 OVPPmZNUOT3OaP7e7BsRk0vazY2DlsELvFqLJPbJumAr9yX6jMnoql3/95E5ckUH3O
	 4nbkoBmAXlZ+w==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-131b21245f1so756045fac.0
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Sep 2022 04:32:32 -0700 (PDT)
X-Gm-Message-State: ACrzQf0nz6Z9zcNdoF95ATnkyW3vi/UuXAKsUVKCaZg3Q2wjKX3ljiXx
	G/FC+YXzUCANRM0HkR1ILivzrBUa8xesT51bOxw=
X-Google-Smtp-Source: AMsMyM49wrkAH4OUkQTE8tyai+0kbdp8Q3E1zaXzaVKfUNsAh15pGpa/MU0+76igKoVhHvBh/79KYLP8UiA8/Nb3O5Q=
X-Received: by 2002:a05:6870:1d3:b0:127:15ba:ae17 with SMTP id
 n19-20020a05687001d300b0012715baae17mr5171959oad.267.1664364751570; Wed, 28
 Sep 2022 04:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <2b80ff37225b13669d1aa4af81070a1665499d78.camel@mediatek.com>
In-Reply-To: <2b80ff37225b13669d1aa4af81070a1665499d78.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 28 Sep 2022 07:32:20 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4a8D5UEBinNOy1R51amLZhX8gJy_-1x4MzVTJq3xsv0g@mail.gmail.com>
Message-ID: <CA+5PVA4a8D5UEBinNOy1R51amLZhX8gJy_-1x4MzVTJq3xsv0g@mail.gmail.com>
Subject: Re: [PULL linux-firmware] Update mediatek mt8195 SCP firmware
To: =?UTF-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	=?UTF-8?B?TWFjcm9zcyBDaGVuICjpmbPos6Lnoqkp?= <macross.chen@mediatek.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?SnVzdGluIFllaCAo6JGJ6Iux6IyCKQ==?= <Justin.Yeh@mediatek.com>, 
	=?UTF-8?B?UmFuZHkgV3UgKOWQs+afj+aouSk=?= <Randy.Wu@mediatek.com>, 
	=?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_043233_694361_8EC78C44 
X-CRM114-Status: GOOD (  20.45  )
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

On Wed, Sep 28, 2022 at 2:29 AM TingHan Shen (=E6=B2=88=E5=BB=B7=E7=BF=B0)
<TingHan.Shen@mediatek.com> wrote:
>
> Hi maintainers,
>
> This pull request updates MT8195 SCP firmware.
>
> If there is any problem, please let me know.
> Thank you.
>
> Best regards,
> TingHan
>
> --
>
> The following changes since commit 0958301bde97756f34b67fdd25526e6cc88cdb=
41:
>
>   Merge branch 'mtk-20220915' of https://github.com/tinghan-shen/linux_fw=
_scp (2022-09-27 13:23:42 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/tinghan-shen/linux_fw_scp mtk-20220928
>
> for you to fetch changes up to 375d4500d315ff20c59911d12d86b477d4979b1d:
>
>   mediatek: mt8195: Update scp.img to v2.0.11956 (2022-09-28 14:03:24 +08=
00)
>
> ----------------------------------------------------------------
> Tinghan Shen (1):
>       mediatek: mt8195: Update scp.img to v2.0.11956

Pulled and pushed out.

josh

>
>  WHENCE                  |   2 +-
>  mediatek/mt8195/scp.img | Bin 429820 -> 429920 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)

