Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B96E606A31E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2026 12:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eSKU64mh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HN/6YiN5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAk8vAv8nUAyr6JPeIhpU/yIjHpAZXyzJ6Jytkg7sB4=; b=eSKU64mhpBF6MmC2QB3HCg+Ibf
	Qfja1xR08b/op+qSw7v6aGWUIMFlUzJG5PPgWxx9XCMb/ojoplLMKhdBezoGY0FVLQy1XngRjBHD2
	9YV/chnXR4f8S2fEOcrD4RuJBNum9wnY8p8pn5pL7MZwZbfmkQJptvhDp4Qi/GdfOwktGcfT7CJ32
	uUC9l/4uGiGkOWDw1NY+pX2HvUSRbpAkDqgRqMyi8jX71snybLoBhQ2JUohkEmzCQG8dGfOsyY5YN
	BPlBQBTt8l+LQn2nDPFVCKY1s6u9anbshlanPSEy8x9aKIRoEgL31mthM9NwjltXrjvaiuMPtq9xq
	kdLJze4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ96F-00000009gdp-0fOG;
	Tue, 20 Oct 2026 12:37:51 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ96C-00000009gcs-2hYm
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Oct 2026 12:37:50 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-6fbf1ba31fbso1197061eaf.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2026 05:37:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792499867; cv=none;
        d=google.com; s=arc-20260327;
        b=exeILwLC3RTF/9zadrTXmp7JVTD9/jFQpkAMgX5xA3Y7PlFACDWZZ5tqeQOWnS1otr
         4oGleO/NMwrE04l/dSh9jaItegsCTtKY3iK1oWHzhex1GHcC6u8KeTLcHFV1YMStJxHb
         bzeGDXlD5YZKDu/ouF6ftch4SgRrpheZf4NkVlHksZVM1aSyjHfcZZPrPq+83VW1//02
         W86BYrSjeGqOTwk03EbEt1pEns21nBLH5XeQPhP5uZOOrvRKEuD9xb3Z7wl6dWUTCeuD
         WBG0jSxgdlAUYRdddkSfGBzPguXq5ffCe/CUgObBysgdMr/4keTHNTfgk6Bn73MfeUyG
         UFxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sAk8vAv8nUAyr6JPeIhpU/yIjHpAZXyzJ6Jytkg7sB4=;
        fh=n6ZHaEqsl2yT3QEpvkL50t3zQ1YaFYTjPbzEQ7r7Sps=;
        b=qU+/KmaUUxi8PkliL8WWCkTWv/OvHh8bvpXGMcSV6e/dp1lHzCZbdMdjzj96PjNUhL
         tW9V2nLBi/LqFri9qDaIjqrOitflIDf3/RZcGIaehmwEvQBhfi1PjTPxTg1yETCaklOm
         yk9LQIKS7K8eKYlQMZY9wu7ZC8A4IK+pqhEU82cqCMPG+H0NFyuAwn0TddDJdYuQi2oK
         6vtHxudor+PMO//C3kQCMvuL8/XsEcWIq7o8lL1JMmPpf65D954oOiLrXP8sGWuea/9i
         e6QN2fU2FZrdiBiKYtRZlRnJb0bGj0cO4SWiz5omwU1FaAP2LALMbcpsZdeyqBQm5GWy
         Qrbw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792499867; x=1793104667; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sAk8vAv8nUAyr6JPeIhpU/yIjHpAZXyzJ6Jytkg7sB4=;
        b=HN/6YiN5meoqsm0L3J6kUmPCu6LEhJupkl/6y5mN4wrtCbbqsrrGLfczD/TRpY7RzM
         HmenDTxj71t8qM+5ZJBOXIH/+O743ompveHjIWMRK5cwCoN7uMkRTRLLeyL2cw3UXgAf
         L/YWyKDrd8zLVesnXHTB74jAV1Qfo0qg2kdrsg7eIKPEVnDBDAu4maN3S5rpRjRD3aGj
         LPB9wdNhAgCdWFOT7JiBlffRUxIy37n7WhMvFGE/cjqbdJMFWfHHCR83ITwfoO4uuIjf
         /S8qBB7zktwEE7Q+Et2ZJbPmACf5EQtsDGGyVzerG1jWodOfzW3kkImhXk0ncwL41pdd
         VMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499867; x=1793104667;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAk8vAv8nUAyr6JPeIhpU/yIjHpAZXyzJ6Jytkg7sB4=;
        b=dTj0nEcrVEElAIJgvdABuUmik83iPPCOAOQRdhni/ZnZsUA1H0dQY1RVViioR1UCr4
         mhxtfR5yn72d71OO+gtVxAIuwNwupcgytj9w1nnwXfm0IxNRURfuoLNZa1EoGWgX+70L
         +iuPWpnEdPvOpIz99dB9kupOd7qcJj1LdfBDj2OS2FLZ+zg+gREzCgV8TbMxOVRm4Cig
         1bh1I1DsozDNF5K9L/+aSjl8RcTOORN+1FwnCYTLpEnHbo4c8NQaxubw2MvfOvhRdsrE
         2KzrsqtAvymAboArpWm4da5YlMz89i7f5MNwNfEZhiCZLBprGpO5MnuQAhfrJzSGGJcH
         9pSQ==
