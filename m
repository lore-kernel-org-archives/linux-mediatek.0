Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E76C5DF67
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2026 01:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7iUYHczkM8ggxniKLtcHr2bhd+vgzUTFNILXhpxAeg8=; b=JLcTU2PxxhTQzaQkRR1lIIOwIc
	EDASAbL9FYMHNrhvEtCWqPxXJ43QahivuspEMsFwjPYGkD+GMki3/SBY9AyHkcbPn4cG35lBCYG+E
	bKYLe0349fDeun+5IrHnrvBZVvyPW1tC//AYKSEg9oIv9/9OJGNLLlVDIFFRtWZYdqSIgrLJdTghj
	8BFHd30ZBvl0xTRj2Pv6G8LbDLgKZPKCrRFBGHyRVT6hm5B6jXZGduK0vqLSeKB+KKy2PCxKs0gmy
	08bFefMMVN5hehySu7PA/F0NFO3CbZW2f70yI4GpgEfkMNP+s+q2E1qQpVNxe5vDewREpH1by5z7f
	ulsucNXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wugMZ-00000001mfM-1Eva;
	Fri, 14 Aug 2026 01:05:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wugMY-00000001meh-0SIN;
	Fri, 14 Aug 2026 01:05:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 194F5600AF;
	Fri, 14 Aug 2026 01:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9816F1F000E9;
	Fri, 14 Aug 2026 01:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786669532;
	bh=7iUYHczkM8ggxniKLtcHr2bhd+vgzUTFNILXhpxAeg8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=V8tUtPQGR/8qdh+OMCCst5huDIIjOuZs9sMrFEUBobOgVgae+xOGmnr4iEzixXvx7
	 ySTDeV7Jm2KpgIb4NMmwfTuahMybH8nE66j1DV/F/aao6QQ7bG3IgZW+DABwsiOj7m
	 T8uw/pWPbOQGaUQV0q/l0QaYK607AUv0TW3UTWR9OeVBRxRM/UOcAA6LkFU/wbqlm9
	 /ri0kHam+z7lHH6tAygaIiKMdQuAwMd6op3Hc25wScEs1lI/UiQBZy5Ff83D1vDGz9
	 TvrtwjevLo925327sxFkp2fJOaOubz98nl4Krbclx3zk6hZhSGrOEF0kFDxcfbx74Y
	 eF3MbIr99njJQ==
Date: Thu, 13 Aug 2026 18:05:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Pawlik <pawlik.dan@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, win847@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v6] net: airoha: npu: use coherent DMA for mailbox
 messages
Message-ID: <20260813180532.3683abc7@kernel.org>
In-Reply-To: <20260809152813.585797-1-pawlik.dan@gmail.com>
References: <20260809152813.585797-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Sun,  9 Aug 2026 17:28:13 +0200 Daniel Pawlik wrote:
> Commit 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox
> buffer") switched airoha_npu_send_msg() to DMA_BIDIRECTIONAL so
> non-coherent CPUs invalidate caches before reading NPU GET responses.
>=20
> On EN7581 + MT7996 that change regresses probe: the mailbox completes
> successfully, but WLAN_FUNC_GET_WAIT_NPU_VERSION still reads as 0.0 and
> mt76 never binds NPU offload. Healthy boards report 0.1111.

This sounds very odd. Is the DMA API broken on the platforms you are
testing? The code looks correct as is.

FWIW here's what GPT suggests:

  Indeed, HEAD^ uses the DMA API correctly:
  DMA_BIDIRECTIONAL map/unmap must make the NPU response visible to the CPU.

  The important wrinkle is that, on arm64, these small kzalloc() buffers are
  forced through SWIOTLB when mapped bidirectionally. DMA_TO_DEVICE did not
  bounce them. HEAD switches to coherent memory and therefore bypasses SWIO=
TLB
  entirely. That suggests the actual problem is one of:

  - SWIOTLB memory is outside the NPU=E2=80=99s real DMA aperture.
  - The platform=E2=80=99s dma-ranges/DMA mask does not describe that apert=
ure.
  - SWIOTLB copyback or cache handling is broken.

  Using coherent memory for a mailbox is reasonable, but this patch masks t=
hat
  underlying problem rather than explaining it. Before accepting it, I would
  test a cacheline-aligned, rounded-size streaming buffer with
  DMA_BIDIRECTIONAL, while programming the original payload length into the
  mailbox. If that works, it strongly implicates the SWIOTLB/platform setup.

We can take a revert of the patch under Fixes if it's urgent.
The real fix requires a deeper investigation.
--=20
pw-bot: cr

