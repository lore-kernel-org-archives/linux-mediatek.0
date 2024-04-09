Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F63DCD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 06:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMDYO2c6oxyg4uLYpkx2s2QjYRlbgcgKpJOA25y7Xcg=; b=JYgfCj/wpyPwluUGan8zpYqlyw
	WM+G8d4uD5YC84AkgDBO/yHm2Kyd7FLkQBCP8CtkI8bZaVWllXzdeZ+p56l3piUpTvAmPkcHQstUF
	sRMmdLGyQG1+anapRQx5Tsw0kD8caDi8b/UNcUPXzxo3qQBv3aqFsGIcX1yeFxEvmV6sacm5bAX6X
	dcqbmRE4Zv3WemwKf0txFJPQmtFfbMxZtSZ3XWgm9vtkZYmf7X425iw90O3VpSXNYySMjMcsQW0MM
	P1ggs54b6SE8lucNs+W+Q8B5jAO08u/iaKUflARv5uDBzl20RP8SoBg2wrVGNK4gZ+d6G7JqMjNFp
	EoB7zofQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4sa-00000000ZMK-3F5M;
	Tue, 09 Apr 2024 06:22:48 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4sX-00000000ZDK-0Cod
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 06:22:47 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a46ea03c2a5so872403766b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Apr 2024 23:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712643739; x=1713248539; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UMDYO2c6oxyg4uLYpkx2s2QjYRlbgcgKpJOA25y7Xcg=;
        b=ovsjfSpJy/5HOA0l1zZ5TNhQO24kZLuvGQkopOHbZ0fgIs/Ckzt8Vx7phdDTBrS6Mv
         oUSDL0aqwdq4vd80KVtqyzvp5GddpHYN4oCBHgFG6iB6jsoYRTCUN2G6x7/LXLltBAcw
         gQRwJGNnfL99la1jAkVLJ9pcHFrX7dIJtHA2AZoJSgbINAHTqYtW2sbBol5YsgyhySEJ
         +360de62F6javL1u+ELlaMz+zK5lCRfXrC8B/Z4crCKlns7kakw88w4PWX/Vr4MW2WVS
         E5EZ38f658me91ODTRGEIhkcvLq2a3mltlGbUL03AMMYigyU7E8i+HQ9vWc40twv7VxT
         +ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643739; x=1713248539;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMDYO2c6oxyg4uLYpkx2s2QjYRlbgcgKpJOA25y7Xcg=;
        b=Lyd4puvazqn6Y7lc755/KX9TLo/AaZkwfIVzjgs2l984aJBXRSlvQZyjs6s7ZefcUH
         ZVMJkwy0rHKLQwq8rV47S2jzvo+2eZ9BCYBWCqDprkocb53C+wosTwYzHJKukC0GZV4c
         Nn+cBB6pFGtoKiKcvMmrItxSpVNLEvHH30y0ByJteqjOtiAjzOfP1rWvKci6zx7jTtD7
         FbYqJxYee9WWkvgOTqzlKEuN7fgtFPMKuR4FY++1zNXN+EqtruhOP9rliZ7SJI0KlPY+
         cC226R9eMFz7M475zpoUnKUZAgiwa+7NLj928yc+BM2gEqaFYiS3AwxEZp9Jlr8UjV/8
         rgqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnFJxKB9s/vYgz3WvxG2wcO0720kUqYGE02gH0deH2QuecJBQljSEn5YRRu5o0dcPHt7w7BgZElsesXeVfSS4zyyn0Kt+6uXuoZR6ttRnPjgGW
X-Gm-Message-State: AOJu0YxgtCf6jSW38PVP7uXZg0yJ8H0w9NUXXgBYRUhhrMEz4L5Hf5i0
	SfbWdUicMNKELG8BJfQe028aP4OJ35NHUAcR3i8YtL/gACne3rABQj4nCssIFp8=