X-Forwarded-Encrypted: i=1; AKwUvByWcRYn75D9oCR/2KeLSbyWgtILBQ33Al66XzGk8C/ob2MxcIsH8uo+bYsgcsYBIDHTi8gHTEwUt+z3ZTTZiQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYK0ER/0rZCk8uPNrVwWwkGvVCn77BixOv8XRejCgiVPFHQlPzWg
	h+vXaKgj2G+F+h7dAWs7uN4U5HZNlpQds3ZpEkiPN4aU1L3RchOCeptgQbHvRI2cM4UvC2qGf7Z
	npnoN8UPRCe2IFSqsaExp9jgXXbEcW4E=
X-Gm-Gg: AYBFou14vmz/2+O4MWu2dFJPRA6t4r8lUf+rpMrEZw2R7RO6sDJ72CdBxE3B81o6ou0
	mkAY5gYi73xomGurtpH67sHCAdL4wje172moDinmWHA8UfS3exg79mMd2VnX23jLHbTZg36/dvC
	xrce5xYpgeadm53q40yEA5mn8jerDK4T4qzwLfxSB20scx95hp0j+gFk+1rjazc1htE7hAQzmEu
	Q37Ea73pTQFvErKPEe/yjqZ7ClRGaHRiJdla4IgI+mOFMPzbhmN9/0437i/b2ZnZIP4dHabEDJI
	Fkz51AfDVIpwm9emnkD5Ledddu2MGOBBLzQQJXtFzyQ6CNnhqq4AXMk=
X-Received: by 2002:a05:6820:f023:b0:6f5:a49:6175 with SMTP id
 006d021491bc7-70355983cd8mr7947845eaf.14.1792499867428; Tue, 20 Oct 2026
 05:37:47 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016-wedfix-v5-3-8b02e78fd34f@gmail.com> <179249104276.3135.12420565113536395663@kernel.org>
