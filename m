Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DB8C001DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/7tv75kyLF04/hNRx8/Qrlee5igGYasqrhVSHaQy+E=; b=4rDIITwO6F9Mfg9WMyqq/NKBVG
	Zm2t3FehpRi5NE6wE0Tc2NvGyEjktEv221EWLX+TbTV9SV7ZGVNdv7QeNOq1yd4fefZM6vvzVMS1x
	vFwSrS7GQFQHdLdNAxfi9pwx9sYy1lBhBa723DHQuPsVpKGinHV20bBlvY7rFmiGWraZOxTeiM5io
	e0TMlHx/WuMaruxgG33QWtQDWw8U8C0TW5I7j1mOuuWfFwRT+JE9r78sKETLNM5XWLiEURU/6SFFP
	f8yoDcke0TFuRleu0sQTjNLxqjuiQfY7OssGaHDoNGFS9z4Mo2axLwntcQcr4JSZU1uY9atfREOj+
	t/qvTGTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVTVD-00GaRY-0F;
	Mon, 14 Aug 2023 09:04:43 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVTVA-00GaQd-1p
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Aug 2023 09:04:41 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-791262638ffso190322939f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Aug 2023 02:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692003878; x=1692608678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/7tv75kyLF04/hNRx8/Qrlee5igGYasqrhVSHaQy+E=;
        b=LchWXGcbREjS02VJe+/qz/M45zFlWNx+7j7IAw0Qp5Q6Nug/0lGgbA5oPrk9kQEkTn
         B0LYQNbLQ1svAjtsBJsge8o2z/dtQNfPhGBT5lIRFxHQOiTyhXBIBOvvaJlJd4ae0w1b
         NKJ/Xzyrk7cymjdYf1AZ5jReUj2rya+ojic+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692003878; x=1692608678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/7tv75kyLF04/hNRx8/Qrlee5igGYasqrhVSHaQy+E=;
        b=i/nDWoCMaEda6Bk9rz3qcZPK8rdZTQ4SqDwdf5IP3PRSgEXVihdz9OhGJFAXY416WF
         Rs3OS3B0ZZFmpM73YSVS4FpHKW2expJJTC+5tNhXrW6b+mbDYRQUF9YaClGWbPz/Ax6z
         munsU7fPIF7Z28avKZEQLctD+BbjxiXUnlWNACtBkgS38JoQWPOq28yH9n0MjgZw98N0
         PTSs5iBUxUXQLWgxp84qPdg0VFHCm/elETxQCaVsSPOnZ4LiYneI/bZqh+Bra0eceHU4
         vcq79YUiVATdJf6CeAo4wtF5Epwbe8CmsMaZm+r7ts1trxp6PVMbTfDGeOKlV7My+lxO
         D1Gw==
X-Gm-Message-State: AOJu0YzxvLZjjv9VvFal0FooRr6GAuau3H0CHrq/eJenL/8BuYsW6CV9
	wXNX5nxoukqKBbV8iaFWu6l6b0FJOYU/JTHvjkY=
X-Google-Smtp-Source: AGHT+IE1LWeS/LPtUTCILhgSAVseAU7DEMI2ySoF0U+7D/WRry5n61CAq6jmldSHJTmoeAs7cgmBFw==
X-Received: by 2002:a5e:8804:0:b0:786:7389:51d7 with SMTP id l4-20020a5e8804000000b00786738951d7mr14625275ioj.5.1692003878164;
        Mon, 14 Aug 2023 02:04:38 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id z13-20020a5ec90d000000b00790d81167a7sm3113919iol.2.2023.08.14.02.04.37
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 02:04:37 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-791262638ffso190321339f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Aug 2023 02:04:37 -0700 (PDT)
X-Received: by 2002:a6b:6b02:0:b0:787:822:30f1 with SMTP id
 g2-20020a6b6b02000000b00787082230f1mr13847848ioc.1.1692003876732; Mon, 14 Aug
 2023 02:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230814072842.28597-1-shuijing.li@mediatek.com> <20230814072842.28597-4-shuijing.li@mediatek.com>
In-Reply-To: <20230814072842.28597-4-shuijing.li@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 14 Aug 2023 17:04:00 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngr0JS-rP+q2xukNdLFE9HcLJ0-RmbKOOtT0EK1P588sw@mail.gmail.com>
Message-ID: <CAC=S1ngr0JS-rP+q2xukNdLFE9HcLJ0-RmbKOOtT0EK1P588sw@mail.gmail.com>
Subject: Re: [PATCH v4,3/3] drm/mediatek: dp: Add the audio divider to
 mtk_dp_data struct
To: Shuijing Li <shuijing.li@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, jitao.shi@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_020440_603924_F5F8CC03 
X-CRM114-Status: UNSURE (   8.06  )
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

On Mon, Aug 14, 2023 at 3:28=E2=80=AFPM Shuijing Li <shuijing.li@mediatek.c=
om> wrote:
>
> Due to the difference of HW, different dividers need to be set.
>
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

