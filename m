Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703F4C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gpqy2UwJbTsT8CSlsBkekwaizPbfI6waBJSct+QDKo8=; b=fG3rHJKSLzqOnlUY0D5FdR74EQ
	Kqro8JBLf62cX+rMxK18neqA5XwjxaHP0jJDyTpEm6e6O8glJ9na0ZiBYXlHptHhT6sHj8z7HksXO
	aZIRjCgzgN71T2TSP+NRsMyIhqHqjes+hPwEWsG+8reZyhVDCVc156XMqV6Wtoqyr8pPjz310JJVS
	s+D9coRNDzBFr1KtvRw7NDaDEeS/COUnnLTREIWAMTPIBoNY1iB/M5YtSDrxyy1EYVo2vHTnVRXIM
	PNJdslf5JJ9C1dqG5si3voJ2mnMG6YfUYcDmul9+NJY7p3IzP/OzPerrs2jwnTQ9sX7eEg36lPMpR
	aCUBla/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHhF-00AiqU-9Q; Thu, 09 Mar 2023 14:56:45 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHcd-00AgbN-2m
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 14:52:01 +0000
Received: by mail-oi1-x230.google.com with SMTP id bg11so1822882oib.5
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678373516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gpqy2UwJbTsT8CSlsBkekwaizPbfI6waBJSct+QDKo8=;
        b=7VnZ8eoq8JCRR9LWSoq6SXSKIYIRedzcewZzSE9gKx6AQQB2Ax7dwKBcAYwJrjlsWs
         4TCezR69X8MwfD4+CKaz/SObaltdvIIieLVdJ+BWlplOPFiALrUJwDgjMU47Vf51qRDl
         xdFrwA1rnPNMA0GVzeDnkpXSGfyag6vAi04knNO8VIXj+D5n+705no78/qGHcnD2tLqc
         nohnomuGXgF8COo7QbluFk8QfItIs5fLy7I2ZnAC1v81iSP6Ds1uiOBx5oP32kgrJXPW
         yTtqYLrIVGryvFjGoykGRd0Kl8dTZeGhvhFDQoCSZrB7mIPyeb5SEOWrMbUnxfz7JmgZ
         oQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678373516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gpqy2UwJbTsT8CSlsBkekwaizPbfI6waBJSct+QDKo8=;
        b=HP7PbXHTZXCb+XUMDaGOQvLQ9p9pds6chmJUcsREpc3sMmqTNHO+LEHTtiKaSp29GE
         7CteNU4BVjsm6EeJ+oh4czXcjqtM7FyAiWOBFl3ICYyGhFrtw0/B4HXjH37Krvc+Y/ih
         tiUhvfkp2YkdFjjLe0eaTHLdln+EXWkzt1ihNIVvStYLOL4mD//jov74dcqZdA32ZEJy
         4AgRunoWBN0BC0pHjDmA0G0ovTdjMZBB9hp86vu8XxOOI+GJP7jrt24kQSOd4yHH48wg
         6GqRJxSN41HjEOxGZ1kr86cgseXaGTINnvfV3ll0jU/THWVLDwAChsv9malRe2xocKXQ
         CdsQ==
X-Gm-Message-State: AO0yUKWMIV3adGEegtZuewGvXNgcM4i/nEP+7SdBoWXni7DKEkaA0IMU
	Hgs+RJ+XSqkJv8REi00n0ArDaGLWQndBXV4d1/z4iA==
X-Google-Smtp-Source: AK7set8A8FpW9dqaR73G09blcvv/Ti7DIE1vGNLlncw0hLE8FnQCoXHRSlvX0YUqfVCqYXdazGxGSi3CnqOThNIO2y8=
X-Received: by 2002:a05:6808:2208:b0:37a:2bed:5756 with SMTP id
 bd8-20020a056808220800b0037a2bed5756mr12243997oib.0.1678373515531; Thu, 09
 Mar 2023 06:51:55 -0800 (PST)
MIME-Version: 1.0
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
 <20230203-evk-board-support-v2-17-6ec7cdb10ccf@baylibre.com> <0fb37a8f-f284-76f2-e2f3-ff0f23eaa200@collabora.com>
In-Reply-To: <0fb37a8f-f284-76f2-e2f3-ff0f23eaa200@collabora.com>
From: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Date: Thu, 9 Mar 2023 15:51:44 +0100
Message-ID: <CAP2ifjOtORrGKEBMw-CzPR4B8CPDaRKnqKHyKL7mC_8qH08=iA@mail.gmail.com>
Subject: Re: [PATCH v2 17/18] arm64: dts: mediatek: fix systimer properties
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	devicetree@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_065159_165499_2C77EAB4 
X-CRM114-Status: GOOD (  11.89  )
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

Hi,

On Thu, Mar 9, 2023 at 2:32=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/03/23 14:17, Alexandre Mergnat ha scritto:
> > From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> >
> > MT8365 has a SYST timer (System Timer), therefore the compatible node
> > should be "mediatek,mt6765-timer" instead of "mediatek,mt6795-systimer"
> > (which corresponds to ARM/ARM64 System Timer).
>
> So this is not a CPUXGPT, not a GPT, but a SYST?
>
> At this point, this should not be even introduced because commit [1] is
> not in linux-next yet.
>
> [1]: https://lore.kernel.org/all/20230125143503.1015424-10-bero@baylibre.=
com/

I've posted a new revision of this patchset containing the systimer fix.

https://lore.kernel.org/linux-mediatek/20230309143459.401783-1-bero@baylibr=
e.com/

ttyl
bero

