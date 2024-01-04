Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789B1C47073
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jan 2024 19:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0fBUOM0R/wxHfJNIbk+Hsj3pvgiZjJxtJP8ZKkEMHY=; b=EO/7apKNLGnAWIB6WCQzaVes/q
	z2IBq/1a+2QJyddNR4+jhSIKXBECT9Xx6XRGCFuSM47ZVUXWyWU/ZKcgnnm4PR4/671it9iD6qO1z
	OBdbuodN9qwIlZynr9lopNEgvSt1zOYnVpEBUKD3YT6vUHU1i/cH9N7q0NyBBx++nrgdOD1Wa0zap
	54O3cv9BVFCwQMBShM99rCxDNhZVX1IL5wsNpbWz/dJNlOHba0D0aZD0c7ikoW9XEa7bDJ0K8Jugp
	kZFJGATS0hebwzF+VS//Po5DOBYnL6T3PNVO5pFY0kS5e5fw7eoUQrg66mjICR2hH9bTb5Drbz7dW
	BmtXzmlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLTkF-00F7wV-0M;
	Thu, 04 Jan 2024 19:51:11 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLTkC-00F7w4-0G
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jan 2024 19:51:09 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d42ed4cdc7so30475ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Jan 2024 11:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704397866; x=1705002666; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0fBUOM0R/wxHfJNIbk+Hsj3pvgiZjJxtJP8ZKkEMHY=;
        b=uatJLWVZ65xNneD8fCOaxzZgi/jMUPkUq7FdOUBfJiiv/m7ONCcqzNNzCT/HEQnSD0
         R50HnqCklXxsCGyh/V6z53Co2n6+WVkwi9lldD6wrzyZKZ+1TTpj4FdnNkiMNBUVHXew
         maqZWHPRXUUC3+F5mur3NcPAmlZfLX9r1G2vLtlp2WxyrjQCGSN3JAGpVik6TnGWCmbi
         JFSbQinAjdqereei6zHr7RPFk1Jv0Y+4bY4/JEcwZm4JLhURcAb+2c09biQLSlHnpkVu
         eEoynOkszD13Z1jX9piJJVXUqZt3Gw0D0v6Hq2FcAxyySP5LbXpDqVTBJPcXOnBkl1D5
         9OPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704397866; x=1705002666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0fBUOM0R/wxHfJNIbk+Hsj3pvgiZjJxtJP8ZKkEMHY=;
        b=uEx9lYbbJyvj1Lg8nqwxwqcaEqf1Tn3dApddDcJ+SB303D7CIrxuNY9tVGLd/nz2GK
         9z7gZ921IK/RRRMFsxvKvlqFkFfuX3s9yv3MRteykMr2oi/zXCXVIzy/pw0i2GdvsHOk
         P8YlS8X398Ywz8dYPCgmYFaFEQ6fUVs7jkuW+6wf+tOkMzg0tpQJbO+FSgGHdbqIiyVK
         5C7Bg+YQLJMmiRFzNbrMX+77JbciCg98KCvX4bPsXJlJpyoo2FSMcc5a/XqslL6cB70u
         0DW85DMzFBCDY8LpQYC1ueiRE4KlWr64VOmtgZ89xUOgdZG4IGxv+N2I0yqszNAU347/
         Zb6A==
X-Gm-Message-State: AOJu0YyqngB0p76Q/2SjLKmTtP1PPPRNw+zjvF9lec1d1o0HfQ06DlWo
	3LYszuTcBKVXM7K0R6L+BEwqBv5YXa6mwLSc69ynfdpPTns=
X-Google-Smtp-Source: AGHT+IFqzvWpoM2uA+6FBRb2VzfC6a4Pu4eHXCZULmxK95LCj0aqs1mpvIbjznkas7f4lRb0XubNWN1kTL/JdAY9AX8=
X-Received: by 2002:a17:902:6e01:b0:1d4:4482:83c3 with SMTP id
 u1-20020a1709026e0100b001d4448283c3mr39053plk.16.1704397866221; Thu, 04 Jan
 2024 11:51:06 -0800 (PST)
