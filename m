Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678BDC54731
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Aug 2024 16:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GgD4dqFDyUnD/vStQPVANJoNOpD1Qd5JKsejYAWVUn0=; b=KnVOinuLPovWgIrlJXhBEUbvDY
	V2bDrLE4iOXXKzgekChBEu0K28kB1AohwsM7sLFZ51nsnE4vYIwxkqWGBT8bpql+ITo/gtk0266MU
	fe0AlrN2QFYirDBD7CVAVDmbcav0QWEQM7tRuoBZiH+VVyIKlQkR4dVjbKf2kgY1qrGdrrInKsiZq
	MU0Y6ieHsv0fBeHZS98fipwfU8snAk6Goyd1S8OUok/nWN9i2ISBh0TvwPkFFa9zTJiSHuXi6Hdv2
	9a6U1WgGFA5HxK5eVXNhiLWNvDqiUnRcZCScKJMANHpaYmPewafzKJ7uadbhUTPvs6KZ0zxIVPqb2
	hGxeCLQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siytW-0000000C2gM-462y;
	Tue, 27 Aug 2024 16:18:10 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siysg-0000000C2VS-2ItZ;
	Tue, 27 Aug 2024 16:17:20 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6c91f9fb0d7so31364967b3.3;
        Tue, 27 Aug 2024 09:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724775437; x=1725380237; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GgD4dqFDyUnD/vStQPVANJoNOpD1Qd5JKsejYAWVUn0=;
        b=WuPZJxwVm/5O9Di5FkJJXRx0qU+PgQyue5l2ZT9C2QndGDM5+GnnVmVKMOD4GytXLm
         5M4NqirmXuNdE1710kHGyYl1G/krGqLbZ5S6eUbUGNxrNnFI0pmsuZeidGk2wNL6ktQs
         CNs1vU4UO+xUQ10pVZYQG2ccmPN00cpHBLuQ+u8MIJSWuCEmX6LfvDGTh0ze4IKOA5zi
         FIzl6VjPpdCiNW3vLa7jGF31lyITdf6iyhTglhAwENn1PKTJhjveNTQ06xBpmsTxxs4t
         vf+XROD3/S3ReBFHruSsoVEResKqLk7YrbJwsZH+57fNwXJDm66VZIyXRPlAEerXG8xQ
         +ANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724775437; x=1725380237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GgD4dqFDyUnD/vStQPVANJoNOpD1Qd5JKsejYAWVUn0=;
        b=tuaWRnWIYJBuM2y7uoqrHbQk/2lJ6hEJowMqfUWg659cl02cSAHDU+GJlnOoejOrt0
         PYEhfeyrldnnbc2eEd4Yx75kA5216wH2PH5FFu7qVJwP34MV9rmHrBc4CRgoleh3FDDU
         fwLNUhXrPl4/Mbc/2Rfg8U8S0tS39K3xn698Fp4Qj5LMgvfDdCEgm8Ah/BLrDq5beUrt
         wOYEYEVsv1E/ZsywXDzqQHEklSA5j/rDv55Y6q5QJeydZfUfcLeuH+ChqFet9xR43OIB
         C8eGqDWcLuvRf1zGMAJFJOTbtuw41DcEji+KHtZ0v6IAkkmaeKYVMMXx9SUt/h8PzVKa
         hcUA==
X-Forwarded-Encrypted: i=1; AJvYcCUMCq/50+mKqJB7yFU+rNB7+nXidHqWzz7+rJMuBMQuqxCe8VAO5hjpdHdLZGT0zDoSTeC4fLpzOysysrde@lists.infradead.org, AJvYcCWJ40zGde2dp5yuCfYdvsXAape0gtqn1RWbRzEtWjOfzn6GJtOl4ny3dqUL7HqAys4OCCZSsb8wblsDMKIJq00=@lists.infradead.org, AJvYcCX58q23+UpmGgOjbUG5NW1hpe4fHzugZ3EiSUrG3j5ffIx4rDOXKoytBwwa5KjOKdEcq21WMLFxpbYFpJ/vMLxqwg==@lists.infradead.org, AJvYcCXyky7gVh8M1H2jbFn31fgt+oPB3y35r0H++Q0ed5d9dkIgaLkw9vtinDmd373bXKjHdUlSf3/mxwQ5/lfS4pMerg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw88siOCYFvp3z4ofB43C0l5pemb+Quv/X+jrnml8VzmhL0igfo
	gcosBPoa/PPeRu97KzYwqYSQRMyRW4dqzFb3SP622pOOwlzbpdZgngrxwL2ICS1cYbVsIwzrGv+
	CuC0s4T/G44yUsdaHuj6JSoz9yfg=
