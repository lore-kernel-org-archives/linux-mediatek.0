Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEC5C44507
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 07:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9+oyG6jqj4Pqj8nJndEWPVlC24dF09myG8cBJZ5TrA=; b=HXueG0MsOfQzt9FMHJ+PwiX6OJ
	goup3tdTq2Y3vXB21IUYe0/EPSdeqYFtSs/faQV9jUmg0IYWtOgFTPtIlyR3H61cE5ZxDSJvS4Qrk
	f9leToBP0oQPkloFpIfuwDnxgQSVV4kBHqDvzPEppR9jA+iuRCn8Z9w8JFFXM1gtyFNyvm6Wui9tA
	CMwdWgWRdzLsGItt3ktup2ixQlbaa7qcPEUtq3YQi939dc4HHoQdKeJyXuAtfPuZ9WmxC/pnAEkqS
	LbbJz7PeRxBG58gPMKbHCnaR/4kqdVcJm2FdOSFw2g7ShVFZXerYOAipL3XcdPJ3eRsqrfByup5VT
	SEYpx4+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkclI-00000001NBh-0otr;
	Fri, 17 Jul 2026 07:13:32 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkclF-00000001NAo-1UXM
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 07:13:30 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-51c1372f84dso39403471cf.2
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 00:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784272408; cv=none;
        d=google.com; s=arc-20260327;
        b=hJpMnk8HlLzf8naLqUG4y3o4+SjAUdOL+QiXPi08sYcPh7rNvzqEF3sL05czy2Ql01
         g6AII/3BOyWXXH98UFOBNaue2dgPqfO9I/Bm03wxgivZmulNQRQByyVKYqnqHuE7IBgz
         SKcKrhKMpPHnUo3tq8PPSNgIk1hvNsfn38uSvcyihqRDm3Di8RkzW9ykWirxAbBWswzv
         kmjILJ5WW40+o+AZSPkuCxBV+e10FBYNMlWfVukl2I36yPkdhTk3J2ZvljyiA6eIpCmZ
         qLH3kQdF362Pkp1rrwHq7ae/fywfzK+91nPzLP6J5qdRStr7c3ocCSS6rjokxV+AHqzM
         PSjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g9+oyG6jqj4Pqj8nJndEWPVlC24dF09myG8cBJZ5TrA=;
        fh=NVvN/k85wr4vxM1Mr0NL1SIhpcwcm0JNGrTj81pbDzA=;
        b=CPY8WcHa0uc/2Ppm/C9y3da+La5jEfGT0elO8F1IREJUjcwFyukncKXA6L+MEYZTWI
         kzZQutowCx5Qsqolv7UOVEDT/Mubr5Qu0POe7CNLSatI42Gr4Emo8fsOwhqHpFs5ZsqT
         X9wuUlaaQ0pXVW2BMBsQU29kqAp6XgkbZChYc2f9XscfSxbcaaCL7h3sMtByOi0LXssS
         Fseq7fFyMEqnTRkggjowg26U7jAzsMHDgrgpbF6ZGYFiRsOd1nSCsgkqgNvQ4hIUWzoy
         Lkp5jf7DJiIcH25ibmL8FaxPlymxI3eCgOWSD2/6Q0/EIBQ9BIxDnTOkaraPT1wIR16v
         ztiw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784272408; x=1784877208; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g9+oyG6jqj4Pqj8nJndEWPVlC24dF09myG8cBJZ5TrA=;
        b=fjt42tZg3XHR/tDUosgwJWQTK03RctZ/TKD/V4T5pPArCNntFj0aFAg5L57Mib+VGD
         RCL6WYtgqLX94UzriUrvdB2yl2AEVhDTULVsZeF9kDtbVtvh3rVk7GR52VvrQNHepDT9
         FHs9NEdL3iY/02LXmr3Z1aSpE7aIOR3L4zGF90HLZ4CdGU8dcfjQaYt7lsoFKh8sbv/p
         k0rnZqwGBk2N6PtkyblTL8utZIovewZ3Oz6K16n802+1ysK+hw1a5q8kYkJ+roNaph9a
         z6pOmKefjQy5qWdO92O4TvrsIfACBYYMbQp2ZFKiVgXEXmCu7qaJ2P0yTu+HXRmmnGvr
         SoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784272408; x=1784877208;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g9+oyG6jqj4Pqj8nJndEWPVlC24dF09myG8cBJZ5TrA=;
        b=k17YNgLMnTPz8Wz01HqDQSaVFHGmvaZf6VCCc1HvDjZ/tU9OsyBQA73BGFjgALFsHc
         +Mt6T69TcqXuqRddopf8sPyIVezlzcox2sN18WmfLyOwJ47BIVQXiEjv1GpoYe2EYyNB
         63+/ECAETkj/wff02xl5dlRNbztvUsPKDz1poUphMsD/U5dysW6rJ2CDABfbqL1bGjNU
         mqAc71KithZ4uj+JS9B0AV9pPJvAHZ445dOPMGJ6okFV76+BNhO+Q/4XAFV5YYwOhncz
         UZGKTcxC6bXLes2Ct+cPKU1LWVMbKMRTXSZPouIwfbLd9e5hRUg3zN92WD5y8hu42xut
         9mCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDNa7vUnmnjT9dr6BpA/Wfd4ilPv0JzwpN5twBjcn3LYdOj1E3U5lUkdb0eWE2h90RFh6Ov3zfIcUXnhBkzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxF0ldvolTIJbdFNT2UcwYTaxLmTCBmnmvZGZBr1tCZpnK6bsSL
	HFZmw6hMPvlnq7Fa5Pp1IGQC3MNjvcK2mmKuS3cKXOkd+RsLc6ZBYxfbz1QCRTDYJZAnIPQq/os
	jJR4LManz4FvUHbIlswZGx64pbWeJpBE=
X-Gm-Gg: AfdE7clqmDh7plMGPEkVARFnnlIKTyvpY9f9/KQvZ1BZej/u8t0sTELMULmvd7Btr27
	QyEq8JjLufNT3YC7RZZkFYMBvHOf9hXnbTbTmmrqv3UdAQwNwpEcDuGKqT9dqNxwIdJb7T/d6Nj
	nSJ+93vyW8D5t3Ln39J9HbD3NTzah237dMS+eU13wuNdyxsihmUfQcKySnYCbKWw+gD+xNz4QnC
	1nCSxwbAc7sNcklpOCB0ZoSgyqsuCOdotyT0gn3DarEFWA0XYEEdGwJBsA1nyyf
X-Received: by 2002:a05:622a:551:b0:51c:135a:5b53 with SMTP id
 d75a77b69052e-5213aa6e46fmr10419721cf.11.1784272407938; Fri, 17 Jul 2026
 00:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260716161923.266315-1-akkun11.open@gmail.com>
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Fri, 17 Jul 2026 16:13:16 +0900
X-Gm-Features: AUfX_myw0V2Aiz3FUrMgQlgFVz4GkSaEohB1xo8heVTI4ZdFmSeFalXVsz80Rxc
Message-ID: <CAKr_iV7_k1cAMxOeE_SmR4ydTnhs9oDAaHYp=DsZ-YAPHpqk_A@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add reset support to MT6589 wdt and remove fallback compatibles
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Roman Vivchar <rva333@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_001329_404156_E19D4C57 
X-CRM114-Status: UNSURE (   6.13  )
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

sashiko-bot said this patch series makes a regression.
Should I add another MT6589 compatible string such as
"mediatek,mt6589-resets-wdt", insted of changing "mediatek,mt6589-wdt" ?

