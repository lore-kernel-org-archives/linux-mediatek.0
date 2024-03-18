Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946CFC54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 08:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npuV+MPjFSDr3HzZ1jEevx08H7DusAET6upqkhgWg4o=; b=Js7TiFh4uV2Ug+/eDMqvu39AVo
	htnT8vsVxEAt4x+PC17iC+bbGzjAXSPNUSupvZ8j3/wa8JU6yJZZXDVq7a8CIu79apPKP6rHCEVKc
	BTGHy/c5xNz0Pp3UlWj232WQsHcu676tw+kJL3TLNJzq9voyU8GahTI4yJ0oIRoKtd4tr2DUCR6ct
	KwxotoJcxToIfHwHeThBnY4nFALTzOH+DkrJE8tzEzFFnU+OX41JXLZ/eHTVmB/3xieI/oRCG80mO
	lesYnpsDxelBbPt3L81uVddXuUu+C+6tXa7qOqRhpjVU/ybL4GbCof54iV/BLMKPob+PvltYxQZOS
	+b8ThEpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8fc-00000007nsr-29mk;
	Mon, 18 Mar 2024 08:48:36 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8fX-00000007noV-2x5g;
	Mon, 18 Mar 2024 08:48:33 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-229661f57cbso128013fac.1;
        Mon, 18 Mar 2024 01:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710751708; x=1711356508; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npuV+MPjFSDr3HzZ1jEevx08H7DusAET6upqkhgWg4o=;
        b=kwvw9yBhFqwjF5uRNwndwN7zls0emLgAf/oxFmQlnbzbdVadE8OU90dBVM8giaf4yM
         6l3an+bNb+N8VM4J6KiRGnJOqXJRuS+/ZaSthgB946QmtGRWdWx7q0x81diSsWzm0uP2
         np5P0TJ6XbSdlNB786UlHIOd3d+of57xPFr9IEtmIhO3ndFoei/d8qc/lY7W9ujaXhwC
         B+FSuYb7Oj0OxpDsCOIfjuTdAaVXSjAvLsCBybaihghjuaTXFo1oqBeF442wtsmSM+ST
         K8D7PW/qOBXfcd07qI8Qr4kQb2nT4AbVry9rkpqgnbnEnmfMJUAHZeN3MZsbROISVHtr
         Dbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710751708; x=1711356508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npuV+MPjFSDr3HzZ1jEevx08H7DusAET6upqkhgWg4o=;
        b=JPnylA8kfwtc5ez4coxPE8sFsAU4CbOVg8ydYseasdA5BErFpHRNhi1aSMiFABZms/
         goAqDzgcj579ohCnukNifYpAySdsi0XKJN5WF25pPgiFRkfyrlLKNt3vjkLy7ChYToED
         rtyQy6Yiqe/V0+Mn2jkaUQLLVrHFSGpvUXXKkEBkCa9zjcnovx7VWetDTXA0qV8zlJi8
         UyE56tl53f/2Tnn7OTzxK2M7G+wBbQJpKfqRpGJOMrTWb04pFO3Gw3gvX4t5hvOffHdN
         c/eiycHgDxEer5qB8oYGV9naeB9jj5wQwZsCvaRYat7TCKEJ3ruGdHNw0NmLQ0cco0a+
         VueQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhliE+6Q2hIGLCApwcqWMpG7/sxTzwkmBvksULhC6JAoxGgiXweukenMgHrTtTFoXatbLb7HvUNq19N4o32j3ZlHQJtHlPewQawWYOgy9MOxSnbGJYn4L227DgVPilluB0e2q/L1l33iO/rbP5uJqhe5buOkz/HmI=
X-Gm-Message-State: AOJu0Ywm2NiTJNDp/nMJ80eqqAdtdYbexPyqaVNutEwJyXmOtkKrDiEr
	0zIBhNyrZMCkVSKTnAv8gJIKId+9MhrRWTLIBT9aSCt3yIhTI5dsFqFt+xgOcmt/s0OTb8bgrK4
	k+sdaJXWct7s1+w0z1LsqGCF2I+8=
X-Google-Smtp-Source: AGHT+IETjYlP8OmJEtS9A7tonlde3gO7yveZ3H0MRWYGfVElthO7L1t7r3b9bdSl8NrQTIQOGzxNqDOGbNgVpYGsXAk=
X-Received: by 2002:a05:6870:2192:b0:21e:528f:54e9 with SMTP id
 l18-20020a056870219200b0021e528f54e9mr12511527oae.18.1710751708108; Mon, 18
 Mar 2024 01:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <CAMhs-H9ZO-sitsrASuvsEd+ddwVyHH35gj7yAABTqFNfOCGYYw@mail.gmail.com>
 <60512ae2-dd73-4cb6-9514-145f946300fc@linaro.org> <5d6c36cb9dd9afda1efb69aa34058517@risingedge.co.za>
 <adefc3ff-86a5-4af7-8276-73d0e0108901@linaro.org> <26633d73360e43b2c548f49e544472ea@risingedge.co.za>
