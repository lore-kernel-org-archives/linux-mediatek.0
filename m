Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF051C677F1
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 10:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdaiFhugD6+oPaJhwaL4Kajgsb7fLINSYFgd7bDk4J8=; b=T20fGKgEv3j9S1be6KL2Vsoy50
	XDOuuOQ23M663X5SVh/IXbRdRnU+HYSEhFGzL6BmCz8OozcbRCU/8y3vD16TdqzDz6FYefGBN7h1M
	Z+JMPWsnXeBVXVjC0o5W5BjZ8PxIyyQ5s07838tpw7r01DuBRYvz/rXl2zG6uHQ86ffyVHzCTG7Er
	DqV1lQ3HlejcM+mVgobhnAci6oDQAW3vWYMk2c9q/D10gKLyc+ziGrI76YwLJqzgjxFAfS5/S2Oah
	Ha5n0Z/O0a1xg2OgBKfdgtaTplqaROq2dEEMdVq2IY0IZ9DIkxTryAK4fqLORmsQfscduKjJJTuHi
	ByGwQJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFuZC-00EWtA-Vg; Thu, 12 Jan 2023 10:12:15 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFuZ2-00EWp0-4P; Thu, 12 Jan 2023 10:12:05 +0000
Received: by mail-ot1-x336.google.com with SMTP id x25-20020a056830115900b00670932eff32so10303349otq.3;
        Thu, 12 Jan 2023 02:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdaiFhugD6+oPaJhwaL4Kajgsb7fLINSYFgd7bDk4J8=;
        b=D6929yU096JD5AfK5EnzixHXiNvJbcDjIam7feV518ZFPQ6LVTQh5wQIhG+OgWPiRw
         KvLXMi97RsaXG8bTb3+V56xQKO4wlgzrhRd64S8cS9kQnyLAlgmhOikgWH1PtOGq3TlG
         lIvP5HqZfj4l08Ki6geXDihjhmOt5p1udP93sv5SKL8q5N1HEaJSDwHAMEd10sQStEeR
         QYyLm8JAvEX+LhUQgRu3nEQGJtb2ehJYr3DSgH0qofHyay7TvmGejEX5GjcGOt0XfgSt
         NFZbmf4PlO8vZ/H98VLaBUhuDiLeFCq3lIT3juTqm2DutAJtg8mz26hz780GefQO9mYs
         nEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdaiFhugD6+oPaJhwaL4Kajgsb7fLINSYFgd7bDk4J8=;
        b=hzfDAAol6MHeiRJi8jKt0H4s+B15D5BEZrFzFltozG3LBn0motU9gD35oS4H+AnpyA
         aOgZedB3jTLOdImfbrZoBpWmJ/1jigkcKns5OFzfJt4Am5P7nxgjK+X0MzQxJFQqCj9p
         SHOuPGc1EanAhlHF8vyOCMs8dSxRhiV+ReNo/F2FtwFbiQ/RvLVU9p/dRVCiwBvaO2fb
         JvnoYPKPiMAkltUBGAqjkta+HRdWAsPLEypY7IzpLrqFc4Sb6+tC25XvxVSbzuhBuWA8
         3IA85wPVwKwXSGmJqMjBIZmhuTtPdIsPtFNiYE1cX0H7QDsyE1NaSRnGANgoAwI2l5rf
         jLCw==
X-Gm-Message-State: AFqh2kriysvpOlqjFNciBXGLyadsJT+cnF86OYsMQXcfBZBingaomxUH
	NqfSkiB+P0jpbJlfDEXCRhyH5q/6afIteRyU44I=
X-Google-Smtp-Source: AMrXdXu4i8RZ9oUXZZSSmOvejAHMluXivRyO1ot2lck+WOreatEKCm4GQt8+55NYUd7PhqhGQaNxDyqmW1WQ2gYseuU=
X-Received: by 2002:a9d:75d5:0:b0:675:4bf4:dba2 with SMTP id
 c21-20020a9d75d5000000b006754bf4dba2mr6017172otl.304.1673518314006; Thu, 12
 Jan 2023 02:11:54 -0800 (PST)
MIME-Version: 1.0
References: <20221231160849.40544-1-arinc.unal@arinc9.com>
In-Reply-To: <20221231160849.40544-1-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 12 Jan 2023 11:11:42 +0100
Message-ID: <CAMhs-H848zZRtnGjaEty4+0DmD69rN11FHUfrd7xQcaastfH3w@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Enhance Ralink pinctrl documentation
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, erkin.bozoglu@xeront.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_021204_195164_AC6C614A 
X-CRM114-Status: GOOD (  10.98  )
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

On Sat, Dec 31, 2022 at 5:09 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> Ho ho ho,
>
> This series mainly enhances the Ralink pinctrl documentation, and make a
> small variable name change on the subdrivers.
>
> I've compile-tested all the subdrivers.
> I've tested the dt-binding changes with:
> make dt_binding_check DT_SCHEMA_FILES=3Dpinctrl/ralink
>
> v3:
> - Changes on v2 were put on the last patch. Fix that.

For the whole series:

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

