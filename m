Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FB7C38142
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 14:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvTqSv9IiiqJO7FY0k9EPMcUo95Z2K5HRqvuXpd73A4=; b=mTbsbZO0TKbJNew69rLaYifeS5
	IHOZ/7OZZZ+SSJbKUhrVwKDTd18t5/a/92DNsp1dJ0F0dsF2OnP0fxYdhiYOFjo2ciigmj+ZsnXhv
	cuYZ0lWaQ47wkhIsvidpGcC6No3/OoKgSsUKX4ILtfzEYyY5VxouGpyphzrATfWf/0kL4sKGWgpY3
	RlYHvCQa2nj63yeQz1sRGrjxiNt5Ru43iaPiRA/41sw+17IxJoomX4NOP4Yfm47daYKqp8FgssJc7
	67zrZMxXyBHcwZrmMQ2Oga7esD4NQO0Kf4WBXMAZ8UODVGSrM/hwvH5rJ5IeBRjQWVM4StpsBif3X
	L/o8MEQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyHA-0002lN-AY; Mon, 23 Jan 2023 14:58:24 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyGz-0002je-Ss
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 14:58:15 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-4fda31c3351so146072597b3.11
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 06:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvTqSv9IiiqJO7FY0k9EPMcUo95Z2K5HRqvuXpd73A4=;
        b=weCELVEjnhgirLS0yfICmHlYM1tJJK/1wLN12zzmlA69lZ/8m7OZl49Sz1klvbgzoU
         ne/WEVg5nXjUUCYdrmxXAnOYWpxrm0aQPTqm0gFH1HGewVCAs3YecycYgaTPaBcocZW3
         UizWpTtV2T6B1V0KueIpIOc5VABYaNPLZNPyDWZEV128P67OAl5aVs6DoR1asmQAwz5R
         CLePFN0oG16pKNmhr3T1iga/Y2bQK58xHS9mw4iNNDJZUnmUehfF/q+DX4P+TplSGWVR
         Mz22E+WC/kxzVjbef1FVlrkj46Nq11iZ4Wa8Q+Qp0DLV1m0TzVzc8/5c7iaHVfV6u06g
         Rj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvTqSv9IiiqJO7FY0k9EPMcUo95Z2K5HRqvuXpd73A4=;
        b=zIYDGNK/SBCVSQVNZ3MIRs7LB8XpxPPkuZ1BFKkgm5n9kYxO25/fn7wrel6Oktztzr
         VyRuungq6N/kfHE/nvgtOpntDik5l2hSKumM4PHUdKllaBqUkonT5NXhPJaR5j4P3ddX
         Y+CoDshmQcbVoYiuFrehzF7onZwzaSiBm9Z/8+6E6Kxv2aqR8NUSRfjz1UB4Py/r6xS8
         CM4tmtxrgQUX1sP9zjpCy1DcngQ5PfxHHRkS5CkpAm3+BIVPkLjG/DmBVToL3naIKjGE
         h95kfvybTG47je6jsG5/RR0NuSDlpfy8zMd8H0eT1p/YEnd5wJkdYZnwqwDEtXZT4PLn
         o0+w==
X-Gm-Message-State: AFqh2krodYXowauCOKKw4y59cqip7Q8MV5N57opnD9ng0VCtrlpufFm4
	4OHQ76ZkjXTa4j+mzNgfyhJMEe5Ra5HVm7zfEMOHLQ==
X-Google-Smtp-Source: AMrXdXvb8K7VSIORVsr8Qw4LbxKTz53T405uI7iUamoWMQKa2zwGzQKmuAxlkobEyafiMl05CCpJpwK2s4Bv3QBaFj0=
X-Received: by 2002:a81:11c2:0:b0:3e8:76df:4afd with SMTP id
 185-20020a8111c2000000b003e876df4afdmr2507306ywr.380.1674485890612; Mon, 23
 Jan 2023 06:58:10 -0800 (PST)
MIME-Version: 1.0
References: <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com>
 <20230120082054.610626-1-michael@walle.cc> <CAFGrd9qXL-u4XzG9MLK2zbKoDudhTYpr-gJaZPjbysJ9Fo2gnQ@mail.gmail.com>
 <2aa2ff64cfd3b5ccd1342873fffa6cb4@walle.cc>
In-Reply-To: <2aa2ff64cfd3b5ccd1342873fffa6cb4@walle.cc>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Jan 2023 15:57:59 +0100
Message-ID: <CAFGrd9pKuMsjmqg=mPsrwn=u7pCHdHEGaiW5PnwA_=TSte5sDw@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: spidev: add new mediatek support
To: Michael Walle <michael@walle.cc>
Cc: broonie@kernel.org, devicetree@vger.kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-spi@vger.kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_065813_957969_E5B09706 
X-CRM114-Status: GOOD (  19.26  )
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

Le lun. 23 janv. 2023 =C3=A0 11:44, Michael Walle <michael@walle.cc> a =C3=
=A9crit :
>
> Hi,
>
> Am 2023-01-23 10:37, schrieb Alexandre Mergnat:
> > Le ven. 20 janv. 2023 =C3=A0 09:20, Michael Walle <michael@walle.cc> a =
=C3=A9crit
> > :
> >>
> >> From: Alexandre Mergnat <amergnat@baylibre.com>
> >>
> >> > Add the "mediatek,genio" compatible string to support Mediatek
> >> > SPI controller on the genio boards.
> >>
> >> What is the use case of having the spidev? What if I want to
> >> connect a device with a linux driver to it? It seems like you
> >> just want to expose the SPI bus on the pin header. There was a
> >> similar discussion for a mikrobus connector [1].
> >>
> > Yes I want to expose the SPI on the pin header for two reasons:
>
> Then "mediatek,genio" doesn't really describe the hardware, does it?
> If you read that linked thread, NXP was also trying exposing the SPI
> bus on a pin header. IMHO this is just misusing the userspace spi-dev.
>
> That being said, exposing something on a pinheader (or on a standardized
> connector) seems like a common thing and we should be working towards
> a good solution. I still think Robs proposal for the mikrobus connector
> makes also sense for your case.
>

I don't think this is the same case. For the mikrobus case, it's
consistent to have a connector because it fit with other "add-on"
board which can be plug on the "mother board".
Here I've just a simple debug pin header. I've taken a look at
raspberry pi and Beaglebone black DTS, they don't use connector, but
DTS overlay to enable SPI. I think you're right when you say that I'm
misusing the userspace spi-dev.

