Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15772CD98F2
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jun 2026 14:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHbcnzvx/9cpKl4xbjllHs2z8IgKM+rmWA0KM7paHK4=; b=Em0CVSr3ojcQ8pmjXW0ZgOo7rj
	6ksECziLTZ1kKPCGGwF7A7sNNNC3cz0SQkUTF3E/VlOJbNXWTQwJjpxADylJhT/9iGkBydbt4Li3j
	FOgqEv8UC07CC20L/taWYyKWvnBdruGqAWBHYssSSOb5TtrkeunXtpEqx+gxqP+MgYcPXp11QFzoD
	ABLbNP8+t2pVnimxrgcqkI6HJVSnO/fu9RcVje15jAb1l+CabnBTx2viBwTA9sKDCjfEDJnSDIZNl
	Tz/oIT5QoT1pMxwOyLaQgPsEOiqDHA9BW2iibggL7L2nUhiCj8NPYcf0nghWhuN1GZl6BtNDLp1Ah
	ziQgG29A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbfvz-000000055xG-0Blt;
	Mon, 22 Jun 2026 14:47:35 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbfvw-000000055wp-3LTk
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jun 2026 14:47:34 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so1582814a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Jun 2026 07:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782139650; cv=none;
        d=google.com; s=arc-20240605;
        b=PPgFJsy3dBtLyx8lWUc+w0t71+AOeBdMZqop12OwB/U+5cjVYQKoDDNzzOnaFvOKz+
         zpAJFL54AxFbkrmqbLt28uLyemRn4LIHRv8YOyhZ4rt6UWIAy8RVSWJmDFb5VbjhnEnH
         k8YbCwRUuR4hGeU95+olspNuU44/wF8TUpTtm3o6ToqNC9B7F8VM1+eCMvUao/I8lGva
         GIurocMHOpVgXK7xK58rjjjGDcFeZGIGAbogXNf1kO1u0+S9Yp1W0IauTR+ilviAWDpe
         Ke1t6q7jpqD3eNjT+Z6+IH9H/6+bRmyLADNRD0/Zf5rfgzIOhb2qYQWaZ4N+ARqJ06cX
         ufdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qHbcnzvx/9cpKl4xbjllHs2z8IgKM+rmWA0KM7paHK4=;
        fh=H+VkR8eodPUQn6/HeD8tC+1yilyUBC88rS36Ou3/1bU=;
        b=IrI85ADVcjO3vDPYIk33rD5PdjtbwAqqAoLvjoKqhEX2u/LDTqNXJxSee7Nx1Lyl0x
         kFt2f+DZCflFh0IEeuGv4SbBMnPtMXm2uVBHn+1oimapcujQcElqn9E/Gu/8AeajrQ0c
         ZAb+8RJZkgHDF0ZFL+TwOTl6JiDNGuFAW1QZMDXrxmtxn8G4tww7gXhU+lOL4KIsiCTv
         FzSJ5aDSK42Eeu/QMMSatju1zKPzonTvBro0M/PMXN01a9/wXyNxKN15MCOAAhmmx/y6
         20vJKmaahKl5FIwA4MmuXh05VenICH3TiLjaqZpLy0B8S4T22WvcNg3AR1ph+WNYiYyz
         9cwA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782139650; x=1782744450; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHbcnzvx/9cpKl4xbjllHs2z8IgKM+rmWA0KM7paHK4=;
        b=gKewj5mOm6rA0hfqhfUQtfLr8kdWCUQhiQO+Z5AP/e6iXeBLdRyhOzCiOvTbu4HNma
         7z3PXlfmUhbsYeCL+soTpb98TADCup7SdrB8KsJdJWoH09cAkLCcA6IsHacl91sj0dY1
         mWB3vIuJ/qQFqCTxmYAlcGpipGTkuaIPWR7IgQowyaxeSJptZcQkwWyuB5WBOUCtFD8e
         68PBZ5QmiXTFErwJKGsgTiNBFooa9j48vLrGo2IDX7U+BEHngSWTb6TeWReIWCTWyOoM
         SAyfwukZPrR3UCaCZPCmhSP5xu/7mSduG4SAaMF8LzNrvoVBNlFefZTmPIZTev2dsvF8
         ipiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139650; x=1782744450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qHbcnzvx/9cpKl4xbjllHs2z8IgKM+rmWA0KM7paHK4=;
        b=SKkuALNn6f7J86VMi3pHxLYExIrXCJjTphia6YHkbGfGIyT8p2QTr8sTmFafkMhuQA
         6kQ05Gyj1AAsuFjqJgwJmf4MYsC6VtN2ExsRAmIEAf1vrQM6Z7SXF1U2g9Kjr6SZys7J
         hhWkARL4m0ivVgnW0c9JSbaOmU171F/3h/kmCDIXIW0MvHz9jN3e2P4Odej668ajpLsb
         Dkknz8gbJp314TpthczSk8PRiKhmzEEVFLN/M3SMM10BzxcjS6LjI2VfKbS/TD7+6YI3
         je0RPeUdFf32xR5OUf2d8skVnrGGmi72JNfVfMfBLSoF3USXUI2/aHBom+eKZPY7FGAp
         adsw==
