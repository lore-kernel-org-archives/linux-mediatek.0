Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15270606A31E
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 04:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=alaaf1ER;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D9PQ/Jq9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-Type
	:References:In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qhf6HHYFUlV0Ii1kQze/CtNGoi88xb50T2RCDKewG6I=; b=alaaf1ERTmesvuoCtelcMez1jB
	n25/o0G9vMtgWMB6c+GrJlUfVJg/EjYZDT//L+L9Cp4kGYvhAGc7XpXNscHOfhq+2T2Zm233CLHPi
	SwE7i6LpDY4uqQ/jEf3zd8+ZPbd0XYOcJ0iHf9mVnyCFQ2Z7d1MtKDTkkflNkID71RlkP6wH90BX7
	jJTZfL6hV8WIAmdBlP+OFpeYmGNVZqICAjsfnGL2k9RGl62PlPl/STyEKl6RloEWNjcXOL/hropgJ
	t3tX+C9E6zhE8bfl7MhQqx3C5G/rgcXGLqFTEyLOhH0wgeJwfCwwrz/z0+Gp2gYCSV4s2NsB8mwTa
	i7+Gum/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXA7c-00000000N6K-495N;
	Sat, 28 Nov 2026 04:33:13 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXA7Z-00000000N5Z-3ucS
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Nov 2026 04:33:11 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3b53db3d0a5so458304a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2026 20:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795840388; x=1796445188; darn=lists.infradead.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qhf6HHYFUlV0Ii1kQze/CtNGoi88xb50T2RCDKewG6I=;
        b=D9PQ/Jq97fX4uSU+v2R/mHfPeAyxKNhYK0nSLpWO11173oYxstsgMAegR6Vzk6AFic
         RCZ6rgPcNS2YuNfCa6cN7MnUucTuT+yyzl9VA5l9HckOVb4s1+BvmsIma+x9nnxqHGmL
         52jSfolOxNStksbdoVit6fml9SDn3M8Y1I+aGx5raqL4J58H7BcAxjVtXxfmNl6OQ5yA
         Aza0AIskZBAjsbKe6qetE3Qzy8AuJkNYltm9fVR6MV/IVQYdl4DdKXSO34v3Alg/S6PE
         hxvLIjQK7mhBHyVyNeu5AGB7pmYL8pM357hOCy4k5XbBP0EDoA5+YrgWew3F4I1liFL9
         +U0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795840388; x=1796445188;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qhf6HHYFUlV0Ii1kQze/CtNGoi88xb50T2RCDKewG6I=;
        b=uWAieqrlf8SNhtWMW5Saf3zYu99iIXmUPOesMO1NWcKKVwAnxzCHO+tYvWllQtwOeP
         ev1LX/9mUyf6gnFEuYJ+2I3fqOuhI7bNElbOR/ZAvl8FibUV06M0Dy33svMIKWvWVCRU
         VvysJb9dcDPOHR7NmY5UP6Xt8Qt2DGDU0+KyjaLWUbFSr9SPKmgOnzAuRUwbAR3nGbg3
         YPcGSUymUmlJ4kcMW7mnunfMkYInoIFZ2kToN0A48QIojSzG1YpD8zI5vcURcBbuSkzX
         Lk7HgXBsBiUGYjxppy88IF4BBhFdviMryjxbEnYV0D7JtT79+pAQqNAzVhb73TTj517w
         b5Zg==
X-Forwarded-Encrypted: i=1; AL+hErGmDs8ZV//xBrnl6oiVQENSjcFnzlHpzKZbp3tRmkyWgLPFvZh/WsXUWAAtWWzA3AeT91UkvwGWhrY+KADOLA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8LfiCBOSPL4HA8yleDcnylbIDB2qt10gpKNfdH39cGbSCITOy+
	7XWPmM5lq3xje+wkV5HhheIdQDGIT2hjEL79Ge6hsOkCY/g8pd/qG11j
