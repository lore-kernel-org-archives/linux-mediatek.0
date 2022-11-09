Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4775AC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 08:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1hRKXwVB2zqbRKgazpAfelVDfIB83QYMnKU9WhNPso=; b=SWFUYSkDEeXX94kgktcz7XC5ht
	VDhelgiynqSE+dP4exb1rahzDavFqYpR1oiOR4OD4IaFZO1HZzSvsR6Jp0vR2RSbDy1NOcOPQ3tgh
	JA1MKHa4R/HaNEsnLTxqPKwYKWxhPUvV1DrjFj9MBNTCwxTXOdcmvlg10Cd+NsIQTrARUhmZXiB8K
	l+g4NFm0Kjy1gSgZ1c1EosBiSaYcbQzOXZaV6s8LSdERaJq32EEP3cAPOPEfdQe81ItRLaTt8CGWA
	TgBrpVC6iHtSsNVgjA2Kw/EEnDbQCS2ym1nhWxw5yoCTDT95xWy4x+aeONax3uQKqi0DZqhpCvLxt
	PAuj58jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osgtr-00C4F9-Rf; Wed, 09 Nov 2022 08:57:35 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osgto-00C4Bb-OS
	for linux-mediatek@lists.infradead.org; Wed, 09 Nov 2022 08:57:34 +0000
Received: by mail-ed1-x52e.google.com with SMTP id a5so26159176edb.11
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Nov 2022 00:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z1hRKXwVB2zqbRKgazpAfelVDfIB83QYMnKU9WhNPso=;
        b=QiKNjIZP/NVw66cQ9HADd5LIkfQP6F8jpVSgENrQ+wAerOTYi6IsDpRXH47Zk3W9R9
         pr5AGBcM1N0WIWn9g8db9WpudVrZcwyBTWM34qSivLKNlcZGTQ+urNwmVdMuWXUMMlcq
         RvFQ2Xx+ijsh+2wQCLv8iWhJ7AeEzbq94/VcnRCFvZSRrJMFD5dV7F+Z1LUW1ItqUUos
         vXkffc0YcJOwDEpwm3Bh3U4fiof/i+c1Q1eMbOYF+1nqgKhck5GR2b6qRYSaDyYv+vSn
         m2DtbLqFRW9hQoWLJ+n1vI4YkuqI9UYtOIwq7S944lJfcEaTgRnmvMdWVMM4aZUJ/gph
         9BtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1hRKXwVB2zqbRKgazpAfelVDfIB83QYMnKU9WhNPso=;
        b=IOQd11c+xOjXyeZAcNF9eqA2obOfokTLsc0Mjoc5zXmcVToFtMyR9DyHuWIQiaKZiX
         CYHz2z1wU9AZ9XaDcuZ5kFf1Im/e+GczdgFHoa7w8sjQxO/qSf6hIskShWt1fYLx197V
         WZN1T1noiWXJYMzCu3t3wpuO6S7Shlo+OFde+NlmSkXbU1TxSkDFLOR+XkkQItlavWFM
         62btg9aCdykJ+P+CgfsbikPPaIDfzNm5nhGTFyc4sax9t/O2QR58oXk7hCjDU7gkHac9
         GBecNkeT3xokp0kHKCDbh1KKbPsD31RmfsO4OGtCbT/b8L6b6MkfNjbSBfJ0o9VUC5P/
         4VQw==
X-Gm-Message-State: ACrzQf1bZ9ry2nGrqNwtYdLKjgn9nZyNyWFyTAuKkiiF+h7yuRNUQ7Sy
	fu0XDRFEuznfTNf5eKRcGJP/lx49NoXoggtkwtfuzg==
X-Google-Smtp-Source: AMsMyM4wV6ZrQBRO3Nus3KwHc/K2UYSxn2KzEQnw8XZfrBH97PBwEteETvQa+c6qsQ5UQ/srBrkGOVcgEJ7LRr1Jhos=
X-Received: by 2002:a05:6402:d0b:b0:458:a244:4e99 with SMTP id
 eb11-20020a0564020d0b00b00458a2444e99mr59359972edb.46.1667984250985; Wed, 09
 Nov 2022 00:57:30 -0800 (PST)
MIME-Version: 1.0
References: <20221108094529.3597920-1-liwei391@huawei.com>
In-Reply-To: <20221108094529.3597920-1-liwei391@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Nov 2022 09:57:19 +0100
Message-ID: <CACRpkda6ghdCq2-yktqGSYRjQzO=5gW3V_F7R2oxtgTGOF10bw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Correct the header guard of mt6795-pinfunc.h
To: Wei Li <liwei391@huawei.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, huawei.libin@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_005732_838307_79513733 
X-CRM114-Status: UNSURE (   8.37  )
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

On Tue, Nov 8, 2022 at 10:47 AM Wei Li <liwei391@huawei.com> wrote:

> Rename the header guard of mt6795-pinfunc.h from __DTS_MT8173_PINFUNC_H to
> __DTS_MT6795_PINFUNC_H what corresponding with the file name.
>
> Fixes: 81557a71564a ("dt-bindings: pinctrl: Add MediaTek MT6795 pinctrl bindings")
> Signed-off-by: Wei Li <liwei391@huawei.com>

Patch applied as obviously correct.

Yours,
Linus Walleij

