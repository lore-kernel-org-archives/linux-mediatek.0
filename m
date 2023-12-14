Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03E9C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Dec 2023 10:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQpEKW0vlfzqI5cDIUoQ0zKRhm/QITCtnmzIzOsRhcU=; b=GZAVcg6G/bpdBma0+AwWG+5zPB
	ym2gWuPVhsikQKUJvkPCgFPPcbjCkTkCfG4NUkGzkhyda4MXYz3oN25dbQBJwNkZQHQtrd+hshZVl
	E2Kb1Y5zXtytAI1HLaX2bmrIo1AsXdEj13FmTXVe1uYcPRE7mvYF81xpezej4SbjhRK9bDFD1EmDz
	VM7ZElm734tMsSX1uPZFDbuQMUYXmO/A+VTlbr+aGpwX3K5EqBWqzhf89rywd1whG5Dv0+dqGmKGF
	4ZZ4wJPyRnY+5E0ViX564MLcnaR2OIWAlmX6G3b51dY5u+/g2y1wr8WbELAe3M+pvoC1GM/4UTTD0
	QA53GFkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDj85-00HVTD-2B;
	Thu, 14 Dec 2023 10:39:45 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDj83-00HVSK-1x
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Dec 2023 10:39:44 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7c500dcdd7dso1271170241.1
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Dec 2023 02:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702550380; x=1703155180; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQpEKW0vlfzqI5cDIUoQ0zKRhm/QITCtnmzIzOsRhcU=;
        b=mD6N+zt2Q2pnijxi5w0keM6sT3BzXOuSBcciTqI/atukf2ONR1NKern6+3c0NcFGX7
         m2xWfZwahh0KP98ZrxN8vqx7nbVtwLWVyFlR+xGYFQ8zm5yNls3zSoLGtBENTHN2LL12
         jQksqs3yy5Ee/8tOKA2Y60jXRm7aJn36JK6uQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702550380; x=1703155180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQpEKW0vlfzqI5cDIUoQ0zKRhm/QITCtnmzIzOsRhcU=;
        b=ZX5mBVy9HnNKE7HjocSaJ7JyD3xtFoJ3aDY4K8j2piCKnCExe3zcIrIsj0KcmHQQ+8
         dO6aCm20vZkuI8bGouc5oBYiiZ5a5noROa0qHUQkgLpJZGpODfKG4g2ZwRv5r2bG7rim
         k4HE8nXI/xCTRcUDn42x2DOgyHkwj6tpnH+Fa01b/pTmc0xolFD2aQNGTpYwnAZlfazq
         b80kwn+9yMxlxvLJ2GtVBVgvH8u2El+51RdhSfVWgnVPIQ6WI/ZAJDsZGB8/gr6ex6fK
         COcBxHUgcgBAXSwZi6gNxTxIn3rLStBYToANqSr3n9bCqZkmSYhxXEYhfS9WMcIh6h2z
         QvsA==
X-Gm-Message-State: AOJu0Ywk/eSzdYZvtmJB/yW/kJOvhmej5uMibBuePQBsNfmEd0rI3GAp
	4wsVRG8bQdGI5o/XvFdTu4TonIWKZneTzknOdzw=
X-Google-Smtp-Source: AGHT+IEoNBgPRwvTcdsWJvjFoL0dBPxBguls67qWwhfGgZt6P2LaBomlFAfFYMmeP3VdsvZpmlSLyQ==
X-Received: by 2002:a05:6122:4894:b0:4b2:f0bf:2794 with SMTP id eg20-20020a056122489400b004b2f0bf2794mr3374741vkb.32.1702550379615;
        Thu, 14 Dec 2023 02:39:39 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ez20-20020a0561224a1400b004b2d650c65csm1310537vkb.15.2023.12.14.02.39.38
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 02:39:39 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7c461a8cb0dso1273327241.0
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Dec 2023 02:39:38 -0800 (PST)
X-Received: by 2002:a67:c010:0:b0:465:fc90:2cce with SMTP id
 v16-20020a67c010000000b00465fc902ccemr2107147vsi.29.1702550378388; Thu, 14
 Dec 2023 02:39:38 -0800 (PST)
MIME-Version: 1.0
References: <20231213150435.4134390-1-wenst@chromium.org> <20231213150435.4134390-7-wenst@chromium.org>
In-Reply-To: <20231213150435.4134390-7-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 14 Dec 2023 18:39:01 +0800
X-Gmail-Original-Message-ID: <CAC=S1niMvoD-EzGWqo-5fEBJLWAVk3FnxW3jq5rSj9fQ_H37gA@mail.gmail.com>
Message-ID: <CAC=S1niMvoD-EzGWqo-5fEBJLWAVk3FnxW3jq5rSj9fQ_H37gA@mail.gmail.com>
Subject: Re: [PATCH v4 6/9] arm64: dts: mediatek: Add MT8186 Krabby platform
 based Tentacruel / Tentacool
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_023943_639810_AAF01D8E 
X-CRM114-Status: GOOD (  14.09  )
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

On Wed, Dec 13, 2023 at 11:05=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> Tentacruel and Tentacool are MT8186 based Chromebooks based on the
> Krabby design.
>
> Tentacruel, also known as the ASUS Chromebook CM14 Flip CM1402F, is a
> convertible device with touchscreen and stylus.
>
> Tentacool, also known as the ASUS Chromebook CM14 CM1402C, is a laptop
> device. It does not have a touchscreen or stylus.
>
> The two devices both have two variants. The difference is a second
> source touchpad controller that shares the same address as the original,
One nit since you need to resend this anyway...
s/touchpad/trackpad/g

Regards,
Fei

> but is incompatible.
>
> The extra SKU IDs for the Tentacruel devices map to different sensor
> components attached to the Embedded Controller. These are not visible
> to the main processor.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