In-Reply-To: <179249104276.3135.12420565113536395663@kernel.org>
From: Zhi-Jun You <hujy652@gmail.com>
Date: Tue, 20 Oct 2026 20:37:35 +0800
X-Gm-Features: AclHuK9NT-9EOIYyPIth6-MRT74ZwJUNVrZ8OhqVSMXdfi7sbVHRzVyLo962vUM
Message-ID: <CAHGaMk9E7b=3vJku55Qs2shoV8pkXF5OtBsDC37-H7AuEu0iJg@mail.gmail.com>
Subject: Re: [PATCH net v5 3/5] net: ethernet: mtk_wed: free up rings during detach
To: netdev-bot+sashiko@kernel.org
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	sujuan.chen@mediatek.com, rex.lu@mediatek.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_053748_703541_A897527D 
X-CRM114-Status: GOOD (  37.21  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 6:10=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 2 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] Copy-paste bug in the new rx_ring cleanup loop in
>   mtk_wed_free_rx_rings()=E2=80=A6
> - [Medium] The new flag gating in mtk_wed_free_tx_rings() causes a leak
>   on partial setup failure.
> - [Medium] The patch now frees the rx_ring descriptor memory in
>   __mtk_wed_detach() =E2=86=92 mtk_wed_free_rx_rings(), but WED never dis=
ables=E2=80=A6
>
> --
>
> net: ethernet: mtk_wed: free up rings during detach
>
> This commit adds frees for rx_ring and tx_wdma in mtk_wed_free_rx_rings()
> during __mtk_wed_detach(). It also sets MTK_WED_RING_CONFIGURED in the
> tx/rx ring and wdma tx/rx ring setup paths, and only frees rings that hav=
e
> that flag set.
>
> Link: https://github.com/mediatek/mtk-openwrt-feeds/blob/main/25.12/files=
/target/linux/mediatek/patches-6.12/999-wed-04-Fix-reinsert-wifi-module-cau=
se-memory-leak-issue.patch
>
> > diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethe=
rnet/mediatek/mtk_wed.c
> > index 3f0be70c3f145..b8264435acbe5 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> > @@ -949,6 +949,16 @@ mtk_wed_free_ring(struct mtk_wed_device *dev, stru=
ct mtk_wed_ring *ring)
> >  static void
> >  mtk_wed_free_rx_rings(struct mtk_wed_device *dev)
> >  {
> > +     int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(dev->rx_ring); i++)
> > +             if ((dev->tx_ring[i].flags & MTK_WED_RING_CONFIGURED))
> > +                     mtk_wed_free_ring(dev, &dev->rx_ring[i]);
>
> [Severity: High]
> Should this check dev->rx_ring[i].flags instead of dev->tx_ring[i].flags?
>
> The flag on rx_ring[idx] is set in mtk_wed_rx_ring_setup(), and that
> function never touches tx_ring[idx]. The existing reader in
> mtk_wed_dma_enable() also tests the flag on the rx ring itself:

ACK will fix it.

