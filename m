Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D25EE14DE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 11:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G88lP2VW9W0ey1BM427zqcg+F+UpGhl5q2J3uTfo6Co=; b=J632VLxx0wIzHeMzdu5BXu5ZoS
	M3xpCca1imTB1appkNN4tu7Hr9yxW2CUWAI9NruCPgI8ge7uAHD9ARScPX5uSqulPFFuvX7EeaUqJ
	VwRlITeDEicKwICSVq13qZKgfyRycKnr9Ym52QZ9QDs6dIXEiWgTAN5yPpZ7P03N+ErCIyEU45jHn
	aKz3/Q4v+ojp08ieitRW4pQNnEcrEnYP8Xoo1DJTe5x4O4HZNJ+xgIOEgtYOfk8zPmGf5DGpnh1CX
	fa3zxIFFwhS6aA0NtfHY0JsQJKhFuXwLZ6qbutPzNXOXqTx2Zr/S9qeubGDs9c2XmB1EgN+134m5C
	wPXU/nfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeCs6-00Bz3O-23;
	Thu, 07 Sep 2023 11:08:26 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeCs3-00Bz2Q-25
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Sep 2023 11:08:24 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-401da71b83cso9398235e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Sep 2023 04:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694084900; x=1694689700; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G88lP2VW9W0ey1BM427zqcg+F+UpGhl5q2J3uTfo6Co=;
        b=DxeD+rbvbTzq4tvQr9amXobzNZqKBXeSWHwTihP9M6f9TJIqei1QM1CankcHXR5SHr
         COzWM76kOYJu0P3RjPC5ZfSg51bzSKz7iqxs4GeMliF7Mv/VH0jNYJpcvttX43X9oOAO
         rW2HExsSYrG728jvZs3WqzeRFdJLIzs2mbyIou7N+BdGTX6IpWjZgFSmrgNXVZdElwF+
         6JpfaLQDZ7nY/12LwZU7036dYFEMBTXZkVc3TMlFMfulqQpsfNTaaTfKzC5PQHgQvBY8
         6vzihDapN73kITYnGwq+k5n95LDpksuMMTT3de0ZF1Ba3SybpL6ESeFikmMG3bvxnXhz
         mGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694084900; x=1694689700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G88lP2VW9W0ey1BM427zqcg+F+UpGhl5q2J3uTfo6Co=;
        b=Y09ukBeQJeau/yZTBCQOGBGlNQTAxDyMCTAh40tVY8v+exvvxNg08GpB1ASmIvrZeG
         M+XrOXGURV63lV5R+2mvwNA9b6izfhKHueAw1OZ0RryMr0C4XEUuznANe9B56cxyuyRh
         0aiWCWDS/XbpNJsH2/7qBqxmprDIa+TdynsKGECh+lS+HR1pvWG54MD0J0bJ3U74uRro
         JTxPqxI3wsjIOjZjRhZWI7S+d8jpkPb0SrYaI2nS0Fptu9F2TsFLIFehTGRVxBrxGyOZ
         CSymSIxztwHo+AoJoA+RfV0L6SZgJzVmr3PcFfNzFAMtmaJ2TrNT1sUUGqM5uu6Ab2wp
         5vNw==
X-Gm-Message-State: AOJu0YwPVa9bjJJdRqfF+1lpeAFyX53IlAqa6B8SoWwMqOFz9FLFLtGS
	URBrMrlX0q7+9AYy2OVsFub9Aw==
X-Google-Smtp-Source: AGHT+IHGT591APG6CRNW4zuyJuEfxCr1FfGrojCK5qI1ehGXhuwAoMXIKQPf6+hAJXIGsQZ5/i+wTg==
X-Received: by 2002:a1c:ed08:0:b0:3fe:2b60:b24e with SMTP id l8-20020a1ced08000000b003fe2b60b24emr4801517wmh.29.1694084900263;
        Thu, 07 Sep 2023 04:08:20 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ay30-20020a5d6f1e000000b0031f65cdd271sm3999677wrb.100.2023.09.07.04.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 04:08:19 -0700 (PDT)
Date: Thu, 7 Sep 2023 14:08:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Sebastian Reichel <sre@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH] power: supply: mt6370: Fix missing error code in
 mt6370_chg_toggle_cfo()
Message-ID: <1092ffb3-0238-4dc0-baf3-344a653fca3f@kadam.mountain>
References: <20230906084815.2827930-1-harshit.m.mogalapalli@oracle.com>
 <cd6eea67-df0f-08b1-61cd-57a3b4f9cf0d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd6eea67-df0f-08b1-61cd-57a3b4f9cf0d@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_040823_716795_3E92C673 
X-CRM114-Status: GOOD (  19.16  )
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

On Thu, Sep 07, 2023 at 12:43:12PM +0200, AngeloGioacchino Del Regno wrote:
> Il 06/09/23 10:48, Harshit Mogalapalli ha scritto:
> > When mt6370_chg_field_get() suceeds, ret is set to zero and returning
> > zero when flash led is still in strobe mode looks incorrect.
> > 
> > Fixes: 233cb8a47d65 ("power: supply: mt6370: Add MediaTek MT6370 charger driver")
> > Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> > ---
> > This is based on static analysis with smatch, only compile tested.
> > ---
> >   drivers/power/supply/mt6370-charger.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
> > index f27dae5043f5..a9641bd3d8cf 100644
> > --- a/drivers/power/supply/mt6370-charger.c
> > +++ b/drivers/power/supply/mt6370-charger.c
> > @@ -324,7 +324,7 @@ static int mt6370_chg_toggle_cfo(struct mt6370_priv *priv)
> >   	if (fl_strobe) {
> >   		dev_err(priv->dev, "Flash led is still in strobe mode\n");
> > -		return ret;
> > +		return -EINVAL;
> 
> I think that returning 0 here was intentional, but I agree on a return ret
> here being both confusing and wrong.

If it's a success path then probably we should remove the dev_err().

regards,
dan carpenter


