Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4B9CEBF97
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Nov 2025 06:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xPDqTOMSysXGINTTvRQnNReggLR5szicUimARShbck=; b=Ex3rU6CY1FOraMupME1tM2FLKt
	VGJfhlDWN4fKO7gXnRfjDw5GDQoKOrDuTc7Hss/Ts0Yy2ETvFLfNwa2bwtII/Vo780IgAkKlavrjU
	bRysdbM5H0OJvcS5vWhUsWiZoH3H/k1UN+3ncJO8TfEd92Dr4nMgDKIMHuidZSQg1+VooG5VYtxFR
	LpkNKcsNBz7hKcrr9wb7izP/BtdHgSl/0VBPD4T6Fn6qvFX5LsPNHXS1QR0yH+QHIiEJQm21yYw6E
	zjYKo/Y8QY4AsQKB4wjbkfU0kyeYLW/CWyYJ5nQ3fbs7JySZf+hicTKi+JsIyzjk7C1ZmC+xa6+fz
	3fMCsG+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLF09-0000000HU6U-01AC;
	Tue, 18 Nov 2025 06:15:41 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLF06-0000000HU55-3AUx
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Nov 2025 06:15:40 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9BAC53FB6A
	for <linux-mediatek@lists.infradead.org>; Tue, 18 Nov 2025 06:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1763446531;
	bh=0xPDqTOMSysXGINTTvRQnNReggLR5szicUimARShbck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=CK+ai70j+478/4QnDauf2ZW76gfs63hZSfICJ1yCVH8uvDp+xqwVKweDKZsodMC3O
	 aie99mQNg/ORbxr2D1QxIxuAyj65SJJSsjhmZ4D/rG1QrGZaxqIPNOk/9b/v58SDGQ
	 WL7jHEf2Fig7semsUxtaMnxg76UQkeuEdc0rLOjBCx9h+3jUjz8bjaWcpME9lkdnUW
	 yVI5TFI03Wx72ese1J3lTz9gQnIxdE2ZSFksb6gJ6flJOeEUraKHEtC23smqUZrHFA
	 70BzmkUMantNGjlRT5CitjEu1z1UlBPyx2IAV7GhCYz9s8HY3M6kmi7vnBbfC9hLnP
	 ZOTWJV21cz0/jFHi/hfkMKDa1t64RlMJJ+DQm3B8jJw5czlzS1+w62cKEmja2N4BLs
	 bbpMrcjvDd6dbzpZR+Ak3KWUCZx06Sd4HOzzQ/JgLgtnGrd7I4zoSkRxdy40XtCjho
	 aTgmfbCr3ppLdabP+CKjkyExqxJLtRxtdpR4Brola8rjM+eB0iqvqmjflbaxXTlCyG
	 LTIuUvEhQtQ6Fj0F4vJ/s3RIyhv/H+K14/ClUywPtZ5PRqK33gsVJpFWAMDZP97o/Q
	 xo3N/1iWV6oUXUwfk02CvA+NBQBRg8AYwjb3q9wiGJK0p1dJSUEG6yfnCdKe+dkR/X
	 Mf6SOHz1FzT3eS31KBxrxUrg=
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-42b2ffbba05so2662931f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Nov 2025 22:15:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763446530; x=1764051330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0xPDqTOMSysXGINTTvRQnNReggLR5szicUimARShbck=;
        b=HttGdVHgVgW/kxw+zvWg90g5pR/eqGc1WwXByG52KF2xu6WgGKlCvcLyLhaAd/fBJv
         a6PHX5g2fJoj6TeThvdAgXLrxq3hS1XX5swXQHUg4x3BibKnUh9Y6YvqhUJdkL7Y1h/p
         559l91lvndTe+1lhUZ0qN2M4GM2viyrWitrUuFOmmAWQBKXafgmkvO6xOheYC9mgJRkQ
         89L3U8M1mYOnZ+qKt0AJeKRTlQ5CVBkHpnRUiLtjg66azIjW7bA2u/kTXA4w28MizouE
         m8z3zt2XPS/S0q0nc58mzhvNTLY4HA+HL0Cyb4TsYHE4KwVmJ5Al+BxgK2CaFTG6XXg9
         PukA==
X-Forwarded-Encrypted: i=1; AJvYcCWaL1FTJD0l3+2aesDZPLjjuqlVutyisp5e4iTam+CtiTAElZlf0qMTD8o8H4d21xg6uHET9t4XnvdF5cpYtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yztb2uHpYopua+1nFF1vV5KofkC1i+D71vPRzvKlkB6l1Bs08ce
	zMuDMjcOSZayEfucB2Zo9t79vuz9CK3PfKAlA/ykhmDD/62SQWtG0fbl98FdsczqzbOToHBaW2+
	KBsv1/YUKABgr6LQ6fBxcfmFLXUfaJj1YDVHuNJKRRMg2Z3UD3O00oRgB+HHrL5ojHbD5ZLM9Iy
	u1kELhHExbQhnN1m8GGJ9t/ZSSk9sLUtLPSEZ1dxr9A2eHGNCV5bnsciFpV9GoOUWl