X-Gm-Gg: AZFdTZfkIwyzHCz9MDGwz1FecGjYOdj540TCDu7hp4YGmFi4fjBNOlOy5kqetHcXwyj
	/QBnfhIdVhEgCHXOIO2cQ/oXcaTDUpEjeTlWPfMY06NGBawQwUU6hm5JaOMRNoYjzzhFthBDMsT
	uZgWrN9NVnO19lrw7VRqKec65GkSwoRJqLvo2xTmiWHfy4+qvrjOhiKb8XWpIhuAm8QC5XyywWk
	7Q49uCoDox4/fnUN2igZ1VeE+D/yQ4EJsacM4hFmcximgwmDn1ebozdW+ysk3+N4cTF9vPr5OvR
	1vmvSTF6yPYvnchANKtztU7Pgm4e98bKHVbNEJLvsyzkJF7pfzWPbbaiUhX/8xcpxK0rxbIzd4H
	EV7izB7jcU9/sblLRJ0A/YO703D9JNgiwrZ1aZJWGuyCvw+PSVzt09CBZ2xrQop33wUymmFaq4Q
	doBqpL4jilMYTFXDBNqNW3Yj0T2jrd7YCnyWainSZzZwO/94yZqCQaJ8eDIT+rZmuhoCSzukJUC
	RaWhpOhKrCeZcHs53mBahR//qVY3xoTULY3sq/qJnM1QyywwG5WXryDtbk1aX8ZtG0PS7LJFEjm
	thdRfJgKn2kFBqYIStFjCYviRsCVo8TsaFrKGpzwz5NxsIBoGbGpbjUH/wf6Fd7qJC3fcxAWgac
	=
X-Received: by 2002:a17:90b:2648:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3b41c952ebdmr24822169a91.39.1795840388460;
        Fri, 27 Nov 2026 20:33:08 -0800 (PST)
Received: from mac.lan (114-45-156-18.dynamic-ip.hinet.net. [114.45.156.18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7d36bcsm17993882a91.3.2026.11.27.20.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 20:33:07 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 amergnat@baylibre.com, me@adomerle.pw, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] soc: mediatek: mtk-pmic-pwrap: Add MT6789 support
In-Reply-To: <czEp-CqZIp301roqRSqIALy9ubTnOg7uHv75zRifEAuhIS0f1zSU45eKzIC3fZfiUnaahQK6yVuQvthvHZOt267Mpt13X55ERh2A6HJRTic=@protonmail.com>
References: <20261127030009.10572-1-iasnezhkov@gmail.com>
 <20261127030009.10572-4-iasnezhkov@gmail.com> <czEp-CqZIp301roqRSqIALy9ubTnOg7uHv75zRifEAuhIS0f1zSU45eKzIC3fZfiUnaahQK6yVuQvthvHZOt267Mpt13X55ERh2A6HJRTic=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 12:33:01 +0800
Message-ID: <179584038151.67185.14057994923136112895@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_203310_038655_910CD8BB 
X-CRM114-Status: UNSURE (   7.35  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Hi Roman,

On Fri, 27 Nov 2026 18:12:33 +0000, Roman Vivchar wrote:
> I don't see INT_FLG and INT_CLR in the 5.10 kernel [1]. Where did you
> find them?

They come from the MediaTek PMIF bank 3 interrupt register layout that
MT6789 shares with MT6833/MT6853/MT8195:

- In mainline drivers/spmi/spmi-mtk-pmif.c (mt8195_regs[]) and
  drivers/soc/mediatek/mtk-pmic-wrap.c (mt8195_regs[]), every PMIF
  offset matches MT6789 (INIT_DONE=0x0, TIMER_EN=0x3E4,
  WACS2=0x880..0x8A8, bank 3 IRQ enable=0x450), and bank 3's status
  and clear registers sit at +0x8 / +0xC:
    PMIF_IRQ_EVENT_EN_3 / PWRAP_INT1_EN  = 0x450
    PMIF_IRQ_FLAG_3     / PWRAP_INT1_FLG = 0x458
    PMIF_IRQ_CLR_3      / PWRAP_INT1_CLR = 0x45C
- The same 5.10 tree you linked also has this exact layout in
  drivers/spmi/spmi-mtk-pmif-core.c (mt6833_regs[] lines 167-169 and
  mt6xxx_regs[] lines 119-121, where mt6833_regs[] in mtk-pmic-wrap.c
  is identical to mt6789_regs[]).

Omitting PWRAP_INT_FLG and PWRAP_INT_CLR in the 5.10 BSP's mt6789_regs[]
leaves both entries zero-initialized (offset 0x0 = PWRAP_INIT_DONE2), so
if any interrupt enabled by PWRAP_INT_EN (0x450, mask 0x180000) fires,
pwrap_interrupt() reads/writes 0x0 instead of clearing bank 3 and leaves
the level-high IRQ asserted.

> Also, the series doesn't apply on next-20261125. It might be due to
> recent mt6572 changes. Please rebase.

Confirmed: the conflicts are from the mt6572 commits and the
dev_err_probe() conversion in pwrap_probe() on linux-next. I will rebase
the series onto linux-next, carry your Reviewed-by on patch 1/3, and
send v5.

Thanks for reviewing!

Best regards,
Ilia

