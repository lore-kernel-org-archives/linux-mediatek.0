Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25B3C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 14:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TH/xJqHWFubxL/8O0+lYkHTensbsYI3zkNHhjgr66zA=; b=W9zvva5ZJmf20VMZuBVdIWxrQ8
	828EQpgKrCEq6Y/3ynDV2cUuou0nMSj5xfBBgvOOPdzIPNHcfygoPsqdCZuppAuA3WCCP0INf1IjR
	2i7fdKey94kjj4XOGAkQtRa6Yzy+V+ELA9Q1DW30qgcAweUAEH0N8pE57QKlOBrIoasyuWG0vdKBL
	NRx+1xbWPbdTXymMNBhm4pArvgclYXORBzI5tlqYTSX0Wh/jhII+wTCZXmY8EVa/Ed9EFg6by/VLr
	FeOqerVlzFNr4drC/5NC/bNYpgr96YmQT5oCrKIFdH04NLdB/iJN0rACqYY1tXeRPv56YOEWCz3Qm
	KBjesMlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oicTs-008L0i-3g; Wed, 12 Oct 2022 14:13:08 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oicTp-008KzI-1H
	for linux-mediatek@lists.infradead.org; Wed, 12 Oct 2022 14:13:06 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-360871745b0so96600857b3.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Oct 2022 07:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TH/xJqHWFubxL/8O0+lYkHTensbsYI3zkNHhjgr66zA=;
        b=I9E/1WI4ktnBT8m0fMHpkqXGKZyazdnmx3YKFZRx2/W71/GOJmkt7fHT69WddzunTd
         Gk0DK4sM3lKbtFlbxkMYempB7jEgf/0XvyJT9VorRBukgDObzcOf6i08pbtt8uRBrBvb
         rsAv+xAoEKlP+rrpAUUjA2//DnkdvHHQLr3Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TH/xJqHWFubxL/8O0+lYkHTensbsYI3zkNHhjgr66zA=;
        b=J9B/fCuj+3cG664NgTn/xAj4LCZ7/0qSBuD5oLjvcLHREtrXAgKkttMoY1EwTamDUO
         vkBzLpiJZXFoq3IDtUmSY4z/zyJAEUXqRKhmkqdOoq1QT6e+8i2x5IsjO9gF6nXQGZNi
         p7TaXJuA1RjrqjvP8ZTUC9o/s9qn/JugEiHASYb6YspsjPpVBRrjpsZPdhfEtgIa2er9
         a/fVOvSLPHnCog6PKVVRMSTYdrtw6eLGFH6lgdVDauQaA3/YxAV9Ak6ogQLS7MRtE5UZ
         y40oReoOzLyQOGt1UBztTIuoB+a901wTRggPLglobN5W2ui3FnX48Nlm8t2uBz4OGArO
         mW4g==
X-Gm-Message-State: ACrzQf2B/2pgxVj1+sHlj9mW7LACVzxqbSU6tQ2pYIlIj6J6A+a02HE7
	R4tI9hreHrJ08VyJM8tnmVeGjHsIJQyqPxdLcjYcq465B8k=
X-Google-Smtp-Source: AMsMyM7o1EvuERAWJAX9bodKYFU+0g3Q/158qBJWsuPNWlTTlrmvprjLKov6d3ED6ta+1nCXkDJK1XAbyyr2KLMU8Og=
X-Received: by 2002:a81:1497:0:b0:360:1793:52be with SMTP id
 145-20020a811497000000b00360179352bemr25006135ywu.447.1665583976380; Wed, 12
 Oct 2022 07:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221010150157.1864492-1-greenjustin@google.com>
 <664e32dc-3f91-48ae-64a1-6dcecc9dfb5b@collabora.com> <CAHC42Rf7o61NF3LNQkm4BFcBHMKEP2np3sZMvM7KYczCsurHKA@mail.gmail.com>
 <6548c0ea-d1c0-2de2-99b6-4cfc27e8b938@collabora.com>
In-Reply-To: <6548c0ea-d1c0-2de2-99b6-4cfc27e8b938@collabora.com>
From: Justin Green <greenjustin@chromium.org>
Date: Wed, 12 Oct 2022 10:12:45 -0400
Message-ID: <CAHC42RfKROmaPTkf73eCuU7CV3YhhxyCVEp9UA94XNjMfSzLAQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] drm/mediatek: Add AFBC support to Mediatek DRM driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	jason-jh.lin@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	airlied@linux.ie, matthias.bgg@gmail.com, wenst@chromium.org, 
	justin.yeh@mediatek.com, daniel@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_071305_133996_CD55F7F2 
X-CRM114-Status: GOOD (  12.64  )
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

> These would be different from the macros that are available in bitfield.h, but
> not *fundamentally* different, so these would look a little redundant...
>
> I think that you refer to that `pitch` variable that's coming from the DRM(/fb)
> API... and bitfield macros are for register access... so I guess that one clean
> way of avoiding the magic shifting (that is purely used to split the 32-bits
> number in two 16-bits 'chunks') would be to perhaps use a union, so that you
> will have something like u.pitch_lsb, u.pitch_msb (with lsb/msb being two u16).

Do you mean something like this?

union pitch_val {
     struct split_pitch_val {
          uint16_t lsb;
          uint16_t msb;
     } split;
     uint32_t val;
};

I think my concern with that approach would be it assumes the compiler
packs structs tightly and it also assumes the endianness of the
machine, whereas a bitshift is maybe more portable. Is this an issue
worth considering since we know this driver will only run on specific
MTK SoCs?