X-Forwarded-Encrypted: i=1; AFNElJ9AiEwx2UOvlXFp/OsEiN2Fq6kD6lPzYkHqW1yO7v3mUpcUTyk8NjIfJjfyIJCUr3GqfeKMcFeU5u/RbnHf2w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt4zGEpspSWuSowouUM0DWu68XnsLXInY3GhVksag9eA8VR5ax
	oOrh2ApKmrs0qg1X9vu0TgQhW2i/JxZNBu+w8tpCMYH//F51xaGKanD8tX7n4w80Dt42Bf7wdgH
	ttOOwLSqUgco/AVic2PXCT/bMahOsZ/k=
X-Gm-Gg: AfdE7clV0E7yb13zlVCLH0lJuJxQIaVeYBa+jDDvkuflHMhLdiUFyIZLS7SuILV4oYn
	KTIs6GNUXPA6TdD5AoHHxfuUVzYBzdc93Nnwa+paENOTc/ngO0rypDb5jMMu00NEdcpoT/vOlzc
	eZOdL3tSXTPBLn2kYGH/UP1ZYEpcIuleI+0RYHAyF8XD10jPsb1dZjkL9JIuzqgv5+LQ0wA+Pb5
	QCtkuOUGRkOdorx5JUDFAHb1LbHuqk8dAFMq0N/nmafmwsoKmMnx4iZhCwmmZ89gicuc4dt
X-Received: by 2002:a05:6402:551a:b0:681:2472:4b2d with SMTP id
 4fb4d7f45d1cf-696edc5b1afmr6155530a12.2.1782139650050; Mon, 22 Jun 2026
 07:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260613173109.849-1-hujy652@gmail.com>
In-Reply-To: <20260613173109.849-1-hujy652@gmail.com>
From: Zhi-Jun You <hujy652@gmail.com>
Date: Mon, 22 Jun 2026 22:47:18 +0800
X-Gm-Features: AVVi8Cer6FyHrG2MFFDZNl2gD33yKhTThKSHKqy9TvNIP7qrWJCYwREn7R846mg
Message-ID: <CAHGaMk_-UP4pFTFaof94CqFv4s1Z_g9mrxVJcworzvLqe20HTg@mail.gmail.com>
Subject: Re: [RFC,mt76] wifi: mt76: wed: fix kernel panic on single band MT7986
To: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com
Cc: shayne.chen@mediatek.com, sean.wang@mediatek.com, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_074732_901897_A4D70022 
X-CRM114-Status: GOOD (  21.67  )
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

