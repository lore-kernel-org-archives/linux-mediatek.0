Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3905C3DA41
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 14:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8gJnKjoA3sk0MHNnCyDf7HxbJLOHfbLKYv1jyslxAs=; b=rvlovaPStOrI1o
	j+rqDiy66ORFsPYrAK81yjuKwkCxoAnywUbLR1WA8z/ZA2vJ92xhoos6Z23yS8XYIW43Ctcc+BIGN
	D//CflNCDFk7uisRi+d3FYGCNOeXCWJ748u8Z6EPaBfh3Wl1qqD2jBaRe7MWVQjut1/mcskx7tDHy
	tUzJ1orgfF37IIlX3vGO0CxprgAB1TafSijl9uK5/cj8em3UIUiDrORfQ9hKlSRxp0mMPdf9RqYxq
	HtDZ2e29B5dlLlogX7YiwZV2Zd9r6CSU/YRYnThs7WSpY2MPhutNR0su+/VbNkzsr6VI381oBDak6
	1cn58eCG3xIPDZQtZ5hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRYJl-0000000AopV-3tDu;
	Wed, 10 Jul 2024 14:29:14 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRYJj-0000000Aooq-3E0Y;
	Wed, 10 Jul 2024 14:29:12 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a797c62565aso88186266b.2;
        Wed, 10 Jul 2024 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720621750; x=1721226550; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8gJnKjoA3sk0MHNnCyDf7HxbJLOHfbLKYv1jyslxAs=;
        b=WbPbfiXYiPktMFRh/323rblaKGwNlIVDraZLCQgYb9mTKYgJHjZBeQCRe2leyW4xDC
         L3mMtijhTuQC480f7ih16PmZxiSDB63YTFNCMBeDFm5OjP3tvDGMa0Vx0NIsinbXToj1
         +SPG7yZAnmPYVxatYoEgqT0tmsjOA+Yg6F26qp7SZIbzZfoMCvqEI5i4TOXE5H1M6z8b
         oWyStw66lrwwen3pXSIvgjaENCPvNzs6hc1Cbdm2tG2rFBDnSsXHGISH8GzgTL5KTq/7
         /av0WDqO+lPrSBEpBTIYpqLRK7uZ1pv06gS/uVfyH/x6G/+bnZxK4C3h9wZV8wZk745R
         cgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720621750; x=1721226550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8gJnKjoA3sk0MHNnCyDf7HxbJLOHfbLKYv1jyslxAs=;
        b=rRfobzNfKSQMPsqNhGcT0ieBnN4fpDvbxG1CAU6DJ2bztz3f0/AKqEdlHs3D33pWwY
         bwaTzvOACS71tC1vKBNNQab31yEseiaE7/3+w43kPOp+g8B3wGMJabQISguo/MT4DvMX
         /6nB4IzB8PyNfZE0RIpLLkpVAJKJWhQQi3gp97Ksz0wMBkuf0HW1YO4N2GymRTdwppdr
         CTqAiW5X4UM4cz2ooevVRgXnJTeWU1UCgGNog1CWr8roP57DTXwecgK+krGqODCVJY5T
         1l9wnaJGVUuK/qkbglYHygSjncHe2XSJCzjsh4Tr/6ta8XLx3FBdt2P9g8BmZ9G4Yhe1
         HeDg==
X-Forwarded-Encrypted: i=1; AJvYcCXaf01SgCudj1ovBvDqJTMGLYSFbU0vdSqVypG0UQ7vNSgLHOAsXnXjogs92eXJZXv48XNnVKc3JpIpUHQ29u/I4TFmJKOUemW8rsKMlzCNd/phgBc0+H5bhjRjl62LgECHFa2JWuw/pga+3su5VG0GDz2P98qvpcg=
X-Gm-Message-State: AOJu0Yw1Yp+AmPQkn9WbOneXYFTPqSdXmb70BghFWGuwbf2L1QxejP80
	KUaLl/ValhpPJ/us5r38US34noCYOsdLDofRDuCcEXqFKdZTNZKWbTXWxUc6FMHBsE+RI3vW28R
	SVm/HctGKvq+4Kjm+6vFIxEo4LQg=
X-Google-Smtp-Source: AGHT+IFA5+m5xZv4TYCT5QPxWx1vJf/iXq68BQ4T7QErwC03UwTWky2h2CUAYZOmGS5DJLngCY+qzVcAGRFLZMxsAl8=
X-Received: by 2002:a17:907:868e:b0:a72:4d91:6223 with SMTP id
 a640c23a62f3a-a780b8849cbmr438447066b.62.1720621749595; Wed, 10 Jul 2024
 07:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
 <20240124011459.12204-2-jason-jh.lin@mediatek.com> <f91d3ac1-0a7d-4ca2-bf0f-c5e471c2f6bb@collabora.com>
 <2a2a939c9cb56de0383ec3e42db9bcf8e8518775.camel@mediatek.com>
In-Reply-To: <2a2a939c9cb56de0383ec3e42db9bcf8e8518775.camel@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 10 Jul 2024 09:28:58 -0500
Message-ID: <CABb+yY2_oJ_AC2w5AgHMBvqFDeyaUq9BLczqY8JhLFPDnfzY_Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_072911_828378_95A8FF04 
X-CRM114-Status: UNSURE (   8.45  )
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, May 26, 2024 at 10:04=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5)
<Jason-JH.Lin@mediatek.com> wrote:
>
> Hi Angelo, Jassi,
>
> Could you help me apply this series?
> Thanks!
>
Please get it reviewed by DT maintainers .... Rob or Krzysztof.

-Jassi

