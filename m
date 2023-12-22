Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14922C41535
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Dec 2023 09:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvFPmQYSXCW++H17F3FBSpFjPOkodCCqULNpYKx/X4M=; b=hligCYaias8+waF86Nklz7rz4h
	3UQh14BCRZf6BmTX0bNyn6cYyltSrHIcdBrQNc2R8mBB2JeR6NLsQsqultdiBrPCTFrathUsOICRX
	iyCjH/GDj07FDgxxxj8Rnnc/Q1yz804zArzYLIk7fbHQlFzwWfO42bn3ptQ/ntN3qungXMGW/Sjjk
	MzhnZwDdQWq5pv4n7Foi+Ju9aPE9CeWUjUqIsme44E35xc6LVAP1AHxLtnuAu/cIEMwUZVUMG7+0M
	E9NchtAsmGpJMMF+tvWX+GKFVqqERvzmze7hpvpUcKtTwTOZWVsHiUD06z2Pa9p3v6IdUjP+pKv5m
	/lYEHHvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGc1I-005SBK-33;
	Fri, 22 Dec 2023 09:40:40 +0000
Received: from mail-4018.proton.ch ([185.70.40.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGc1F-005S9e-1w;
	Fri, 22 Dec 2023 09:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail2; t=1703238029; x=1703497229;
	bh=RvFPmQYSXCW++H17F3FBSpFjPOkodCCqULNpYKx/X4M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KUeJEFF8cS8NbUYEe1YI7C9RCUnb22uQFIsHpP6jjSohQf0y1mWvISCZss2RSG0cE
	 FpFbc+rRNMpRZSb13C1ahONUfnCzGKxUsUUXSsR5C+1R9ci2C5g3By5Mb251Zs9fVi
	 YFv/UAC1f8dJ2Vd22XeC0cShQ3exgbgm9qAvG5p0ggzE7Kr1Y++nvPWpA9zuiSt7oR
	 JeJvwrdg3px1mpjFK/Pb0+sldHag3128mqywcYp+5f8irYQA4y3n4J7ElJxPnbAZiR
	 03F5CEcznFJEOCNtxpJk+MYxgpv1yuAr1WVgq6nUByVZdezLQspZZ6YpOL8YNsVtZb
	 E9NXLgPNEemwQ==
Date: Fri, 22 Dec 2023 09:40:18 +0000
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: Joakim Bech <joakim.bech@linaro.org>, Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Vijayanand Jitta <quic_vjitta@quicinc.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org, linux-mediatek@lists.infradead.org, tjmercier@google.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] dma-buf: heaps: Add secure heap
Message-ID: <9m8eC1j8YSwxu9Mr8vCXyzF0nfyCSHpFbfc__FtUjjKppew65jElBbUqa-nkzFTN-N_ME893w0YQRcb3r3UbIajQUP-Y5LxnHKKFoiBepSI=@emersion.fr>
In-Reply-To: <20231213161614.43e5bca8@eldfell>
References: <20231212024607.3681-1-yong.wu@mediatek.com> <DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr> <20231213110517.6ce36aca@eldfell> <20231213101549.lioqfzjxcvmqxqu3@pop-os.localdomain> <20231213133825.0a329864@eldfell> <20231213132229.q3uxdhtdsxuzw3w6@pop-os.localdomain> <20231213161614.43e5bca8@eldfell>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_014037_813938_3EF155FF 
X-CRM114-Status: GOOD (  19.42  )
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

On Wednesday, December 13th, 2023 at 15:16, Pekka Paalanen <ppaalanen@gmail=
.com> wrote:

> > > It is protected/shielded/fortified from all the kernel and userspace,
> > > but a more familiar word to describe that is inaccessible.
> > > "Inaccessible buffer" per se OTOH sounds like a useless concept.
> > >=20
> > > It is not secure, because it does not involve security in any way. In
> > > fact, given it's so fragile, I'd classify it as mildly opposite of
> > > secure, as e.g. clients of a Wayland compositor can potentially DoS t=
he
> > > compositor with it by simply sending such a dmabuf. Or DoS the whole
> > > system.
> >=20
> > I hear what you are saying and DoS is a known problem and attack vector=
,
> > but regardless, we have use cases where we don't want to expose
> > information in the clear and where we also would like to have some
> > guarantees about correctness. That is where various secure elements and
> > more generally security is needed.
> >=20
> > So, it sounds like we have two things here, the first is the naming and
> > the meaning behind it. I'm pretty sure the people following and
> > contributing to this thread can agree on a name that makes sense. Would
> > you personally be OK with "restricted" as the name? It sounds like that=
.
>=20
> I would. I'm also just a by-stander, not a maintainer of kernel
> anything. I have no power to accept nor reject anything here.

I'd also personally be OK with "restricted", I think it's a lot better
than "secure".

In general I agree with everything Pekka said.

