Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C877ECA5FCB
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2026 03:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4ijuTp5svOtTgrjejnJF22Eh5tEOHO/CkeB5GXCR3I=; b=E5MgR3AmwAd51KHVp9LJVFGLtu
	+Wnw2dwzwVZdk5iJDvtqY7e01NTCjtsixaAs9/SewsfUXCS49FRLt1WgUX+sdQ2k+b2WA83mR7qSu
	0qlAGkYD2JRNcPFWkWyG/Lw3qEQOwCyzwg2awq2t738dh8YwjoDTBKEKGzu+5GMA7UbYhcPo3q8Ba
	tIWrjHGiyA6ukeroYgyQQFUCNlflGmpBA8yYcOYkcAx25AWcdoOA49o2M+6US7fRO01+73QpvqFIU
	64iGPiFNQjYaX4dwVIakoFSCn9qML+tutsHL6WmUvHYQxpqAsOX37p/Ij0oToqnqfc8TTmITHRp5D
	2MfswjhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7iS-00000007guk-1m2M;
	Thu, 01 Oct 2026 03:44:16 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7iP-00000007gt9-1upb
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Oct 2026 03:44:14 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-8198a3a54d7so2272035a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2026 20:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790826252; cv=none;
        d=google.com; s=arc-20260327;
        b=ZjWAuX09XKQMj28OtdYer0Jrx9J4VdQ7d5+6tthjTsya7uPdZ1/iDzNyo9WBHUPfc1
         5AhOKmrUzmUou0qbY2mDz1NgWm2O8CC9In10DYKH3HCW+/YqpJSuEjdm3CQ48nxp85OF
         YQ26PxScL8v6UiVt98ARAskhSnbFdSm5sXw9VQlkadzNp3ucUDTvXJJH4IiTbfoWPZPX
         P48PtycdzK1BNV0ijJj98pU5OJJmKDwzbUjeSLOYmMKM+VJ4plcYm9pg1GX2wnCBUgGN
         Qe4CM/kJ4wmPOgfnMBO4DxbpWNphfYmaBOHj09k2XsSkJbwwHt5GxlGNCQVh90LGha1K
         miQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w4ijuTp5svOtTgrjejnJF22Eh5tEOHO/CkeB5GXCR3I=;
        fh=PJVOHfPVF/tGV6Ng13HrhkMD83pX/sLpDjHr6mQCckg=;
        b=IKM89DOfzg93Nn7N/2uB1inIPKm5Xp/BnO1jLHdITdk5bFsWg9UyZAU1+LvcVNybTC
         oYlruWbl63At6iv52izrw0lmcUX/00dfML0nGQJsgVFfEh2Jft/Zji8hCvCIqHGtcIL+
         0uU5y39sRRE8I+KECPSHXtLhCpajXDnfOWz3ECyWV1eSxSf4TCsWvomqqjqwSfGAqDHJ
         ojAUbveVuu1sdBggpTAjLHNhVlNx46Y1H6eKfC5Dai+5YC78YVkRzwy2o+CV2bifQY/O
         1gDm0e2HVbZnMbjcgKhA/KWYfK61/OpG2UgzmPjyy5O2xe9Yc4q0tawmTUd1iIZ/NPV0
         dO7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790826252; x=1791431052; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w4ijuTp5svOtTgrjejnJF22Eh5tEOHO/CkeB5GXCR3I=;
        b=MPdSxzunuqBpc/isMDSJBdZTpjxlRHnLusP0cBm41B/idI+zGqS2xQyhL6gTXM9NoN
         0Cg01w5TAhr78K13mQdUa0cMhTeYxVLmmau0EkoZaMW0y0O5RUJlvwHRNV7RvF5ExDoy
         VN0r5ngl+CavejHQMGeMgwwnAPExkcl9aH9vEca8QsKtRrOY89riF9Ec/QWuBrFE82aI
         abeHInl6dWnO3Wih6yoKCeteoaE0snEwYKX/M94uzT3Rnt3TKo7J6NmJsD22rJIPjj5+
         i7i7RrVfUXy3lyQYzCObJmtpfYYeNdZq70BHTpf/ciW7mLNFsP2dmZt5uvZEq5F8Aq6w
         i30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790826252; x=1791431052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4ijuTp5svOtTgrjejnJF22Eh5tEOHO/CkeB5GXCR3I=;
        b=Byy6n+SEDUd92GNMw/Xse9onJkQ+HmILNiz69ZDoiciIc/rMANirYGG72Z+9oaNTDp
         CEjRgU/hoZ5CaAGctTADnnntxsZtL+j2MxkKWzzMqZO9BXE2uOK8ddDQzvheZPi8TxwO
         P2CgQt5FjNI8ltiZmjc1WezeIUHlpbAvwoBeDgBphDFFEF0HvgxYMOO18ECC8lCCs88A
         S89J6KLpo0SdPG6KMFGUC2zCzg+Wk4H0ZGKcm9dMxEhAKiPJyc4K65wAVYilHEKeMVZx
         gbR1mas43P3tGIs20BUaqjsH4DvIccWBVbqkzKm2/ZMPvmi6QnGwJa0arw68r0vAeJva
         6jLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJyUVFD3EdfA1M2P1eCN8/86UWigi56apt8q73aBwV/WpZGpsM9+d6S+2uLSMRZCp9+jzk5uDrdJt8W6/y1A==@lists.infradead.org
