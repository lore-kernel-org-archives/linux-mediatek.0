Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8CFC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 12:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7uInAiqpQblW1FuguJKCYpcZGazuZcNpStJm/HJYwE=; b=NWTuYMnSJPnUGIhC00RcBdfANQ
	REuVQdlH2W+MZ+DeB5nAxEdbTgpfwmyfkK27C0usryCYW7hIWBj0SjrEa36ZRVwZrazXiXPyhzYU0
	C6ZVUi5fVuJio3bh8I8bF/QUl+arxYK/e/tsFu+qsO8zUnm4dtJLCB9BZDdBaSHz4BALtIuiNMGJV
	L2qiRnEL68hDYaWhKdBTKrzSk7KtG/K2p7RuFdlE+obYUkWXuYWonJgG+k/fQaOMGf7oMyqKH3rP7
	shf8xJcfrTQjV5GwlMUb4dWBEbRVJgCko93RaaKvYvsntzLvQHNKaqTfsJvqaGJnPOSD1R7qpDMFd
	BMZ0kW4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pexwJ-00G0oW-1s;
	Wed, 22 Mar 2023 12:51:39 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pexwG-00G0my-0V
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Mar 2023 12:51:37 +0000
Received: by mail-ed1-x534.google.com with SMTP id o12so72453345edb.9
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Mar 2023 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679489495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7uInAiqpQblW1FuguJKCYpcZGazuZcNpStJm/HJYwE=;
        b=eQ+8m1BOPPny9D5aNyxbHYGTiCf8Na3k/SMUqrCxaa1Yd6GYecb6qZPcSNejvrGTLh
         K2tNopHoQ+IXxsJ3Z/xQnfFtL0q0ndPimIrANSMeWDBSrX/roRZA7g4cDspQdSjlTqYO
         ST0FoVApsvyQx4KLgzGClpGOdlW5k0tRafn6Bi6bY5+mz0yLtL72We2GmJAb5QQ+kYYe
         IesM6YsnG3KC2VBYu5t3XjhDCr80TdEgGVarrxOWZTFYXfXlzOXXqgB+SxHxbjNmxrcf
         xvFNepmdn5r+oAq6AWo8ad7eTxr6LF1M25wuqgQgFPKvVkQ0UoqGT+da4ojmX6Z/EwHv
         B85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679489495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7uInAiqpQblW1FuguJKCYpcZGazuZcNpStJm/HJYwE=;
        b=mKvVcJVj9S8Qfq4p9FVnP9VC5uqyPpmWUatM1XIAqNv4oz4aAbJsbhqPrhLJ1Yznv0
         y6Y8XJ/DsCRjbhOau8j5UUS0vTnLhU0GOOvzbCQyLdSom4+k3b7OyW9UYLGnaC4mVxVs
         41gqPYHe3WvpDqhQBv4M+P9NyqMsxQK8/qbsnuwysOPZ4F9JqyU0suKEdtj7nIzkvC83
         qCxqK0nZf1UK27aj7oIbnAvnKyLQbJlsaTExWyZwpgIbNMQR8Uf6HHHi1tgR9jUIiKiH
         BFVA8i0N2oHP4abypsyj0fW0+lJ6yGgbMPa47VG22dAutgn/M9+Q2yWlnhSNUDeStphe
         Midg==
X-Gm-Message-State: AO0yUKV4AkwIsDBFCFXS75eKPmuQvql2MiphwdimBT7pzMicWoA89w6o
	UxKDFlHosxAn1G5aXY2osWnDIqQtdKAaglO42kU/JQ==
X-Google-Smtp-Source: AK7set+H54h9AIkF40JfLtjJco8DQSGdF2j7ywDCKthKg0qqriwpU2mABmcujmqJNtXCow1utP9NeQroR4FDuRCo+94=
X-Received: by 2002:a05:6402:3496:b0:4ad:739c:b38e with SMTP id
 v22-20020a056402349600b004ad739cb38emr1580205edc.1.1679489494871; Wed, 22 Mar
 2023 05:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230307154524.118541-1-bchihi@baylibre.com> <CAGXv+5F6yFk+VMUe50YfV11Bx3qnQ=FHymeAM=dgfrqwLGrG7Q@mail.gmail.com>
In-Reply-To: <CAGXv+5F6yFk+VMUe50YfV11Bx3qnQ=FHymeAM=dgfrqwLGrG7Q@mail.gmail.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 22 Mar 2023 13:50:58 +0100
Message-ID: <CAGuA+oqLi-b7YuUVYzCDQWbztPy7WOVEch6dbrbWzdPkRBOwcg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add LVTS's AP thermal domain support for mt8195
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_055136_197374_5423A55C 
X-CRM114-Status: GOOD (  13.14  )
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

On Fri, Mar 10, 2023 at 4:22=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Tue, Mar 7, 2023 at 11:45=E2=80=AFPM <bchihi@baylibre.com> wrote:
> >
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > Add AP thermal domain support to LVTS Driver for MediaTek MT8195 SoC.
> >
> > This series is a continuation of the original series "Add LVTS Thermal =
Architecture" v14 :
> >     https://patchwork.kernel.org/project/linux-pm/cover/20230209105628.=
50294-1-bchihi@baylibre.com/
> >
> > Based on top of thermal/linux-next :
> >     base-commit: 6828e402d06f7c574430b61c05db784cd847b19f
> >
> > Depends on these patches as they are not yet applyied to thermal/linux-=
next branch :
> >     [v14,3/6] arm64: dts: mt8195: Add efuse node to mt8195 (already inc=
luded in linux master branch)
> >     https://patchwork.kernel.org/project/linux-pm/patch/20230209105628.=
50294-4-bchihi@baylibre.com/
> >     [v14,5/6] arm64: dts: mediatek: mt8195: Add thermal zones and therm=
al nodes
> >     https://patchwork.kernel.org/project/linux-pm/patch/20230209105628.=
50294-6-bchihi@baylibre.com/
> >     [v14,6/6] arm64: dts: mediatek: mt8195: Add temperature mitigation =
threshold
> >     https://patchwork.kernel.org/project/linux-pm/patch/20230209105628.=
50294-7-bchihi@baylibre.com/
> >
> > Balsam CHIHI (4):
> >   dt-bindings: thermal: mediatek: Add AP domain to LVTS thermal
> >     controllers for mt8195
> >   thermal/drivers/mediatek/lvts_thermal: Add AP domain for mt8195
> >   arm64: dts: mediatek: mt8195: Add AP domain thermal zones
> >   arm64: dts: mediatek: mt8195: Add AP domain temperature thresholds
>
> Whole series is
>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>
> on MT8195 Tomato Chromebook.

Hi Chen-Yu Tsai,

Thank you very much for testing it!

Best regards,
Balsam