X-Google-Smtp-Source: AGHT+IFezcxylFThCkZ5dq6o+jnfozGQsIp94NHvIm6eTu25O92P3DhT+nJlYrPygKuAeOBrFXddww==
X-Received: by 2002:a17:907:7203:b0:a51:d48e:52a0 with SMTP id dr3-20020a170907720300b00a51d48e52a0mr1969227ejc.27.1712643739522;
        Mon, 08 Apr 2024 23:22:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qx25-20020a170907b59900b00a46caa13e67sm5252758ejc.105.2024.04.08.23.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:22:18 -0700 (PDT)
Date: Tue, 9 Apr 2024 09:22:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] thermal/drivers/mediatek/lvts_thermal: Improve some
 memory allocation
Message-ID: <483b8e9a-26db-45c8-ada6-e39575760c51@moroto.mountain>
References: <42a87fb9837f1760d1ad4eb7162a7536785dc6f5.1712520052.git.christophe.jaillet@wanadoo.fr>
 <8cb69f245311a348164b0b5ca3dbc59386746035.1712520052.git.christophe.jaillet@wanadoo.fr>
 <d97f2a57-d318-455b-a860-8bd7972c8aaf@moroto.mountain>
 <4ebbe227-38b1-4a1c-af34-9ba7bdfecad5@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ebbe227-38b1-4a1c-af34-9ba7bdfecad5@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_232245_114527_5F9B5986 
X-CRM114-Status: GOOD (  27.92  )
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

On Mon, Apr 08, 2024 at 08:41:26PM +0200, Christophe JAILLET wrote:
> Le 08/04/2024 à 10:09, Dan Carpenter a écrit :
> > On Sun, Apr 07, 2024 at 10:01:49PM +0200, Christophe JAILLET wrote:
> > > diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> > > index 3003dc350766..b133f731c5ba 100644
> > > --- a/drivers/thermal/mediatek/lvts_thermal.c
> > > +++ b/drivers/thermal/mediatek/lvts_thermal.c
> > > @@ -204,7 +204,7 @@ static const struct debugfs_reg32 lvts_regs[] = {
> > >   static int lvts_debugfs_init(struct device *dev, struct lvts_domain *lvts_td)
> > >   {
> > > -	struct debugfs_regset32 *regset;
> > > +	struct debugfs_regset32 *regsets;
> > >   	struct lvts_ctrl *lvts_ctrl;
> > >   	struct dentry *dentry;
> > >   	char name[64];
> > > @@ -214,8 +214,14 @@ static int lvts_debugfs_init(struct device *dev, struct lvts_domain *lvts_td)
> > >   	if (IS_ERR(lvts_td->dom_dentry))
> > >   		return 0;
> > > +	regsets = devm_kcalloc(dev, lvts_td->num_lvts_ctrl,
> > > +			       sizeof(*regsets), GFP_KERNEL);
> > > +	if (!regsets)
> > > +		return 0;
> > 
> > I understand that this preserved the behavior from the original code,
> > but the original code was wrong.  This should return -ENOMEM.
> 
> Hi Dan,
> I don't agree.
> 
> For me, this memory allocation is of the same type as all debugfs functions
> that we ignore the error code.
> 
> If it fails, it is not a reason good enough to have the probe fail. (anyway,
> if we are short on memory at this point other errors will likely occur)
> 

Huh.  It's an interesting point.  Fair enough.

> > 
> > > +
> > >   	for (i = 0; i < lvts_td->num_lvts_ctrl; i++) {
> > > +		struct debugfs_regset32 *regset = &regsets[i];
> > >   		lvts_ctrl = &lvts_td->lvts_ctrl[i];
> > 
> > The blank line should come after the declaration.
> 
> The blank line was already there, and in this file, it looks like the
> preferred style (even if not completely consistent)
> 
> Let see if there is some comment about 0 or -ENOMEM in case of memory
> allocation error, and if needed, I'll repost without the blank line.
> 

There is supposed to be a blank line after declarations though so I
think if you re-run checkpatch.pl -f on the file there is a checkpatch
warning now.

regards,
dan carpenter


