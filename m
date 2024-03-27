Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A56C54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 11:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J224BoJrNGTFOuXukBbi0+FhCHvvUryxq1OLTe+bDRo=; b=0Ea68+D0ilUg7EJov+6CX0Nfss
	sAMZyZCWuTmjjDyUG0RnYn5KZ5zJGS9ZPtOr9R6P7evcqLZ5uJuvi1nX+ZRDCodcXsm98QyxydqLF
	A5KrLpto+YQwT7u1uZkUOJYFS8N79+6waOzBiXeeWjnhU/cmn1wKi/5BVJMQQoQr3McYU1k2tkmf9
	GOG+1Hzq7eY2ma/ptXUSiHnJSV2Fi9pyKWuHuMVj4pKyvlDknVJdNTQiemiCDjnLkzWcM/bO+WNcO
	8CgvIW58RXUVrjzY9gEyqVPiu4pMKGdsqAYUEOndZhTfIvpjP1e8Fn7A3ZoQNL1NwUNXv3sYgJo00
	jtu7G1yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpRsW-00000008gkC-2NpJ;
	Wed, 27 Mar 2024 11:55:36 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpRsR-00000008gij-2MgF
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Mar 2024 11:55:34 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-609408d4b31so65768627b3.0
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Mar 2024 04:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711540528; x=1712145328; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J224BoJrNGTFOuXukBbi0+FhCHvvUryxq1OLTe+bDRo=;
        b=T35OJAggsNPzzDZ4fD1bZTjzEeNudLeyVr03qQr/uJy5uWZ/ERpDYCo7mlMNRJYDKF
         dTienzmrxeWPFE0iI5pZt/cqd2qhG7dDXNQU41hHzBaxHpwhldcNAP5E5bOKLyJfh9OZ
         bKWffYKPbPnpRKZ3c95DwCXRAR1EfA9hFc6CSXSIqybaXHbMMkjCOXTyKUCOChMRLuau
         rvmaiUVG8OzNtVaW+kJzbgZ476ahjdUuqGs9uIP/Ll/RTWNv90j0nU75TliqN1xMQVve
         v68Cdt1yn3sA1mlr+PBrZQ24N8bfr1GDyXu1lYymrw5M92hRCXu5BxQm5kL7EXVb0yPZ
         ZrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711540528; x=1712145328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J224BoJrNGTFOuXukBbi0+FhCHvvUryxq1OLTe+bDRo=;
        b=o4b0z6LDCFLlS6XuZzps0/Pf4kCXT5bFdmUvmlYfO6IMZJkeHqTx1przTHY9bgkROz
         QbZsIpuvOb3Jrw9z0Tv7pN8Xb18qOSUxuBLIT8Isvj+tuFsKv+ENZ9FwyTyCiKnZ9BZc
         jBEhHnJSDvs/5ou0TlQQyhYkuLBmGLSLYwpbS0gNzIJXV1gheZTjbmdMriB/04G8Mp9S
         HIj2I6mTMbOSgPa8nj+H41DHz/ZEOx9j2AQWcdSlA56UVCBmKb2MDjX4/mPcqoe2jdB4
         cXTyf04++mO1o+bDT1iO3cXaZRl+l/+bX27XjOolNxtpa9aGlPPD4wL+pITkvnUU0wJA
         tuDA==
X-Forwarded-Encrypted: i=1; AJvYcCW38AxOJMQdnN/dFyw9gwzsCb1uylApxGMBMqofFgZbzixSYH+1LhGe5f1+O6yI1U+/aKzH7ithDHgtgu3AMiQ6nfTkECa/V1e4cQQ5ocv2maKG
X-Gm-Message-State: AOJu0YxNFp8RfdP5mHRKM2OAKFJMMJsHGhTklZrS2EwLxxS2HWwbMDmz
	3eIc2qj2RgnwFMpEEk8guoCfai8wW1pycTfVM2mbke2JZ34FBF9BrEznN4EtATWjcUMh4BJIaxf
	0+JA6M+Ndfqamv2nLj3E2RxskNV/1tHPEjMy0IQ==
