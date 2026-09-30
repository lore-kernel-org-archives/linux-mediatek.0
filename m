Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBADCA5FCB
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2026 16:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nG2T2Alp7V7AR4zEW4H2cF7/r2rfzmYJ1/XwqhpbHio=; b=eL3d+lROTATyV2jA0zTON3/6rV
	atbjSP5WlE8bqhbN9ImdBfZflRghe5V/XgTooJoHWKDRIZb8cmBs5hNZw0wWXZ88luctPg9cPKNuy
	3+7mFtGcPNxw79ZERQ6EPZKJplFrGCQaAR5ysFcGXUYyThbfgBlp0iaDH6rWTbd+Pfo3JsL9rgQ+5
	rQq5n5A7nAHVyXsVM73EGwUArHqE0AsTacYE91pSVqJlUxCSPo+t8Sb8aUzXtz/6YbwjBW6mrmaOs
	ShOUYZ0A0tL31Nrjoag2MMbPo6PzEAbVF/34lVf/LxI20B+cP5MS69lkSvCYU+SGrELCrgtOwJhKJ
	//0hj5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBx27-00000006gbQ-2Cfk;
	Wed, 30 Sep 2026 16:19:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBx25-00000006gb3-2d38
	for linux-mediatek@bombadil.infradead.org;
	Wed, 30 Sep 2026 16:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nG2T2Alp7V7AR4zEW4H2cF7/r2rfzmYJ1/XwqhpbHio=; b=PUqHr6fKp73K6KLOEAkE+7lYwF
	QoZwWwv7lJ9LQa9k7JbIFwdI9Vr8GuJJP78Cz8h0VJ/rBvS4/bF+YVwAu1zRW18zLHI3goR3IdSur
	eY6XCCMJ2Yv4qz0K4DmJQ5i3lDhKOWylVMjHSq5VmKWFZlbGycR2MzdaBfu9HQBmRyAP4/Zj69v3W
	zSpRiACaEZvmxmwwFm0qD17tHO5bYsvB5nOLQqdei2xjamAfTLdlNVOIQVcMFvEnoR2iWFbaM6cNu
	LlWe+vfe4OFWv80qU/hph7WQ6REfDvVnezxGeiUuUFdjY4xd6Ow45hqhItffHu9Gn01YMnm+pVKTl
	uiPdc2EQ==;
