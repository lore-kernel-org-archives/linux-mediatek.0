Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F9A112584E
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 16:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7N2W7yYjM2zRG3DC8FowUvkEvnAbADu41ZCuJNvKKrY=; b=iXi46BhCKl6mN8nnrZjvbtSoyt
	8Te+VVAqqzN5g5GQhXYRR8F/5P7fWGnzCIymso1+rRQsbW51Z84GJUq5ElcseBuT9HeDIOqJgeaeu
	pbIaXR+eY/P1wK5rN91r3Kk7v2ZWmWl7joHJvwut2GsiVAwqaterf0eLelpPm0bqJ4VGkv/Cf1NzG
	t9uSutLiBTYcw54mO66OJc6TnOANLNlIEbpDE7Z8s+EVw6jZSHzozLiaW4zOFoAC2/AuIz3kQD2c1
	b7I4RUDUXzYUS1BHAx2OvC5+l7YMXpXP9j2D9a+kky3OZYRZxBGDHRzzXdNHR4w4u0kBawttirxAI
	FjGSJ02A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0MDB-0000000Bu9C-3mD0;
	Wed, 11 Mar 2026 16:15:05 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0MD9-0000000Bu8V-3njt
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 16:15:05 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-509134ab2d2so292361cf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 09:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773245702; cv=none;
        d=google.com; s=arc-20240605;
        b=SRhDX0+glXh+ZFQwLyPzhIZAYM4Mpfwc05XhL9rq7lcKpvNMNPNZETcGGkKLMLS3vA
         c1RBk5I1EKP2i93KVRlwiAlFjnFLgHuGhvBgOuNw9VMFI2VG1eqNTdHIWRuC4sJOVew6
         w6mIUd5bl69dW9ptl8tokfn0W0V4iAzQXWEB3c3S2plFvA03SCcoqa9mJl8bYlDlT7iK
         FjCVTGri4MU5Pv5kmrjr1nut/bJpZsaCxHWDsMmldwbu9/4mMfDV5jDJNntMYsUYYCUK
         Hf2H0fCukNyPQSa4u8z3xdrlKbNr9fKhEHaLXxRZ6/XiQ5K/OExnA4xxjKQUxl6sb0yk
         SAXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7N2W7yYjM2zRG3DC8FowUvkEvnAbADu41ZCuJNvKKrY=;
        fh=X3GRzi0DHsH+VLtR/6IpEBQ9x9kvPRLNvYlNZvDh3X8=;
        b=Cg4srVVEGaxmqLGa4qou8sfjRK1jNT0+KbLqoytuw8C3AR2hMt/aJbb5+4aEtGNzST
         4ZHC06ztJMm3iIMMimGRx9SPXZ8XF0mP26d2BmL9y2zmo2Po26lawIllkX0w66r9J4JQ
         hnZmUNalH2irbl5s83f6ECl/6CCG0xFQZpG9o56ysR5wRTAguosl/1ze+rNWMLATCsrM
         uWAT8qehJ9S70RTGUnniN9VYCyedzpsl5KQXPy2TzrYqwJ6TyvlFUTIZPlrojmEeiuLu
         MXYJu+Ye2avocyyHteZWXLQ6RDgRpx+PrgCwgOS94wncBOsHmWgAWctHBozFGN+MAwwC
         Jm3g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773245702; x=1773850502; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7N2W7yYjM2zRG3DC8FowUvkEvnAbADu41ZCuJNvKKrY=;
        b=dJY5K+OF5RYxCHzLvnhhFc9admR6t6G+10IDAlDOhfXMwNPVP8/bZKVTDz+iPDEdMV
         9P3qX12nDJMG6N81hXhK2h2NoqPkffatoW4s5TSZiNlQWZMPcxeRROEhtyEo3hXzK+jN
         Ei/c/R7mSsywtoDrHj/CoAyy1kVvSmQi1w+CxqrAcBARSChjQecVU3Vuz4CtAigLQfLF
         5Iel/kS9xZ5CjZOag9XZyagB+effrvdqhk5dwqRqQRZku+ZijYOgOcaQdMqrDpaaso2c
         7BxVJPV9tLFu976+O6S7X4uFSBWawhCKci93KbSgGU8UeJlmzbsk14CcwqMS9FYM6Oap
         zGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245702; x=1773850502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7N2W7yYjM2zRG3DC8FowUvkEvnAbADu41ZCuJNvKKrY=;
        b=t6HO7+82wpsMuyNvbO+nup6lVUPwvXRz7eoYo+pGOSs+hY+bHaUMHOfID+5YZQJ3gu
         fYkI0LYMEI08mfIxdsx9lh6rIKCE49PtRHQ6KqfaV/TJ3mLuLIPRFpGnj+w4v37VlHfp
         rdbc8Ih5HmppacwSzpcWMSacWrZShrBS1yM8SitcLXtuOm5e7SQCC/vZG/4lkcJyD7hw
         NB1TBCzhsrOdlWalbE2h/JomVLR+QLDV+o5khJZJ8VCe5nMOAzmh/v9EwuUuekt+oPm2
         PFNM01xxtRvdIrluPszS8x4Y9wxYcFE023qZKkuN5WGvAfyGbfgi73wgnYMff1LL5otV
         ec5A==
