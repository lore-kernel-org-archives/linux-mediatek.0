Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112ECC54E5C
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 07:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nXejeh4l9H+06qZGldlEJ+T5glCtHAjj6L+4wjA2ME=; b=bprYGAjc1WfXnpjzqmfNoiiPiF
	QPsIqEOcZCFaTmlfGp5vpP8XE5qht+LiVuyhxHWUyoa8Zu8aWi3gs3hBDru54k12RPJ9/74ZSaqAb
	TSp2z8I0l8X/vbNeNHkXJT8dFugfE/sGLuhQhUlnXoZCAPSVDEyCp1iXLrffHtW5zQEsio9VOtk9V
	M2EzpOrKIutOim7B+14PGrZTHiuwMvvscdQUAjqWNzW+JLbkzV6G2U1DYOhq4zxR21BRNCaiPQftP
	oY2XPB0iUJmB19hTTPtXjZTovXrO10AiCw5LmdLMdks1S3m0JCvtX5FglbyE5aNcIANq2IHzCnHar
	YEN7CtcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUfp-0000000894J-30dS;
	Fri, 08 Mar 2024 07:29:45 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUfm-0000000892t-07zj;
	Fri, 08 Mar 2024 07:29:43 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5a1be5dbc52so476780eaf.1;
        Thu, 07 Mar 2024 23:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709882980; x=1710487780; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nXejeh4l9H+06qZGldlEJ+T5glCtHAjj6L+4wjA2ME=;
        b=At//5x1y8mthOnjQEh4O9ax6iIbZnB9pyniO4aiPY883up6qDAg53U076ehj5BVET4
         i0KGS3d8CIRVZYSa8TTv3smp6TWhI6oxdThWfsvI92f9AuFmSx4fmw785SxKExEu071r
         thgabXB+0OkRvVtV5wLNPiWZtjjWmVNhF7AmNPq3JeHSiKAzyoQ/aQb/BfnnzcSNde2N
         UDFeYVcPnWnzk66KBR/pPqjwxTq8hboLTHQqnVw64zYgn+N+lc7+xzr0FUqb2tDHFYe1
         soQosSQkpiINFlcloimW5oyU96zSTc0ObET9Ci+GRa9rZNiS+viRLXs0+NLqAP6bGfYS
         6vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709882980; x=1710487780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nXejeh4l9H+06qZGldlEJ+T5glCtHAjj6L+4wjA2ME=;
        b=BBLEQBjG51+pw7MY8hzuk0XuoKWs6asoxKtHgFcq7Oy/ubcps0IsLOI1Syzv9ypBjr
         IbAmDkRNxP36icmU0YA8A2Eh0kBnkGBrNiEapP0z8j8jx8614ct/ZnHL9+A16EgusnRX
         u/+JFgyWFp0+0JJyonvcpaiEq/uo2fNXp6vI7swQ2p/MIVxM2SdG7QeRgeE6ZbBtTeN8
         uZigzrCtNFdCpNpIVji/nK9L93B1aETozhZHbOaEwqobKtdD1F/iw2PRXeQsdXZFjA4A
         a6grRgrgjmYFU1khoXNyZGuiisDm8roEU4U0AEvyZ90lBI4XNIZxhzcxrnIRHUnPYDND
         9jhw==
X-Forwarded-Encrypted: i=1; AJvYcCUq1P5HDNB7ZLaCh3nO8x/A/0UivfNu37atHMVNn7zlcCfWeBZjJXAtZA84/bKuJI51paeTtjPVL3WnckRD37Jdmngyms4PPhQOpGvJzzwLEhkdGxsMkCrGl3bwuOLWcvEKKTed73ZVydfdBiS8CFti8UpwMk817Y8=
X-Gm-Message-State: AOJu0YzVRjV64SZXFp9EdLTsbdfLS8PKYtwM8NE1GBvTdR0ZtUWc0hNU
	EL9Tk1BgyIn2Tt/BBzCHGjBikMB55cuR3qXoAhzO3TKowIP1R//ug/0SOyUZVTPIY9wpW9/VfH8
	dSxbc7XySIDRZPou4LzLgtTSC28k=
X-Google-Smtp-Source: AGHT+IGfPKC1vAGMMd+/KzXy2O0/LixaCY+jyT/LJJSJQrZ6JoQiRQvUj1Su1Dj3OW3cPC0bKw+srckL7pOTKUdmbd8=
X-Received: by 2002:a05:6871:620f:b0:220:a34d:d26c with SMTP id
 rd15-20020a056871620f00b00220a34dd26cmr909873oab.14.1709882980664; Thu, 07
 Mar 2024 23:29:40 -0800 (PST)
MIME-Version: 1.0
References: <CAMhs-H_eUKm7C40oCzuKwwEMZAcOJ-g4MghAfkGAmxRM0AXPUw@mail.gmail.com>
 <20240307190408.23443-1-justin.swartz@risingedge.co.za> <20240307190408.23443-2-justin.swartz@risingedge.co.za>
In-Reply-To: <20240307190408.23443-2-justin.swartz@risingedge.co.za>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 8 Mar 2024 08:29:28 +0100
Message-ID: <CAMhs-H9Z4iB-MA4_CwsJAee5CUDNFynT0nLoBz_3A-ToJzJ_xg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mips: dts: ralink: mt7621: reorder serial0 properties
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_232942_087881_1DEC0610 
X-CRM114-Status: UNSURE (   9.47  )
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

On Thu, Mar 7, 2024 at 8:05=E2=80=AFPM Justin Swartz
<justin.swartz@risingedge.co.za> wrote:
>
> Reorder serial0 properties according to the guidelines laid
> out in Documentation/devicetree/bindings/dts-coding-style.rst
>
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

