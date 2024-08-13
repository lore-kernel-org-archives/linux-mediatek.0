Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC0AC52D7C
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Aug 2024 09:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ve4jbSU7S9ExZbxJjtrrBtClvd5I5lhR/E8IhWEXAFc=; b=EnvmcbNE5AC14/cVhL3aUt7Dq0
	AgLN7AKXd3KSZXXCVCt8czBXQHFdD9l+TrO6/qdTq52XohChPDupzlQ2mWegJFk3Xh+MTW4z50F5u
	S/D/G/CsPNc3owL7J0MtqfCHpInyaAYNRlR2coZ5CvSVU3/JbRmqtqeNBr3nmRC4r8lVYdhbz/Sae
	ue9dK20sAHxCJ26S+iDvqYNPs5rWJCg/Pzty0qcA8j7qwk+dMhMWPseihraZ8muYkPydcApPlPf2t
	NPDrFMfdYODBbN6tRBHTUiltC2J26h3kOTzjunXAL0XgbZpZklCiAex9iEqDmhZlSIE3A7aVWO1zs
	2AX82J0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdnSa-000000034NR-2u2K;
	Tue, 13 Aug 2024 09:04:56 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdnRc-0000000343i-0LRV
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Aug 2024 09:03:57 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2f16d2f2b68so73139841fa.3
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Aug 2024 02:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723539834; x=1724144634; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ve4jbSU7S9ExZbxJjtrrBtClvd5I5lhR/E8IhWEXAFc=;
        b=lYUTFhFh1AvSZw5Y5kqDZILXJaPI9NX1YttplICY1djJtEfpnCbDDErhfNjMenEwCd
         R0HAAhgTCkHCZDm9Vy92su0nIOTGXJ0CSCmioOUFXoA94LVVbmpKfiydpTfb173x6EDZ
         r1etWhlzp4YMneFIolp8sTcbjrW4RE+1SWSU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723539834; x=1724144634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ve4jbSU7S9ExZbxJjtrrBtClvd5I5lhR/E8IhWEXAFc=;
        b=iLN+i9myr2mOsMeijMVGLdnWX+1+Tiw5VSo9Q+g7cIr4jtPcA+uErAxJMlKBh3ck9r
         HNp/LGoNsj1XD1uU7g1T4StLGh+2Fuj4HFUule0QpdXd7I8e+uNcLfJc6oN+oG8V3dT7
         5M/Ew7Ac9s1uWXsDd1GlN45XTdlnOuNYXwxPaumwtqZFc2L7nfd32xeiz/zYRKJN7GVq
         Cjf4SiW41CvgaBxEd9ZMdMa1QeapZmSw/pM1n2q9yIkGuiNVbgCX0sjdYICHvnyX/Z0O
         OGqI/yHYWemcURBV3NcaC5xobkc2V6HnITeyS3/56SajrJT9c5kDhErD8zC4vn7XQK6L
         PF/w==
X-Forwarded-Encrypted: i=1; AJvYcCVxQNm55IyyQTwOsH2rbTF5qeKGQblVX8RbKSk74z4462PSsOjWmWaGEEp7wCRRvPlxe+Wmc7/4sy8XQqQydveSdCJXTZGpJ0SdCEfQmOBFsDM1
X-Gm-Message-State: AOJu0YyDeDaw9hHqWOAbFtCWLxM+tmV8C8IGkHamnyO0sDuS33QFxSn7
	67KjXtPdm0oPEsJSpc4Qzpwqo2L1oGvHJ6R0Zs44KgYJvV+WQ/kqPk00GoW6ktos2fD5vIZiX+l
	xKFsPkPW61Z3JQ0klxDcbP1okSIdeLxkszP3e
X-Google-Smtp-Source: AGHT+IG7NaoKLkQNmaW+Q8ybfg+2Fkm3g2gdZmqPP65jKw5bs2Y5MuNgZOgxthLiif5iORngSqZhzj93hj3oIkVu1A0=
X-Received: by 2002:a2e:3c14:0:b0:2f0:27da:6864 with SMTP id
 38308e7fff4ca-2f2b7150009mr22309211fa.17.1723539833287; Tue, 13 Aug 2024
 02:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240809135627.544429-1-jakiela@google.com>
In-Reply-To: <20240809135627.544429-1-jakiela@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 13 Aug 2024 17:03:42 +0800
Message-ID: <CAGXv+5FpYxyANqp+uMoJP4my7e_yjSS7eFOodG-UuGG6eHCj-A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: Add missing board compatible
To: =?UTF-8?Q?Albert_Jakie=C5=82a?= <jakiela@google.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Trevor Wu <trevor.wu@mediatek.com>, 
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_020356_195878_F00C6005 
X-CRM114-Status: UNSURE (   7.67  )
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

On Fri, Aug 9, 2024 at 9:57=E2=80=AFPM Albert Jakie=C5=82a <jakiela@google.=
com> wrote:
>
> Add Google Dojo compatible.
>
> Signed-off-by: Albert Jakie=C5=82a <jakiela@google.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