On Sun, Jun 14, 2026 at 1:31=E2=80=AFAM Zhi-Jun You <hujy652@gmail.com> wro=
te:
>
> In mt76_wed_init_rx_buf, it's hardcoded to use MT_RXQ_MAIN.
> But for single band MT7986 MT_RXQ_BAND1 is used for RX data queue which
> leads to kernel panic when attaching WED.
>
> Use the correct RX queue by checking WED version and band_idx.
>
> v2 and band 1 -> MT_RXQ_BAND1
> Others -> MT_RXQ_MAIN
>
> Kernel panic:
>
> Unable to handle kernel access to user memory outside uaccess routines at=
 virtual address 0000000000000000
> Mem abort info:
>   ESR =3D 0x0000000096000005
>   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>   SET =3D 0, FnV =3D 0
>   EA =3D 0, S1PTW =3D 0
>   FSC =3D 0x05: level 1 translation fault
> Data abort info:
>   ISV =3D 0, ISS =3D 0x00000005, ISS2 =3D 0x00000000
>   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
>   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> Internal error: Oops: 0000000096000005 [#1]  SMP
> CPU: 1 UID: 0 PID: 925 Comm: kmodloader Tainted: G           O        6.1=
8.26 #0 NONE
> Tainted: [O]=3DOOT_MODULE
> Hardware name: Acer Connect Vero W6m (DT)
> pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> pc : page_pool_alloc_frag_netmem+0x1c/0x1bc
> lr : page_pool_alloc_frag+0xc/0x34
> sp : ffffffc081dab660
> x29: ffffffc081dab660 x28: ffffffc081dabc60 x27: ffffff80091af040
> x26: 0000008000000000 x25: ffffff80091a8898 x24: ffffff80091a5440
> x23: 0000000000001000 x22: 0000000140000000 x21: ffffff80091a2040
> x20: ffffff8003f1d780 x19: 0000000000000000 x18: 0000000000000020
> x17: ffffffbfbf0ac000 x16: ffffffc080ee0000 x15: ffffff80049d47ca
> x14: 000000000000037b x13: 000000000000037b x12: 0000000000000001
> x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
> x8 : ffffff8003f1d7c0 x7 : 0000000000000000 x6 : ffffff8003f1d780
> x5 : 0000000000000680 x4 : 0000000000000000 x3 : 0000000000002824
> x2 : 0000000000000000 x1 : ffffffc081dab71c x0 : 0000000000000000
> Call trace:
>  page_pool_alloc_frag_netmem+0x1c/0x1bc (P)
>  page_pool_alloc_frag+0xc/0x34
>  mt76_wed_init_rx_buf+0xf8/0x2ac [mt76]
>  mtk_wed_start+0x79c/0x12ac
>  mt7915_dma_start+0x274/0x63c [mt7915e]
>  mt7915_dma_start+0x5b4/0x63c [mt7915e]
>  mt7915_dma_init+0x49c/0x81c [mt7915e]
>  mt7915_register_device+0x24c/0x530 [mt7915e]
>  mt7915_mmio_probe+0x91c/0x1980 [mt7915e]
>  platform_probe+0x58/0xa0
>  really_probe+0xb8/0x2a8
>  __driver_probe_device+0x74/0x118
>  driver_probe_device+0x3c/0xe0
>  __driver_attach+0x88/0x154
>  bus_for_each_dev+0x60/0xb0
>  driver_attach+0x20/0x28
>  bus_add_driver+0xdc/0x200
>  driver_register+0x64/0x118
>  __platform_driver_register+0x20/0x30
>  init_module+0x74/0x1000 [mt7915e]
>  do_one_initcall+0x4c/0x1f8
>  do_init_module+0x50/0x210
>  load_module+0x15f8/0x1b10
>  __do_sys_init_module+0x1a8/0x260
>  __arm64_sys_init_module+0x18/0x20
>  invoke_syscall.constprop.0+0x4c/0xd0
>  do_el0_svc+0x3c/0xd0
>  el0_svc+0x18/0x60
>  el0t_64_sync_handler+0x98/0xdc
>  el0t_64_sync+0x158/0x15c
> Code: aa0003f3 a9025bf5 a90363f7 d2820017 (b9400000)
>
> Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
> ---
> Hi maintainers,
>
> I am trying to fix WED on a MT7986 + MT7916 board.
> With this patch applied, WED loads without kernel panic.
> Client can connect but there's no traffic.
>
> Maybe there's somewhere else that need to be configured for single band M=
T7986?
>
> I can provide the rxinfo, txinfo dump from WED if requested.
> ---
>  drivers/net/wireless/mediatek/mt76/wed.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/wed.c b/drivers/net/wirel=
ess/mediatek/mt76/wed.c
> index ed657d952de2..f210a0c57d81 100644
> --- a/drivers/net/wireless/mediatek/mt76/wed.c
> +++ b/drivers/net/wireless/mediatek/mt76/wed.c
> @@ -33,10 +33,15 @@ u32 mt76_wed_init_rx_buf(struct mtk_wed_device *wed, =
int size)
>  {
>         struct mtk_wed_bm_desc *desc =3D wed->rx_buf_ring.desc;
>         struct mt76_dev *dev =3D mt76_wed_to_dev(wed);
> -       struct mt76_queue *q =3D &dev->q_rx[MT_RXQ_MAIN];
>         struct mt76_txwi_cache *t =3D NULL;
> +       struct mt76_queue *q;
>         int i;
>
> +       if (wed->version =3D=3D 2 && dev->phy.band_idx)
> +               q =3D &dev->q_rx[MT_RXQ_BAND1];
> +       else
> +               q =3D &dev->q_rx[MT_RXQ_MAIN];
> +
>         for (i =3D 0; i < size; i++) {
>                 dma_addr_t addr;
>                 u32 offset;
> --
> 2.47.3
>

dump of /sys/kernel/debug/wed1

root@W6m:/sys/kernel/debug/wed1# cat rxinfo
=3D=3D=3D=3D=3D=3D=3D=3D WPDMA RX:
WPDMA_RX0 BASE                   00000000
WPDMA_RX0 CNT                    00000000
WPDMA_RX0 CIDX                   00000000
WPDMA_RX0 DIDX                   00000000
WPDMA_RX1 BASE                   4a7c0000
WPDMA_RX1 CNT                    00000600
WPDMA_RX1 CIDX                   000000ea
WPDMA_RX1 DIDX                   000000eb

=3D=3D=3D=3D=3D=3D=3D=3D WPDMA RX:
WED_WPDMA_RX_D_MIB(0)            00000000
WED_WPDMA_RING_RX_DATA(0) BASE   00000000
WED_WPDMA_RING_RX_DATA(0) CNT    00000000
WED_WPDMA_RING_RX_DATA(0) CIDX   00000fff
WED_WPDMA_RING_RX_DATA(0) DIDX   00000000
WED_WPDMA_RX_D_PROCESSED_MIB(0)  00000000
WED_WPDMA_RX_D_MIB(1)            000000eb
WED_WPDMA_RING_RX_DATA(1) BASE   4a7c0000
WED_WPDMA_RING_RX_DATA(1) CNT    00000600
WED_WPDMA_RING_RX_DATA(1) CIDX   00eb00ea
WED_WPDMA_RING_RX_DATA(1) DIDX   000000eb
WED_WPDMA_RX_D_PROCESSED_MIB(1)  000000eb
WED_WPDMA_RX_D_COHERENT_MIB      00000000

=3D=3D=3D=3D=3D=3D=3D=3D WED RX:
WED_RING_RX_DATA(0) BASE         00000000
WED_RING_RX_DATA(0) CNT          00000000
WED_RING_RX_DATA(0) CIDX         00000000
WED_RING_RX_DATA(0) DIDX         00000000
WED_RING_RX_DATA(1) BASE         4a7b8000
WED_RING_RX_DATA(1) CNT          00000600
WED_RING_RX_DATA(1) CIDX         0000004f
WED_RING_RX_DATA(1) DIDX         00000050

=3D=3D=3D=3D=3D=3D=3D=3D WED WO RRO:
WED_RRO_MIOD BASE                151f8000
WED_RRO_MIOD CNT                 00000010
WED_RRO_MIOD CIDX                0000000b
WED_RRO_MIOD DIDX                0000000b
WED_RROQM_MID_MIB                000000eb
WED_RROQM_MOD_MIB                000000eb
WED_RROQM_MOD_COHERENT_MIB       00000000
WED_RRO_FDBK BASE                151f8800
WED_RRO_FDBK CNT                 00000400
WED_RRO_FDBK CIDX                000000eb
WED_RRO_FDBK DIDX                00eb00eb
WED_RROQM_FDBK_IND_MIB           000000eb
WED_RROQM_FDBK_ENQ_MIB           00000000
WED_RROQM_FDBK_ANC_MIB           00000000
WED_RROQM_FDBK_ANC2H_MIB         00000000

=3D=3D=3D=3D=3D=3D=3D=3D WED WDMA TX:
WED_WDMA_TX_MIB                  009b009b
WED_WDMA_RING_TX BASE            00000000
WED_WDMA_RING_TX CNT             00000000
WED_WDMA_RING_TX CIDX            00000001
WED_WDMA_RING_TX DIDX            00000000

=3D=3D=3D=3D=3D=3D=3D=3D WDMA TX:
WDMA_GLO_CFG                     58404e77
WDMA_RING_TX(0) BASE             00000000
WDMA_RING_TX(0) CNT              00000000
WDMA_RING_TX(0) CIDX             00000001
WDMA_RING_TX(0) DIDX             00000000
WDMA_RING_TX(1) BASE             4a7c8000
WDMA_RING_TX(1) CNT              00000400
WDMA_RING_TX(1) CIDX             00000000
WDMA_RING_TX(1) DIDX             00000000

=3D=3D=3D=3D=3D=3D=3D=3D WED RX BM:
WED_RX_BM_BASE                   4b400000
WED_RX_BM_RX_DMAD                000006c0
WED_RX_BM_PTR                    16f93050
WED_RX_BM_TKID_MIB               000016e9
WED_RX_BM_BLEN                   00000000
WED_RX_BM_STS                    01100000
WED_RX_BM_INTF2                  00007800
WED_RX_BM_INTF                   00000000
WED_RX_BM_ERR_STS                00000000
=3D=3D=3D=3D=3D=3D=3D=3D WED Route QM:
WED_RTQM_R2H_MIB(0)              00000000
WED_RTQM_R2Q_MIB(0)              00000000
WED_RTQM_Q2H_MIB(0)              00000000
WED_RTQM_R2H_MIB(1)              00000050
WED_RTQM_R2Q_MIB(1)              0000009b
WED_RTQM_Q2H_MIB(1)              00000000
WED_RTQM_Q2N_MIB                 0000009b
WED_RTQM_Q2B_MIB                 00000000
WED_RTQM_PFDBK_MIB               00000000

root@W6m:/sys/kernel/debug/wed1# cat txinfo
=3D=3D=3D=3D=3D=3D=3D=3D WED TX:
WED_TX_MIB(0)                    00000000
WED_RING_TX(0) BASE              00000000
WED_RING_TX(0) CNT               00000000
WED_RING_TX(0) CIDX              00000000
WED_RING_TX(0) DIDX              00000000
WED_TX_MIB(1)                    0000002b
WED_RING_TX(1) BASE              49f10000
WED_RING_TX(1) CNT               00000800
WED_RING_TX(1) CIDX              0000002b
WED_RING_TX(1) DIDX              0000002b

=3D=3D=3D=3D=3D=3D=3D=3D WPDMA TX:
WED_WPDMA_TX_MIB(0)              00000000
WED_WPDMA_RING_TX(0) BASE        00000000
WED_WPDMA_RING_TX(0) CNT         00000000
WED_WPDMA_RING_TX(0) CIDX        00000000
WED_WPDMA_RING_TX(0) DIDX        00000000
WED_WPDMA_TX_COHERENT_MIB(0)     00000000
WED_WPDMA_TX_MIB(1)              0000002b
WED_WPDMA_RING_TX(1) BASE        49f18000
WED_WPDMA_RING_TX(1) CNT         00000800
WED_WPDMA_RING_TX(1) CIDX        002b002b
WED_WPDMA_RING_TX(1) DIDX        0000002b
WED_WPDMA_TX_COHERENT_MIB(1)     00000000

=3D=3D=3D=3D=3D=3D=3D=3D WPDMA TX:
WPDMA_TX0 BASE                   00000000
WPDMA_TX0 CNT                    00000000
WPDMA_TX0 CIDX                   00000000
WPDMA_TX0 DIDX                   00000000
WPDMA_TX1 BASE                   49f18000
WPDMA_TX1 CNT                    00000800
WPDMA_TX1 CIDX                   0000002b
WPDMA_TX1 DIDX                   0000002b

=3D=3D=3D=3D=3D=3D=3D=3D WED WDMA RX:
WED_WDMA_RX_MIB(0)               00000000
WED_WDMA_RING_RX(0) BASE         44f40000
WED_WDMA_RING_RX(0) CNT          00000010
WED_WDMA_RING_RX(0) CIDX         0000000f
WED_WDMA_RING_RX(0) DIDX         00000000
WED_WDMA_RX_THRES(0)             00040020
WED_WDMA_RX_RECYCLE_MIB(0)       00000000
WED_WDMA_RX_PROCESSED_MIB(0)     00000000
WED_WDMA_RX_MIB(1)               00000000
WED_WDMA_RING_RX(1) BASE         49f20000
WED_WDMA_RING_RX(1) CNT          00000400
WED_WDMA_RING_RX(1) CIDX         000003ff
WED_WDMA_RING_RX(1) DIDX         00000000
WED_WDMA_RX_THRES(1)             00040020
WED_WDMA_RX_RECYCLE_MIB(1)       00000000
WED_WDMA_RX_PROCESSED_MIB(1)     00000000

=3D=3D=3D=3D=3D=3D=3D=3D WDMA RX:
WDMA_GLO_CFG                     58404e77
WDMA_RING_RX(0) BASE             44f40000
WDMA_RING_RX(0) CNT              00000010
WDMA_RING_RX(0) CIDX             0000000f
WDMA_RING_RX(0) DIDX             00000000
WDMA_RING_RX(1) BASE             49f20000
WDMA_RING_RX(1) CNT              00000400
WDMA_RING_RX(1) CIDX             000003ff
WDMA_RING_RX(1) DIDX             00000000

=3D=3D=3D=3D=3D=3D=3D=3D WED TX FREE:
WED_RX_MIB(0)                    00000bed
WED_RING_RX(0) BASE              42784000
WED_RING_RX(0) CNT               00000200
WED_RING_RX(0) CIDX              000001ec
WED_RING_RX(0) DIDX              000001ed
WED_WPDMA_RX_COHERENT_MIB(0)     00000000
WED_RX_MIB(1)                    00000000
WED_RING_RX(1) BASE              00000000
WED_RING_RX(1) CNT               00000000
WED_RING_RX(1) CIDX              00000000
WED_RING_RX(1) DIDX              00000000
WED_WPDMA_RX_COHERENT_MIB(1)     00000000

=3D=3D=3D=3D=3D=3D=3D=3D WED WPDMA TX FREE:
WED_WPDMA_RING_RX(0) BASE        42784000
WED_WPDMA_RING_RX(0) CNT         00000200
WED_WPDMA_RING_RX(0) CIDX        01ed01ec
WED_WPDMA_RING_RX(0) DIDX        000001ed
WED_WPDMA_RING_RX(1) BASE        00000000
WED_WPDMA_RING_RX(1) CNT         00000000
WED_WPDMA_RING_RX(1) CIDX        00000000
WED_WPDMA_RING_RX(1) DIDX        00000000

Best regards,
Zhi-Jun

