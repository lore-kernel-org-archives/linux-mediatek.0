Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DE7D4114B
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jan 2026 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYui0318UOsS6VyHkKkmfrBiXM5qykug+UUq04REjYo=; b=Z2bQQ5z+Fjdvme3a6qUcH/bLkH
	GEthCDPyeNWiSjz/m9Y7yn9T7XMmvV7Pff2/9qS3ejsLpmdPmgLiWT3ogqw0ahUVfZ/y+JFT++E+l
	iud5uboPFFBZ97JhoLdooGiHIM6q4XJ+RlTI0Q+pXGyxIptaoNS6wELOFfDhV5Y7jvfltT/QRXg5C
	i95yrogsMswZuFgU0K0I56Mi6x9G8E8Fwe1owlK5RIDeBWdznCCjiitRx4WyGSewYW+Sg6ac5k4WF
	3oR/lFIkFVe11818hDs4dE3NnfIcR/mySH57+fZmmFdSnejivq0jAgGMcdVRyO7EV49HcewNRoyNP
	T4xvB6og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJbc-0000000C42R-0kcL;
	Thu, 15 Jan 2026 09:25:28 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJba-0000000C40Y-0u53
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Jan 2026 09:25:27 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-64b8123c333so1110741a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 01:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768469124; x=1769073924; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYui0318UOsS6VyHkKkmfrBiXM5qykug+UUq04REjYo=;
        b=Lwxhj1UorM5zwL+IB63k4/PakcIlc+EgfG6MyxzcxfTWrGQkoVnlmQen9nuNE7eQhq
         4dodLxoSrbdHcIhE4wItqKuNfgDaBjIOK7OJ8cyIt4ZM+a00yZrAb5Qdq/jQfDHCsntB
         ZIpM89La2f3I4HcPKTcv2qeai1IAhnQYFb9YTt/QH+X0Vngee52xJDAx4yMP+kqyjyn6
         mLTCiJaklJHmTBAMxyWQgoyKdahPQnmW4oXW9iZJYBPeqJHfP3w4DZlcsAtttAIDfqh5
         lcmI5fAzx5DvN41PwfZWqsEJGpzVqDt1/kjhsIALsahOn35uFyjocOemsIOQv/Yo9poN
         M0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469124; x=1769073924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WYui0318UOsS6VyHkKkmfrBiXM5qykug+UUq04REjYo=;
        b=Zp7XO5i+TKJsi4vYca8RURkJdczt2HEqKY0obu1NRxLamCtmvwaPcXN0yJaDZrtQjw
         pcUSig9P2g1M/ULlh4O3adHYZnjIT1qlLQgwZqGJcLQiyeYIVLdyq6GH843OSfzs/2uW
         By8T0cX7q0JekQ/hc84uO7rEWGcoWSbBunrAUf0IOxP6WPr2t23wfvjIVaYurxCw7Ulj
         e1eWAuhe9OXr1mLcPwzDFkRIsTgrA6dE2odITf5Gni0QWfUO2Z5sw+BSurrdOBhdvZHs
         oAF/tFScH5u+M53Bd3Qfn/OeAgH9qwk1RH+5U0kxkGHyuPvG7esvFsQqrABIMzjJ+WjM
         yuDw==
X-Forwarded-Encrypted: i=1; AJvYcCXhQgrI579F0Naq+gb66ZQ6OHXErYeooonMrAMFLz7OO28GSSx6sDrBHfuCFIFRe3aSsxFwpXYsrSU8aK1QBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlectaSqHZoJbJMMf9UkG+V3vUR9zC0AkCtaSG/I7nvbnHqdnU
	eOGfkLnk90hhVYNWz2maCGZ6hkgpbQooMG2Et0AtTlZrS6r8WPqXzcclu8hMnhVWkmEZJO3AIga
	M9H0XtVOGzLxk2as0t+jUK579bZnke9Y=
