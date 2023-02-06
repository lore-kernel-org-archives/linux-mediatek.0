Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D51C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 11:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dx0rL/jZPMLeHFNkdGq3B0lHEAtTAwxRwYVBdLrzGf4=; b=z1cfpKGYxMaK3bfNxNJ2OEeCCr
	2+Hp2lDvKTZxGil5OGUt1mxqZ3Pg7Qv7qjBOZXcr+fGxB3kbQywmaLymdBw8VqqRsf5YrCT0nbBKp
	trq5CElZDqdIckZPtZusUMp6+Q4VmjcPByZV9I3swGDun52YIrqiwMyNEefRcQz+kusaVqTU0GvwZ
	K/syt+E20csrtQK3S02x737qgjjEQKz1AFqoyupoy/gwhjMUfsZPlwkHM2pQYTdoMHhdccOT9Sh6P
	KVi/KiLTJETlK2fAj517gvrvilJ8qYR3p5DSB0Pp1DPVHre35VJ9WcGJeZ5aAvUwoJTqk9pssysfF
	liRTIYGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOzQe-008FON-Vn; Mon, 06 Feb 2023 11:12:56 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOzQS-008FKR-AU
	for linux-mediatek@lists.infradead.org; Mon, 06 Feb 2023 11:12:45 +0000
Received: by mail-vs1-xe30.google.com with SMTP id k4so12245097vsc.4
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 03:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dx0rL/jZPMLeHFNkdGq3B0lHEAtTAwxRwYVBdLrzGf4=;
        b=RpSQ3qkKIePil2cxOGelPztIhxlANWmbbwU9RhBul5avvUPj+q0M4uLMEDT1sHKyEz
         mjG/rfEWMAlTbf8tcDgE3qtg1IZh5leZoM6yiEzP+c3SziJCoQzPCVrZT7H7+zBMiFqf
         B7aDf+yrPUXxtDA7GvjM0Qk87Haq0JB4MmbXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dx0rL/jZPMLeHFNkdGq3B0lHEAtTAwxRwYVBdLrzGf4=;
        b=OERwDXZixo9kmNfZx297B6zRTSe1I5/S1r3TB24RacXRj2d7nzTdwaj4l+GuNn9koA
         8OsDFDVi+FgEuYjcjU4kkwkk2j5ilisT8BGRa8wAm+cz1+z5HJdETAS78WQi4iq0lWNS
         e8VbGRYxG4eXTdT+XUGxVeFhAp6qPxH4K7zpKfpducyxzYzu+DpX7tuDgvf9PyYM7OBi
         Gx3HlcxXOnvUqAdpeavnx3Uy2kR85lgNFHrC7p3FII4KLdTpEV/+ycUmAsuNgZQVaDSN
         K8t+79IOHDm+vU5CthecA/P5RVV13bwdk2FvhjfCa+xhbb0+HHQBm9gKzp4NPypL0bCb
         tGKA==
X-Gm-Message-State: AO0yUKV5uAXFYffUrTelb9X18NSlrS7R7Jy8YH0W/SQmMpQ+n5C9vzHr
	QcNgL41stWL7+uWrlHEmcOOExOgrfJiFJVTUhU67JA==
X-Google-Smtp-Source: AK7set9deAUpwZvkISTP2kzU9X7LTaqj94p/drhOTgA6z/VsK90cwJfx1qsalSnu41+dWRZbIWESyD/aiCDW4pwFflw=
X-Received: by 2002:a05:6102:322a:b0:3fe:ae88:d22 with SMTP id
 x10-20020a056102322a00b003feae880d22mr2920661vsf.65.1675681959294; Mon, 06
 Feb 2023 03:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20230206091109.1324-1-moudy.ho@mediatek.com> <20230206091109.1324-3-moudy.ho@mediatek.com>
In-Reply-To: <20230206091109.1324-3-moudy.ho@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 6 Feb 2023 19:12:28 +0800
Message-ID: <CAGXv+5G+VSV=NLF9-+Z88JR+Cr6t=RGweZ88DA6VJN7-aoAqVg@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] arm64: dts: mediatek: mt8195: add MMSYS
 configuration for VPPSYS
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	"Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_031244_404352_AC8E757E 
X-CRM114-Status: UNSURE (   8.40  )
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

On Mon, Feb 6, 2023 at 5:11 PM Moudy Ho <moudy.ho@mediatek.com> wrote:
>
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
>
> With the change of the MMSYS binding file for MT8195, the compatible
> name of VPPSYS in dts need to be fixed to match the definition.
>
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

