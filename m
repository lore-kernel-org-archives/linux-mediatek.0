Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6B2FF495C
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2026 07:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYnQOFZ4bGFIeTmozNqeJkBObILJLvK0jBuil+gfMNk=; b=Y65FhZO/E4B0ODv/6cebfpgxZJ
	KWFQP1jNf0CKi+byVYKNiIHidl67FBFmSdPcryyz6FTlLSu7g8MR7xzhusebFboUFb8xP1dfLoKYE
	qawZIkwmRdnOERrPNJYIGEVzrPqoQI4Lg6Uhq8+jgRmGB1WOaDa91Eq+S2Y9qF2zBUcAXDNL3vYj5
	2rdvTx6GWGNSuEZIvbzcuHfivn9K+PbnA/wOhiN3t31adEP6gxXqsn7nBgcYaixh7rT7F+MVubWRI
	0azC25SnbrNorNrOOhNt7GLlY0DYkHbfnrQ0HQfF/a8MkC02dXwQtmxpxrG+CiMb8tWv1agsPlVsI
	2bifN6CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77Dc-0000000AmQV-2AtF;
	Mon, 30 Mar 2026 07:39:28 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77DZ-0000000AmPb-1oO5
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Mar 2026 07:39:27 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-66a4c6bb6ecso7350058a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Mar 2026 00:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774856363; cv=none;
        d=google.com; s=arc-20240605;
        b=dmj6MwRgQftlRONW6q+o6O5OjoUoHg2DfKf4MZA+betU2u5Zq23eCIsgyxKrFuxHH/
         Ym2aYRXlS7Pt+Lk09/2tenxWLsitNSqkysIdJsBZptu/zma1XFcwX2AhtMV+FHrI0rax
         ph0p/9XIz/PV1OyR0BpfDPDQwn8Irejwce6uOoGzfwKK2FfLngqQetCtfq/FarxMWkxB
         VFZXa5voWX/j1pyBPr8ZyUEuBIr45fDg9jm1fjXQmewcv4F3zpE/+BUZT135OWHf23qs
         7nXl5ha8rKZQYkWQ+VQ4kcWPfRpcm43mDFjPd5Tg2Q/ICO82jp7gADZcbuGBib/78caO
         VQBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zYnQOFZ4bGFIeTmozNqeJkBObILJLvK0jBuil+gfMNk=;
        fh=RYLZ5khTfzTxf+FyjOJE8rJs1qS0zWUPO3/N8NVTDCQ=;
        b=lzOJR81cCotVpqJkuZNmxVXsEh8cfUsXuUxHCS6Lp6hhs6sT7wrKA8L/8Qon6AhQVO
         Hu0M1clG5Jvlzy1NiJuLK19NhplER2p74HaCgHBc8PZaO8VQhzTwbY8+zHVkP/H0rodF
         MlIOsKqFLZax180P+xydq8g0WT5+SEt9L9AY3iD94VbM+WQevomouychilXEFLhnv6Mj
         hqRvyLsyLHi+K8mgPQfqkDCIc1eTI0MWQ0nhumD0sPfqyUVhWOLiNPGPRqOK/jVWuKis
         3KWxlgAmXjBOhd+kdaa8tmc9I4lTwPlDo+euJotR6/7P+XBmXoo4IARdDjByvTLqt+r8
         T3oQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774856363; x=1775461163; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zYnQOFZ4bGFIeTmozNqeJkBObILJLvK0jBuil+gfMNk=;
        b=M5gvwHZFZbqeE3KwzOn40nfivIfLlCUbF7jflHyy1OPSdl92T34xBfVzNhsPfhgKb1
         mjIMwTBRcyuV6aYwAcQA3ldu4hSkgU1rwnosH+MueDIzZcuqkmh8NmxJoM4yIyW8NEk5
         dg4SoaJNy/ct3tB/SdhyLD/XOL7l8nDZ704PjZIFBqIxvQiG9Co4UCukX8FdqKm24gJd
         LRyoa3jd+3pfcoBRNm6G6gftHzzgPCviUljKMBYgEtpnQYmlReifAI4Jfn0ctv6r40X/
         PnKikvlJOKJ1BrIPi8slWvZOg60MLF6ownvLPpeEcVqeiAA9N+X4i8kTCk2OxMumUd3c
         Ae5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856363; x=1775461163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYnQOFZ4bGFIeTmozNqeJkBObILJLvK0jBuil+gfMNk=;
        b=pmxBV/t0HdEPBQuyLp+6cqXtArZ+dRxJf/Dl4TfJap4ym+sdB5j8h5i4gPUFIGVLzw
         6MEQGgEMa1SRanKNjksTMj+3gKM5RuaEVNRKKiWWdbkB1RXBFU3DwR1e6S9LoN/OP+vW
         VTHK0vW+p6PDlKeC24RXWuFxK9Ehk+B24BgHRNbC5VNee9/Cwx8MqV7B51BA1nGcu185
         w1aDPuzz3riOqEjbughdhccEl7lbYLfDAfgF5XgUlym6MJPNaFFzv6Y1avOmOD64IT52
         BQ7fguAsa4eXSh2PA/6jaFykPC6qV7iv4Ic6fdDGF4M6wuZL1iVwKMuuMk3x9gKrMVY/
         XgVg==