X-Gm-Gg: AY/fxX6gpytJ3Wgze6CA8FPOILd/BXv1E2WgmxNSBy5PCq/j8TGOO7occI61lFknEXS
	iupu3gpw+wuguFfy+5TjWIKoZxDn5ZL7Mm8g5PS/MQpSoQ/PM6207HmW6FikiQISKHtRUKa5/fj
	21GXgxdnryk++XK8ymu1f5RR49DCYlK4F9gME47ldpeaJD9h0SWm3IAdd2+IJLiLOawaC4LTtEG
	er4aAsy3gas4Vw9ySAhnB7potIts0aUofdS6Ucq052Mby7tPhlayta7zbokoGhrUTcfbiNP7WTk
	mBGStolUdpSmVxu9d/uBD+x3cZ17
X-Received: by 2002:a05:6402:2804:b0:650:891f:1c06 with SMTP id
 4fb4d7f45d1cf-653ec115969mr4596435a12.12.1768469124088; Thu, 15 Jan 2026
 01:25:24 -0800 (PST)
MIME-Version: 1.0
References: <20260115001405.3513440-1-robin.kuo@mediatek.com>
In-Reply-To: <20260115001405.3513440-1-robin.kuo@mediatek.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 15 Jan 2026 17:24:45 +0800
X-Gm-Features: AZwV_QidmYXnF7h9yz4oq7n444gRgXoBRtnbiVEv5D6iVPSwvP_31krseRm0_Mw
Message-ID: <CAMgjq7Db38sNdsGe121oBFshiJz+vUrKWf5BjB3djAYUr40LLA@mail.gmail.com>
Subject: Re: [PATCH 1/1] Restore swap_space attr aviod krn panic
To: robin.kuo@mediatek.com
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wsd_upstream@mediatek.com, 
	casper.li@mediatek.com, chinwen.chang@mediatek.com, Andrew.Yang@mediatek.com, 
	Qun-wei.Lin@mediatek.com, oliver.sang@intel.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_012526_272517_2F36C1BF 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jan 15, 2026 at 8:14=E2=80=AFAM <robin.kuo@mediatek.com> wrote:
>
> From: "robin.kuo" <robin.kuo@mediatek.com>
>
> Restore swap_space attr avoid krn panic

Also a nitpick, you may want to add "mm, swap:" prefix to the patch summary=
.

> Commit 8b47299a411a ('mm, swap: mark swap address space ro and add
> context debug check') made the swap address space read-only.
> It may lead to kernel panic if arch_prepare_to_swap returns a failure
> under heavy memory pressure as follows,
>
> el1_abort+0x40/0x64
> el1h_64_sync_handler+0x48/0xcc
> el1h_64_sync+0x84/0x88
> errseq_set+0x4c/0xb8 (P)
> __filemap_set_wb_err+0x20/0xd0
> shrink_folio_list+0xc20/0x11cc
> evict_folios+0x1520/0x1be4
> try_to_shrink_lruvec+0x27c/0x3dc
> shrink_one+0x9c/0x228
> shrink_node+0xb3c/0xeac
> do_try_to_free_pages+0x170/0x4f0
> try_to_free_pages+0x334/0x534
> __alloc_pages_direct_reclaim+0x90/0x158
> __alloc_pages_slowpath+0x334/0x588
> __alloc_frozen_pages_noprof+0x224/0x2fc
> __folio_alloc_noprof+0x14/0x64
> vma_alloc_zeroed_movable_folio+0x34/0x44
> do_pte_missing+0xad4/0x1040
> handle_mm_fault+0x4a4/0x790
> do_page_fault+0x288/0x5f8
> do_translation_fault+0x38/0x54
> do_mem_abort+0x54/0xa8
>
> Restore swap address space as not ro to avoid the panic.

For a stable backport simply making it not RO is simpler and better.
We can do the cleanup and add debug attr as I mentioned in another
reply later.

So for this change with Cc stable:

Acked-by: Kairui Song <kasong@tencent.com>