X-Google-Smtp-Source: AGHT+IFgg8nhk4AaTwEdQScNnj0lCNbPtx/6BKknBGcKv6QaXtQ3UUhwr0ao7SYZYJqXqXdru/t/sWxXHWLNFIXrVzM=
X-Received: by 2002:a25:144:0:b0:dcc:417f:a85c with SMTP id
 65-20020a250144000000b00dcc417fa85cmr2285561ybb.50.1711540527892; Wed, 27 Mar
 2024 04:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240327055732.28198-1-yu-chang.lee@mediatek.com>
 <20240327055732.28198-3-yu-chang.lee@mediatek.com> <6dd9959e-f741-47af-b10a-1894f72ae78f@linaro.org>
 <c3ca3d90-898e-44b0-ad0f-dd78c09c5fcd@linaro.org> <f3eedfb3495bb9c28b5cbf466387c24822c5b6f6.camel@mediatek.com>
 <7ff9c4c7-3b56-4a5b-95b7-c37cbf8bcd6d@linaro.org> <b957b072d5d88ed315982e914a7f700e0ccafb83.camel@mediatek.com>
 <038ccb20-71cb-40d2-9720-ce1a0d3eac8c@linaro.org> <7f24ca2806a7199e4de6fad17b8dc1f127c82180.camel@mediatek.com>
 <c59f2f33-ad6b-469d-96be-9345920370b4@linaro.org>
In-Reply-To: <c59f2f33-ad6b-469d-96be-9345920370b4@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 27 Mar 2024 12:55:16 +0100
Message-ID: <CAFGrd9qZhObQXvm2_abqaX83xMLqxjQETB2=wXpobDWU1CnvkA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: power: Add mediatek larb definition
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <yu-chang.lee@mediatek.com>
Cc: =?UTF-8?B?TWFuZHlKSCBMaXUgKOWKieS6uuWDlik=?= <MandyJH.Liu@mediatek.com>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	=?UTF-8?B?WGl1ZmVuZyBMaSAo5p2O56eA5bOwKQ==?= <Xiufeng.Li@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	=?UTF-8?B?RmFuIENoZW4gKOmZs+WHoSk=?= <fan.chen@mediatek.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_045531_807115_EB5F0AD2 
X-CRM114-Status: GOOD (  25.00  )
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

Hello Yu-chang Lee,

SMI LARB must have a power domain, according to "mediatek,smi-larb.yaml"
Now you try to create a link from power domain to larb.

Here is my understanding: when you enable/disable power domain, the
larb linked to this power domain may have an issue. Then you want to
retrieve de LARB linked to the power domain though the dts to manage
the LARB. IMHO, using the dts to have this information into the power
driver isn't necessary and may introduce some bugs if the LARB node
and power node in the DTS aren't aligned.

It seems not implemented today but during the LARB probe, it should
"subscribe" to the linked power domain. Then, when the power domain
status is changing, it is able to "notify" (callback) the LARB, then
implement the good stuff to handle this power domain status change
into LARB driver.

Regards,
Alexandre

On Wed, Mar 27, 2024 at 12:04=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/03/2024 11:56, Yu-chang Lee (=E6=9D=8E=E7=A6=B9=E7=92=8B) wrote:
> > On Wed, 2024-03-27 at 11:43 +0100, Krzysztof Kozlowski wrote:
> >>
> >> External email : Please do not click links or open attachments until
> >> you have verified the sender or the content.
> >>  On 27/03/2024 11:39, Yu-chang Lee (=E6=9D=8E=E7=A6=B9=E7=92=8B) wrote=
:
> >>>>>>
> >>>>> Hi,
> >>>>>
> >>>>> I will double check the format of yaml for the next version,
> >> sorry
> >>>> for
> >>>>> inconvenience. But I did test it on mt8188 chromebook, the reason
> >>>> why
> >>>>
> >>>> How do you test a binding on chromebook?
> >>>>
> >>>>> power domain need larb node is that when mtcmos power on, signal
> >>>> glitch
> >>>>> may produce. Power domain driver must reset larb when this happen
> >>>> to
> >>>>> prevent dummy transaction on bus. That why I need larb node in
> >> dts.
> >>>>
> >>>> No one talks here about larb node...
> >>>
> >>> Sorry, May you elaborate on what information I need to provide to
> >> you
> >>> or it is just a syntax problem I need to fix?
> >>
> >> Please explain the purpose of this property (how is it going to be
> >> used by drivers)and what does it represent.
> >>
> >
> > It represent SMI LARB(Local ARBitration). In power domain driver when
> > power on power domain, It need to reset LARB to prevent potential power
> > glitch which may cause dummy transaction on bus. Without taking care of
> > this issue it often leads to camera hang in stress test.
>
> That sounds rather like missing resets... or something else connecting
> these devices. Maybe the explanation is just imprecise...
>
> Best regards,
> Krzysztof
>
>

