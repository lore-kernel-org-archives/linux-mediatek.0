Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E4DC55174
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2026 12:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMWwIcs0xWh1pHKE4O8EfEzUf2rTBX1k3h8OgCjQgKc=; b=PBeo4vSoGWUAmFjw0yRqNggcXl
	JpZacK0hwOlO8aglEclMJIzHbKPAvlq+6tvF3CXwUMYuljKlwS63Pv1nsdCRmyK48fxSz0t0Uk7RV
	q1mlFJLta/A+8g9JLr4oYn6FWBJ637Kv6kRgwr/EgqeO6WVjZdB0c28nNTV8GAdZviDmZWjN8+R+u
	cT2D65cXQaW6FcBl7A0JOc00FiCuvAjk1J8Gzy9jl1rNjzf6a8uqDXN8RjylCHpuMDGREIhtldDbe
	y9WWoX7HUUdyUb8zFbUShGj0vgG3oNAc0Lq9cyAX7FhP8WEA5Pv3qMK/rdKOIl/VRvygwReOwdVmo
	1uy3+kNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraWo-00000003sj0-3fcl;
	Wed, 05 Aug 2026 12:15:22 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraWl-00000003shm-1vIE
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Aug 2026 12:15:21 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c15dd4b9132so155972666b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Aug 2026 05:15:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785932117; cv=none;
        d=google.com; s=arc-20260327;
        b=WHqvJZL5kCgpsmeGM0rzHcp0DR6mYLtnx6mUkstr4Ta2BwPrgJ7E2SrxBM9VM49WD+
         k5peB+99N/G+BNbsUAfSzpfAkPDSDckjLi4VRu4tnlA+EI1QleBIY81mHU0jQ5zTxgrx
         +MJNVeYGXpRAFdMowGFZjGXUF8pZGsA14xvV8rI4WP3UnePbXFvGw+pGljVcNel2+81G
         D+AOU2vFCGk7MW88HJ3oL+PYuHaGDGtSRGvSMKC6Bxc+pNB6AS52SB8qmJ4YbiYBckud
         MdQYgnm45jNU/VApkJZL0oG4WdZEFf+Ho/9GO5QaebpJ6kep+21grTf9YfBCaOggGycX
         Xl7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iMWwIcs0xWh1pHKE4O8EfEzUf2rTBX1k3h8OgCjQgKc=;
        fh=muReQ7sPTUMCjywO5zcizsm0dOYRJW9kiV5sXVkuQSw=;
        b=WGLoYE/bv5GFIl4eVvbcuDIua6QQuGf8Uhubjsiua+4Rm1X3N1so5ZH1ui5V2FiAna
         lJqBjE6y4mSV5kQjhRxi8NgAhiTTQJ/o1qSizejFoMqAkv/syp3/KZpoxltjQIHeyKAC
         tHf43JYdkXAS184Ul/3irdQnF18blAqlZlF5zJ9fATdRj+u2AkOsdSTRbbI8oMg9vl5D
         UyWcPhpbrtgknqrzHYc4rozhQFhXXDizZ0Isj42cBkCMgVhvKMaKIH5WgzQZwiTpyj51
         +2DskJ6hGKUjZcw4l4LN06DjosFWNcy9Utzz3T8hDYkQFa1HQpakz794dDtM1Dz2myDi
         90FA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785932117; x=1786536917; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iMWwIcs0xWh1pHKE4O8EfEzUf2rTBX1k3h8OgCjQgKc=;
        b=DJY4nrILG6DVHC67jTKPN7tRRBhQJhViSTfWRPjY41C0gDeyvF7IY+illqbCyzb3hD
         HdR8KZBgtap6H9BE49hM5yoIxVmXgo2oaTHDJi3ZLacfnJJkPERuBPobtjspTD0Y9Lq+
         GfaXZZkQd+tz74GkG4YVCKVZAFRbbU6uqGGiNHG+dKAbHMyPfdtFEn1DMDFXVJvgotAB
         PP9FkJy5B1RSI46n60kOwvFjx4IpJ90Xedau9dPwhZ1nQ3V/Unzw4eahfaeExPjv8LON
         34txlWU5lOFTTapnR1VCXvDLBXmvcCzkCbtZoXSGdFedZah/fRPr8tDYjqrpgwIo3b6m
         u2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932117; x=1786536917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMWwIcs0xWh1pHKE4O8EfEzUf2rTBX1k3h8OgCjQgKc=;
        b=hOo5sV1bC01YmV0j7W27L5DrAuBsDPlu3kIb5G+d6hPuGSqm5TMFeRC/efrjzh5neF
         nGTDow50cYKAMw4WTFRSFz1bmsPCxfuWvt2S4UegTISYfIFkgwigvSyHnb7Eb+I00n61
         +OJqYEip0dsh7triYSXGTRMkoA/6GcaFtLIgjX2iznK9P63mUARFz5kJQfnSAMw+HjsW
         s7r/LSxSCumXmXZkkqgMj2IhK13Io9fFAnrGgWQt+jVrfkJ7aaDv9Z0GG1MhEnrsigTA
         wslpvmhfjBfKZJVLCx/BTWJYkv+rSaTiTGi3xZ30iKFN+6ZHSUshqVRw3V3P9nfZPZVu
         nVLg==
