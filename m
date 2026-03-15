Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4889F30283
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Mar 2026 23:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfWc1PVuIaGjEj+v5aaxG4wWyzdFsgkmHQOoNbes2Uc=; b=2Af605aRGB6Gr7xHMp/CgrRfIW
	175A9HodOmP5mjVfYm/L0zwqdOMmSDnzBC9fl/EtNNahmkYv40+8mNMbetvnz+H1lsT+Pr2+IBqNt
	cxaKemY9MmAN6vGe38H3YNRfv6sTvmr1ZNOwUW7m6c17JTOEbWT5+XEqcxc9iCfUTNLOOhNyMjA3j
	WbrWNkHK8k45wgW9YYtV+lTjWMMUywEhA3YLKxeoEzyC0kj2dgTRku/aL+gJ0buhsQxumYvS8VRCa
	Iil3GV+zxnMp0S8EylJeHOY4LaFRxU1DAVb/RUDrDqLKVzCkrcXM0HQV0YFry66CsnrB9Vz/BIkUz
	sKrfQmwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1vKI-000000031tN-0yOE;
	Sun, 15 Mar 2026 23:56:54 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1vKF-000000031t0-0TaR
	for linux-mediatek@lists.infradead.org;
	Sun, 15 Mar 2026 23:56:52 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50912a097b0so22295171cf.1
        for <linux-mediatek@lists.infradead.org>; Sun, 15 Mar 2026 16:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773619009; cv=none;
        d=google.com; s=arc-20240605;
        b=WaFMhirGb0GEgahQErU3usXIeGjFxN0EAHGPTnKa3URDA+7PUlpD9dT3GPAcgn0l7D
         krGa4+hrr8pOELau3yNRuTUZ7766XDxIde2T2y7oV3DONuGdcrQK62kDO++dTrziqbm7
         sfrpkRzzyGu3NPfJByGa0lqS7jpL+LzvDrR85jFv+vtE7NB9jkdQfabV5YDJkhz/Cy9M
         jKORNxDWkkzAhzBbXHMSataA9/JI4orcnDoN2myI7XLOakW4WpIEOGzbfjTkAFLJe2wU
         NPhblSUelMUGoy5O0fxDX8Q2/Web0G6OkCb2k+buvtOnrMkeXUHGlHBXGenCCWDUsM96
         jyug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zfWc1PVuIaGjEj+v5aaxG4wWyzdFsgkmHQOoNbes2Uc=;
        fh=B87EpcbaP+TlTi8YY1cg1doPXotDB92wJLdrfKxRed0=;
        b=BHJqnMsaleMZJuABwvyiJlCmV7ZyIS6dfIyLtehpWXDmZZIg9gCN1cvfKKaURNO1vG
         aNUypjYMB8iJUxJazdoEhENAraMSDhOsor9SrTV3mKyE57cjwzlbWEUFc78mnsu7jZtS
         q76lX5O6H5QKafU9APwLEgue5D/2iw4r6jgoNcsg4poquLAaf15rirmkFuQ8an/dSTrW
         ik4q0NQxdn+bTfo4qisRMCr2QVHYLkWLmHCfjP8lu90fg5BCx+MlXanujoDMGDt2/0fY
         Mf5uFZVN2vmMDet2fNY+HQj19LMaupCTiJg9DveUYwIKScSwoKuGNZJVHlLrZmMgntkO
         h2xg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773619009; x=1774223809; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zfWc1PVuIaGjEj+v5aaxG4wWyzdFsgkmHQOoNbes2Uc=;
        b=K55u8B7/1sqDmLRJ4nrrM7bV6AAlENYMjIaWU93JGABzJgrVhJORpi8Afx4crL2NVi
         RXdyxvr135cIjKI4Y1S0K9utaS4VcnXL4zAFNCORmwBCqQCBgBiVFv6FQaB2kdMD7ouF
         mqG08VnsK1nxvrhGgQvhKT23fmqYWxnHHmj3dEJ2Cz0wNunNxyBw06TPLa9vIJXysXYE
         a6pSs1i6To6VhVIdjPc4z9nvrdW2rrKbZ76Upby9GgygS0uBDC5Ygmg7NeO0yyT/wIO/
         /HsmqPNEKBwEOb81gCVr2siGxllYA1y64UdpKEptpwlJp7ob9PUI1j97hnFIckI4h7lX
         iRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773619009; x=1774223809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfWc1PVuIaGjEj+v5aaxG4wWyzdFsgkmHQOoNbes2Uc=;
        b=UCELlrIFFdzkFF1Mq89610F7eLOJmtm3Am0hYyaFfY2hUs9Q+EoBHpUCp5SXNOdES4
         fa42xY7AyZeASmEMiCSzM2WMsYuMmP/6dxZffHNz8isirJPe7wZ+YLXyrBZlgP1YTT8B
         yoHBXuxs9V00KpBo5EkSJHQsG3/GtaQBjJOnuALtXfcD/t+Nkl86nA4lFZlbzmSrQpB6
         PtZc8xErg/kGUEXlwnIftmqojNAYnPKkI7DlDMbk0Rg/ZopYdTCnUCvWAQiM/3qTUka0
         5xZGPtkJSa4hvNHcd0xoMwLz9pkCRphMRydf8eeEUUU+pE0bVmxXr4uCw7kYBpvq9EaU
         mKPg==
