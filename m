Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3C2C43219
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 11:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8DK9DM/Joeyp25Jhq2KddrijoW7OgJ/0JO/zDAQJYg=; b=dG8ey4vxWZuz5MbLMqijxoldSD
	kgpWHKJC/3pcA0oALUT7QW2NxW4B4YfMjfQOvBDmwycFyn3pg6o5yn4RVpianSSzMI3beSEbRrX8e
	seSUq3HcFpE91gFCBsXGFUt+lel/AZrabjGD0qlmhxSq5jV7m2N9iOhk5+zLDuB6Aq9anvslkY7V9
	PKg4c4Q4pvRTUfTwdx+yuziIq2lTBB8wWc3opTxFcl23LtZriHjmzTR9UYN5V+qFL0ZMDhAdnFl0a
	EuNGY0BLqg8Wp1rlPBVirqMAi1jJFK+7Oc5/tM2uzrHT/eSeukZSDnscrrCUgsqyZb6xUaTegRt/X
	HB9pDOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMMC-004j4P-Ax; Tue, 08 Nov 2022 11:01:28 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMM8-004j3a-LI
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 11:01:25 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id g26so8615983vkm.12
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 03:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8DK9DM/Joeyp25Jhq2KddrijoW7OgJ/0JO/zDAQJYg=;
        b=TF3AHNNgNmarMWCmKT2AxYiRqmkKw+uexQPQmFLX5fXEDsnWkPR86A+jxYLcTD1Lsa
         MIjNCE8srNStKLl3eDfGlhooKcjNJP2Q8pPuHKMBBLMAhTkYGn/V7O6NediSHfb3erH5
         R5hsTLUAHena8ne63j8sqGMVTwkpNmKgs4OnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8DK9DM/Joeyp25Jhq2KddrijoW7OgJ/0JO/zDAQJYg=;
        b=TLsR4E31uE1kTI7TnObc7IM0YjCn01fNXXwi0CUcU5+BMQoaAAms+zICR3LQ3GBNLk
         QNx3tgRqIytTBIsDPDYqP3CvexoyAOqubX3csB2dYpwYH2F5RsJf3WShUO4m/YF2iaiR
         aGTpG+HbqXgIibwnLWG/AWlij/9Dzuz+lsWhEdKtwSOpo19w5lF4mK9o+rieVc2/4ErE
         zPrSr9j4ywBdOXRMxAgqNH/T+YlQB+M++Drnp/0Zuvrfxte3E+yqwXldn9CU6GyJYhWE
         3QJeOiieAyf9d7eYJLseaO2dyN8N73+fSkTWeCHnnoyD5punrWITjYDnvPt2GzkivsuF
         lh2Q==
X-Gm-Message-State: ACrzQf22ATqrwmFRsYpEDQhPwGvNjcOHRBra/+CA2uoheJh79YAPdboM
	yJ8ZysHoE+V12aZTQ+csSW98DGyb6ONb134LGdb3uMEyhTo=
X-Google-Smtp-Source: AMsMyM5djY2N0rMudnF2ERzIwk+3mqJ8PLMEwSyNwM/8eFgA1p1IJVrnAU5RggXbDYPpgI1QKxXoiTWAh6dBFuguGZU=
X-Received: by 2002:a1f:9116:0:b0:3a2:362b:fea9 with SMTP id
 t22-20020a1f9116000000b003a2362bfea9mr27061022vkd.11.1667905283579; Tue, 08
 Nov 2022 03:01:23 -0800 (PST)
MIME-Version: 1.0
References: <20221107160437.740353-1-nfraprado@collabora.com> <20221107160437.740353-6-nfraprado@collabora.com>
In-Reply-To: <20221107160437.740353-6-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Nov 2022 19:01:12 +0800
Message-ID: <CAGXv+5Gyo_VvioV5HWabvQgX3xkM8nj3Ty8AossQgq89qmg00A@mail.gmail.com>
Subject: Re: [PATCH 5/9] ASoC: mediatek: mt8183-mt6358: Register to module
 device table
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	Akihiko Odaki <akihiko.odaki@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, alsa-devel@alsa-project.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_030124_730025_FAEE2EC3 
X-CRM114-Status: GOOD (  10.51  )
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

On Tue, Nov 8, 2022 at 12:06 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Register the compatibles for this module on the module device table so
> it can be automatically loaded when a matching device is found on the
> system.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