X-Gm-Message-State: AFuF++kcM0VSp2CIyJ99sBD3P3wDuAz9bsUVs1Bwo0xPLSPZOLKVX+Sr
	8MUdhtb6XwYB/lvibTb23eHEV41gpChOyC0/SmylmQfGlhZpfltIz0Niv8EAavqv0v9btWZJNql
	liYBj5tcwmT2xYtY/1JAhlwp2vDOK/WQ=
X-Gm-Gg: AYBFou2Xbuv3dAvgzESYkl0sJs3l2GMsEwbwNVIySgaDnCSbTBDSeRgBQ1o7D62/S7e
	MKPyH5Xh4Ojii3PR6xUpHl6WKGEX8XLNtw6/Tbsz0iwgSuCwSaV0lVi1n8B6ObmgmF9T/xM+VfE
	YZ51JyRpB299/N02hMEGeb29IyVqGAjOQzIHRvV3aJvnb7qyNyXdDxB/dxQ4T0K1irK6irrx7a0
	X6i3cqzXi6mYHhGCI6s12jGCf1UeT1qH81XeiIckddeDQUUUHDEQJrbWLUT+pzCmvIgLAdkfyJk
	KIfg/bRywsuZpzVGcvecvy0qzaPbr3nGVK5enm9yUKVQu057nJz4dK6RdrW2/m93kAI=
X-Received: by 2002:a05:6820:4cc7:b0:6d9:58a1:824 with SMTP id
 006d021491bc7-6ddba7942ffmr1480642eaf.22.1790826251774; Wed, 30 Sep 2026
 20:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
 <20260926-b4-mt7629-toprgu-v1-1-c124bf9ac273@gmail.com> <20260929-spiffy-harrier-of-snow-b78e7b@quoll>
In-Reply-To: <20260929-spiffy-harrier-of-snow-b78e7b@quoll>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Thu, 1 Oct 2026 11:44:00 +0800
X-Gm-Features: AclHuK9LNVBWetA4umqzLuoUjfCXVTn1WDE30aATZ75mv1-R3SpbZ9mzZOo88bg
Message-ID: <CAJsYDVLimYZXk6mFrnsObCYFnK3HxqVJpuee+msnCi-GAUTXbQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: reset: mediatek: add MT7629 TOPRGU reset indices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_204413_508140_10B56604 
X-CRM114-Status: GOOD (  18.78  )
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

Hi!

On Tue, Sep 29, 2026 at 4:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, Sep 26, 2026 at 07:13:59PM +0800, Chuanhong Guo wrote:
> > Define all seven reset IDs documented in the MT7629 TOPRGU SWSYSRST
> > register: INFRA, ETHDMA, DDRPHY, INFRA_AO, CONN, APMIXED and CONN_MCU.
> > Use their register bit positions as reset IDs.
>
> If so, I say you don't need bindings then... but fine except:
>
> >
> > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> > ---
> >  include/dt-bindings/reset/mt7629-resets.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/include/dt-bindings/reset/mt7629-resets.h b/include/dt-bin=
dings/reset/mt7629-resets.h
> > index 6bb85734f68d..828919eee298 100644
> > --- a/include/dt-bindings/reset/mt7629-resets.h
> > +++ b/include/dt-bindings/reset/mt7629-resets.h
> > @@ -53,6 +53,15 @@
> >  #define MT7629_PCIE0_USER_RST                        30
> >  #define MT7629_PCIE0_PIPE_RST                        31
> >
> > +/* TOPRGU resets */
>
> Didn't new bindings switch to continues indexes?
>

This is written for the existing reset driver in mtk_wdt.c. I don't
want to add a reset id remap when all the other SoCs in that
driver use binding ids matching their hardware bits.

Is this OK for existing drivers?
I can also live with plain numbers in the device tree if that's preferred.

Another option would be to include mt7622-resets.h for mt7629 dt
as their TOPRGU definitions match exactly. But that would bring other
unused mt7622 definitions into mt7629 dt, probably not ideal.

> > +#define MT7629_TOPRGU_INFRA_SW_RST           0
> > +#define MT7629_TOPRGU_ETHDMA_SW_RST          1
> > +#define MT7629_TOPRGU_DDRPHY_SW_RST          6
> > +#define MT7629_TOPRGU_INFRA_AO_SW_RST                8
>
> Best regards,
> Krzysztof
>

--
Regards,
Chuanhong Guo