X-Forwarded-Encrypted: i=1; AJvYcCVyAXsBg/QO5Lo894E8KhKHFz19jUxIPkenJeOJ9A7dq3QN+BZJ2jTt2dYTjKQZIlt8ATIRhD11GTO0tXsydA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwK8Tu6MVIj/Wo+s82HWt2V0XnCueHbVkLAOlpC5W30e8OcEZSa
	AbccqwoOF83/vOUGRfbuU43JH81/mxjZGEAt1zhSzTRNtynM/lP4cvVRORRsU8dUAPNw6Em1orO
	tLrbYXgCQxQ7dIrx7GmO4TGqLdEw0ew==
X-Gm-Gg: ATEYQzygf5S26iBekwYyeT7XEOLw3J+hfBsUNXXYdvjt8nR7ahhAujY9g/paJzTdnKI
	OOtzT0yjke+Lg06HI//qxKBhbrilWlAxs72DhcOOyf5GKBz8NmoQhZLJxQF4zkUdQCIYnbkxCke
	Lk4gQG6Mb98VbGni2eWckV+On52ZvEBl9Pgtsc+mlqAiZbpe25QFTxTHZ92C9XXbjhRNedxMi46
	TwAHp/CBlcufReA4FsvK3P1B7sIg+3jLFVNDuFQQ+X4XCmEdgg7L/XUSs1Q3BfefyjeUD9WbLBk
	BVTTVCuh3oHK/2O59g==
X-Received: by 2002:ac8:5f8f:0:b0:509:2222:4201 with SMTP id
 d75a77b69052e-5093a1c2b09mr36139601cf.69.1773245701913; Wed, 11 Mar 2026
 09:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260311002825.15502-1-sean.wang@kernel.org> <20260311002825.15502-2-sean.wang@kernel.org>
In-Reply-To: <20260311002825.15502-2-sean.wang@kernel.org>
From: Nick <morrownr@gmail.com>
Date: Wed, 11 Mar 2026 11:14:35 -0500
X-Gm-Features: AaiRm50riU_uOb2IzOgK4aB6NSrm2_y0b6pNwKh9O2M9Qcys0qvy4wS0pXJ7QU8
Message-ID: <CAFktD2cbFJrLS4ggc+yf582BYmw=jJsntfbDR65ssMpVGM2BKA@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: mt76: mt792x: fix mt7925u USB WFSYS reset handling
To: Sean Wang <sean.wang@kernel.org>
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>, 
	stable@vger.kernel.org, Satadru Pramanik <satadru@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_091503_958062_173F221F 
X-CRM114-Status: GOOD (  17.50  )
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

> From: Sean Wang <sean.wang@mediatek.com>
>
> mt7925u uses different reset/status registers from mt7921u. Reusing the
> mt7921u register set causes the WFSYS reset to fail.
>
> Add a chip-specific descriptor in mt792xu_wfsys_reset() to select the
> correct registers and fix mt7925u failing to initialize after a warm
> reboot.
>
> Fixes: d28e1a48952e ("wifi: mt76: mt792x: introduce mt792x-usb module")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt792x_regs.h |  4 ++++
>  drivers/net/wireless/mediatek/mt76/mt792x_usb.c  | 13 ++++++++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
> index 7ddde9286861..d2a8b2b0df32 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
> @@ -392,6 +392,10 @@
>  #define MT_CBTOP_RGU_WF_SUBSYS_RST     MT_CBTOP_RGU(0x600)
>  #define MT_CBTOP_RGU_WF_SUBSYS_RST_WF_WHOLE_PATH BIT(0)
>
> +#define MT7925_CBTOP_RGU_WF_SUBSYS_RST 0x70028600
> +#define MT7925_WFSYS_INIT_DONE_ADDR    0x184c1604
> +#define MT7925_WFSYS_INIT_DONE         0x00001d1e
> +
>  #define MT_HW_BOUND                    0x70010020
>  #define MT_HW_CHIPID                   0x70010200
>  #define MT_HW_REV                      0x70010204
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
> index a92e872226cf..47827d1c5ccb 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
> @@ -224,6 +224,15 @@ static const struct mt792xu_wfsys_desc mt7921_wfsys_desc = {
>         .need_status_sel = true,
>  };
>
> +static const struct mt792xu_wfsys_desc mt7925_wfsys_desc = {
> +       .rst_reg = MT7925_CBTOP_RGU_WF_SUBSYS_RST,
> +       .done_reg = MT7925_WFSYS_INIT_DONE_ADDR,
> +       .done_mask = U32_MAX,
> +       .done_val = MT7925_WFSYS_INIT_DONE,
> +       .delay_ms = 20,
> +       .need_status_sel = false,
> +};
> +
>  int mt792xu_dma_init(struct mt792x_dev *dev, bool resume)
>  {
>         int err;
> @@ -254,7 +263,9 @@ EXPORT_SYMBOL_GPL(mt792xu_dma_init);
>
>  int mt792xu_wfsys_reset(struct mt792x_dev *dev)
>  {
> -       const struct mt792xu_wfsys_desc *desc = &mt7921_wfsys_desc;
> +       const struct mt792xu_wfsys_desc *desc = is_mt7925(&dev->mt76) ?
> +                                               &mt7925_wfsys_desc :
> +                                               &mt7921_wfsys_desc;
>         u32 val;
>         int i;
>
> --
> 2.43.0
>

Sean, testing results from: Satadru Pramanik <satadru@gmail.com>

"The updated patches from
https://patchwork.kernel.org/project/linux-wireless/list/?series=1064695
do NOT work. I get the -110 error with them on a warm reboot.
Reverting to the kernel with the older patch restores my adapter
connection on a warm reboot."

You are welcome to stop by the Github issue where this issue is being discussed:

https://github.com/morrownr/USB-WiFi/issues/688#

Nick