MIME-Version: 1.0
References: <20231212024607.3681-1-yong.wu@mediatek.com> <DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr>
 <20231213110517.6ce36aca@eldfell> <20231213101549.lioqfzjxcvmqxqu3@pop-os.localdomain>
 <20231213133825.0a329864@eldfell> <20231213132229.q3uxdhtdsxuzw3w6@pop-os.localdomain>
 <20231213161614.43e5bca8@eldfell> <9m8eC1j8YSwxu9Mr8vCXyzF0nfyCSHpFbfc__FtUjjKppew65jElBbUqa-nkzFTN-N_ME893w0YQRcb3r3UbIajQUP-Y5LxnHKKFoiBepSI=@emersion.fr>
In-Reply-To: <9m8eC1j8YSwxu9Mr8vCXyzF0nfyCSHpFbfc__FtUjjKppew65jElBbUqa-nkzFTN-N_ME893w0YQRcb3r3UbIajQUP-Y5LxnHKKFoiBepSI=@emersion.fr>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Thu, 4 Jan 2024 11:50:54 -0800
Message-ID: <CA+ddPcOew7Wtb1-Cakq_LPN1VwtG+4vpjpLFvXdsjBunpefT1A@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] dma-buf: heaps: Add secure heap
To: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <ppaalanen@gmail.com>, Joakim Bech <joakim.bech@linaro.org>, 
	Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, 
	John Stultz <jstultz@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Vijayanand Jitta <quic_vjitta@quicinc.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org, 
	linux-mediatek@lists.infradead.org, tjmercier@google.com, 
	linux-arm-kernel@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kuohong.wang@mediatek.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_115108_164462_D83FA1EF 
X-CRM114-Status: GOOD (  26.22  )
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

Any feedback from maintainers on what their preference is?  I'm fine
with 'restricted' as well, but the main reason we chose secure was
because of its use in ARM nomenclature and this is more for ARM usage
than x86.

The main difference with similar buffers on AMD/Intel is that with
AMD/Intel the buffers are mappable and readable by the CPU in the
kernel. The problem is their contents are encrypted so you get junk
back if you do that. On ARM, the buffers are completely inaccessible
by the kernel and the memory controller prevents access to them
completely from the kernel.

There are also other use cases for this where the hypervisor is what
is controlling access (second stage in the MMU is providing
isolation)....and in that case I do agree that 'secure' would not be
the right terminology for those types of buffers.   So I do agree
something other than 'secure' is probably a better option overall.


On Fri, Dec 22, 2023 at 1:40=E2=80=AFAM Simon Ser <contact@emersion.fr> wro=
te:
>
> On Wednesday, December 13th, 2023 at 15:16, Pekka Paalanen <ppaalanen@gma=
il.com> wrote:
>
> > > > It is protected/shielded/fortified from all the kernel and userspac=
e,
> > > > but a more familiar word to describe that is inaccessible.
> > > > "Inaccessible buffer" per se OTOH sounds like a useless concept.
> > > >
> > > > It is not secure, because it does not involve security in any way. =
In
> > > > fact, given it's so fragile, I'd classify it as mildly opposite of
> > > > secure, as e.g. clients of a Wayland compositor can potentially DoS=
 the
> > > > compositor with it by simply sending such a dmabuf. Or DoS the whol=
e
> > > > system.
> > >
> > > I hear what you are saying and DoS is a known problem and attack vect=
or,
> > > but regardless, we have use cases where we don't want to expose
> > > information in the clear and where we also would like to have some
> > > guarantees about correctness. That is where various secure elements a=
nd
> > > more generally security is needed.
> > >
> > > So, it sounds like we have two things here, the first is the naming a=
nd
> > > the meaning behind it. I'm pretty sure the people following and
> > > contributing to this thread can agree on a name that makes sense. Wou=
ld
> > > you personally be OK with "restricted" as the name? It sounds like th=
at.
> >
> > I would. I'm also just a by-stander, not a maintainer of kernel
> > anything. I have no power to accept nor reject anything here.
>
> I'd also personally be OK with "restricted", I think it's a lot better
> than "secure".
>
> In general I agree with everything Pekka said.