X-Forwarded-Encrypted: i=1; AHgh+RqvBezRy/gDK2nfOL5x71iiHiCxvxO5lVSCcA1k8DXFD16odsSP4fGphuGD2klOmHIpNYIHTSlXOcg1FnJYYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCpDz4BTAzJx76GA2qankPNN8gpekXVYYebe+3kWiagWmAKNgd
	3PVJ1fQMH3v3CRy1sXYBD41IrsSwF2D8zgEGzqdj5UxGQ/3Z4DXqg/WvVWbX+LcDyXzNorSS5Ai
	9t5JFJPo6xElrnsJ2hFF2ii4Hrn/SteY=
X-Gm-Gg: AR+sD10Yq59Dn50kjZnOw6YPUT9EVXMf6jHoEIbIQ4H5e3G2auj8mWCsKNnMtZKpx+s
	I6bS5QMxIpRjNlQOBLIp0n7Pp+9LoibTD+lA6SSeXafUms69/4t4cXnpc7PJBSKEQHxQKk8UiJd
	X7M8mkTvYa3jLjxrvew/p8NZQP7KarvaZZqvCseeyDsM+oDgqWGJJXVIEudR7NpWine7E1WijZV
	CV3n8oAKbacCmJMpa5JQoGpv6KwiW9GJlj9/GsSPKPySMF+Cqbz4WLyLuM7c+BkzQHHFURcqEAs
	O4OM8pmjfIxD2gcbzTmeJWCZGgLAkSv/rhMFAW2pTouY4IgWRPnW3p1s
X-Received: by 2002:a17:907:94c3:b0:c16:5cf0:3aff with SMTP id
 a640c23a62f3a-c2039ef01abmr283671566b.18.1785932117071; Wed, 05 Aug 2026
 05:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260805070851.2885888-1-pawlik.dan@gmail.com> <anMJcp-R17Hx6DQL@lore-desk>
In-Reply-To: <anMJcp-R17Hx6DQL@lore-desk>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Wed, 5 Aug 2026 14:15:05 +0200
X-Gm-Features: AUfX_mxi7EYRrp2aol42yH7BvJv5JuaOmq_wG_46Ap5ob4pD0cDCrwN83dn9Pyw
Message-ID: <CALC2AphygKfbqvAx2_gcSV0bfZiTd9roe+c8Ekw8LfVFOOMu_A@mail.gmail.com>
Subject: Re: [PATCH] net: airoha: npu: use coherent DMA for mailbox messages
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, win847@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_051519_523165_F26C9FCB 
X-CRM114-Status: GOOD (  23.15  )
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

