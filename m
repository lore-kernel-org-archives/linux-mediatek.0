Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8073C369D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Apr 2025 15:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TC6Uw6VHl8li0pKtOZq0F1Vqk2LcExMB5Btz+dNIGMU=; b=1M91mB3CuI00Y9fNQ4LuVDCsW3
	21AuHkKyp5b3rPF8NwUyDnPpaP1OWiTsOhfaUcXq1FQ3jnK4y1Y2JWA05lemFO2li+RzbXGxnCQg6
	lQV+S55V8EW/zVSbkOn+ioHCsSJWQ43Mb7YTDGpqnG72kPn4QtxMAIyWi+B/nrpUSSZ9PzGgpP2lv
	2T5cbn2mp26fQk0h+v8zGX3j4SDKk/R4X7yO6S/wANdshQUksJxGCi4dAOfzd/9cyNvAKpjYOT4Gv
	QQCmHbLtlRXsnBiJ1xvdNSL+MCVid5U9aQ5FGSMvNUjsw2sqgajOS9OcEFCzYUmP/mmve+4+EMHKX
	j8jvf6Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA992-0000000DFcR-1i40;
	Wed, 30 Apr 2025 15:14:44 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA96j-0000000DF7v-3MtR
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Apr 2025 15:12:23 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7c560c55bc1so887461085a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Apr 2025 08:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746025940; x=1746630740; darn=lists.infradead.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TC6Uw6VHl8li0pKtOZq0F1Vqk2LcExMB5Btz+dNIGMU=;
        b=ohx8Tl1bXlZktUoy0ZTF3kOkoB2H93vCHyTYUcvwxYtxMTvPJRtwXQKKJGpcUtBVP2
         h8F713+UxfeiJZo9UI6ZCgGlpH1oDCxZLdcFzyG6cW1TXEUYNsPr26U/GEZquO39RDQN
         GbLy8zJFsTT9pDX/cgcV3sVI2kflKcDzbxdPtRTo/F0Oi7IREvNXeIYOhb1dqyouGNOe
         8JW3yUz5mPk9GlDy9f0NXe9U8LdGZXPTppWVbDNtdbMrTVvi2Oes3sZHuhVdBn4Jl3+D
         0/+mY6YVJW4CUvqENrjfUuaRNzhOsn8xdRB862Axa5NF+dSZl7YpaAIPra+H3Np/H70o
         GZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025940; x=1746630740;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TC6Uw6VHl8li0pKtOZq0F1Vqk2LcExMB5Btz+dNIGMU=;
        b=QmjXKgirbWzNodFGJpFn7LnR4+Cc5ECXCFs5U4bIpe7HTuWmoPBbJix0DujxeIFnlE
         gaSDDT3RqDxPQozqc84nzCxDyiA0anCbai1enascxda4vW9Rbyp2MV6IvsBUqxgKbVOJ
         mQHQR2PSc5aYtr7ujBLVex945ctwSrI1qr/DXvG7FMNenSfAIWGUQWFIaKhNPlKT1xug
         OWmd8inXpnoi8A7FPRmIBemBlB4eul9GPQ62r+DYHF1X0CT4sYRjc/DNNzyatFAjszWc
         AVvTwwXpds4suirFdioy7WAAF8/LyUDinb36T5sBM4by2qWaajDpbJNuGcj+lsN+SBFE
         Ettw==
X-Forwarded-Encrypted: i=1; AJvYcCWmfxiwqIB+NZG+j7n3CIqdFN+P+sgghA05ku+pmpAddVUuH6GvZD4/phJMO/p/IySd3OXX7/Q6VYah4t9aTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwL38+elooQURx+FMjLbqhETGeLtz5O6exqVgvgG+sl0gOzJslx
	Oe2NwycnuIz3hdPfZhvIEKah9x01yx7vd3X/UDp61GDCbcLsgFAVKXVTllVxppk=
