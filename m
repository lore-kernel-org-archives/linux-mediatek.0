Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299AEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 18:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQKuRO8pVpyPQxkPVTTZY0y9uKoz66y5KrOZ8EWn98E=; b=raBT5ItXo17+53
	Fx1l2X7bvG8Tee3Lq9VX5PdPEughxQh0XOYmotaDYzZ8nz7rBXJ+AGolj496rH7EsFkN2dpV07Lsa
	o2aQx3kGb/ZlNwHM+Sz7jSE6wJdCwcqw/bSnivIpD/pt9DYO5ZMz8RQk7a77drRVxjHukWVIGswjF
	iYiXk6HP1owvPRh21TSOnQt9QfV2t585GB8kn3huX0sQ8BpIVF3syY3rajOy3AMStKuQ4uzyY3gU8
	/wkDWrDcxEIcyd7UFA/TJlNWZu/wNVn9UsFZPbL6a89KlP+juYvOm5Sp5tpLpBdoySjG7GkjKQeuM
	L2AhJPZH/OpmjKY4cv8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no7l2-00Fjwy-UH; Mon, 09 May 2022 18:05:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no7gF-00Fgzt-OY
 for linux-mediatek@lists.infradead.org; Mon, 09 May 2022 18:00:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5731CB818D3
 for <linux-mediatek@lists.infradead.org>; Mon,  9 May 2022 18:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200EDC385B4
 for <linux-mediatek@lists.infradead.org>; Mon,  9 May 2022 18:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652119221;
 bh=cZuHMZkRe/rKUZyjjIE0peHawxxhnDN3YLyAGVjsIxY=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=izTetdhA0d91JTkvFAb34Yl3+4MY1GbbHt1HjgE5st2+Lk+vA0V9iIJ8TjWAn/fdf
 a2pRCQPCDcjb1WNnUbVfGVDdG37iUhfycTaX2KgyWcbWVyG64sh6STOIDC+REPYe7w
 bmKQu6OuiZLHfE8fx6EqYZS/v5W+x5FR2j+m9b6r+vkBgDBMj9V8gTutjWBRgXIh4e
 5OEGysFzkVn/0VG8ZtLeJaOPTkCptEMiDv8Q/xyWppb0UDTB90tdKyEYpjMtVtevtv
 mLdvaTbCea12Hq3oRU5Aa/C2HIv6QGxfUHimlPx3xCy4/0tFSKpaHW0FCpUq7LpALQ
 RnMnQlY7g8dQQ==
Received: by mail-io1-f43.google.com with SMTP id f4so16186383iov.2
 for <linux-mediatek@lists.infradead.org>; Mon, 09 May 2022 11:00:21 -0700 (PDT)
X-Gm-Message-State: AOAM532waanR6WaeBtx7+67uOC/OYTkfeekN5tgAnlG5RCjQcPli+kWC
 HHmRNjr3hZul/5RMGo5bEmG3VeIfmyraIJ02VeE=
X-Google-Smtp-Source: ABdhPJzbtkmlimFVD5p86As7rTvM8yguVhRJ+JqiScVfM3LhTW8V4sPgPuzuwp0WuSediSFDEeDcSCgNlbh7PAxRK9g=
X-Received: by 2002:a5e:821a:0:b0:657:c59f:898c with SMTP id
 l26-20020a5e821a000000b00657c59f898cmr6945799iom.209.1652119220296; Mon, 09
 May 2022 11:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <4a46f800702c33bd9c2b0c2069179572a3eb1044.camel@mediatek.com>
In-Reply-To: <4a46f800702c33bd9c2b0c2069179572a3eb1044.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 9 May 2022 14:00:09 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6yF8_MPEqN5tyxGnHkQU4E0QK3X_JSEVvcVCmnUa6-7A@mail.gmail.com>
Message-ID: <CA+5PVA6yF8_MPEqN5tyxGnHkQU4E0QK3X_JSEVvcVCmnUa6-7A@mail.gmail.com>
Subject: Re: [PULL] mediatek: Update mt8183 firmware
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Rong Chang <rongchang@google.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Shawn Ku <shawnku@google.com>,
 hsinyi@google.com, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_110023_988744_44ED901C 
X-CRM114-Status: GOOD (  19.04  )
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

On Mon, May 9, 2022 at 4:04 AM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
>
> Hi linux-firmware maintainers,
>
> Update the MediaTek mt8183 firmware is to v2.0.2745.
>
>
> Thanks,
> TingHan
>
> ---
>
> The following changes since commit d4b75516c46b22d17b8654c65f2ea2730875bf14:
>
>   Merge branch 'dg2_dmc_v2.06_rebase' of git://anongit.freedesktop.org/drm/drm-firmware into main
> (2022-05-03 08:20:28 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/tinghan-shen/linux_fw_scp 8183-v2.0.2745

Pulled and pushed out.

josh

>
> for you to fetch changes up to bdc8ff9f974d541c296212f208ac23bdbdd076d1:
>
>   mediatek: Update mt8183 SCP firmware (2022-05-09 14:54:43 +0800)
>
> ----------------------------------------------------------------
> Tinghan Shen (1):
>       mediatek: Update mt8183 SCP firmware
>
>  WHENCE                  |   2 +-
>  mediatek/mt8183/scp.img | Bin 1027104 -> 1032064 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