>
>         for (i =3D 0; i < MTK_WED_RX_QUEUES; i++) {
>                 struct mtk_wed_ring *ring =3D &dev->rx_ring[i];
>                 ...
>                 if (!(ring->flags & MTK_WED_RING_CONFIGURED))
>                         continue; /* queue is not configured by mt76 */
>
> TX and RX rings are set up separately, so their flags can differ. Take
> MT7992 with a second HIF:
>
> - mt7996_dma_init() puts band1 RX on the primary WED's rx_ring[1].
> - mt7996_register_phy() sends band1 TX to wed_hif2.
> - mt7996_init_tx_queues() then uses MT_WED_Q_TX(0) on wed_hif2.
>
> So the primary WED's tx_ring[1] is never configured.
>
> In that case, is the rx_ring[1] descriptor memory still leaked on every
> detach? This loop skips it, and the pointer is then lost to the
> memset(dev, 0, sizeof(*dev)) at the end of __mtk_wed_detach(). That looks
> like the same leak the commit message says it fixes.
>
> mtk_wed_free_ring() already returns early when ring->desc is NULL. Would
> dropping the flag check here be enough?
>
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(dev->tx_wdma); i++)
> > +             if ((dev->tx_wdma[i].flags & MTK_WED_RING_CONFIGURED))
> > +                     mtk_wed_free_ring(dev, &dev->tx_wdma[i]);
> > +
> >       mtk_wed_free_rx_buffer(dev);
> >       mtk_wed_free_ring(dev, &dev->rro.ring);
> >  }
>
> [Severity: Medium]
> Can rx_ring[i] be freed here while the WLAN chip's WFDMA RX engine still
> points at it?
>
> mtk_wed_rx_ring_setup() writes ring->desc_phys into the WLAN chip's PDMA
> RX ring registers through wpdma_rx_w32(). mtk_wed_dma_enable() then turns
> on the chip's RX DMA:
>
>                 val =3D wifi_r32(dev,
>                                dev->wlan.wpdma_rx_glo -
>                                dev->wlan.phy_base) | MTK_WFMDA_RX_DMA_EN;
>                 wifi_w32(dev,
>                          dev->wlan.wpdma_rx_glo - dev->wlan.phy_base,
>                          val);
>
> mtk_wed_dma_disable() never clears MTK_WFMDA_RX_DMA_EN. On normal teardow=
n
> mt7915/mt7996 disable DMA before mt76_dma_cleanup() detaches WED. The
> mt7915 probe error path does not seem to do that:
>
> mt7915_init_hardware()
>   mt7915_dma_init()
>     mt7915_dma_enable()
>       mt7915_dma_start()
>         mtk_wed_device_start()     <- WFDMA RX enabled
>   mt7915_mcu_init()                <- fails, returns without DMA disable
>
> The probe error label in mt7915/pci.c or mt7915/soc.c then runs:
>
> mtk_wed_device_detach()
>   __mtk_wed_detach()
>     mtk_wed_free_rx_rings()
>       mtk_wed_free_ring(dev, &dev->rx_ring[i])
>         dma_free_coherent()
>
> If the chip writes back an RX descriptor after this point, would that
> corrupt memory that has since been reused? Before this patch the ring
> leaked, so such writes landed in memory that was still allocated.
>
> The error path leaving DMA armed predates this patch, and the RX packet
> buffers were already freed in this window. Whether the chip really writes
> descriptors after MCU init fails depends on hardware behaviour. Freeing
> the descriptor ring here is the new part.
>
> > @@ -959,9 +969,11 @@ mtk_wed_free_tx_rings(struct mtk_wed_device *dev)
> >       int i;
> >
> >       for (i =3D 0; i < ARRAY_SIZE(dev->tx_ring); i++)
> > -             mtk_wed_free_ring(dev, &dev->tx_ring[i]);
> > +             if ((dev->tx_ring[i].flags & MTK_WED_RING_CONFIGURED))
> > +                     mtk_wed_free_ring(dev, &dev->tx_ring[i]);
>
> [Severity: Medium]
> Does this leak the tx_ring[idx] descriptor buffer when
> mtk_wed_tx_ring_setup() fails partway?
>
> mtk_wed_tx_ring_setup() allocates the descriptor before it sets the flag:
>
>         if (!reset && mtk_wed_ring_alloc(dev, ring, MTK_WED_TX_RING_SIZE,
>                                          sizeof(*ring->desc), true))
>                 return -ENOMEM;
>
>         if (mtk_wed_wdma_rx_ring_setup(dev, idx, MTK_WED_WDMA_RING_SIZE,
>                                        reset))
>                 return -ENOMEM;
>
>         ring->reg_base =3D MTK_WED_RING_TX(idx);
>         ring->wpdma =3D regs;
>         ring->flags |=3D MTK_WED_RING_CONFIGURED;
>
> If the rx_wdma dma_alloc_coherent() fails, tx_ring[idx].desc stays
> allocated but the flag is never set. The -ENOMEM travels up:
>
> mt76_wed_dma_setup()
>   mt76_dma_alloc_queue()
>     mt7915/mt7996 dma init
>       probe error path
>         mtk_wed_device_detach()
>
> Before this patch, mtk_wed_free_tx_rings() freed the ring because
> mtk_wed_free_ring() only checks ring->desc. With the new check the ring
> is skipped, and the memset in __mtk_wed_detach() then drops the pointer.
>
> mtk_wed_rx_ring_setup() uses the same order. A failure in
> mtk_wed_wdma_tx_ring_setup() returns before rx_ring[idx].flags is set, so
> the flag-gated rx_ring free in mtk_wed_free_rx_rings() cannot reclaim
> that ring either.
>
> Since mtk_wed_free_ring() already guards on ring->desc, what does the
> MTK_WED_RING_CONFIGURED check add in these free loops? The commit message
> does not explain why the frees are gated.

The flag was from the original vendor patch.
I will change to rely on ring->desc.

Best regards,
Zhi-Jun


>
> >       for (i =3D 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
> > -             mtk_wed_free_ring(dev, &dev->rx_wdma[i]);
> > +             if ((dev->rx_wdma[i].flags & MTK_WED_RING_CONFIGURED))
> > +                     mtk_wed_free_ring(dev, &dev->rx_wdma[i]);
> >  }
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261016-wedfix-v5-0-8b02e78fd34f%40gmail.com