Hi Lorenzo,
thanks for taking a look.
Hardware where I see the regression:
- Board: Gemtek W1700K (OpenWrt U-Boot layout), aka Quantum Fiber W1700K
- Airoha EN7581
- WiFi: MT7996 (eagle), NPU firmware
- Tree: OpenWrt main branch + patch related to update kernel to
6.18.42 - https://github.com/openwrt/openwrt/pull/24551

Please let me know what you need next (dmesg, DT snippet, etc.).

Thanks,
Daniel

=C5=9Br., 5 sie 2026 o 11:59 Lorenzo Bianconi <lorenzo@kernel.org> napisa=
=C5=82(a):
>
> > Commit 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox
> > buffer") switched airoha_npu_send_msg() to DMA_BIDIRECTIONAL so
> > non-coherent CPUs invalidate caches before reading NPU GET responses.
> >
> > On EN7581 + MT7996 that change regresses probe: the mailbox completes
> > successfully, but WLAN_FUNC_GET_WAIT_NPU_VERSION still reads as 0.0 and
> > mt76 never binds NPU offload. Healthy boards report 0.1111.
> >
> > Mailbox messages are tiny and already copied by the caller. Bounce
> > through dma_alloc_coherent() so the CPU observes the NPU-written
> > response without relying on streaming DMA direction.
> >
> > Verified on Quantum Fiber W1700K (EN7581 + MT7996).
> >
> > Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox bu=
ffer")
> > Assisted-by: Cursor:composer-2
> > Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
> > ---
> >  drivers/net/ethernet/airoha/airoha_npu.c | 21 ++++++++++++++++-----
> >  1 file changed, 16 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/eth=
ernet/airoha/airoha_npu.c
> > index b679bed952de..d2f6c9c084b8 100644
> > --- a/drivers/net/ethernet/airoha/airoha_npu.c
> > +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> > @@ -166,12 +166,21 @@ static int airoha_npu_send_msg(struct airoha_npu =
*npu, int func_id,
> >       u16 core =3D 0; /* FIXME */
> >       u32 val, offset =3D core << 4;
> >       dma_addr_t dma_addr;
> > +     void *dma_buf;
> >       int ret;
> >
> > -     dma_addr =3D dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL)=
;
> > -     ret =3D dma_mapping_error(npu->dev, dma_addr);
> > -     if (ret)
> > -             return ret;
> > +     /*
> > +      * Mailbox payloads are small and bidirectional (CPU sets the
> > +      * request, NPU writes the response). Streaming DMA_BIDIRECTIONAL
> > +      * mapping regresses EN7581+MT7996: MBOX reports success but
> > +      * WLAN_FUNC_GET_WAIT_NPU_VERSION still reads as 0.0. Use a
> > +      * coherent bounce buffer so the CPU always sees the NPU response=
.
> > +      */
> > +     dma_buf =3D dma_alloc_coherent(npu->dev, size, &dma_addr, GFP_ATO=
MIC);
> > +     if (!dma_buf)
> > +             return -ENOMEM;
>
> I tried to reproduce the issue locally, but it does not occur for me.
> Moreover, I guess dma_alloc_coherent() is not the right approach since it=
 is
> usually used for long-standing descriptors (e.g. tx/rx DMA descriptor rin=
gs).
> Can you please provide more details about the hw you are running?
>
> Regards,
> Lorenzo
>
> > +
> > +     memcpy(dma_buf, p, size);
> >
> >       spin_lock_bh(&npu->cores[core].lock);
> >
> > @@ -191,7 +200,9 @@ static int airoha_npu_send_msg(struct airoha_npu *n=
pu, int func_id,
> >
> >       spin_unlock_bh(&npu->cores[core].lock);
> >
> > -     dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
> > +     if (!ret)
> > +             memcpy(p, dma_buf, size);
> > +     dma_free_coherent(npu->dev, size, dma_buf, dma_addr);
> >
> >       return ret;
> >  }
> > --
> > 2.55.0
> >



--=20
Z powa=C5=BCaniem,
Daniel Pawlik

