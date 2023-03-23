Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9207C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 09:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ER5BSCr9JV00PaqEK5UpQdMYow41x054A0NzdPKRFxo=; b=OKlmIYrZRyuzyloEavE8l8Bs6w
	sOiSWOFAI76kZ8nMIkNkizJw0CWIOpvco07VYVL1enAYWBb7BaVYecQYlRolSMisdqe5dAOO6qVdA
	/uGTd6Pqro9/PcpUXv/WSeEOHqGJnXKafzMWWByZLg2TqU9ObgL3orI1/rQTGxCXIHoVpfFS389Rf
	5dBho+F/d3n0Bch7c3n/U61RuxS4OIXn/xXYpPCBDTQ4S6O413IBGy89IqPRvJTEFdHzFEvZitd5+
	ZTrnzR6yV4jDDAiRsrG+TN2O0lXf1yHUjVRPqwMlY6lfHPv45ma7nbxv8QHik4+9ZhabF6YrzBeW6
	+OM+XtFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGsa-001Mij-1B;
	Thu, 23 Mar 2023 09:05:04 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGsU-001MfF-1n
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Mar 2023 09:05:01 +0000
Received: by mail-ua1-x932.google.com with SMTP id 89so14522694uao.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Mar 2023 02:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679562295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ER5BSCr9JV00PaqEK5UpQdMYow41x054A0NzdPKRFxo=;
        b=cTjDYAWCMEbcsqF6rG9P/DV5MiBYk+2MTPuya2dk52/SvB4hjaQIL9hP5GxKBi3bxZ
         rbu9QMoZoFYtR54ZOowHAVGIN5y+DPM8Ii8TGsN6q82qqKpx9K/0HwH0BLiB7wZvSv6Z
         JOClzLV/+Zt8HBq0JiXVL450GKr5XKfuV0nX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679562295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ER5BSCr9JV00PaqEK5UpQdMYow41x054A0NzdPKRFxo=;
        b=bGiSPZV3ddZBzy9yiDNTdC9SZGTJdAQ2YXFVcgVqRdYDCVJlH1wAbGKW4o25g/iXGr
         Kk/QE/C+x084zgSkPcsPcuhTZjXH+nHd7smc0HdykjTsLVrhBbo9IVCX3V/xiq7b9Z7T
         3TQF7p3Lq45XYNnERCDJgIyouREw9SDWkXob5LLdY+f30mM4+0YMk1O6Z/5JpJo8+0G9
         w0/2MmYJPa6Lm1Ns3fF8LIahETugR8+/C+HSe0Ts1qW+pSlC7L4RBpMvF0fQsL9pWZkq
         BeOWjrOFL+HKz9b8WpHYgyYipi5pppM2zw7N8yeFZ8ZQ0tvX1smJXY0uXvnnS85Thzc1
         Vs2g==
X-Gm-Message-State: AAQBX9eK72/LQsF2HvBnLi13Dibwp/GXiQ27eg40Ph3NH7piICVDLYIp
	8gpOteFupfEDqVwpX8/E9nukpmfsx053TthVkqH+Mf5n5a9x/0Ey
X-Google-Smtp-Source: AKy350aBwAARZFXCKTypUlkAy7+CkD3eOoHJIRlhaqu5olHys60B5m/DMcr9xhAwDThW+C/Sce5ce0an2hZ4w2+3tgE=
X-Received: by 2002:a05:6130:913:b0:68e:33d7:7e6b with SMTP id
 bu19-20020a056130091300b0068e33d77e6bmr5361851uab.1.1679562294902; Thu, 23
 Mar 2023 02:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230321121859.2355-1-nancy.lin@mediatek.com> <17831605-5c9d-9c92-d190-04f91060ace4@collabora.com>
In-Reply-To: <17831605-5c9d-9c92-d190-04f91060ace4@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 23 Mar 2023 17:04:43 +0800
Message-ID: <CAGXv+5F82Ctz0pit4LsR5mQizPq-v2k3OVfiRhsGnG0a2J=Dyg@mail.gmail.com>
Subject: Re: [PATCH v30 0/7] Add MediaTek SoC DRM (vdosys1) support for mt8195
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Nancy.Lin" <nancy.lin@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, krzysztof.kozlowski+dt@linaro.org, 
	devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	singo.chang@mediatek.com, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_020458_612146_2CC38423 
X-CRM114-Status: UNSURE (   9.91  )
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

On Thu, Mar 23, 2023 at 4:58=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 21/03/23 13:18, Nancy.Lin ha scritto:
> > The hardware path of vdosys1 with DPTx output need to go through by sev=
eral modules, such as, OVL_ADAPTOR and MERGE.
> >
> > Add DRM and these modules support by the patches below:
> >
>
> I've tested v30 again on MT8173, MT8192 and MT8195 based Chromebooks.
> Green light from me.
>
> Chun-Kuang, can you please pick it?

It was picked up a few hours ago.

ChenYu

