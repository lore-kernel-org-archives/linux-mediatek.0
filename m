Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F04C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 00:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ty74aeA+wQw7ihZoKe00bT06UdajKfV/UW5cn51RaWQ=; b=qgzcuIOWnUvMgu
	jGS8a6a4IRzZJlPQ4rPfSI346ey/QDzxlTp2+peKwvPk6cCbAC1BtNDk0sAkFBf4xSxbYK5Rncad3
	tzpCr3kTNQ1e6/XRH3Vcm+Mod2HKAHtpn0K/WvCFICqL4Y1wSlEIT9BC8R2dGNUQLeAioYDEfdd3A
	t9kTOnjp8ikiVYb2nG3BanQp17lA68rInXoyttGrKxZlPYhbA+BzUkc9rR1PA2q96grjnXslrEkvU
	LcQvS3bHcdRfKJoSNh6hbnRpul0V2GynQMPDJQS9ZoLIk4YZZcYyK/40GcrXX6oLXRqxj6Rj21paM
	41gDwZ98VIqZbQCEAtYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIK0x-005Las-T9; Fri, 11 Feb 2022 00:42:19 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIK0t-005LZE-Li
 for linux-mediatek@lists.infradead.org; Fri, 11 Feb 2022 00:42:16 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id p19so20393327ybc.6
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Feb 2022 16:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fvA/9wughT6Lyon0GBTYvA8nAc9rTAjUMYk82Ep+CkY=;
 b=BwIb6t0+jLIf2FTYizV5fDdIjwQl4Doa6z03s3OOjT/K2kwBOQ94CD0xDdQuRH3R0s
 PFa44cKNHcluUhfRD9EtywNKDgHwpQnrIGX6o1H49Cj/D9zpyON+1jJuzCct3teWYPY5
 YbNG7HLrDPGUciVE7b26cUREiLt0hGzYvkWQugAABdnzcqPRox3nY6awT3FZGi9VEZ1D
 jAAFQIDEWeeV1Zs3IknKKGLp3ClSynLBTw9GEARUPCMfxTTwW6Cr/2qNrzLt+4Tj4Uym
 g+U6mhs0GsqOkVVCSY3hE1DgEC9pdecTqCqcgBPmpG9CxS4YX4Tc4cuNYgBq9M8IMa5y
 DD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fvA/9wughT6Lyon0GBTYvA8nAc9rTAjUMYk82Ep+CkY=;
 b=gr+3qz7FH6S2MTAcgJRf5np3DvKg37udX3vsD/DiyCHODPiy8wJ7LBN/e+RevFtFgo
 HnmIXnd7DGWXDarbP63dIV4bkjpRoXKqPE5wta/hUwVUjJrTEoB/5MHWUfBRQSworkBv
 7zw5Sv7y0NA2b7Y0Nj0ubDMR8tH2uE7qExy75mxv6UkujxoVIp1gmmMe0QalN98h8cGV
 0dRwKx7aYDgdMsTECPSr7A2EQR5AYjhBq7o5KjqTJoG0TXsjx4rqflEYTuZzEvUvOILk
 qwyQ2iXENph9742sD/v+YYRe9SVKAl4iwQF3M4LhtjHTpgM2Al6KMGiMsrXw5GC/z39k
 7d1g==
X-Gm-Message-State: AOAM533AYOhpgAfBRwYyrdp81DJhwwTiAo8RfaESJEpR2xYIhN2mGxwi
 VUL4c/KqSHTGXJgirl8KpxSO8qccg1NN1oZdbs8A2w==
X-Google-Smtp-Source: ABdhPJyQtHuSZe9d+F1eReCcOh9vckw2Q0NUeA7YAnISwTitUUUgxK5gjCkhZseemwLjXSu4L5ZVtPKxp0C4vkuQL+I=
X-Received: by 2002:a81:4402:: with SMTP id r2mr10176647ywa.126.1644540133572; 
 Thu, 10 Feb 2022 16:42:13 -0800 (PST)
MIME-Version: 1.0
References: <20220201120310.878267-1-maz@kernel.org>
 <20220201120310.878267-11-maz@kernel.org>
In-Reply-To: <20220201120310.878267-11-maz@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Feb 2022 01:42:02 +0100
Message-ID: <CACRpkdacLL-hv-upsfzq+fJNv1nvLagY78igXo6XnU7rJkYYBA@mail.gmail.com>
Subject: Re: [PATCH 10/12] pinctrl: npcm: Fix broken references to
 chip->parent_device
To: Marc Zyngier <maz@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Emil Renner Berthing <kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_164215_727006_BD52AE8E 
X-CRM114-Status: GOOD (  10.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 1, 2022 at 1:21 PM Marc Zyngier <maz@kernel.org> wrote:

> The npcm driver has a bunch of references to the irq_chip parent_device
> field, but never sets it.
>
> Fix it by fishing that reference from somewhere else, but it is
> obvious that these debug statements were never used. Also remove
> an unused field in a local data structure.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
