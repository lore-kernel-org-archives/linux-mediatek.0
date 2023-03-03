Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA37C678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 06:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sY40wTgLWqE1HWG5gSrcD3SfOE1S6aDb/jRZfClrmSM=; b=JR4fZa7bwMA6FO
	LDMTkEOY3H4VXNoTuKzITd8suVjDBuh+CdZS18zzK6O9QyhR7z4lltLKIVP7HFcc2pCKSsV0tzO0u
	C9KepN4zegmC8vyYlA2lLHQt/CDsDbuLyJ19Cf9TRvGVYKFpPuG/4t7Xo09B4GPo9NlwKn7vQ0Hnm
	AWRLI/20sjE+QVAqxHce9k5wIza3M6NsXqk4oZuQB+JIVp0/dTAB05ji0Y/sG0dO71nFRNR9mfexK
	syffiwKtXifIS56sm3BUCAYiXQJVc1yWOcQ9qNW4EBaCl0Owu2l8Moxp99GFJw53DzvYM+qZ6Cci/
	JSBv/Ur9Bxo8fF/tLreA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXyVT-004xoT-0P; Fri, 03 Mar 2023 06:03:03 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXyVQ-004xmm-Iu; Fri, 03 Mar 2023 06:03:01 +0000
Received: by mail-oi1-x234.google.com with SMTP id q15so1002473oiw.11;
        Thu, 02 Mar 2023 22:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677823377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sY40wTgLWqE1HWG5gSrcD3SfOE1S6aDb/jRZfClrmSM=;
        b=kuZNbXdE6O4INKyXCNzVS0kV/bVcXLFhWJPzILeewXEyHshXoSxVCkzZ+xHvDrSctK
         0h1y79PnJ0TpzAPQHFHhIaS575c2ixyvfRpQfaga1ATI2srYbYD7y9xr0+jJwoezuI/E
         S/AZ72AGafYESH+jKUTDIZa9uvPHvKDnPPjtfZ9m9FxuqxPaBE5AJq5veUjwTD3q63Mg
         LJbpWx5VPMlhgf9h5pZS6p2UMNiV8qddN7ddcq5SPHlKY7RnDz83hP3InszF4ZaM2N27
         +sEkiFB9LtRvPjuM5IvqIy+E2JyS2Xp0bdkY1A457eBwYCbrdn9LYPA2ZGdgWFxik+CF
         AVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677823377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sY40wTgLWqE1HWG5gSrcD3SfOE1S6aDb/jRZfClrmSM=;
        b=q5T7zSQXMFk+LnvpscxKVXt+5WiiJL7pKdfgGiJCkIwNMLEXlxMaA1vFDqouzUYTE6
         Pt4zm1QOnbM00A85CISDs2V8vGCV+8LXjnUvs0uBdMlEd98rvALuLCQ83ZTq5YF5torY
         jkPq0+FIYJb2t4RJxbsTC1rdADbMd44FdKZHETIh6ae8m0MQYj+wyXxftNAHTOICrd5u
         huTpfbLS/mtlQM2sf/dZFzPwQR4Nw7/AkdqsTHTID4iakllD5Je6LYWrqtMGYbMC5HrF
         A46ggRxnq/Kx1O5HReV8o0lg0FGWbV0vFWLenhL+M6haZPBuJnsmEM8zYuKSXKnASAbE
         4cjA==
X-Gm-Message-State: AO0yUKXUfv/EaoQEtLP99cRP9na1QF/WMZ+X3q6L5pvcJCkHxfCF8rxp
	Q/p5C9jysmNaGYSNt4AIiBleskZRDEREoCeyx74=
X-Google-Smtp-Source: AK7set/PPBGBmqaFLu/x/7FEaM9awhg94M6PTTjS9Ii+pHqbbjJ24I27AlnH45802wz/elA/L97MBTJkOhhEpnCw33Q=
X-Received: by 2002:a05:6808:9b1:b0:384:efe:729a with SMTP id
 e17-20020a05680809b100b003840efe729amr201801oig.2.1677823376576; Thu, 02 Mar
 2023 22:02:56 -0800 (PST)
MIME-Version: 1.0
References: <20230303002850.51858-1-arinc.unal@arinc9.com> <20230303002850.51858-4-arinc.unal@arinc9.com>
In-Reply-To: <20230303002850.51858-4-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 3 Mar 2023 07:02:44 +0100
Message-ID: <CAMhs-H_Ydu=A8Dcy8L3KZw_32FNW5iCytqUJXqkk8ijzhLK1yA@mail.gmail.com>
Subject: Re: [PATCH 03/20] pinctrl: ralink: rt305x: add new compatible string
 for every SoC
To: arinc9.unal@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_220300_689154_EF8B523F 
X-CRM114-Status: GOOD (  11.55  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, William Dean <williamsukatube@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 3, 2023 at 1:29 AM <arinc9.unal@gmail.com> wrote:
>
> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
>
> Add new compatible strings to make every SoC, or SoCs that use the same
> pinmux data have a unique compatible string. This ensures that the pin
> muxing information of every SoC, or a set of SoCs that use the same pinmu=
x
> data can be properly documented.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  drivers/pinctrl/ralink/pinctrl-rt305x.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