X-Forwarded-Encrypted: i=1; AJvYcCVMoammx6YMGnrj/ur/sE52OtrslQtfHJhPLjhz/vv2IepAyc0wflrXst3CKkKIncRVVTCeuLnjOUBubhIgEA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3/TJ+syEeG8WFRl9FSWpErl+rVzH1J1VXztuViNod/SYf5Hq8
	7d5w/RCYZSInc6xZrCso2dtKrN7g3b/YV1t2uNmpOTpn7XaChJcgH/aSHvYpoJzYuw6L2M+Dz56
	cAkgyqNBouzxhIrWrVeSrQTM2JGqBtwoP
X-Gm-Gg: ATEYQzyizvgQedXJRYxvK2pP9buI8qyLKTcwcTgwwZfLegPLHGR9poX37fOZcdBEIQT
	E3IH/iwDY1n3c8BIuVhph9M3E+xev8BtxSOctuRHpguNSP1gT5HLDzBavGoxrd0yTvEKRCvSxDu
	XlczNvnKLXFfUbJ9wpYCSs3NZ4l+1wNTL0j2wrcSvEwQA/VlqmysRfc9BCF/Z2wt3l5n7ec7Fjy
	fSNzvfJql0NO4NxfFrllgHLtXssBvNGzSXURJkvPPQeZXNKbcZLfFBK9Dq+HNJV2bM3Za8IaNxw
	3MZ0XKnbV8/AXjheow==
X-Received: by 2002:a05:622a:1998:b0:509:1260:b138 with SMTP id
 d75a77b69052e-50957e323c0mr131795091cf.58.1773619009394; Sun, 15 Mar 2026
 16:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260311002825.15502-1-sean.wang@kernel.org> <20260311002825.15502-2-sean.wang@kernel.org>
 <CAFktD2cbFJrLS4ggc+yf582BYmw=jJsntfbDR65ssMpVGM2BKA@mail.gmail.com>
 <CAFrh3J-PsVQ1u_hGFxTVKK0uOs6KxT=euK+jbGvWCueqvynAgw@mail.gmail.com> <CAFrh3J_4N5j9eZAgbP0gzj5gTGVABat9-4xWZBicKMfgL85LRA@mail.gmail.com>
In-Reply-To: <CAFrh3J_4N5j9eZAgbP0gzj5gTGVABat9-4xWZBicKMfgL85LRA@mail.gmail.com>
From: Nick <morrownr@gmail.com>
Date: Sun, 15 Mar 2026 18:56:23 -0500
X-Gm-Features: AaiRm51Qj5-6K1SxyXtVVXgAPeBMnSu9mdsfs7G65KWz5yr6fupz2hG1vMFQLVU
Message-ID: <CAFktD2cot4QuVSs0_r2p0ajuRSDCL2u8d94Eq5vuVBfZxCsKzw@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: mt76: mt792x: fix mt7925u USB WFSYS reset handling
To: Satadru Pramanik <satadru@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, nbd@nbd.name, lorenzo.bianconi@redhat.com, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Sean Wang <sean.wang@mediatek.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_165651_194722_F68F7C62 
X-CRM114-Status: GOOD (  16.89  )
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

