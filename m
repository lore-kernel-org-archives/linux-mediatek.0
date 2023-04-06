Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9E6C76196
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 13:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1F0yI3E1CQNmz995sNOdh/ir2YtjdzPAog1Ec7AoykA=; b=NWJWcciZ4+RJ9Dd9nxJRHkvV/M
	SM+8jsgaNl0QP7oduCamA2EqsjhZHeChNAn97OeWKBoh89OCjr6Gp8ISXmjq1+NOXdaUSu8MH9rro
	68hocl9/NL1ErnuV2t4lcyDsujecK7OdSItlNqhGdjbYps9+SiKrUq9pTyRLzK9WPnleK9o+r/fWG
	V8hAkgvI1qor3Rgjcuu48aPEXlWMTIjmG8rjqBh23rM+nCT0L12Jy+nK9B5TAaOEfMuPgx3lr1Mdx
	gUGSwKXP9TDgIo484znUz4FUbyTmcNnweGJwSTf3fW7KKVcGfmvuyfdopx1Ouo6V8qoLwZp7aKUJl
	OXCAq3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkQ6T-007TWi-2V;
	Thu, 06 Apr 2023 13:56:41 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkQ6O-007TV8-1t
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Apr 2023 13:56:38 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5416698e889so741403917b3.2
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Apr 2023 06:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680789394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1F0yI3E1CQNmz995sNOdh/ir2YtjdzPAog1Ec7AoykA=;
        b=nX0GwtTQofUtPCN+McLLwMkSmfBCkm/U3cGZSJVHFiruDVICqE/r1hT1z8/nEJnCN5
         RCgbVef1BZX/8VG6u6zUQExgJ8SE6mYoM9EKXBE8EULybXR+23JMRQyMIgiYMx8GmZYK
         4TXHBWXXutdCHd0vwOKsf5ab/+1EGQ1xZnASNhDZANBmnL2aPJFNlNb7s/UuZYRNymL7
         epKayD6T/0LXXzAUNPYwle2geQpXwGPppPpgJVPwZGbiPyRcMQ2WP/gTYBsSkTAa/15T
         cOxxw8YNi5Jzbd8jb+g+kfcPeailD+zmAhZgFyh7WKm/aQG4N5mYrtAkACf2oNB/iLMs
         FjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680789394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1F0yI3E1CQNmz995sNOdh/ir2YtjdzPAog1Ec7AoykA=;
        b=q2oABxh88Haij4WQHnnK56OMjhXlpx2XRXTErMy6h8K+er6+uwkSHVb9LZms9+KwUz
         FRufz7Q0CPGS246lPZ31P9BvA/pMk1dSa+4K2VL9t2oCZWh5Bba7da6QWET7P56EmuhM
         sFi+i95z2Waa+ze4Ak8kDQV4a4Tg4rtkZDaAhpDYHIAluYKb/YMDOiUV8uK1+k5DzfQy
         eV8EPWyMaCdfu9lRXYVMiPyijtVXXornXN8GyudsqfErgIv5kqr79Xgt+zQUAWa1pTBg
         HyZu6RTez5+bzEnziyjwnLb6DQX91CM+w4i2UMdBnnsdManR6rCpwXHfL1ahs7zIAtZt
         zeqA==
X-Gm-Message-State: AAQBX9eif2IpdpjErxAU3Z+dOe6kUAD9VdREJ2PmcTCx9zfCSvDjk0hj
	sX0tCFyjgRa2m9gAG1SaYC/cG6Z948o7rhq0r2YI0Q==
