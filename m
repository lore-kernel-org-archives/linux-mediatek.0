Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B51C76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 04:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmuBUFzQUjaxZVU+S/+mOcmOc0AOV31J3v1NKMouK28=; b=OisSvqxrcDgelLjqMbdYbq0d7R
	gEFAmcd3Il3fkPLD0fRLrqiTNs+IV8rtsuCY6I1RtQjhV3gzAuqgby37k4/q+Dti0UTrTZA0BhjbG
	E+zgRGy+nUdU9zHTM2yqEaxFgmCXgFEYAex2gSGj/5icB3zCFGX3k7TRLB/OyFJAcbW/PeYBVSBrv
	BF9lizSBvDqVdA+CFzxj+URJUOY+i9/M1OnyQDTa5eF+xP8B/HUOwJqd2ghJtOm6vluLnHHfrDSdL
	9S514AQTmokHhaC5S2HphfJ2Ny01i7k9bK+UUQGg/HKF1kNBEZbMFATLdROTJHErweC0uCxG4VH27
	6s3I8WkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjC9g-00E9E0-2R;
	Mon, 03 Apr 2023 04:50:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjC9c-00E9DI-36;
	Mon, 03 Apr 2023 04:50:54 +0000
Received: by mail-wm1-x330.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so17274710wmq.3;
        Sun, 02 Apr 2023 21:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680497451;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KmuBUFzQUjaxZVU+S/+mOcmOc0AOV31J3v1NKMouK28=;
        b=PGK/Fk4wYOsAWep6nEBI2HWHAGlmmQr9MHVl7DMSGeFoHAdU0dwbFTq9HO9wrXfLok
         HUULIuqfTTkJpJfQJa6vhojoVJnzzaCnp4StcdPc0oH+djaJXj+OK6J5XNsc99gjLUDB
         eAMV0TIIoDDkhm3s5ZrySlTZ8X9AxVFLLzPz8PGFe/Tv/yWdz9jnL+DTXafyU4kQnC8Q
         a8H0PInP4F6/AEd52TJkWlq4JKhhsC8gYUv8m5N/Gyur+swg2s2RqdQlNLYXpfwkuDAF
         d7CFcef+z3GNLRrW/TJtM+fGvyJ4HrFeN/vUFBAg7H0HIGagF+Bn6HaRlk7AhHNZcy7N
         oSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680497451;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmuBUFzQUjaxZVU+S/+mOcmOc0AOV31J3v1NKMouK28=;
        b=UeHoKWqmPzWlA9WAil0KRCdlER4plLfbO0m8vaYLADgYSK3fmzAh7OV9MgxBdHzTVi
         3S7bXsht35CJzw9Pfq9o8eixvww9LwM8/xGY7Xht++EjZ4FtXxWT8wtb6NS/wU71Db3G
         ItmJ5uYmqs5OQn7pQgJ+A3o7oRAsuIjx6ry8F5KGTXIgeoU+PiYehFruJyDFLDfYtYbL
         XMsh+6aIeEOnEkIKFYqXBTDTYL/Cxy3iFOJe5wCoRy66nFtxxmMnc7CIIauxYaI2QqDF
         p67F89BouPaWaRZv7eP4Y9c+mwzNeqn3I+P9SvSlxNfR7M6Divy9pvCW0JiJ6bUN/Kae
         40Iw==
X-Gm-Message-State: AO0yUKXoxRxCMBdFyiPf7vuQ+/28xtH1ocR2VEQCx+jIVWOLVSFVHt9O
	g8WxAxk5pnr12OezWh6WXMM=
X-Google-Smtp-Source: AK7set8ZQ9YczPJ94tVG7x+s4l8T7g2se9y9PUJGHUMtSjgLZlVwkUZj0mxGW1e7LgB+9x+f4k0jOg==
X-Received: by 2002:a7b:ca4a:0:b0:3ed:d64f:ec30 with SMTP id m10-20020a7bca4a000000b003edd64fec30mr24501671wml.33.1680497450934;
        Sun, 02 Apr 2023 21:50:50 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b003dd1bd0b915sm18158191wmq.22.2023.04.02.21.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 21:50:50 -0700 (PDT)
Date: Mon, 3 Apr 2023 07:50:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: ye.xingchen@zte.com.cn, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] PCI: mt7621: Use dev_err_probe()
Message-ID: <2e4f27f0-a4ac-4523-8f90-695a62973bd0@kili.mountain>
References: <202303231145121987818@zte.com.cn>
 <CAMhs-H_-kQ0FGP3L1xJ=ec_xJ59a2OztMLLjEQmQfYFOEa4DfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMhs-H_-kQ0FGP3L1xJ=ec_xJ59a2OztMLLjEQmQfYFOEa4DfA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_215053_018724_E4D52966 
X-CRM114-Status: GOOD (  24.04  )
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

On Thu, Mar 23, 2023 at 07:23:26AM +0100, Sergio Paracuellos wrote:
> Hi,
> 
> On Thu, Mar 23, 2023 at 4:45 AM <ye.xingchen@zte.com.cn> wrote:
> >
> > From: Ye Xingchen <ye.xingchen@zte.com.cn>
> >
> > Replace the open-code with dev_err_probe() to simplify the code.
> >
> > Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
> > ---
> >  drivers/pci/controller/pcie-mt7621.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
> > index 63a5f4463a9f..964de0e8c6a0 100644
> > --- a/drivers/pci/controller/pcie-mt7621.c
> > +++ b/drivers/pci/controller/pcie-mt7621.c
> > @@ -220,10 +220,9 @@ static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
> >         }
> >
> >         port->pcie_rst = of_reset_control_get_exclusive(node, NULL);
> > -       if (PTR_ERR(port->pcie_rst) == -EPROBE_DEFER) {

So the theory here is that -EPROBE_DEFER is recoverable but other errors
are not so we just ignore them?  Error pointers will trigger a WARN() in
mt7621_control_assert/deassert().


> > --
> > 2.25.1
> 
> Also, this is not a probe(), so I don't see a point of using
> dev_err_probe() here.

It's a weird thing to return -EPROBE_DEFER from something which is not
a probe function...  Someone told me I should write a Smatch check for
it but I never got around to doing that.

In this case, I guess the user is supposed to see the error message and
manually fix the probe order?  The dev_err_probe() will change the error
message into a debug message so the user will not see it and will not be
able to fix it.  So using dev_err_probe() will break things for the
user.

regards,
dan carpenter


