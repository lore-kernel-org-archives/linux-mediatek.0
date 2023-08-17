Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5694C27C7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 08:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqYCpJ77ukc6LNS1A4X/No1oC3nfzVx+pg4F8CfKxUc=; b=A9G85kSH6DJyffyNc9Ie484TXa
	6tiVYVwtG8kNuIu0pP6rQOeZHj0q0nOjwubaejZlwxq1oGLp1q8mHSFFn9PMb3sun35KP5mIPYyfU
	t17GAMBqYfaJ8yl2A+kJVYo5lGsqt4Axd8ca5hLXHtXFsuFps4r7gQKNBTuKW4mAFik59dT8ySNU7
	Y0z+QapJNQy0rNiG58zGzD4UcWoiQpd8JpGX++pzMDWbBmW6wmkxICDg6B4edgPK5KQ9X29m/Jcbc
	AvEsOAA8JP2jhTy1u4RcCROXABwYh+mZidk26u+yhR5jOcWpaPcL678GAKev1zrv4X5G+xpMCm4kl
	e5u5tnSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWYdn-005rWV-2a;
	Thu, 17 Aug 2023 08:46:03 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWYdl-005rVd-1M
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Aug 2023 08:46:02 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-48a6a1ba95aso679133e0c.3
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Aug 2023 01:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692261960; x=1692866760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqYCpJ77ukc6LNS1A4X/No1oC3nfzVx+pg4F8CfKxUc=;
        b=BHw3mJbM4hiuKYmnePc4eJjfyuFoK/yRMWyAEy7IWaPgRQKpe059qpCObRoV/bBlwH
         uKp+QwZnGCcAgbn6bXRqBpw0Tqecrmhy7Dt4tVldyFCdMlMBQxzMcWLkKMIkpx7I0CT/
         MA7P6Z8cybRNmGJMtvbrQtbbTToOTVaG4Izsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692261960; x=1692866760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqYCpJ77ukc6LNS1A4X/No1oC3nfzVx+pg4F8CfKxUc=;
        b=cC20vgy9r/v8lcXJSkJrepCx4alsugK1I1Q/cmDl/cQy6PBybPfbrKyH2TDHGlx7V/
         l35U06+89npEGOaQjWwXxLVpZSOMN0ail1fukMkJSZSUeTlEW4cZBn/AfIs1dVgQ3XuF
         J7HM1QDipO7p3ePmLZAhmV690XE++gxBqNvag8mYQ5rin5AuFySAono2fXT7G0wk4xy1
         uz+MrwhbnOXVsEdSHawW9FUHI+kIATiLaJks7qw1mqQGE3jggQFzKWYCiQSPtHDkVess
         +ChTO0b5ShUg7PT4ddsFDaipAbVa0JTFXaZ/ykTjaDe+akDbUHIC63OTShFSN1pzwktg
         DdQg==
X-Gm-Message-State: AOJu0YydkKVyDVx6p4I4VyXepV6xum+D7+3J2YarSNZQL6xPuk5M3IW4
	A1wvQ6ZJ11ALh/vKyrTri3iRqFbqzIL6ME+D3QFsfg==
X-Google-Smtp-Source: AGHT+IHXlDV52tzwpRP9Q+YvnVRJMnf3bkME2JfcNlfX9z20DgAbY8v2IRSoiHr9VM/ZIT8Hmy6flouitCaU4ecYlfQ=
X-Received: by 2002:a1f:eac2:0:b0:48c:2b9f:ee1d with SMTP id
 i185-20020a1feac2000000b0048c2b9fee1dmr609627vkh.16.1692261959110; Thu, 17
 Aug 2023 01:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230530195132.2286163-1-bero@baylibre.com> <107678ff-c3d5-4c3a-ad0e-fa292a125daa@notapiano>
 <a97efd71-23e2-5ac9-8d3d-427a431353c6@linaro.org>
In-Reply-To: <a97efd71-23e2-5ac9-8d3d-427a431353c6@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 17 Aug 2023 16:45:48 +0800
Message-ID: <CAGXv+5EFD_yMF7q0P5rqiRWeyRqm016Or8iB0niwj26HFVp93Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add LVTS support for mt8192
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	=?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	angelogioacchino.delregno@collabora.com, rafael@kernel.org, amitk@kernel.org, 
	rui.zhang@intel.com, matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org, 
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	james.lo@mediatek.com, rex-bc.chen@mediatek.com, abailon@baylibre.com, 
	amergnat@baylibre.com, khilman@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_014601_504706_69400639 
X-CRM114-Status: GOOD (  12.30  )
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

On Thu, Aug 17, 2023 at 4:49=E2=80=AFAM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
>
> Hi,
>
> On 16/08/2023 21:57, N=C3=ADcolas F. R. A. Prado wrote:
>
> [ ... ]
>
> > Hi Daniel,
> >
> > just a gentle reminder. As you've just applied [1], there are no longer=
 any
> > concerns with this series, and it'll provide both working interrupts an=
d
> > reliable thermal readings on MT8192.
>
> There are still concerns and questions in the series for patch2 and 3.

FWIW the readout errors raised in patch 3 were fixed by

"thermal/drivers/mediatek/lvts_thermal: Make readings valid in filtered mod=
e"

So I guess the remaining concern is on patch 2 about whether the noirq
suspend callback should be used instead.

ChenYu

