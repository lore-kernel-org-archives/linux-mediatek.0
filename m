Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79925EB64D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 04:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1rezx4FlsyiQzr31Fbv1Ua224W3A27Dsl53mJwBX+Q=; b=c/rrMdBYYrnuCOg8M6qKF1Xppj
	eJnnIVatt/QgwyduF0lUmCl2LxX4rdSNrxH2rPwngjnBZt7unknUWGQrIQH9//wYx5PTfB2nwaBCR
	wnZIDdssNLBv93BsiShcP3UrJc/MA39Q5kP6oVaVL+BZba/iZHCNb24hpcl09aNRsB1Pa4Ka/PO0A
	d1JQCC5H2xiOzbV2o9nu4b7uUO3Q1FtRioU7QAZtlNNKL5YCeyOFLTHKm6zfGC+RNlZoPEpnjZ8P6
	vAblwlyeXJmXPX9tVLR+UfWq6sWkVcMlt+fNOLW2f2Ys72nSjpBv5iSSVh8cYZQPAlUlnw/jx/pJr
	+SHEgELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEMk5-00EmeZ-2c;
	Wed, 28 Jun 2023 04:25:21 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEMk2-00Emcn-11
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Jun 2023 04:25:20 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-7835ae70e46so124849639f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Jun 2023 21:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687926313; x=1690518313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1rezx4FlsyiQzr31Fbv1Ua224W3A27Dsl53mJwBX+Q=;
        b=XfGKl8xYbreLr8Za0iz7jOnSEgaTNGYTTongpGjNoF5QH85aBTddbOMHrWHoeBx8uU
         JRj1eozMWjjj08ECxi083M8+I+PO4D7jMFQOsBr37hcB2L9GgFZQrxKxukLycVzACJTG
         dAnT5Ja0BM1DJeM6GvHa9iVRKAoVN8uUjO3N8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687926313; x=1690518313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1rezx4FlsyiQzr31Fbv1Ua224W3A27Dsl53mJwBX+Q=;
        b=g9wyiOBdCy6qzcfT0YhTQ4ybhIFDe2NNFU6aIj4gbfBeylkfiAhcn9hQ69ikzmGmYJ
         BcLnWTNoV7mIeHphnTrVv/5e4qFBtzObYqiH6wJr3wjj5drAl/dbV9KTSsgKQFgHdwOs
         YXyyCqq/1OxUQCCpF8UfZGoGc+afmft3n881frBXr9nO8CA/1mRe+TI9cTdqtqlQTd+c
         vjZ87QMQdsg3euUvM3zoThl3F0cFqEUQt6pw4rLwRihRFMlvzqdJUNLrj8dPTynuZ7lY
         xvihw7pRn27/x3N028hrnPbl6LflefMU/2/kB7xnyNgXG5kU0Zx31ybW5vD9PPG+5++u
         66lg==
X-Gm-Message-State: AC+VfDwqarL76gZr+DFTBo3GGzyklnFVSGhNwCIO/iW5rMuCNV5ErHyI
	OmAMr6tOYecyl+ZxZbgX/eKOAdiC/pBtHvj2+ds=
X-Google-Smtp-Source: ACHHUZ7YigIs7f54tynKaVAMXlXgY6hf1EqqiaEmMSdVEzDhoNVFtw35tgcSvWduZL5SpHxpl5V1iw==
X-Received: by 2002:a05:6602:34c:b0:783:6bfb:8a52 with SMTP id w12-20020a056602034c00b007836bfb8a52mr5503286iou.9.1687926313313;
        Tue, 27 Jun 2023 21:25:13 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id g3-20020a5edf43000000b0077e3b1ffb52sm3219970ioq.12.2023.06.27.21.25.12
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 21:25:12 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7836272f36eso105105939f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Jun 2023 21:25:12 -0700 (PDT)
X-Received: by 2002:a05:6602:22cd:b0:783:63f9:55b9 with SMTP id
 e13-20020a05660222cd00b0078363f955b9mr6463588ioe.16.1687926311837; Tue, 27
 Jun 2023 21:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230627063946.14935-1-shawn.sung@mediatek.com>
 <20230627063946.14935-14-shawn.sung@mediatek.com> <30fc2593-1d8e-286a-cc54-03ee250a37e7@baylibre.com>
In-Reply-To: <30fc2593-1d8e-286a-cc54-03ee250a37e7@baylibre.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 28 Jun 2023 12:24:35 +0800
X-Gmail-Original-Message-ID: <CAC=S1niScbOZrq6srx2DHGGtKfTV+L7rEf6o+77Y=XCz6GezwQ@mail.gmail.com>
Message-ID: <CAC=S1niScbOZrq6srx2DHGGtKfTV+L7rEf6o+77Y=XCz6GezwQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/14] drm/mediatek: Improve compatibility of display driver
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Hsiao Chien Sung <shawn.sung@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Jason-JH Lin <jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_212518_800457_D39BEAB1 
X-CRM114-Status: UNSURE (   8.64  )
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

On Tue, Jun 27, 2023 at 9:48=E2=80=AFPM Alexandre Mergnat <amergnat@baylibr=
e.com> wrote:
>
snip
>
> The lines is > 80 columns.
>
> https://www.kernel.org/doc/html/latest/process/coding-style.html#breaking=
-long-lines-and-strings

The 80-column convention is preferred but I think this provides better
readability.
Also checkpatch.pl allows up to 100 columns today and the lines fit in.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dbdc48fa11e46f

Regards,
Fei