X-Gm-Message-State: AOJu0YzBnXHEh4nnjf8Xf7yGhteYxuEGnhKMCvcCHjgMvp+HVLM8nqDT
	Wsd2zSSoyEGsCiADTI+5LyGy1KFZ8vgdOx29pY5dS3CiTdifwrpd4njGb7yCkOeC8/2+RFJ+eMv
	wRk83PHkIF5BGYey/SDd/Thc5tcZEJJI=
X-Gm-Gg: ATEYQzy7gwgH2HocuJN2R0TvuYruMzg9GUf/0QmSw5xZ69DOquFxshTvaTGrYGbx5Ml
	4GsabTM0cja0T6VAKeJj319xNqVmqRtlp2zB0eEgyArWyvw0NlBC65/rwHb5kpVffYgEN8X53lV
	cx9fHfuYGcbGSaPZvBN53teCrUmckSqkekAgv/sK6Ph6UtKW0gypLLl5eN2idqGbz0OU1CAvESZ
	oyVg0oh/KuB15Xo+F5f5FmhM3UDlaxE3bAFcrhGy9HOhKKMbpPLbKsB2S7H5IMapcHUATcoCSA9
	sqyY2g==
X-Received: by 2002:a17:907:9621:b0:b98:13a:c92e with SMTP id
 a640c23a62f3a-b9b502b5aa6mr732407066b.2.1774856362950; Mon, 30 Mar 2026
 00:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-8-l.scorcia@gmail.com>
 <CAGXv+5GmDtrtFHJXs+fDyF+dZ5YW-TSEqXnPs2xCH8cu-Xcn9w@mail.gmail.com>
In-Reply-To: <CAGXv+5GmDtrtFHJXs+fDyF+dZ5YW-TSEqXnPs2xCH8cu-Xcn9w@mail.gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 30 Mar 2026 09:39:11 +0200
X-Gm-Features: AQROBzCKAAw0QfB5IMl3n57JlPRQDr7IJq4vT7zpNh4df3HsPMVBkVCKdEdIBnw
Message-ID: <CAORyz2J355NZH=7iQ9sTDBhAmtjP7xTpXe21_3Z9J_R5YvdXAQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] regulator: mt6392: Add support for MT6392 regulator
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_003925_489564_1E98B826 
X-CRM114-Status: GOOD (  17.75  )
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

Il giorno gio 19 mar 2026 alle ore 06:04 Chen-Yu Tsai
<wenst@chromium.org> ha scritto:

> If this PMIC is anything like the MT6358, then it has 0.01V fine
> tuning for most if not all the LDOs. It is sometimes needed as
> a rail may have a 0.04V boost that would otherwise be invisible
> to the system. And then if you have something like 3.04V set in
> the DT constraints, you end up with something the regulator driver
> doesn't support, but the hardware does.
>
> Please see how it's done in the MT6358 driver. I spent a lot of
> time on that driver to make it actually support the full range
> of voltages, and describing the supplies.
>

I had a good look at the datasheet (MT6392 PMIC Datasheet v1.0 08 Dec.
2016) and unfortunately I did not see any fine tuning option in there.
I'm sure this data sheet is not perfect as it's missing some regulator
registers that are clearly used in the Android sources, but there's no
mention of fine tuning in that code either. I guess it does not have
that capability.

I will shortly submit v4 that hopefully addresses the rest of the comments.

Thanks for your help!
--
Luca Leonardo Scorcia
l.scorcia@gmail.com

