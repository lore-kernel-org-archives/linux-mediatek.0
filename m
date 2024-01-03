Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF26C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 08:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XiqjQ4CtsdHzeZ/6fpkEoYxayaW7/f/QwsswQ02BtUY=; b=BwuqjZyJyNIIUZ
	D+kktGfZwsF8RseMenNd5UOLjFqz4y6simWHMrt5H/0lLNR6ML6zC8ym/WpKr50cKmS5/0NddslMe
	CedFY5bsPN9s9myJ0Pf0ZnIWntIc6EPyJhcbxxNMU7J9+jfSSKblULdZSazjrvmZm4re3wLF2looF
	t6ESK5y6+oLNNETAGYbcoCTWRXog3K+f/Ay9QCyU/PuEgqXHeVdBEG5UCwphnhWI2ELVynmaS8sXy
	SG5CNpKr04Oor4EboI+UWPueYIBVydQQwo7EqXMULqUqep1laAx3TwqdPK7nX8Ud3oqWkt58bzP5Q
	isrQEv2XZtNjik33/fSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKwxz-00A82v-1h;
	Wed, 03 Jan 2024 08:51:11 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKwxw-00A81x-1X;
	Wed, 03 Jan 2024 08:51:09 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-556aa7fe765so1115509a12.2;
        Wed, 03 Jan 2024 00:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704271866; x=1704876666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XiqjQ4CtsdHzeZ/6fpkEoYxayaW7/f/QwsswQ02BtUY=;
        b=Tgjry9ueFKW0maWffrq5cfSbgpdVIVo0axlT32V3Q9ME908/nV2NPCiH0sLAGFP5aO
         16pZuWWB0sOUky6CHhxh4I/Aht7NPKpqaz03jutgoGTTKEByzKgXewUaq/S//YAxhVXt
         8zynTFfMLAqT5DzMBRub+heDThDmk1LmG5rI7nU141qK6ODXT0XGtrEYCorY18CSS88t
         5RWh8RR6wbf56ByImbWCUh+F4n+Qgen4bjIH1TzVtGGxhHezNrxMNotRE+3qvjXm9eg0
         GCfcwLMcHY3VBXfUn+8S7VD5Nkr2JCm44r0ulBMXtdyEWBgPzDiYqTqeCwKLBFXyEXE2
         QM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704271866; x=1704876666;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XiqjQ4CtsdHzeZ/6fpkEoYxayaW7/f/QwsswQ02BtUY=;
        b=nvYf2D4IvOpofW2aG9zdG+VpTMyTP4zoOqMV0PhEFrDuNigtAqvmdebu7IQ/JJWtdw
         0upt4JoMjdPNM85hQyLeQ9RaLSaV5t2kUm9F/iZ9kk2wEHuCgC+aTIGkZO5oCVp7f9qo
         V4JI0XSucXDIED8pZ/sgrHsHz4ZF9dUYOLk0SeMv4s8IftA/MxYSlctwtcAsV1h05BWZ
         +dj7y+eh7SeDafpHLlLmYkWSC2ic7ScW6bBrFEbXw+/PjwHLHZ+zN9lu4LD1cv0GRpuT
         LL+PYnK5AtoHSp8os9wZJPrOH7gZNPzdJRpDEKUzkzpE0crhR9Qq2nD2qFi0f+BpPiqi
         4S7A==
X-Gm-Message-State: AOJu0YzKjzRxW3fcABFnAf5hRc+u7I4hNlVjegIjupfXS/rOMWE1qg09
	MwCgo5y0kLg2EkKzBG1KbW0=
X-Google-Smtp-Source: AGHT+IGNYJlgqX4aL4rwFT6qPkLkPCNzu0T6qFd3mLQ/9Gm/aUXTDoxlbkwKVyX8g/IDS0wJ8Nwjrg==
X-Received: by 2002:aa7:d795:0:b0:552:3044:1df9 with SMTP id s21-20020aa7d795000000b0055230441df9mr10602167edq.67.1704271865117;
        Wed, 03 Jan 2024 00:51:05 -0800 (PST)
Received: from [127.0.0.1] ([89.205.132.224])
        by smtp.gmail.com with ESMTPSA id o18-20020aa7dd52000000b00555a0fa2211sm7690447edw.31.2024.01.03.00.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 00:51:04 -0800 (PST)
Date: Wed, 03 Jan 2024 09:51:06 +0100
From: Eric Woudstra <ericwouds@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RFC_net-next=5D_net=3A_pcs=3A_pcs-mtk-lyn?= =?US-ASCII?Q?xi_fix_mtk=5Fpcs=5Flynxi=5Fget=5Fstate=28=29_for_2500base-x?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ZZSX_oNUIQr6R9FU@pidgin.makrotopia.org>
References: <20240102074408.1049203-1-ericwouds@gmail.com> <ZZP9GR15ufDbjGAJ@shell.armlinux.org.uk> <92190426-3614-4774-9E9F-18F121622788@gmail.com> <74223164-ab50-4d6d-a4f4-561b0a70d396@gmail.com> <ZZRrk85SCDmo76NJ@pidgin.makrotopia.org> <6666EB36-984E-4898-A41A-2D9713DE4DB0@gmail.com> <ZZSX_oNUIQr6R9FU@pidgin.makrotopia.org>
Message-ID: <654EAEA9-052C-43C6-AA8E-16A30721A916@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_005108_512223_A4BDA3AA 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Alexander Couzens <lynxis@fe80.eu>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

>Surely, having phylink take care whether SGMII_SPEED_DUPLEX_AN should be
>set would be even nicer=2E
>
>I believe that source of confusion here is simply that
>
>in-band-status !=3D SGMII_SPEED_DUPLEX_AN
>
>We *do* have in-band-status even without having SGMII_SPEED_DUPLEX_AN set
>with 2500Base-X link mode (as in: link being up or down and link, duplex
>and speed is fixed anyway for 2500Base-X)=2E


All clear, and even with autoneg disabled, one way or another, we now
have a non-functional 2500base-x=2E Cannot manipulate anything in
userland to get the connection functional=2E We need a fix in kernel=2E

