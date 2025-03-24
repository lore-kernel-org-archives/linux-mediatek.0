Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6440CC36002
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Mar 2025 07:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wYOaUvH2+wGNYkwE9FMO2ObsGp/j2F2VQglfrqeSwY=; b=Xbt2RgXRfqwPWV3P6lw/uPjB8Y
	zaDrvkm02jh9BM24eXas8aIwAwOsYTAed0WBNrmT22C7JvogUVTt9C1i6iFyREqydjO1CFo3o62V5
	6uH04OFM/UCaCPaoVyr6TS2glmmdobZlgcEgMvlZflUoMVPo6n+pxF/KZft/ioWCJDDQWRcCh3mRr
	J7XxuBEx4O4qaCwflZK/E4Dz51Qbr9nOM523D6HI+cwIIOZJWcYUWwUV+TXzq+QPD8l/2BvhOfgAY
	1AghsNLpnl0zSfWKJwqNkwk69eLhOhDoNPuaMei2l0bfkv8w0Qe95OazRmoKaDj5Q/oXVDlHMlOBJ
	dm+tAGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twccy-00000002VLa-2M7J;
	Mon, 24 Mar 2025 07:53:44 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twccw-00000002VKZ-1Cm1
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Mar 2025 07:53:43 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54963160818so4867526e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Mar 2025 00:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742802820; x=1743407620; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wYOaUvH2+wGNYkwE9FMO2ObsGp/j2F2VQglfrqeSwY=;
        b=sVAgHFZwJT+fm2fFVXMh/5u+nLww4476nRF62ClolFhTM73TT+g4TDhgPoBd0oSbgU
         K2Gh4GxFO7Jyez/zvqu2qjYxvqndauNUkfQE+zD4uMdyFx25ODlYCGA46QPLEpIwEuJj
         k9Wd4SaGSj8eE+mlRI3dshScFEVkNDU21Kx+ddXUcyoqtTaRt5os9+GAMQxrlC7WnG5f
         OAPgjoIt08Z72KR4LzT5dGVcxerYQSN2a9sP5VGzMQ4PVb7R04aBUAkEs1PSOByy3FEY
         l3ng7+zCTxzWb6lp5JMmTfW65kpGXEjteQ5ufs/YVblabvljmmdBakkXPhykgABnwIBu
         kemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742802820; x=1743407620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wYOaUvH2+wGNYkwE9FMO2ObsGp/j2F2VQglfrqeSwY=;
        b=QnDyWX7r1eCY1WP08EeJHPkLkcVtOreApCxJCY+fTlDZYd4eg6xHvgwdEa+WUogRFL
         jHD1pVgX543/y0B0MXJmzVrthB6cidJPgCv0qP0k4oHJl5EZ5fCSkUnnALYNEnmVCxME
         nGCLa5gjYIWbpb0N6jx1yH1rB0uIZgf8GjvTwLjtW91d95QcChP+deXeEQH/IncD9jRB
         Nqyidq+WqJk00TjiNPcBBFwl84WFsNAcikmkwQ+vLhngfcAUB/YFBdFzk1EWx/wAmVZG
         oVhtSYPKcSbezi8KPj/5GrabmsycVY6WNeZVQik0JK0S2ZH0tLlgrCim8ckkLpLCVhG4
         HU+A==
X-Forwarded-Encrypted: i=1; AJvYcCU2aGnGGVyrurTubTGtfeRav9nRafqT5mr7HosDPAAHr98ktqc8gvKf7Hq2vMXS6icmayO91anqa4W/gVBQCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2+pXBHT19g3hof3l55mZgvrs7dARPLU5igCgY13To1t7m9nPc
	5d7Lb2InVODRR12TPdhS4oz48tKM4tuUHqrtyeVNwpJM0LzD53cSamwKO6z3mFakChRBUf+jSkE
	rbUN56TMF2ecBxLgHlRucFWThQxprHOD4oiy/MQ==
X-Gm-Gg: ASbGncuZos6YmfGCBcTMkHsL7paeBxqcFCzUqiBPgBbpbshFepnhyPqo3qQM/eLg5oG
	itufLOsAvrCosiGUpLn4JJjmBogn6Qr63uQXDXBeT9DHNdpiUga02LChX6iA9FuO9uaA1sCEGR1
	CfUw/xXAPhuKtg6ShNjloPlqo7DdtfyXmT7w==
X-Google-Smtp-Source: AGHT+IGCsf6gs4boVKvi872tdBJFNBLIE72SzFHUnHiJ2uqF225HOjiewrQhZXAtHdFlZf9qfC6RwySnYBdeijJWt7I=
X-Received: by 2002:a05:6512:ea5:b0:545:3037:a73a with SMTP id
 2adb3069b0e04-54ad64850e7mr3708934e87.13.1742802819820; Mon, 24 Mar 2025
 00:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250322035307.4811-1-ot_chhao.chang@mediatek.com> <20250322035307.4811-2-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250322035307.4811-2-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Mar 2025 08:53:28 +0100
X-Gm-Features: AQ5f1JrIT3jjMlJn7-UFm0QREZvmNoSOiORkmH7amKsqv7WDxLgWsH1QR8-hb0M
Message-ID: <CACRpkdZT1GYsZjeRHQqWJmuw5jg-kz7x+53_u8_Y3goyu=uRGw@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] pinctrl: mediatek: Add EINT support for multiple addresses
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_005342_325264_363ACFEF 
X-CRM114-Status: UNSURE (   8.07  )
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

On Sat, Mar 22, 2025 at 4:53=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek.=
com> wrote:

> For flexible routing, eint will be divided into 5 bases,
> and it will obtain the operation address through the pins array.
>
> Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>

Patch applied as the last pinctrl patch for v6.15!

Thanks for respinning this, I think it will make things easier.

Yours,
Linus Walleij

