Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E788CD3B7E9
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2024 08:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tyiE9J0eGLoQYHuhhKZIa6hDUKaJOnKp7k8/yARY2U=; b=KpOKW77COR9wMwwq9cPFH4scwI
	SpJ67jcyP7Wcx6Ept79NtufxsCgSRLH4WKBfDCZeMTJXFJhZg/PHDchqjy0X0RExIc08peLLhqGRH
	caZMZ0SfcaIhamvHezW7IA4UQaNrMd7EKRw9Hi7ZOLJWCJ73+Cs3gnu5j3z7O8f4erlPPpX222qAL
	PmyqkhAletRNJpC28EVLqMV+XkixKOjfIQo26ZJAcl/ZY8aqNwKyXFaFh54X21u7+miehNEWXotqA
	ZgHuQLeZI67yrAOW92oP4KxeJpL1+cCkvzXs6lbKUpPAF6N1iM83dCmzHX05JzkRqqDrQK34KlaZo
	15Q2jV0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFU2K-00000007Idn-07JC;
	Mon, 25 Nov 2024 08:01:36 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFU2H-00000007Ibd-37bk
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Nov 2024 08:01:34 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53da353eb2eso6358481e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Nov 2024 00:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732521691; x=1733126491; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tyiE9J0eGLoQYHuhhKZIa6hDUKaJOnKp7k8/yARY2U=;
        b=IjyiahI0pl0RkbSNLYYPGe6qi5DoEenS4uY5cLxUDI1NB2fBUsVKPUOE2SVkO2DvGz
         /MALSvuPwB4czZspuQcIjqt9kL3C2+DbTgjOUEWsr41ISyCodpBFFaRnE1Hs19Bvil/z
         X9PA05Nsv0A/HwcSFiiKUcEVOP1DrdMl2Hd8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732521691; x=1733126491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tyiE9J0eGLoQYHuhhKZIa6hDUKaJOnKp7k8/yARY2U=;
        b=S50F3PG2Seit4YnR9d3uKkD0zD4Z8mJ2LA1c7TKue41DZXkJf3uxAl4GjaQS8DoxrS
         iRW+qV3or/MfReRCPwPagW4kW2HqzOwCHJ94NJC/1KZS7M5LRuxKEEA5o2yqogsP7n6g
         n4UOf4qknyBDznSp/i/0ALfFhTqtFneTNMQ9ucHGuGRAmdxHE3nt3/JMRFG6XjWjMRaW
         Jw64fqRr9YEzYk8l49G0etZJ0xsdU2z/1/ea0dJZ9sTA3l3czSUjFCWER23ZU4WiQWCD
         McvwYK1pGRmYUpJe1GRAp9idP8wND8hvQjWAxKk2TdF5elbrTi7nlgQMRS0CHlYir2ra
         OpBA==
X-Forwarded-Encrypted: i=1; AJvYcCVjdwHyTIM6fSYbLQgBeTpwonTnaePmZsRxDR0pDgNxGdFxziUuaq1vv0YFqZW/y849WfVdf11xKZ37x3C5Vg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9r6vvXbevs8Cmb84IAzu6z/6w0w4WNPo5XIHWcnB+tX2bhbgO
	3kf4IU2a1GOHYqS1sr9ataE4z00u8DNYvsG6hozCA6leD7PFw+DVaW1qPWK6bxb4FKYw0SO3YiI
	f904B4Nnz8k/i1zrNmRmZKKbIvl+owkAMeL6p
X-Gm-Gg: ASbGnctKGc3QK15ztxwOXVERvgpN2c4/HULZDi3uKgV46O8J6VpUJsVQwYMPF8BTZ6m
	rG9voIm5eKhKGvtVwpgSs+X2d0UYfosLXlxFG7cjZ/koDALCKbXfocqDj70E=
X-Google-Smtp-Source: AGHT+IFNA2YPDB29CKBTPo3ULGX/2k8v0BktEtEySMJsHpFYreImy/VSkDo3YvLTyiyt5hYDcUA3UR4cYjWGNCVrAeM=
X-Received: by 2002:a05:6512:6c8:b0:53d:dd84:a92e with SMTP id
 2adb3069b0e04-53ddd84a93bmr3341455e87.0.1732521691043; Mon, 25 Nov 2024
 00:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20241106093335.1582205-1-wenst@chromium.org> <20241106093335.1582205-8-wenst@chromium.org>
 <1246d672-4370-4db7-b4d0-368524809435@collabora.com>
In-Reply-To: <1246d672-4370-4db7-b4d0-368524809435@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Nov 2024 16:01:20 +0800
Message-ID: <CAGXv+5H8YwiTyk1eMSwPLuGw5sQxec4n8OKR-Qa5wz8QGH4h9w@mail.gmail.com>
Subject: Re: [PATCH v11 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	linux-i2c@vger.kernel.org, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_000133_804683_DA29227C 
X-CRM114-Status: GOOD (  11.61  )
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

On Thu, Nov 14, 2024 at 6:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 06/11/24 10:33, Chen-Yu Tsai ha scritto:
> > Instead of having them all available, mark them all as "fail-needs-prob=
e"
> > and have the implementation try to probe which one is present.
> >
> > Also remove the shared resource workaround by moving the pinctrl entry
> > for the trackpad interrupt line back into the individual trackpad nodes=
.
> >
> > Cc: <stable+noautosel@kernel.org> # Needs accompanying new driver to wo=
rk
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Hi Angelo,

Could Wolfram also take this patch instead of it having to wait another cyc=
le?


Thanks
ChenYu

