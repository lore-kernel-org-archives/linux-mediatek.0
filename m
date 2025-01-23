Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04700C02182
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jan 2025 06:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9bwYMmAg8VWivh0Q28h6rvauGMF0XnNE+msNjrnFeNE=; b=wvDdfiwYDABTzr
	gQrbwQvuf7PGGFlODZA1SQguKGJeIZ4b+g+YqKD1e++sKI/7pKV6OX4KGNPL8MDUhuPhLZV2hGaeF
	7ho1HIZHVRiPTbIQYO4VbeHIq8LcWrBn3rwSUFsFczKdg6ouj3mtXTorMexFYizfO1TnxVmr2nZHe
	ukqTFYgOhsVv+WFh/ZX01kAEunm1KaVoP6foZ7fLwwrWFoEdLkuNOXoiC+uIMQ2B3n0BXiSmsz5C1
	7pKcgJYHee2zSlzEIl4agVQ9++Uuhlr2QUL33WlsZZ/GbgrhePz76ehwdNSC/TbgLOd8GgL6eEnl6
	vsdCAkhFCCep2NXTwcCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taqfr-0000000BnVr-2eTH;
	Thu, 23 Jan 2025 06:26:43 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taqeW-0000000BnLE-0MRa
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Jan 2025 06:25:21 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5401c68b89eso615125e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Jan 2025 22:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737613517; x=1738218317; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bwYMmAg8VWivh0Q28h6rvauGMF0XnNE+msNjrnFeNE=;
        b=mc/Q3FqFTK83kBrrpmBbbYrN4J+YLk6zaIOrRPEuPl02/a9PrZTqjkQl2gtZeMOAOG
         snCzood5IHUCowy/9JqCXUWyW6aQ2ubA7cEM4ht8rDXv7PycKVkJv3v7Mi3ZDAHhxH7b
         P8fO5TUQcppLPdEvCyhwoHO+gtizc9YKKmHOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737613517; x=1738218317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bwYMmAg8VWivh0Q28h6rvauGMF0XnNE+msNjrnFeNE=;
        b=WXSPL4la1aXWtbBhlHiX8HddnIa7XnzQaJNx02s8i7Ku5xauyb63IvvgSYfDhMG7s0
         Fd0lb9ToRAn1hCX7cXG/upg+lR+hgknW7fDU5Qx+Kjkt4HhZxeWp5BHqGt9N8+SsJ+9b
         vtcmyYrTbvhIqRSe85F0k8GFyrce98ltkhLBrAA7KPNF0HuiEjG0pQd/pgoimCooDAws
         CvygU46KmtT3ezLzcKjeJ6rxjao+gdwOU4+GHD87CN9+gY/XTmp7zuLjOMjBBgV+kSnF
         JalqnW2EqGM+xjChiafHFVF27WVB9Gii7WOcpviYb7xlXpc0fkLstcSTNIMz7nI8tB8E
         Xgtg==
X-Forwarded-Encrypted: i=1; AJvYcCWD3nQmAVJHSzOrGYznFG76kLxM/RNMCJShFvJh7vKotnRmiovoHCNQhaD6ZnnRuQPCdu69HGgvUJN33yZApw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZib9qBiO4CjNqSHby4vz4B2u1JhqiRZPRWiVB3ph2GIwFKOGY
	+Ti3UgGei/S4ebg8262Nh8zhnwUT3Tp1tN7SrgDuT6T2kYu9Pj3Uivv1qfy8ytTHheFzSnf0DSR
	hlrdYL1QDJ317oW8PXyTuLo0EBol+tjT0uYYq
X-Gm-Gg: ASbGncsFx8z3zPePAOXa38ghIYcy5t7JzSAMJrbcUg+lm+45Uj3WxKvBGOqXZfdHeGH
	JLmJiqWSDOhV8cWpwfhNPqPnJ9S1v7bmhSs1xNIQPTUbgqvFO/YdeS8zExGJuHNmUJpNdY5QFcz
	eSi0MivwkeTiDh6HoU/w==
X-Google-Smtp-Source: AGHT+IFjV1nbatIBQFwYYLMA1abMLSRNx+Lvn+/q0MRJLEjGc9mVSRrS+HUSZbvSas2ijuwobcEMUWdONKDCpspTIUU=
X-Received: by 2002:a05:6512:128f:b0:542:8c7f:cfc1 with SMTP id
 2adb3069b0e04-543c21ff387mr771068e87.3.1737613517221; Wed, 22 Jan 2025
 22:25:17 -0800 (PST)
MIME-Version: 1.0
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-5-paul-pl.chen@mediatek.com> <173651725269.2671643.2891127782637834272.robh@kernel.org>
 <SG2PR03MB66367B4A9DBCC971F55DB326BC182@SG2PR03MB6636.apcprd03.prod.outlook.com>
 <d116e180-a056-4595-851c-ed1bb6f24cef@kernel.org> <b9405b09da418eb3c65592b53489d7f0dd4093f2.camel@mediatek.com>
In-Reply-To: <b9405b09da418eb3c65592b53489d7f0dd4093f2.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 23 Jan 2025 14:25:05 +0800
X-Gm-Features: AWEUYZkP14TqYWMXYt98_YoyRL5G3Oss74IUQkNsE40hMbKns2HVZ7v-H1NK9Uk
Message-ID: <CAGXv+5EhG+xnJmYj6kYp2hzgkX62HfxRUJZKc4_X-s09aBMvrA@mail.gmail.com>
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for MT8196
To: =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_222520_157438_AAF2C1AB 
X-CRM114-Status: GOOD (  23.33  )
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
Cc: =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, =?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?= <Xiandong.Wang@mediatek.com>, "krzk@kernel.org" <krzk@kernel.org>, Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, =?UTF-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "treapking@chromium.org" <treapking@chromium.org>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, =?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 23, 2025 at 2:11=E2=80=AFPM Paul-pl Chen (=E9=99=B3=E6=9F=8F=E9=
=9C=96)
<Paul-pl.Chen@mediatek.com> wrote:
>
> On Sat, 2025-01-18 at 10:22 +0100, Krzysztof Kozlowski wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > On 14/01/2025 06:49, Paul-pl Chen (=E9=99=B3=E6=9F=8F=E9=9C=96) wrote:
> > > Hi Rob
> > > Thanks for the advice.
> > > The root cause of the erroneous log message is due to missing
> > > power/clock dependencies.
> > > Once the MTK clock/power header file is upstreamed,
> > So this cannot be merged.
> >
> > Decouple dependencies or wait with your submission till depenedncy is
> > applied to *LINUS* tree, not even maintainer. Otherwise this breaks
> > maintainer's tree. I really suggest decoupling.
> >
> > Best regards,
> > Krzysztof
> >
>
> Hi Krzysztof
>
> I hope this email finds you well. I have a couple of questions
> regarding the EXDMA commit patch and decoupling:
>
> 1. Would removing the example from the EXDMA commit patch be sufficient
> to achieve decoupling for EXDMA YAML and MTK clock/power header?
>
> 2. If removing the example from the EXDMA YAML is not allowed, what
> alternative changes could we implement to achieve decoupling?

Just replace the macros in the example with the raw numbers, and
drop the inclusion of the header.

ChenYu

> Thank you for your time and expertise. I appreciate any insights you
> can provide.
>
> Best regards,
>
> Paul
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

