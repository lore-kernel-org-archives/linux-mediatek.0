Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48B0C43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 09:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kx0jr6iQJBdI7n19m8fhu/gw5LbN1tE/Li1THtvucI=; b=m7Lxv5qy1J6G6teB9bjj+mIpIc
	G8HRFyaYsModrRGGvnqHRXlWaUxK8JNH1/vy/MVakQq4w90BedTT2mACSasqT7E0DnZ0YKKfHD09E
	Nv/51isSusk8EiU5oos9E0VpovFyQIJA6RZ3XXfsm+DWmO21vZMEayZhoryWFAEeUU+OmyEQVRpTg
	Cs/jCuwuIEB3LhW1OtEdR6ekpeihlZd8u8L0aQdXcH9PNXEMaY0ZZ07txrJjoxxfUgA0KMtWJsCLW
	gLyV8xIlGNlTvV/s1S5xicl3HC6ucJlvWVFzf1vRCfO/0n9WqUaeHqE+iZgW1laZZLmEN6tNQ1NB6
	ZG2p1mQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gK0-006WGg-2V; Thu, 01 Dec 2022 09:57:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gJo-006WAZ-1k
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 09:57:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso3460121wme.5
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 01:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1kx0jr6iQJBdI7n19m8fhu/gw5LbN1tE/Li1THtvucI=;
        b=KEKMHsEb3yFB2gFZmV6K9MRknX/7TQp8PLqjSDztCIcOZmjK44ShfAtpydvOKHciza
         LOOZWO4k7ZESZSSOOmpyFlTekAHYODH8gkS4EB8j4Ddz3JrwUFW9Tb1KLmJNXV/j3rVL
         Sd1EC3kZG/mRFsIF7il3jAJ93BvMwipxG2nbW3xW9TU614kqsmkXhVswBHMLhl4cAq2T
         CQtcdrDx8btPeUyvtUckJvE0xhkjpZaAH96+TluFpet/yEqQbVhad39RkBOJkfX4Uv2C
         MbzoUBhTMvq97GMPYwOpRAdw8knSUbLbZv6vnvtWkYEOuYGJupSVgpSI4Vi2FkLRIIMw
         czdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kx0jr6iQJBdI7n19m8fhu/gw5LbN1tE/Li1THtvucI=;
        b=n/NPMAGzUyCU3VTa7qtq2fNtilqL9Ojf3jXPgk8byEhMyRhoRcQh4opI2J6vEDjdoa
         7D9yK5tNrRGccGbs+d0u3YUEozMZn26n1aNJ3rF6T2ElzXK6LiQf17cLz8OFloCI5rVa
         ELeyPoiMoIxmR85Xb0szra2/XndNMI++dpKWPHPLLsr41D6rG8/OgNA6wV27Fd0IemBr
         UhgwFRW9FwiMteh0Yt3zqNDTbWYTK3AXYZVhzckLoz5iZhxi14tlAQwyqwuD7CAdOhtg
         d6w8ku2AHvLxG02vL5mB9eorpXTbWmSQpKQ4i8BqI0xcrFB7YWj1uEuV7xtBl09eJ5CD
         RYiw==
X-Gm-Message-State: ANoB5pkU6jnnU0dNCjiZ1xtYY0/ZxV60C/QKKk4u2rL9Ey7MZkcHKvxt
	1Q6Nf3h+uIL7g/B2BortgOLN/PngjuES88Bjf35Qjg==
X-Google-Smtp-Source: AA0mqf4RQuT3o5dVODYuifcFa7oAG27rTPoh0EMVG7YVp4qUfFAgO9EocfzkH2534iz0neovTigMa97nRDMKlUjfjG4=
X-Received: by 2002:a05:600c:4f05:b0:3d0:3d33:a629 with SMTP id
 l5-20020a05600c4f0500b003d03d33a629mr24471844wmq.126.1669888641094; Thu, 01
 Dec 2022 01:57:21 -0800 (PST)
MIME-Version: 1.0
References: <20221124074725.74325-1-haozhe.chang@mediatek.com>
In-Reply-To: <20221124074725.74325-1-haozhe.chang@mediatek.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Thu, 1 Dec 2022 10:56:45 +0100
Message-ID: <CAMZdPi9JOQpmhQepBMeG5jzncP8t5mp68O2nfSOFUUZ9e_fDsQ@mail.gmail.com>
Subject: Re: [PATCH v5] wwan: core: Support slicing in port TX flow of WWAN subsystem
To: haozhe.chang@mediatek.com
Cc: M Chetan Kumar <m.chetan.kumar@intel.com>, Intel Corporation <linuxwwan@intel.com>, 
	Sergey Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Stephan Gerhold <stephan@gerhold.net>, 
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, 
	Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>, Liu Haijun <haijun.liu@mediatek.com>, 
	Ricardo Martinez <ricardo.martinez@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Oliver Neukum <oneukum@suse.com>, Shang XiaoJing <shangxiaojing@huawei.com>, 
	"open list:INTEL WWAN IOSM DRIVER" <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:REMOTE PROCESSOR MESSAGING (RPMSG) WWAN CONTROL..." <linux-remoteproc@vger.kernel.org>, 
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, lambert.wang@mediatek.com, 
	xiayu.zhang@mediatek.com, hua.yang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_015724_095744_9DAA1D88 
X-CRM114-Status: GOOD (  11.90  )
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

On Thu, 24 Nov 2022 at 08:47, <haozhe.chang@mediatek.com> wrote:
>
> From: haozhe chang <haozhe.chang@mediatek.com>
>
> wwan_port_fops_write inputs the SKB parameter to the TX callback of
> the WWAN device driver. However, the WWAN device (e.g., t7xx) may
> have an MTU less than the size of SKB, causing the TX buffer to be
> sliced and copied once more in the WWAN device driver.
>
> This patch implements the slicing in the WWAN subsystem and gives
> the WWAN devices driver the option to slice(by frag_len) or not. By
> doing so, the additional memory copy is reduced.
>
> Meanwhile, this patch gives WWAN devices driver the option to reserve
> headroom in fragments for the device-specific metadata.
>
> Signed-off-by: haozhe chang <haozhe.chang@mediatek.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