Received: from mail-ed2-x0e.google.com ([2a00:1450:4864:33::e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBx22-000000044Ai-1jxE
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Sep 2026 16:19:48 +0000
Received: by mail-ed2-x0e.google.com with SMTP id 4fb4d7f45d1cf-6aae359e2c0so8451442a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2026 09:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790785184; cv=none;
        d=google.com; s=arc-20260327;
        b=ZWIu4yz4X1yzISWaRMeF0LR3Y0qPZn1+fVQT7U9HgygnHzSLezNjmgJX3838IieI/v
         N1hO42B7iJCqrTE3/64D8ju410/6KvQNbyqiJA5V38kLn3p18Dd8RNjfTRfS2gvUWigc
         8ac130lpRhzOyUhtAMOSzDIYBbKpRYxiNP8KlUcDARTh4l62RXJB9HLG7c6R7qD4wHGb
         JY1iG/k9cOc4S38fSkWORkW6A4Fy/1tvdMg2As6BkOepxuCsVtrn/ZeoVaGwQyG5op5C
         kBjmXj/4jurl3nYxrwEo8Gd+OW7BKSqmefrVSsWyQsX18/n0tcZ19n5LSpfmm7BcsBCZ
         chGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nG2T2Alp7V7AR4zEW4H2cF7/r2rfzmYJ1/XwqhpbHio=;
        fh=vZ9dS23zNWweCniIMdg5FTA0DwE3HUxjZwEunL+J8wI=;
        b=PqOadkHQ8HzHk698bWUYFaqULaAIvU/AcyUJKMHZ0Q/YqOIyqaCjd3wa9RtInJD0OJ
         alULjismdJ7M0wl8Ux0pQ18CUyqDKailYqzByd3QLX++bILTnb9hKsmMnMl6Cz9Bj61R
         KCfp7PMXPHbTEdkp7/da9zDGjWEyAjZsj5KljU8almb9Wp56sVDBmEyuu3POiFK5ZrHp
         NkmnoD+5w6auxbmTUd3skLaikq/LieenNqWJkZpWzmouukpD22W7UI0Zg6HrUw3HGgFn
         sF9ee9daqKwsQ/IFezomxuD+3ODJfBEKD8TVrj53U4b2QjogWi+N0/FYB3NNI/e96aCJ
         zMzA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790785184; x=1791389984; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nG2T2Alp7V7AR4zEW4H2cF7/r2rfzmYJ1/XwqhpbHio=;
        b=mjFjjcUNjm4q+UH0Umur/LSdzlHDaoGgeoOx/rNi7pKHlPqXl3rD9wm6OGWdrVnmCN
         3UwkTzz/R6AGu3FIBViE7tl/fpTws7zMfnKadSJgMP9xORi1RK7lY3QW0m3EAxkE3Xcg
         7ooShHZf8ULYYWk8aOVU6Ug1ISv24BJXgIzcTwminypC4JNfHxECKSS0Duc6h3UZUNFe
         WPQ801L8OZ/p3rGJX/3fTZg/FH+b+4kHSSX2uzNfZ45aDOSuf/qNm2boHTuDP2DNBaBd
         sWH3u5Fu1to0zoLeHxRLz5KtD6rHxwsw4qskb/Q3pzT4qwRr4Cv4rXM84uj8ZPzFfxLr
         dpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785184; x=1791389984;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nG2T2Alp7V7AR4zEW4H2cF7/r2rfzmYJ1/XwqhpbHio=;
        b=pzRcwE46ULMvQgrRs6xHZdB0uEXQrdQ8KIt4H9G0t8foMJgDBe7IAX6JOJpVVCG/6a
         sfePvXxsxWJMRtW3C1xncDQT7A/wtW0v6G/REGjsykyKrbZktguqpkVlOgT+RL3en40W
         89fd5KIXa10oF/oNzO34nQsQomm9+MZJfxL2hJBnaTq6oSjICx3jK+2Ht9R7MscG4w/x
         Wd5PO+Yo04gIs4HekoHnqmdHIKuwLfUgg1WgM7DGwiv3OaFXb3o6W2kllWfkeHzbUObK
         s3lBp4Zeq0bw1aKBwlEwzb5yzPZbR/LFxlVACGXmE6K4p6ghjwwQDHur8PcX5y/tuYNW
         BfIA==
X-Gm-Message-State: AFq9FYIBvoOqCslx77nsP5NCqWOwUb15RbP4EfkdvqQ+8MezVwoUOERa
	IXaxx9J5cZY9r2lqDhVCFTyJJJKzuUmTe6bmkpLmQOIH1rxTWMItzSmGKm8vDHqoXX5K+xEeSfa
	D/EeU7Ye08v3wRAg9TAXfV4P75UGEtq4=
X-Gm-Gg: AYBFou1yiA6fXltV3LiERxUJrArAtWT4XP+WsjgQbLpOY/lfINc97evmilQDll+sVlL
	7TCeXnL/42fRk0Hos6rRm+vAWqXUGED9Kd8EfjKvjNnbpDX4K90K+u/cIrRlhzW5ZEqVXuSiJsg
	UtNdaeQ3gPzSLiOCGMSPg3BkCPupQR/mQGo06OQ5+UV4ItKUI9YrD3BUamdo3K3n5ssQZP1z6EP
	Gtd2iev2K+Kxwr32FpfdBTq2mazqSfTBVJF7jyMxaEx8wFH58ML5aMIb6bxgEb/FxZUhcPtHWSW
	uIJ/qHvm93EDqMwWxwt4i+YCDBANmGyeFU3HhZmYhmYecpKHobtgzgrKXwb+UXbPE77Q3SogWJE
	UbYobZHVXhCiStNdnWkU9Z4uZePK9mqJnKnpEjMzKrA==
X-Received: by 2002:a17:906:478d:b0:c2b:ca9c:1379 with SMTP id
 a640c23a62f3a-c2e23d80235mr174035666b.28.1790785184054; Wed, 30 Sep 2026
 09:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260820085941.380401-1-pawlik.dan@gmail.com> <20260820085941.380401-2-pawlik.dan@gmail.com>
In-Reply-To: <20260820085941.380401-2-pawlik.dan@gmail.com>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Wed, 30 Sep 2026 18:19:31 +0200
X-Gm-Features: AclHuK9VCY3Sjvtv8H3qKyzm85-MwnmIxc92I19Mmm-MRvCk9MqeBH9bmWUgmek
Message-ID: <CALC2AphzQ=dHOk2Yjtaw=i2euCLxo+Lk0kO50ixtYydO0yzBHA@mail.gmail.com>
Subject: Re: [PATCH v10 2/2] net: airoha: npu: use cacheline-sized buffers for
 mailbox DMA
To: netdev@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kuba@kernel.org, lorenzo@kernel.org, nbd@nbd.name, sean.wang@mediatek.com, 
	Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, yangshiji66@outlook.com, 
	upstream@airoha.com, szymon.datko@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_171946_587061_4B57C057 
X-CRM114-Status: GOOD (  27.21  )
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

Hi Kuba, Lorenzo, Airoha team,

I found a concrete lead for the unresolved cacheline patch in the vendor
firmware. The installed en7581_MT7996_npu_rv32.bin matches the blob in
linux-firmware commit 1043c0303910 by SHA-256.

At file offset 0x3a9c, the Wi-Fi mailbox handler converts the supplied
buffer address before reading the command:

  lui   a5,0x40000
  addi  a4,a5,-1
  and   a4,a4,a0
  or    a4,a4,a5
  lw    a1,0(a4)

This implements (address & 0x3fffffff) | 0x40000000. Both 0xbf6cf000
and 0xff6cf000 produce 0x7f6cf000. W1700K has 2 GiB of RAM starting
at 0x80000000; its current SWIOTLB pool starts at 0xff6cf000.

The handler also returns 1 (success) for an unsupported operation type
at file offset 0x3b4a. My earlier claim that mailbox success proved a
correct command read was therefore unjustified. The traces do not
establish a read-succeeds/write-fails limitation.

This suggests an address-window problem, but the NPU-side bus mapping
still needs confirmation. The cacheline patch avoids the observed bounce
path without constraining the address of future direct allocations.

Can Airoha confirm which host DRAM range this alias covers, and whether
mailbox buffers above 0xbfffffff are supported?

I have prepared, but not yet run, a test retaining all 2 GiB of RAM and
the 12-byte DMA_BIDIRECTIONAL mapping, with the SWIOTLB boot pool below
0xc0000000. A successful version response through a verified bounced
mapping there would help distinguish the address limitation from a
SWIOTLB copy/cache issue.

Thanks,
Dan

czw., 20 sie 2026 o 11:00 Daniel Pawlik <pawlik.dan@gmail.com> napisa=C5=82=
(a):
>
> On non-coherent ARM64 (EN7581), the kernel's dma_direct_map_page()
> forces swiotlb bounce buffering when:
>
>   !IS_ALIGNED(phys | size, dma_get_cache_alignment())
>
> The NPU mailbox buffers are 12-24 bytes, well below the 64-byte cache
> line size, so this check always fails regardless of physical address
> alignment. The swiotlb sync path itself works correctly, but the
> EN7581 NPU cannot DMA-write to the swiotlb bounce buffer address
> range =E2=80=94 it reads commands fine (mbox_status=3D0x7 success) but ne=
ver
> writes responses back, leaving response fields as zeros.
>
> This was confirmed through five boot traces on a Gemtek W1700K:
>
>   - Boots 1-4: all streaming DMA through swiotlb (is_swiotlb=3D1),
>     bounce buffer byte-identical to pre-map after NPU completion,
>     even after explicit CPU cache invalidation (dcache_inval_poc).
>     NPU version reads 0.0.
>
>   - Boot 5: kmalloc'd cache-line-aligned buffer bypasses swiotlb
>     (is_swiotlb=3D0 on all 169 mappings), NPU writes response data
>     directly, version reads 0.1111, WiFi fully functional.
>
> Fix by rounding mailbox buffer allocations up to
> dma_get_cache_alignment() and mapping the rounded length. The original
> payload size is still programmed into the mailbox length register.
> kmalloc returns cache-line-aligned pointers on ARM64 for allocations
> >=3D ARCH_KMALLOC_MINALIGN, so the IS_ALIGNED check passes and swiotlb
> is not triggered.
>
> Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buff=
er")
> Link: https://patchwork.kernel.org/project/linux-mediatek/patch/202608141=
10017.2795022-1-pawlik.dan@gmail.com/
> Link: https://patchwork.kernel.org/project/linux-mediatek/patch/202608091=
52813.585797-1-pawlik.dan@gmail.com/
> Link: https://patchwork.kernel.org/project/linux-mediatek/patch/202608050=
70851.2885888-1-pawlik.dan@gmail.com/
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_npu.c | 25 +++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ether=
net/airoha/airoha_npu.c
> index 4045d1eb93ea..3416f921f961 100644
> --- a/drivers/net/ethernet/airoha/airoha_npu.c
> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> @@ -5,6 +5,7 @@
>   */
>
>  #include <linux/devcoredump.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/firmware.h>
>  #include <linux/platform_device.h>
>  #include <linux/of_net.h>
> @@ -160,15 +161,21 @@ struct wlan_mbox_data {
>         DECLARE_FLEX_ARRAY(u8, d);
>  };
>
> +static size_t airoha_npu_mbox_size(size_t len)
> +{
> +       return ALIGN(len, dma_get_cache_alignment());
> +}
> +
>  static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
>                                void *p, int size)
>  {
>         u16 core =3D 0; /* FIXME */
>         u32 val, offset =3D core << 4;
>         dma_addr_t dma_addr;
> +       size_t map_len =3D airoha_npu_mbox_size(size);
>         int ret;
>
> -       dma_addr =3D dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL)=
;
> +       dma_addr =3D dma_map_single(npu->dev, p, map_len, DMA_BIDIRECTION=
AL);
>         ret =3D dma_mapping_error(npu->dev, dma_addr);
>         if (ret)
>                 return ret;
> @@ -191,7 +198,7 @@ static int airoha_npu_send_msg(struct airoha_npu *npu=
, int func_id,
>
>         spin_unlock_bh(&npu->cores[core].lock);
>
> -       dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
> +       dma_unmap_single(npu->dev, dma_addr, map_len, DMA_BIDIRECTIONAL);
>
>         return ret;
>  }
> @@ -333,7 +340,7 @@ static int airoha_npu_ppe_init(struct airoha_npu *npu=
)
>         struct ppe_mbox_data *ppe_data;
>         int err;
>
> -       ppe_data =3D kzalloc_obj(*ppe_data);
> +       ppe_data =3D kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP=
_KERNEL);
>         if (!ppe_data)
>                 return -ENOMEM;
>
> @@ -354,7 +361,7 @@ static int airoha_npu_ppe_deinit(struct airoha_npu *n=
pu)
>         struct ppe_mbox_data *ppe_data;
>         int err;
>
> -       ppe_data =3D kzalloc_obj(*ppe_data);
> +       ppe_data =3D kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP=
_KERNEL);
>         if (!ppe_data)
>                 return -ENOMEM;
>
> @@ -375,7 +382,7 @@ static int airoha_npu_ppe_flush_sram_entries(struct a=
iroha_npu *npu,
>         struct ppe_mbox_data *ppe_data;
>         int err;
>
> -       ppe_data =3D kzalloc_obj(*ppe_data);
> +       ppe_data =3D kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP=
_KERNEL);
>         if (!ppe_data)
>                 return -ENOMEM;
>
> @@ -399,7 +406,7 @@ static int airoha_npu_foe_commit_entry(struct airoha_=
npu *npu,
>         struct ppe_mbox_data *ppe_data;
>         int err;
>
> -       ppe_data =3D kzalloc_obj(*ppe_data, GFP_ATOMIC);
> +       ppe_data =3D kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP=
_ATOMIC);
>         if (!ppe_data)
>                 return -ENOMEM;
>
> @@ -434,7 +441,7 @@ static int airoha_npu_ppe_stats_setup(struct airoha_n=
pu *npu,
>         int err, size =3D num_stats_entries * sizeof(*npu->stats);
>         struct ppe_mbox_data *ppe_data;
>
> -       ppe_data =3D kzalloc_obj(*ppe_data, GFP_ATOMIC);
> +       ppe_data =3D kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP=
_ATOMIC);
>         if (!ppe_data)
>                 return -ENOMEM;
>
> @@ -466,7 +473,7 @@ static int airoha_npu_wlan_msg_send(struct airoha_npu=
 *npu, int ifindex,
>         int err, len;
>
>         len =3D sizeof(*wlan_data) + data_len;
> -       wlan_data =3D kzalloc(len, gfp);
> +       wlan_data =3D kzalloc(airoha_npu_mbox_size(len), gfp);
>         if (!wlan_data)
>                 return -ENOMEM;
>
> @@ -489,7 +496,7 @@ static int airoha_npu_wlan_msg_get(struct airoha_npu =
*npu, int ifindex,
>         int err, len;
>
>         len =3D sizeof(*wlan_data) + data_len;
> -       wlan_data =3D kzalloc(len, gfp);
> +       wlan_data =3D kzalloc(airoha_npu_mbox_size(len), gfp);
>         if (!wlan_data)
>                 return -ENOMEM;
>
> --
> 2.55.0
>


--=20
Z powa=C5=BCaniem,
Daniel Pawlik

