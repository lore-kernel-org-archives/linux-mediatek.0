Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64209C47074
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 22:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNtKRKHLT7GbRif0IHQKXzEMZSVRXKy9jF4fRiR/VhE=; b=SkrxB5mzEGKmmN
	jDhqS3A93FKr3J2FEJ91bSh4DFYoFMqthH1oDumuK7M72LZLSEkOcVBEe/EMZPwKhd6vDVQo4yVOU
	Yn0ob+6ZPP3a2ObgntERs14WhTj9wevVpfNSsU9yijTx1sin4wbqdxlxTby9MxUzFwphghxfd8TlS
	ngnTZuixGylvTgiRaV9+0unStqRgNUAskeul/ruV9yHTdRejTbtwB69hgZw3bX844ImLJ6se1Tslt
	aV97ZFHEWgu7x9o6BhOYd0AFphxnBxelrG5aKO4BWq09CRo4FG6al7R/Pk8vKDWou1fD6YAMSZ2hr
	7hVlsZiAkiRf8fUt8QWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKn1T-009BcR-0w;
	Tue, 02 Jan 2024 22:14:07 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKn1O-009BZo-3C;
	Tue, 02 Jan 2024 22:14:04 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-556be074e84so312299a12.3;
        Tue, 02 Jan 2024 14:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704233639; x=1704838439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nNtKRKHLT7GbRif0IHQKXzEMZSVRXKy9jF4fRiR/VhE=;
        b=fChnAO+Auc7sDi38sHGqYSgtXlQhIfyRQsyIb0sG/vxktSGfT/kNCJ+eSfYxJPl0vO
         pGivNz3nVWUkh5L3rI54oN3jz/UApb7Uq1nlICuV10oYdjf9WYn+UNrooXBaEdhlWZTA
         yBS0eQ6wPRAwZd575OwfbYX2GqUZQ+i/bStb8yVlIoT0+svCKrFxOSGEQ/FSeMx6Gf7n
         HVEZwiFsID2QlfQAZlL1f9sceBLlGMixMtGkM2HqA6EoBDggrx1nUcS2LD6UKlB+rsQj
         lxgh6RqlFdMm1upVG/x066UxyrizAoiFWhpLfMQ9y4wFF21ixGSNlx6gPwanfFYHiWHn
         IVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704233639; x=1704838439;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNtKRKHLT7GbRif0IHQKXzEMZSVRXKy9jF4fRiR/VhE=;
        b=l5zgiW4auNHWNx4KBmSnzaL11D7vwbsxbLi0GNmMb8hS3lDyd1+6ao9eEzy/VNUxq9
         wTdgACkk+jHElZIVvxBXMWCMmZpfqTI5BGnzGjm8ij1tLtav/lsj08ENpP5iA1L/jG7f
         14FhLu4LEaZDRjA9VQxno3gz4jCaTATBJjw/If3yhibs+Zp7yRB55mF7J68+/QJDXyMU
         V/VtGDz/QP2mXeyqoPfM/uoc/y0vfRXfV/pCzejMhCDmjW3iWMAtLpWU6zIW/9BZkXus
         AeQ+O0PCRvb/cBb/W80oLV692IJ/9B5XFjQO010xfUDfZr2ZKipzYNsub4rfkQk0YKme
         0wQQ==
X-Gm-Message-State: AOJu0YwcC1JSnoPWDLXAFN8CusrCbom4NafAwGsFlY5rYJaYDdN4Kh6Y
	HhXv0ktmYTVcT9g8YPxbYf8=
X-Google-Smtp-Source: AGHT+IEt2lfwKc8ud/gUjAY0071TQZcjd/zfGADvdh0gXWS/csgwq/BmpisH8laLc0/X9noGpGIzpg==
X-Received: by 2002:a17:906:74d3:b0:a27:ec73:7a89 with SMTP id z19-20020a17090674d300b00a27ec737a89mr1604424ejl.68.1704233638915;
        Tue, 02 Jan 2024 14:13:58 -0800 (PST)
Received: from [127.0.0.1] ([89.205.132.224])
        by smtp.gmail.com with ESMTPSA id l1-20020a170907914100b00a27741ca951sm4950747ejs.108.2024.01.02.14.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 14:13:58 -0800 (PST)
Date: Tue, 02 Jan 2024 23:13:58 +0100
From: Eric Woudstra <ericwouds@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RFC_net-next=5D_net=3A_pcs=3A_pcs-mtk-lyn?= =?US-ASCII?Q?xi_fix_mtk=5Fpcs=5Flynxi=5Fget=5Fstate=28=29_for_2500base-x?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ZZRrk85SCDmo76NJ@pidgin.makrotopia.org>
References: <20240102074408.1049203-1-ericwouds@gmail.com> <ZZP9GR15ufDbjGAJ@shell.armlinux.org.uk> <92190426-3614-4774-9E9F-18F121622788@gmail.com> <74223164-ab50-4d6d-a4f4-561b0a70d396@gmail.com> <ZZRrk85SCDmo76NJ@pidgin.makrotopia.org>
Message-ID: <6666EB36-984E-4898-A41A-2D9713DE4DB0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_141403_034329_07F4A32A 
X-CRM114-Status: GOOD (  10.07  )
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

I believe the general idea is that phylink should be aware wether to use in=
band or outband negotiation in order to setup the hardware correctly=2E Spe=
aking of a situation where there is a PHY attached=2E

On January 2, 2024 9:01:23 PM GMT+01:00, Daniel Golle <daniel@makrotopia=
=2Eorg> wrote:
>On Tue, Jan 02, 2024 at 08:33:32PM +0100, Eric Woudstra wrote:
>> [=2E=2E=2E]
>>=20
>> So if phylink_mii_c22_pcs_decode_state() should not set the speed, then=
 it is not correctly set somewhere else=2E
>
>Yes, but the fix should go to pcs-mtk-lynxi=2Ec and you don't need to
>change phylink for it to work=2E
>This should be enough:
>https://patchwork=2Ekernel=2Eorg/project/netdevbpf/patch/091e466912f1333b=
b76d23e95dc6019c9b71645f=2E1699565880=2Egit=2Edaniel@makrotopia=2Eorg/
>