In-Reply-To: <26633d73360e43b2c548f49e544472ea@risingedge.co.za>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 18 Mar 2024 09:48:15 +0100
Message-ID: <CAMhs-H_1bwfKO8yquz-3BHQ0UQYW1FFVJYHE66w8Q9m1+fCCHw@mail.gmail.com>
Subject: Re: [PATCH 00/14] mips: dts: ralink: mt7621: improve DTS style
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_014831_778239_761A6063 
X-CRM114-Status: GOOD (  30.91  )
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

On Sun, Mar 17, 2024 at 4:43=E2=80=AFPM Justin Swartz
<justin.swartz@risingedge.co.za> wrote:
>
> On 2024-03-17 17:29, Krzysztof Kozlowski wrote:
> > On 17/03/2024 16:22, Justin Swartz wrote:
> >> On 2024-03-17 17:10, Krzysztof Kozlowski wrote:
> >>> On 16/03/2024 16:49, Sergio Paracuellos wrote:
> >>>> On Sat, Mar 16, 2024 at 5:54=E2=80=AFAM Justin Swartz
> >>>> <justin.swartz@risingedge.co.za> wrote:
> >>>>>
> >>>>> This set of patches was created with the intention of cleaning up
> >>>>> arch/mips/boot/dts/ralink/mt7621.dtsi so that it is aligned with
> >>>>> the Devicetree Sources (DTS) Coding Style [1] [2] guide.
> >>>>>
> >>>>> [1] Documentation/devicetree/bindings/dts-coding-style.rst
> >>>>>
> >>>>> [2]
> >>>>> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
> >>>>>
> >>>>> Justin Swartz (14):
> >>>>>   mips: dts: ralink: mt7621: reorder cpu node attributes
> >>>>>   mips: dts: ralink: mt7621: reorder cpuintc node attributes
> >>>>>   mips: dts: ralink: mt7621: reorder mmc regulator attributes
> >>>>>   mips: dts: ralink: mt7621: reorder sysc node attributes
> >>>>>   mips: dts: ralink: mt7621: reorder gpio node attributes
> >>>>>   mips: dts: ralink: mt7621: reorder i2c node attributes
> >>>>>   mips: dts: ralink: mt7621: reorder spi0 node attributes
> >>>>>   mips: dts: ralink: mt7621: move pinctrl and sort its children
> >>>>>   mips: dts: ralink: mt7621: reorder mmc node attributes
> >>>>>   mips: dts: ralink: mt7621: reorder gic node attributes
> >>>>>   mips: dts: ralink: mt7621: reorder ethernet node attributes and
> >>>>> kids
> >>>>>   mips: dts: ralink: mt7621: reorder pcie node attributes and
> >>>>> children
> >>>>>   mips: dts: ralink: mt7621: reorder pci?_phy attributes
> >>>
> >>> These are all simple cleanups for the same file. It's one patch, not
> >>> 15.
> >>
> >> I agree these are all simple cleanups.
> >>
> >> Even though the cleanup pattern was the same, or very similar,
> >> for each node affected, the intention was to isolate each change
> >> to a single node (or a grouping of nodes of that seemed logical
> >> to me) so that if anyone had any objections, the discussion would
> >> be easier to follow in subthreads identifiable by patch names (and
> >
> > Objections to what? Coding style? Coding style is defined so you either
> > implement it or not... and even if someone disagrees with one line
> > swap,
> > why it cannot be done like for every contribution: inline?
>
> I had been asked to include empty lines when I had left them out when
> I had contributed a patch regarding the serial nodes, which resulted in
> a second version of that patch.
>
>
> > Organize your patches how described in submitting patches: one per
> > logical change. Logical change is to reorder all properties in one
> > file,
> > without functional impact.
>
> If I had accidentally deleted or modified an attribute in the process
> of cleanup, this could have had a functional impact. It's easier to
> notice this sort of omission when the wall of text you're confronted
> with is as small as possible, and not multiple pages long.
>
>
> >> But if there're no objections and it lessens the burden on
> >> maintainers upstream to have less patches to apply, then I have no
> >> problem combining them into a single patch.
> >>
> >
> > Yeah, one review response instead of 14 responses... One commit in the
> > history instead of 14.
>
> I agree that 1 commit vs 14 is better.
>
> But for future reference: is it not enough for the Reviewed-by: trailer
> to be sent in response to the cover letter of a patch set if a reviewer
> has looked at the entire set?

It is enough, AFAICT. I found your patchset very easy to review so I
am ok with the patchset as it is. However, at the end this will be
through the mips tree, so let's do what Thomas prefers: add all
patches as they are or squash all of them in one commit.

Thanks,
    Sergio Paracuellos