X-Gm-Gg: ASbGnctYTt3AIGn72TgkNSUREiDlGnNN4mblsSfC589ZwsBtlbAIfTQlM4Mbig9MoMf
	dqGEQuDI1Rj4Q2R3diXxFMNYOA0If0UHw1Mp1PZ1RlQjeAgs+gVwjUlKFYkxDaOu86Z09naF9eB
	GqMLlOhWNiBM/e29xMRp29dkiIBe0VT4cSfYiBOnOMyPFS4e/ptcPNGeUX79lnOMwUPmaI
X-Received: by 2002:a5d:64e3:0:b0:42b:3592:1b92 with SMTP id ffacd0b85a97d-42b59398992mr14875444f8f.47.1763446530539;
        Mon, 17 Nov 2025 22:15:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHy67zljjCJsl6gaoTDv0BkRcJmeKCn+3ODT94OVXveyqq33VR5bEkPW+gUoinAzA6fvk06K9aUvCDI/PTkmx0=
X-Received: by 2002:a5d:64e3:0:b0:42b:3592:1b92 with SMTP id
 ffacd0b85a97d-42b59398992mr14875425f8f.47.1763446530167; Mon, 17 Nov 2025
 22:15:30 -0800 (PST)
MIME-Version: 1.0
References: <20251111124853.2916889-1-jianhui.lee@canonical.com>
 <589670a9-ac91-4fde-b595-473408b3df18@kernel.org> <CAGmiHmGiDngNCkfkwdoV8M0XjQVFEXTJekPAfuZfUFRui9gSbg@mail.gmail.com>
 <13d96b3c-4db6-48f5-b1bb-68171ffa6bc0@kernel.org>
In-Reply-To: <13d96b3c-4db6-48f5-b1bb-68171ffa6bc0@kernel.org>
From: Jian Hui Lee <jianhui.lee@canonical.com>
Date: Tue, 18 Nov 2025 14:15:17 +0800
X-Gm-Features: AWmQ_bnblymQssYaPsksjspkDuKcx6JRpIyOduuPX-K9QeLiCzChrXLoyPWaCP0
Message-ID: <CAGmiHmFVUqCW0xv2U0C++OJPL5-vLKG_Jnkw0AkS=O_6tT5OiA@mail.gmail.com>
Subject: Re: [PATCH] memory: mtk-smi: Fix NULL pointer dereference in config_port
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joerg Roedel <jroedel@suse.de>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_221538_919411_0B6AC56D 
X-CRM114-Status: GOOD (  24.58  )
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

On Fri, Nov 14, 2025 at 3:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 14/11/2025 04:03, Jian Hui Lee wrote:
> > On Wed, Nov 12, 2025 at 11:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> Please trim the traces from all irrelevant information.
> >>
> >>>
> >>> Fixes: e6dec92308628 ("iommu/mediatek: Add mt2712 IOMMU support")
> >>
> >> Add Cc stable.
> >>
> >>> Signed-off-by: Jian Hui Lee <jianhui.lee@canonical.com>
> >>
> >>> ---
> >>>  drivers/memory/mtk-smi.c | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> >>> index 733e22f695ab..8eb043ff8280 100644
> >>> --- a/drivers/memory/mtk-smi.c
> >>> +++ b/drivers/memory/mtk-smi.c
> >>> @@ -244,6 +244,10 @@ static int mtk_smi_larb_config_port_gen2_general=
(struct device *dev)
> >>>       struct arm_smccc_res res;
> >>>       int i;
> >>>
> >>> +     /* larb->mmu and larb->bank are set in bind(), may not be ready=
 yet */
> >>
> >> And how do you synchronize this between CPUs? IOW, what certainty you
> >> have that this CPU sees correct data and the checks below have any sen=
se?
> >
> > Thank you for the review and for pointing this out. Moving
> > pm_runtime_enable/disable to component bind/unbind should ensure that
> > the synchronization happens correctly. I will send a v2 to address
> > those you mentioned.
>
> Runtime PM synchronizes nothing in this matter, so I don't understand
> what you want to achieve with it.

The original issue was a race condition where PM runtime resume could
be triggered before the device was fully initialized, causing NULL
pointer dereferences. So moving pm_runtime_enable from
mtk_smi_larb_probe to mtk_smi_larb_bind with the barrier presumably
fixes the issue:

@@ -171,6 +171,9 @@ mtk_smi_larb_bind(struct device *dev, struct
device *master, void *data)
                        larb->larbid =3D i;
                        larb->mmu =3D &larb_mmu[i].mmu;
                        larb->bank =3D larb_mmu[i].bank;
+                       smp_wmb();
+                       pm_runtime_enable(dev);
                        return 0;
                }
@@ -664,15 +668,13 @@ static int mtk_smi_larb_probe(struct
platform_device *pdev)
        if (ret < 0)
                return ret;

-       pm_runtime_enable(dev);
        platform_set_drvdata(pdev, larb);
        ret =3D component_add(dev, &mtk_smi_larb_component_ops);
        if (ret)

> Best regards,
> Krzysztof

