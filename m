Return-Path: <SRS0=+cmX=FW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E60C4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 19:05:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0332323B83
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 19:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0332323B83
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uEYS6N7S+/uM6ICzGZ1n7FmQXBufb+anhmORWphjd94=; b=iMdx8Ijw+Swl5+pxEENdZJmzN
	3SkDgs5/kFx2UrYjBqNpheXB7o4RMnkei2L0OF4vNCe3bH3fbvnUmfphL9JS9zcmfXHFUTTzBKZRa
	lq5cEFdoVZ0oYVYoslLYlzuPWCXioA6BzvgSnwdCJbZWmbeFL9Ri64v1CdLuGONL8xnTT4gDXwW47
	+MtJSzEXrJ1AnFMkk4Q6qlaRRPB/1qpptv5JoTkYOdmlxiHbEP5BOYzWXkRJ7r56sC/c4hW+R2tlZ
	LyZ9GBD+ZTzkLndWx6G7w5dc6dORgriItjAOnJ/OAeee6Mqbvg48b/PM99GBRwZfnnaQU9Ve02jqX
	AF1A6TO8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqL3y-0003gg-2L; Fri, 18 Dec 2020 19:05:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqL3q-0003db-5d; Fri, 18 Dec 2020 19:05:07 +0000
X-Gm-Message-State: AOAM53357Q139DIWmrq++NyJa6BPLpoU08s53ee5uustwBQw76MeYTCN
 9ndBDDYNJ6bQ+LCWPRJkSCSOSf07vIP+TAqLSNo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608318305;
 bh=Iy9SxT9GUgDVreOu6zjvcsB3rpscn1polhAKsk1D3wg=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=PJGETP9kmgBA2o/eATgmpNP2kSt5miLy+Z1icBWVDLUjSGgByphBbRBUX7fUuTKp4
 IKi5DQjyJmNeiAs8+Dh87z2StCjNlsACKmyll94unkRFWjKfLcXz2FnNCAz/KZJ4hf
 P1wJ8MmBdZg0IgfO783LVIl76oMJkU//qZQtKmgKAd6+UIMZ3QVWkHb7m2S2CUuv1+
 8MvlPnavWBGCYmYn/tS5RqoEXTNZJTCENOH7smQ5PDeLYjupm++fEYVL3Ut1uIoknX
 pJ+XCIcC0/jsRIlU0qji2UE38gvR9HbzaSutrFBhBNRGGDbPWYOWSk6SeElfc5e6UN
 0xT70IgJkm8xw==
X-Google-Smtp-Source: ABdhPJxydTxCqfcBipo/PZmwdFGfpsxY9gx6p/51yBH1IZmj1w15XC1V8poFK2kOI3nEKGhTwc8glj8v/uLPlNroU7E=
X-Received: by 2002:a05:6602:2dcf:: with SMTP id
 l15mr5016416iow.120.1608318304839; 
 Fri, 18 Dec 2020 11:05:04 -0800 (PST)
MIME-Version: 1.0
References: <20201210020740.21467-1-irui.wang@mediatek.com>
In-Reply-To: <20201210020740.21467-1-irui.wang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 18 Dec 2020 14:04:53 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6O1QesF_1LWktM-+VE+yOYDjt-VU1Bkc8O=p=qqORwWg@mail.gmail.com>
Message-ID: <CA+5PVA6O1QesF_1LWktM-+VE+yOYDjt-VU1Bkc8O=p=qqORwWg@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Update Mediatek MT8173 VPU firmware
To: Irui Wang <irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_140506_377135_2EB780AB 
X-CRM114-Status: GOOD (  13.92  )
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
List-Id: <linux-firmware.lore.kernel.org>
Cc: Andrew-CT.Chen@mediatek.com, Maoguang Meng <Maoguang.Meng@mediatek.com>,
 srv_heupstream@mediatek.com, Yunfei Dong <Yunfei.Dong@mediatek.com>,
 Erin Lo <erin.lo@mediatek.com>, Longfei Wang <Longfei.Wang@mediatek.com>,
 Linux Firmware <linux-firmware@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, PoChun.Lin@mediatek.com,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Pulled and pushed out.

josh

On Wed, Dec 9, 2020 at 9:07 PM Irui Wang <irui.wang@mediatek.com> wrote:
>
> Hi linux-firmware maintainers,
>
> The following changes since commit 7455a36066741a6e52fba65e04f6451b4cdfd9c4:
>
>   Merge branch 'guc_v49' of git://anongit.freedesktop.org/drm/drm-firmware into main (2020-11-30 09:26:11 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/irui-wang/linux_fw_vpu_v1.1.6.git v1.1.6
>
> for you to fetch changes up to 0fe0fe022b7f88f581254487b1d1768df1b218bb:
>
>   mediatek: update MT8173 VPU firmware to v1.1.6 (2020-12-10 09:38:07 +0800)
>
> ----------------------------------------------------------------
> Irui Wang (1):
>       mediatek: update MT8173 VPU firmware to v1.1.6
>
>  mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
>  mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131180 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
