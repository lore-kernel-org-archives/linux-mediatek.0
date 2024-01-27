Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D35C46CD2
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jan 2024 23:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y29bBOr0W8GWvuErd7/PqliVtdGt3XvPDU1lv0OLRhw=; b=m2ntkU5zh2M88bR8YjVcRRiSAR
	gjqXePW44AMbY4T75g6lFoCA8c+iifI16GFq3bJjN6pHl3N6uGU8X9XlvKDIA9kRKeiDu/w+UP+Pw
	DaqSIxBo/U/KaAp8pBr62Zw0mQ7NhYHa4jYZtvPTYTRlgrGbdtQhbrQpsBv2vpF2Oh3ofoIva7Xcp
	eOanB3KfRLwuB0LjvYcncY6E5VMmJQQPLsrieJPexubTqvKORyfhV1sUc2nt+M4AxiEx7xS8Yi985
	qqSx/uLwTD/dy0Cjaw2dpWgur+HHq5gN511FJFFwLySrBoSo4csQUhz1DH5KJ+HXaBh2A7EXTXFeF
	ScJ7Q0vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTsUC-00000008Qb9-0XUR;
	Sat, 27 Jan 2024 23:53:20 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTsU8-00000008QZO-4Ami
	for linux-mediatek@lists.infradead.org;
	Sat, 27 Jan 2024 23:53:18 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5ff828b93f0so17404697b3.3
        for <linux-mediatek@lists.infradead.org>; Sat, 27 Jan 2024 15:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706399589; x=1707004389; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y29bBOr0W8GWvuErd7/PqliVtdGt3XvPDU1lv0OLRhw=;
        b=E74YVxJylYT7P3uOja+i8zqt3a6oV0o28LPeAuhAu7/moqJymiVkJH+01aNI9J/Nvi
         03IpGJ6dpUXKizAW4DswW5EJD9c+IXLRmC1B+3Y/v+mII09Xu5yq9RSm4lFJ7bfDGEz5
         BjkzJOPn8hVlYdkQEsunUharoryAOEwzkR6pDiwPUrd8ERHFxhoi426plIIoOiR+e75L
         5r3uzOKMdpuBfhCmOClXTMXV3Ve1oPLP66bWhyuI1lxdVPd4P5cu2KGXyUNLDlWUGyT+
         EzCsySJ6Eq2Q511a6znXHxxibcS6dvJYb9S9/7vDT9uJhDLF/bO78YgMqCSQ/TXaN7rK
         9B2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706399589; x=1707004389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y29bBOr0W8GWvuErd7/PqliVtdGt3XvPDU1lv0OLRhw=;
        b=vGPNCikIRzSaUmMnCQBK5hyEevZcOHxvR3kfgHejYtu/Ud+GKvPxxOMpCj7gzZAYHT
         TV9F6AWftTP6FMWXeozm3mkb/V+SV4S1uxjm3U6a4RUKGdOg+8HAVJgMWL2bIMmbVtZE
         galGePIE+gDbucwYuFGaNf9+jcKfNJi391D+W2KfNm7pUcyAISJIQlF4CwHYpYHwhZwe
         uqHYPZxofScARW6JRhS1p1cE2ShXEaLuCd8Wwpclr1sFg+BiCxjzyHJvTq7s2xXjgxBg
         55p+Gs4dbv/gJ/FCd698Tfdva6nfsHtdQwMxBeE1mgrDhSaOvLCmLXxOnUpkow25Dtly
         KEAw==
X-Gm-Message-State: AOJu0YxgiUrnUPHf2371NV18i+T2VmprKJLWa/gN95u3WnHMVugHjOoO
	uQfhqBD9gEw20rNtakjNcK2PXRBaB3YBm1PJYIKhxud/Z6iA7LNTAQiODyXFvqW1yEOMjA4w+1Q
	3kt1nHjWEZ76PL7tGc61nKg6VS0wZGW56EmIIMA==
X-Google-Smtp-Source: AGHT+IEhBRR1+Lt+t5PwX5bLtetfxOwsLRlWvg5X+Vn3cAbutbVfqPerwvTLBdzuw4fwNlv3dgffGIvAL7Z3lkau6gE=
X-Received: by 2002:a81:b187:0:b0:5ff:4b02:73b9 with SMTP id
 p129-20020a81b187000000b005ff4b0273b9mr2196680ywh.21.1706399589451; Sat, 27
 Jan 2024 15:53:09 -0800 (PST)
MIME-Version: 1.0
References: <20240117124234.3137050-1-jean.thomas@wifirst.fr>
In-Reply-To: <20240117124234.3137050-1-jean.thomas@wifirst.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 00:52:58 +0100
Message-ID: <CACRpkdYFwS=KCmR5UDhz_G_DQ4B21f3JjJLTLCfr+D0Yn1iA=w@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: mt7981: add additional uart group
To: Jean Thomas <jean.thomas@wifirst.fr>
Cc: sean.wang@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_155317_081254_D186F0E4 
X-CRM114-Status: UNSURE (   6.81  )
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

On Wed, Jan 17, 2024 at 1:43=E2=80=AFPM Jean Thomas <jean.thomas@wifirst.fr=
> wrote:

> Add uart1_3 (pins 26, 27) group to the pinctrl driver for the
> MediaTek MT7981 SoC.
>
> Signed-off-by: Jean Thomas <jean.thomas@wifirst.fr>

Patch applied.

Yours,
Linus Walleij