X-Google-Smtp-Source: AKy350Z4IW/PHp8g9QPnxFCQ7HxW3nNx4wpRyy6GLid3VsQm6cri1SA2/1Mu692qSIdY03ejAKfL+FQGqTsNYbqPp8c=
X-Received: by 2002:a81:ca44:0:b0:540:e744:13ae with SMTP id
 y4-20020a81ca44000000b00540e74413aemr5753784ywk.3.1680789394514; Thu, 06 Apr
 2023 06:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
 <20230207-iommu-support-v2-10-60d5fa00e4e5@baylibre.com> <9847bc48-c96c-3599-e876-bcf9ebf1522e@linaro.org>
 <CAFGrd9pBdaHLGUZHkaz2_XKafyX=dxu9UckQxrphg52EG=A1SQ@mail.gmail.com>
 <8fc3dd22-79df-32cb-c219-896eda8fa986@linaro.org> <fd24877a-5fae-5434-dc56-61ab35ccd820@baylibre.com>
 <e38658be-1a2a-bccb-3f30-18f1b031f71d@linaro.org> <25bcaa84-fb29-4343-d046-26e210fc81f4@baylibre.com>
 <d25081e4-69bc-74db-bdf1-5f1f2d2c794d@linaro.org>
In-Reply-To: <d25081e4-69bc-74db-bdf1-5f1f2d2c794d@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 6 Apr 2023 15:56:23 +0200
Message-ID: <CAFGrd9oe5cEbprdT-uLtfchpmbyQ9=g61r55kDQHGb9vdmw4zA@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] memory: mtk-smi: mt8365: Add SMI Support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_065636_847273_EAF6B8D2 
X-CRM114-Status: GOOD (  28.18  )
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

Le jeu. 6 avr. 2023 =C3=A0 09:50, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> a =C3=A9crit :
>
> On 05/04/2023 16:34, Alexandre Mergnat wrote:
> >
> > On 05/04/2023 15:54, Krzysztof Kozlowski wrote:
> >> On 05/04/2023 15:06, Alexandre Mergnat wrote:
> >>> On 05/04/2023 13:45, Krzysztof Kozlowski wrote:
> >>>> On 05/04/2023 11:53, Alexandre Mergnat wrote:
> >>>>> Ok, I will move the driver patch before the DTS patches in the next=
 version.
> >>>>>
> >>>> Or do not send it together at all, which might solve your dependency
> >>>> problem. According to your cover letter I cannot take the memory
> >>>> controller bits, so I am waiting for dependencies to hit the mainlin=
e.
> >>>> Alternatively I will need pull request with stable tag.
> >>>>
> >>> Ok, I prefer send the driver patch in another serie. That will solve =
the
> >>> dependency with the DTS a least.
> >> What dependency? Why do you have dependencies between drivers and DTS?
> >> That's a no-go.
> > I probably do something wrong but, that start with this comment [1]:
> >
> >> I guess we should add a independent "mediatek,mt8365-smi-common".
> >
> > Then I have added the mt8365 compatible support in the driver instead o=
f using the mt8186 which already supported and used in the v1.
> > I change the binding and DTS to use "mediatek,mt8365-smi-common" only (=
no more "mediatek,mt8186-smi-common").
> > Maybe "dependency isn't the good word to use in that case.
>
> I do not see patch changing existing compatible. Which one is it?

I was talking between the v1 and v2 of this serie

>
> I don't know what is your meaning of dependency then. For all of us,
> dependency means one patch must be applied after another patch. So is
> this the case here? If yes, then why?

I don't think so. I think you start talking dependency in your 2nd
reply about driver/DTS, but this is only related change.

>
> > Except for the patch order in the serie (or send the driver in another =
one), everything is fine or there are others wrong things ?
>
> If this is the question to me, then I am not the maintainer of your
> platform. I am taking only memory controller bits, which look fine and I
> would have already apply them if not the dependency trouble. Soon the
> window for applying will close, BTW. We are almost at RC6.

The dependency is between the power series and the DTS change in this
series as explained in the cover letter thread (PATCH 00/10).
IMHO, you can take the bindings without worry. I don't see possible regress=
ion.

This series seems pretty simple, one part adds MT8365 SMI common
support in the bindings, the mt8365-evk DTS and the mtk-smi driver,
and there are no exotic stuffs.

To conclude: I'm ok to send this driver patch in another series and
put it as a dependency of the iommu series to answer your first
comment:

> >>>>>Driver code cannot be mixed with the DTS on branches/repos, so such =
ordering suggest your patchset is not bisectable.

Regards,
Alexandre