> >> > From: Sean Wang <sean.wang@mediatek.com>
> >> >
> >> > mt7925u uses different reset/status registers from mt7921u. Reusing the
> >> > mt7921u register set causes the WFSYS reset to fail.
> >> >
> >> > Add a chip-specific descriptor in mt792xu_wfsys_reset() to select the
> >> > correct registers and fix mt7925u failing to initialize after a warm
> >> > reboot.
> >> >
> >> > Fixes: d28e1a48952e ("wifi: mt76: mt792x: introduce mt792x-usb module")
> >> > Cc: stable@vger.kernel.org
> >> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> >> > ---
> >> >  drivers/net/wireless/mediatek/mt76/mt792x_regs.h |  4 ++++
> >> >  drivers/net/wireless/mediatek/mt76/mt792x_usb.c  | 13 ++++++++++++-
> >> >  2 files changed, 16 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
> >> > index 7ddde9286861..d2a8b2b0df32 100644
> >> > --- a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
> >> > +++ b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
> >> > @@ -392,6 +392,10 @@
> >> >  #define MT_CBTOP_RGU_WF_SUBSYS_RST     MT_CBTOP_RGU(0x600)
> >> >  #define MT_CBTOP_RGU_WF_SUBSYS_RST_WF_WHOLE_PATH BIT(0)
> >> >
> >> > +#define MT7925_CBTOP_RGU_WF_SUBSYS_RST 0x70028600
> >> > +#define MT7925_WFSYS_INIT_DONE_ADDR    0x184c1604
> >> > +#define MT7925_WFSYS_INIT_DONE         0x00001d1e
> >> > +
> >> >  #define MT_HW_BOUND                    0x70010020
> >> >  #define MT_HW_CHIPID                   0x70010200
> >> >  #define MT_HW_REV                      0x70010204
> >> > diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
> >> > index a92e872226cf..47827d1c5ccb 100644
> >> > --- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
> >> > +++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
> >> > @@ -224,6 +224,15 @@ static const struct mt792xu_wfsys_desc mt7921_wfsys_desc = {
> >> >         .need_status_sel = true,
> >> >  };
> >> >
> >> > +static const struct mt792xu_wfsys_desc mt7925_wfsys_desc = {
> >> > +       .rst_reg = MT7925_CBTOP_RGU_WF_SUBSYS_RST,
> >> > +       .done_reg = MT7925_WFSYS_INIT_DONE_ADDR,
> >> > +       .done_mask = U32_MAX,
> >> > +       .done_val = MT7925_WFSYS_INIT_DONE,
> >> > +       .delay_ms = 20,
> >> > +       .need_status_sel = false,
> >> > +};
> >> > +
> >> >  int mt792xu_dma_init(struct mt792x_dev *dev, bool resume)
> >> >  {
> >> >         int err;
> >> > @@ -254,7 +263,9 @@ EXPORT_SYMBOL_GPL(mt792xu_dma_init);
> >> >
> >> >  int mt792xu_wfsys_reset(struct mt792x_dev *dev)
> >> >  {
> >> > -       const struct mt792xu_wfsys_desc *desc = &mt7921_wfsys_desc;
> >> > +       const struct mt792xu_wfsys_desc *desc = is_mt7925(&dev->mt76) ?
> >> > +                                               &mt7925_wfsys_desc :
> >> > +                                               &mt7921_wfsys_desc;
> >> >         u32 val;
> >> >         int i;
> >> >
> >> > --
> >> > 2.43.0

Sean, I have been testing this series of 2 patches for the last two days. I
am no longer seeing problems with warm boot so:

Tested-by: Nick Morrow <morrownr@gmail.com>

Thanks.