X-Google-Smtp-Source: AGHT+IHnzsaeAYPx8AAxOBSMK1fpK8G2cmPPm5333uqFeT+rlrVWxKv2QLBzOXLZg8T5AQY4Vh4hdFkNwQmz32UOBto=
X-Received: by 2002:a05:690c:688a:b0:6ad:8bbd:aec2 with SMTP id
 00721157ae682-6c6262f44e9mr177725977b3.25.1724775437350; Tue, 27 Aug 2024
 09:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240817080408.8010-1-av2082000@gmail.com> <b155a6e9-9fe1-4990-8ba7-e1ff24cca041@stanley.mountain>
 <CAPMW_rLPN1uLNR=j+A7U03AHX5m_LSpd1EnQoCpXixX+0e4ApQ@mail.gmail.com> <070cc3e2-d0db-4d50-9a64-6a16d88b30df@stanley.mountain>
In-Reply-To: <070cc3e2-d0db-4d50-9a64-6a16d88b30df@stanley.mountain>
From: Amit Vadhavana <av2082000@gmail.com>
Date: Tue, 27 Aug 2024 21:47:06 +0530
Message-ID: <CAPMW_rJi46_2Ho6KNS9NK0kbfc3ujrx-EJ3586wf0u7vq2kUog@mail.gmail.com>
Subject: Re: [PATCH V2] dmaengine: Fix spelling mistakes
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ricardo@marliere.net, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, vkoul@kernel.org, olivierdautricourt@gmail.com, 
	sr@denx.de, ludovic.desroches@microchip.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com, 
	sbranden@broadcom.com, wangzhou1@hisilicon.com, haijie1@huawei.com, 
	fenghua.yu@intel.com, dave.jiang@intel.com, zhoubinbin@loongson.cn, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, afaerber@suse.de, 
	manivannan.sadhasivam@linaro.org, Basavaraj.Natikar@amd.com, 
	linus.walleij@linaro.org, ldewangan@nvidia.com, jonathanh@nvidia.com, 
	thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, 
	michal.simek@amd.com, Frank.Li@nxp.com, n.shubin@yadro.com, 
	yajun.deng@linux.dev, quic_jjohnson@quicinc.com, lizetao1@huawei.com, 
	pliem@maxlinear.com, konrad.dybcio@linaro.org, kees@kernel.org, 
	gustavoars@kernel.org, bryan.odonoghue@linaro.org, linux@treblig.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_091718_609098_C7204819 
X-CRM114-Status: GOOD (  14.66  )
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

On Sat, 17 Aug 2024 at 14:38, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Sat, Aug 17, 2024 at 02:11:57PM +0530, Amit Vadhavana wrote:
> > On Sat, 17 Aug 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > >
> > > On Sat, Aug 17, 2024 at 01:34:08PM +0530, Amit Vadhavana wrote:
> > > > Correct spelling mistakes in the DMA engine to improve readability
> > > > and clarity without altering functionality.
> > > >
> > > > Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
> > > > Reviewed-by: Kees Cook <kees@kernel.org>
> > > > ---
> > > > V1: https://lore.kernel.org/all/20240810184333.34859-1-av2082000@gmail.com
> > > > V1 -> V2:
> > > > - Write the commit description in imperative mode.
> > >
> > > Why?  Did someone ask for that?
> > No, I received a review comment on my other document patch.
> > So, make similar changes in response.
>
> Ah.  Okay.  I was worried someone was sending private reviews.
>
> (There wasn't any real need to resend this but also resending is fine).
>
> regards,
> dan carpenter
>
Hi All,

I wanted to follow up on the DMA patch that I submitted on 17 Aug.
Kees Cook has already reviewed it. Have you all had a chance to review
it as well?
Please let me know if any additional changes or updates are needed.

Looking forward to your feedback.

Best regards,
Amit V