X-Gm-Gg: ASbGncvBWNxJaPum9350Wujb5KBMz5j5QVW3qs8Rxw814LWSNNjl9sXWNYbbyMCd5Ac
	fxUtv7SaKANCkpNWuLckQCFWRejmtrGQ5SVx3ANbH1i/Ph+qOsMAk+AnVbQH+GnXmkRtxV6GOb1
	6iEYX6EQbBfomuD3WabEZ4kyxQ7Rn8WCi+x6DPeUA4KCnBg979EmDW8aVmhh7KG4Vj6vKA/maCj
	JuSsatLc+MXVsN/V1DjjVAz0XgeOrNET8BpK3Dn826k3YkPeYNQ37uJrb7VPjp/JPgU0FmYZWyZ
	Js3WrzfGZvym9R+Ay36TSWabyfRm2MkRjP5SK8B3/O2Ao89jDGXlss/PM7kZQ9mZX0yIDg3raaI
	bfjbzTKsQu5nKFw==
X-Google-Smtp-Source: AGHT+IHejdBgJxFkwA7njESQOPqDseqqXtDwdi5F8ZnCuvJTa7m8szFKeMzP1F7/ak0b3riGu2KuKQ==
X-Received: by 2002:a05:620a:4555:b0:7c5:55c0:db9b with SMTP id af79cd13be357-7cac76a2dcdmr485037085a.58.1746025939914;
        Wed, 30 Apr 2025 08:12:19 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958d86d65sm868396085a.86.2025.04.30.08.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 08:12:19 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:12:18 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
cc: Matthias Brugger <matthias.bgg@gmail.com>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, 
    linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dts: arm64: mediatek: mt8188: add more thermal trip
 points
In-Reply-To: <2ddff946-9c4c-4fb5-a8e7-b2fc413ae281@collabora.com>
Message-ID: <s8o2npos-6059-3o54-5o31-0488rrqs50s2@onlyvoer.pbz>
References: <s2sp5o57-o534-qso0-2733-o0prs6028por@onlyvoer.pbz> <dcc62684-0579-4d03-a430-d4a276153ca1@collabora.com> <85710oso-p1pp-647q-498p-23583s7nnn45@onlyvoer.pbz> <2ddff946-9c4c-4fb5-a8e7-b2fc413ae281@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463781375-367166324-1746025939=:1712"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_081221_840594_77585EA6 
X-CRM114-Status: GOOD (  27.13  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463781375-367166324-1746025939=:1712
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 23 Apr 2025, AngeloGioacchino Del Regno wrote:

> Il 13/03/25 19:30, Nicolas Pitre ha scritto:
> > On Thu, 13 Mar 2025, AngeloGioacchino Del Regno wrote:
> > 
> >> Il 13/03/25 16:43, Nicolas Pitre ha scritto:
> >>> Provide the "switch on" thermal trip point to be used by the power
> >>> allocator governor.
> >>>
> >>
> >> As far as I know, the power allocation is not supposed to be
> >> SoC-global, as that does play with sustainable power values...
> >>
> >> Sustainable power depends on multiple factors - besides the power that
> >> is actually sustainable by intrinsic properties of the silicon, this
> >> mostly depends on the PCB that it is soldered to.
> >>
> >> Translated, this depends on the heat capacity of the copper layer(s)
> >> and of the eventual additional passive heatsink, which is a physical
> >> property relative to a board and not to the SoC by itself.
> >>
> >> ....which means.... that those nodes shall go to board specific devicetrees
> >> and
> >> not to the SoC devicetree :-)
> >>
> >> Unless I'm wrong - but if I am, please explain why :-)
> > 
> > I agree with everything you wrote above.
> > 
> > But this patch isn't about power allocation. This is about temperature
> > thresholds. And temperature tolerance is rather SOC specific, no?
> > 
> > 
> 
> Sorry for letting this slip through the cracks - that wasn't intentional.
> 
> Agreed that temperature tolerance is SoC specific, but that's taken care of
> with
> the other trip points, so that's not a concern here.
> 
> On the other hand, it's guaranteed that the SoC can "keep crunching numbers"
> at
> full power when the CPUs are at 68-70°C without entering any actual danger
> zone,
> temperature-speaking.
> 
> Remember that a machine may be designed to keep it at even 70°C for a
> prolonged
> amount of time - depending on the cooling solution.
> 
> If you're doing this for a specific board, I'm happy to accept the addition to
> the specific board (file) that you're doing this for.

Please ignore this patch. This is superseded by the patch posted here:
https://lore.kernel.org/linux-pm/prp38558-r53s-756p-o6n8-795o7q87sssr@onlyvoer.pbz/T/#u
---1463781375-367166324-1746025939=:1712--

