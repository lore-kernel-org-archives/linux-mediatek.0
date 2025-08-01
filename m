Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1F0C87FD2
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Aug 2025 04:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Yp8+sGL3lRpm7HC5BKRhWpXDbqCyYKzOoJSMIzIH6A=; b=leiIPJMPMUmTOR/2Qg9+zP7O+U
	v+F1RoBvP33LJObtLYCQQ8rKwr4CQiCykgXN8cEhy+G6nq52vunLgziBavVmavH2iuq04JO3fjPUk
	GgIgFVj9QEzOtE7oQg03gRMy3+U4OGqZSdP78QCfnoWggrVl6/DTxLUIVwUQ2c4zF8BEGFBMtghwA
	woa2tYvR28FSfdwhy47j75KM58PbW7GjmsLPJhk2EFrnBwzRU9lu6Mf/Gy+0YdHoNBqC3q2lQjBRS
	r4OlumosWay0iKmesOMoED29Rr94FuNx7mdr0+3FYofzmyecK0i4fb5VZkthGh2+kjWn/Ul2FqSzc
	8b07ndmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhhgj-00000004ylO-1hMb;
	Fri, 01 Aug 2025 04:48:13 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhhda-00000004yLR-1SmO
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Aug 2025 04:44:59 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-88bc6f023edso449798241.2
        for <linux-mediatek@lists.infradead.org>; Thu, 31 Jul 2025 21:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754023497; x=1754628297; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Yp8+sGL3lRpm7HC5BKRhWpXDbqCyYKzOoJSMIzIH6A=;
        b=nC67na9hYC6djvYzC6PpSeU/ay6xAqww+bJwsFlEgdYBKppS2QMOCkOVMWW6qLWz5W
         kArNFD0PQanyj+EUeUBUDWQzqpgkfQsRxVIveoOXoU3m4C5CBmdxuoH14WsEiCmScG4q
         Qe+sTyiCMuDpx8xBL6LjdwGFF/XnTIQdbGCLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754023497; x=1754628297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Yp8+sGL3lRpm7HC5BKRhWpXDbqCyYKzOoJSMIzIH6A=;
        b=By+cp03X2f3pxy7tSX/Vb5JypBg/3DzyuM4Dm4hMyTNEi7KIZRwqmn8BHpDxnF/l3i
         4OPs/q6HL1GO9LyfaAiLoFqoxHgVZZYwfzsulH8tEq9In5mCugwegJ/89EsNp543LbY6
         p5kuk+bOdzjLHFDf7cMpizWC4PJ6MbPPKADezbWzyv6XYxcr14PO+O8iPAKqE2e4hJiy
         UEkeqLHxV3sNaQ0wor2ysy+0nZXTs/W5227dJ4dLWp1M0jYVPauMqo7szaBFHTMBYD12
         /T6mSJDIT4chZx58QL8PBgD+S/lYABg9/ymLlHWpWUj0qgZ9or74/VjkSbwdD1CvsE77
         4Xiw==
X-Forwarded-Encrypted: i=1; AJvYcCXzIxOXx9q+GDcKZKi/ECRTHKbUXMVcKWIXeSMhhHpCrm8c6TniUfspo6vqXUdJoLr8G1qze/Tutw99hkt5CA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXec0NKZPpsC6CPPHe9MFVAUwMaTaD1vEVshiyZtz65KW0N7lR
	pIoIyFSG1yLEryx3gdCKphaJQcl6Xj9OSgRzEMTmTxqr5ERlPmApnt+YO88JabmBZtUQlCqOp2Z
	v1PM=
X-Gm-Gg: ASbGncveCzvebN41p8YhFqtb0K9GjI4eD6JD8xZiNfHfAW+ynumGNY1DGpOKlTcNzg8
	PSgZxOTzZn6u7JasMBiHSDxX4EI3/1zA2RBLN8B93Fy7VjShtcEKtEfF/YvMaZ/n+ZU4aIDeT5Q
	6UvxQM4nVxprxvrZWLBjTzaIdpu9luLW4u0TejCVEfG8/aTNBT0x2XU5pufPOH1BVOkiY6zA5to
	3JnycPy9A+FTtjVEq4DG7d7CYtTVcRPTg4Q5a+ATWt9jvlEUJIKaRrHhiuavP9nM6A16EKjq2Lb
	tswuD4hWnxQ8G8J1v7KR9DJxOSdhTAD6eLHVPlpTzW+j7e6BAafeo8Tqv6du7MdS6EiWHCs5wSm
	Mqh83yEYNdg43va3kA0+TtbNe1zRePzMZAWr60TeC0a6mZEC8YbZRJCuGAGOJzw==
