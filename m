Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B52C6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 06:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWfVdAaT5bqBLuvVbOuWkJn2HiJtSGwDr94VHpojYsg=; b=yDqFmQont8c6yO73u5XYFYotqG
	zl2T1PrMSWjAe4SWIqenFbDLvjHDuehDX0DWo6EwbtdiuhbS8xQ4XFylMwgIrMEv1pbuK3DeNnLR9
	UBC6Cke5B0dTQCYmr2WvZ63R+Ji8Yc302RTYcyC5z5hufvwkq6ozvgwFIbF/1sui/kBB8z3ECvgcW
	bglmq+r9S6OZuq/rrdphZAjO9f56kom/zb/KOVEeni4iOxKfk95jm8iI/gYg1gm+rv79NKdfZZVGi
	zjRTp9cM3bgZxVT3wuyU1ZjtIpDGSzk0mTi70VD4IRCrVxMuruKwko0PUtQ0ij9LO6mAR9iHWnA6B
	6qYNWNVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi8V6-0063oi-1r;
	Fri, 31 Mar 2023 06:44:40 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi8Uw-0063k9-1q
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 06:44:31 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id d2so18321648vso.9
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Mar 2023 23:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680245068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWfVdAaT5bqBLuvVbOuWkJn2HiJtSGwDr94VHpojYsg=;
        b=BfRk0Yy5991YG/5P+GG3VGVIVfs4eq9KjGIEaqor2VTRbZvDK3ijPKhcp2+dGHKCTr
         4LJRsJg6d+79W0jKhnlVJLMOLWYTS6G2sVCaPiAPIkb8iaH9p+26SuTdaHHiK/gdrFEu
         oUPHQ4Kwqk67Aem8jzNJOL2xtcMZ/lNTGb+VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680245068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWfVdAaT5bqBLuvVbOuWkJn2HiJtSGwDr94VHpojYsg=;
        b=zDf8RdZHftNBZhB1t9k0ncf/vmJgpd6/j5/37X5rR99LlNrsRADmU4Um7htbjJktpM
         VuqQGpa47JSd+TbSnO4O/PIJ58Ld3a4XhxUBoQF2JP3EUwqlXYeOVTfCipM7DokP0I/6
         SWKOMmD+cNn3+ldeHN3CnoXTedkU2bfibgn1/deJN559Ka7yV8nLTgdy8mPjTuljPrpL
         eUrQZb9WvplIgAbp2lI6jHVLKCQpPxdEGvA1+lBeeNLLRRT3yBd9A9KzBfRMStlhdcA9
         hRFttNqgGi+tka20nrNh795k7T90F+3T3LpnVNDxFIaz9gSxF8cp/M3hyAlfitIZOjEd
         xt2Q==
X-Gm-Message-State: AAQBX9fqPDdgPseC4fNB4AOVhpQ+0hfvwSVuom47sAzT2ge12+lkUbN8
	AKXcxlid0btnh3qY1e0Gh9lOKDqy8NRvT92Ydqvs2w==
X-Google-Smtp-Source: AKy350bbcCA/ZjagnuewyGDlO1QmAU/PfBDh9GKuOIQVSkzqdQjA3UIC7YYzhrUF5aEqR3+77hMCXF5P9g2iWg9vj80=
X-Received: by 2002:a67:d493:0:b0:426:a319:a226 with SMTP id
 g19-20020a67d493000000b00426a319a226mr10079472vsj.7.1680245068610; Thu, 30
 Mar 2023 23:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230223145426.193590-1-angelogioacchino.delregno@collabora.com>
 <20230223145426.193590-5-angelogioacchino.delregno@collabora.com> <CAGXv+5H7ADKUu1bsGrF5F-EgJBM6WW0N+AFw=m+hH_00QGHDew@mail.gmail.com>
In-Reply-To: <CAGXv+5H7ADKUu1bsGrF5F-EgJBM6WW0N+AFw=m+hH_00QGHDew@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 31 Mar 2023 14:44:17 +0800
Message-ID: <CAGXv+5GnbP+hEy_J+vNsQgwr6qK5oQpDCaszqOkWmrcKfupAgw@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] arm64: dts: mediatek: cherry: Add configuration
 for display backlight
To: matthias.bgg@gmail.com
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_234430_614066_758BC22C 
X-CRM114-Status: GOOD (  11.54  )
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

On Fri, Feb 24, 2023 at 4:52=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Thu, Feb 23, 2023 at 10:56 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Configure the hardware PWM for the integrated display's backlight:
> > all Cherry devices enable the backlight with GPIO82 and manage the
> > PWM via MediaTek disp-pwm on GPIO97.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>
> with some additional patches to enable the internal display.

Matthias, could you pick up patches 3 and 4 from this series? They are
independent of the other two patches. Having them picked up would reduce
the number of patches that have to get carried for testing and resent.


Thanks
ChenYu

