Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7D8C83F17
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Jul 2025 04:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYfZznB0Bwd01EwuH/VCVY8bkI+jlyZ0D2t//XUPrtU=; b=QKKER8Ptu4EcIA6+kfaw3eetYv
	s4MMTB8M3z8rhfYNO0SdrBBMcjTmT23cbH/P/MCqpADNSj5nSuGqT0EHg02j9E9KgEwa4YW0YXuLA
	BpNMLs+2gZixF4dBAWw+ZVcLqg51rrVadB46LEbObAIJMefAeUpfn6z4dXZPh84bVckKagIlY2PEv
	O/XsdNXZaOIz9V1BgOBxiRdmyJzAMtnen3+vTuQJ3E8JQGExzETmGta0O1wlQLvaziHI8OyLJklWo
	rADb9EFPqi88mAUmVQ2x4gb5Hmsf4EQDeRnnQ5fNja/reFoEcxEEqPpAafI0Zl2wZlU2LthLveq2T
	JKSGDGfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhKZV-00000002rSZ-22Pa;
	Thu, 31 Jul 2025 04:07:13 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhKZS-00000002rRs-1zdE
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Jul 2025 04:07:11 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-87f234ba1abso119017241.1
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Jul 2025 21:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753934829; x=1754539629; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYfZznB0Bwd01EwuH/VCVY8bkI+jlyZ0D2t//XUPrtU=;
        b=ZmHVU0S13qktS0QimOqNR0XId+PKPomLQaG/1VNIrYZ1/dEPJrfc/thSUfJl3UDhlq
         snFUyKNUykjNlHorwNFfm6gxbMhSQ7At8nzEqIJXZPMDFPs2RlKMhpZsiD2JbdAjqPKX
         9t2nnKtFaHU5n5kGJg7ZxEB//JsmGQhOl963c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753934829; x=1754539629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYfZznB0Bwd01EwuH/VCVY8bkI+jlyZ0D2t//XUPrtU=;
        b=Z7UyxfJkE4Dge9P+T2q5gtbQxSaRsSUf/AuyNr54W+zI8oBjt3iAyeA5u1BknxMNbe
         nk1qFhO7zo3EjuLDJzq4XCPiFGo+AatpIKG8HfhPMIGUOaP7JtVDCWfOat6XgI5adP5D
         iditN6vwAXXZqVHeTJybaE2cZq2aGH/cadnmqO1gAHCPVwznWS6cUKelZl+gZ0PxgIIr
         4pt0MbMsrNmc/fpM2rGDbxlpaRBOl4DWsI+A6a0dVEysJLx5gs6FW/VdFW/y2LO2YnpG
         7P48Dst26qMrsdSEt1WPsF2gQii5EUoi4sgoR75hwwX//NHh+bfPpq3qxuW1LPIMIUfm
         qOQw==
X-Forwarded-Encrypted: i=1; AJvYcCWXi0uao4Z6XXG5PazdRPYDdlAs2ToJPNTK+Xn0AJQTs2dpRbDfaVTm4MWkQG0KRdlN71SlEp+i2uROFgJi6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFOrlj12vzisrC8mDy7OyTwSLVkZC/gnCmj2uU2wSMR0PGe5qi
	ImH0lpOGiHmp7fU08T+fuxgsaufGx44mN6iJz+u1xuq6HhVPtzjIQqfz/P1rkTUWltW9guv1JXq
	gF/U=
X-Gm-Gg: ASbGnctKLHAsxc9hxdQ9XMKD9EWT5htbrHRRxZ3+s07wfc4rW2YGtl4y169AKP56rr3
	ONlGPf+8pwSf+ixYGvtC+TbetyjX6O5VzRA2NW7WmcxVNCsEkW2XXBj4OLHKj3mEIOI/jfwlTBw
	qrXE8rpUHlxFtnr/natLgf4RSA7LSzy4vrQ/ed9zOgEzQOLfdNII7zAbdSG5BZsWalqf1c+JzCL
	0aTvD96ej5iZNEWM5zkY4V10Q+AYu686RJf1Zc9wYztxtGSmJoutiOuX/xMUcOLpzzWYwIL0KSu
	ahvXDvrn/Di5n8b2wauk5bAUQXx0/vMyZ6vxnmHfs3MZ9O7+qdCvSCF9SxoSOui4br6RB+wjnfX
	WFpUdlj8X+xjDHG/M938q3V0HXvX4RTjuDKkiqxgCDiVyuLtL1A62TK8mue7m3AnQ0wZh
X-Google-Smtp-Source: AGHT+IE0AAswnI103ZvmjWhpzLjQ0/VpfEORZxR0PbqueFDQNozEpwueuoxEVQT1XtNFLOaieyeOYA==
X-Received: by 2002:a05:6102:1515:b0:4e9:8f71:bd6e with SMTP id ada2fe7eead31-4fbe7ad3035mr4387157137.0.1753934829343;
        Wed, 30 Jul 2025 21:07:09 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88d8f3257d7sm204658241.2.2025.07.30.21.07.09
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 21:07:09 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-87f234ba1abso119014241.1
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Jul 2025 21:07:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYnmH5OusytVHE8Cx1LfXpA8miUCwTJB2tu2bc3mop9tGZMBfjhoPWMuBSM7Ypc6z/9mQaMqT49kN7Xmjn2A==@lists.infradead.org
X-Received: by 2002:a05:6102:fa0:b0:4e5:abd3:626e with SMTP id
 ada2fe7eead31-4fbe87eaa8cmr4099520137.24.1753934828784; Wed, 30 Jul 2025
 21:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250730152128.311109-1-laura.nao@collabora.com> <20250730152128.311109-6-laura.nao@collabora.com>
In-Reply-To: <20250730152128.311109-6-laura.nao@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 31 Jul 2025 12:06:32 +0800
X-Gmail-Original-Message-ID: <CAC=S1nj0F-k37-v-gp5A4p3B_R9Q8exM+STb6vLhJ46=oQV6Eg@mail.gmail.com>
X-Gm-Features: Ac12FXzu20jT5Yk4GmMtSAZzZKsOMgulvP8pOesv2GOi_pI-RDe1qMoPgLQDq0Q
Message-ID: <CAC=S1nj0F-k37-v-gp5A4p3B_R9Q8exM+STb6vLhJ46=oQV6Eg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] thermal/drivers/mediatek/lvts: Add
 lvts_temp_to_raw variant
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, andrew-ct.chen@mediatek.com, 
	kernel@collabora.com, nfraprado@collabora.com, arnd@arndb.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, wenst@chromium.org, 
	linux-mediatek@lists.infradead.org, bchihi@baylibre.com, 
	colin.i.king@gmail.com, lala.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_210710_513956_72FAA12A 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jul 30, 2025 at 11:37=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> MT8196/MT6991 require a different version of lvts_temp_to_raw(),
> specifically the multiplicative inverse of the existing implementation.
> Introduce a variant of the function with inverted calculation logic to
> match this requirement.
>
> This ensures accurate raw value generation for temperature
> thresholds, avoiding spurious thermal interrupts or unintended hardware
> resets on MT8196/MT6991.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