X-Google-Smtp-Source: AGHT+IFVWNGMm0HcO/6khd4uBOUbglO2m4XOfvGQhdKD1SVIP8T0CGRluqVLBz9dU+WeLe7dro7qNg==
X-Received: by 2002:a05:6102:3f53:b0:4fa:d2c:4ff with SMTP id ada2fe7eead31-4fbe87e202amr6269686137.27.1754023496763;
        Thu, 31 Jul 2025 21:44:56 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fc0d4a35b4sm667075137.20.2025.07.31.21.44.56
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 21:44:56 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5313ea766d8so755615e0c.0
        for <linux-mediatek@lists.infradead.org>; Thu, 31 Jul 2025 21:44:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXM3X8LNeJN11rgLBu3W4dheBEh2YsBmObXB1wSA56LEpgNmh89V9w0WQET6R5lwuA4kLKEcJMuV94+k14YQ==@lists.infradead.org
X-Received: by 2002:a05:6122:521a:20b0:539:345c:f229 with SMTP id
 71dfb90a1353d-539345cfaf8mr2385080e0c.6.1754023496106; Thu, 31 Jul 2025
 21:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAC=S1njcFhyY6+dT2MHU02ZsLDq+k_vAVv==bWuoGt3KA18PHg@mail.gmail.com>
 <20250731101441.142132-1-laura.nao@collabora.com>
In-Reply-To: <20250731101441.142132-1-laura.nao@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 1 Aug 2025 12:44:19 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngjmk8-C0H2Nii4NXE3wsL1dYLQp-PXafG0=oaOVsYgmA@mail.gmail.com>
X-Gm-Features: Ac12FXx2cQ8dN2cbGqrj1qjUfxVx4elX2aD-gscg8zxkv2Gb7ghx-fdTpW8_Hzc
Message-ID: <CAC=S1ngjmk8-C0H2Nii4NXE3wsL1dYLQp-PXafG0=oaOVsYgmA@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] thermal/drivers/mediatek/lvts: Add support for ATP mode
To: Laura Nao <laura.nao@collabora.com>
Cc: andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, 
	arnd@arndb.de, bchihi@baylibre.com, colin.i.king@gmail.com, 
	conor+dt@kernel.org, daniel.lezcano@linaro.org, devicetree@vger.kernel.org, 
	kernel@collabora.com, krzk+dt@kernel.org, lala.lin@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, nfraprado@collabora.com, 
	rafael@kernel.org, robh@kernel.org, rui.zhang@intel.com, srini@kernel.org, 
	u.kleine-koenig@baylibre.com, wenst@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_214458_417119_CB71B19C 
X-CRM114-Status: GOOD (  20.53  )
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

On Thu, Jul 31, 2025 at 6:15=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Hi Fei,
>
> On 7/31/25 06:25, Fei Shao wrote:
> > On Wed, Jul 30, 2025 at 11:40=E2=80=AFPM Laura Nao <laura.nao@collabora=
.com> wrote:
> >>
> >> MT8196/MT6991 uses ATP (Abnormal Temperature Prevention) mode to detec=
t
> >> abnormal temperature conditions, which involves reading temperature da=
ta
> >> from a dedicated set of registers separate from the ones used for
> >> immediate and filtered modes.
> >>
> >> Add support for ATP mode and its relative registers to ensure accurate
> >> temperature readings and proper thermal management on MT8196/MT6991
> >> devices.
> >>
> >> While at it, convert mode defines to enum.
> >>
> >> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> >
> > It's not visible in this patch, but a heads-up that I see
> > lvts_ctrl_start() also depends on whether lvts is in immediate mode. I
> > wonder if anything is needed there for ATP mode e.g. a new
> > sensor_atp_bitmap.
> > Feel free to ignore if this is a false alarm.
> >
>
> Thanks for the heads up - the bitmap for ATP mode is the same as
> sensor_filt_bitmap, so the function is already working as intended.

Acknowledged, thanks for the clarification.

Reviewed-by: Fei Shao <fshao@chromium.org>

>
> Best,
>
> Laura
>
> > Regards,
> > Fei
>

