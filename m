Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B65FD4F16
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 18:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEydtYkjbJ0qWFFzbilGZORGZlN37D01JySG0l90LLg=; b=usKp8jdR9kiBhUatfg5EeBJ2VL
	V7M07vpvnK3LXqgJkCMjchAgHW9HIHwyLHJDqDgQQ01oAgWAPFRPxXsVGFDCOeutpG0tQtKmLUIRX
	MWLvBpKr2ZYcxiDpOotK4ALG23cGzYOzwz4oVc5ZTPDPLRqG22I0BX0LCz9FXoecoVlEPnHc7ecUw
	oUZBos4ZwoXP7YzDYjCmHVeWqXWtNKJ+mvZ38ZT/YLz/163oRyUI627m8UnXD8CV75UqaKqUDDVPk
	g3k28EXaSCRqQt7SMtx2dbS51W1+XEcn2rsMLWciMntAw8t/s5KpXOYV8kXg6ynqgW375ujwStOA7
	gCY6gaCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01xe-0000000A5uI-0EyK;
	Tue, 10 Mar 2026 18:37:42 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01xc-0000000A5tC-0Plo
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 18:37:41 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2b4520f6b32so16213711eec.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 11:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773167858; x=1773772658; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mEydtYkjbJ0qWFFzbilGZORGZlN37D01JySG0l90LLg=;
        b=gEz3VL4I+ykr8mVFtkCDq8w7YWPlBtvV2TDNDGwVZLtt+R0jyxZDgJQ2xOqxlqrbC3
         9P3yTVTPaYq9vfP2vhFnCvn9lqrmQ9U2KJpFqCW7UyZ85HTM8/WeCmkw054FHShi/V3L
         nBAR4afLYQFHbdsC0WjcyV7r7P/xuNTEWeeWo4lClK4TjXDJpyqESktnMNngaMmaL4Af
         UXTchjvtoKb6zw9nKx4spCzFBMRu2cYidA0ptQir3eNdURgVT89ctPoycgqqd32A/4W6
         Loe1IQMQWgsrmZ9Ca6h70EdMsbvegVRX5PcWy1tE+yZmWLsTS+qZXT4IHmwSTxf/nKB1
         rZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773167858; x=1773772658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEydtYkjbJ0qWFFzbilGZORGZlN37D01JySG0l90LLg=;
        b=iKBsu2IPHjN6qPzK8egQrdWSWks/4gWe8zes6g5W8rROkxuCC1HTeafQq7eJxvWzZx
         TcDYMytHgf5D1H8MPRdqiBAIlMxwuZUweFZ0dbir28k2D8LXglk9sgRzvZcSxGhblIhM
         0c43oBoHjiaGmqaNm7BwdUYfjCiyRPfFMdF62IPxSeQ8ZcKd+LNkt0zAF9AgIQkCWAP1
         A7HZiIYDT7y7A9d69DrlZvLWXCZzRe0qOsYsPiN5iObMoz/YeVOzkixCQo3OhMfp89bu
         +gitUsrC86vnfp01L7wvIhEThh5Gdp+3F+KwRBR+YrjtT37yJ6XdN/BRm+0pTSETwMn9
         tDwA==
X-Forwarded-Encrypted: i=1; AJvYcCVKCCtrcaxPc6crHkP9K1xrG4tdUc1l6EEeaTxGZr/8MufwSFOZLFsk7RrU8kvfY8wo9X+jBAANmXsBORMvZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwY3ibGAhoTPppvBJXcqi5ppfjFVwrouvrVGsSFtAo+jDU/gvTa
	AUDcxlKUb070Pt02GtggLWvZ6EtmBBeKcUx1x92sHPVOvUO59QYz7RZQ
X-Gm-Gg: ATEYQzxfnYb6y9LDB8gihSrZPFzd+dBTpslWZPs54YITJnoOtFql68wdULdCAiIcnKv
	x6sEtBktFUyT80dCv5olCUnVjBKa5kC+5WR8L+HmNyyYPr7HP3WqUOymze9pkC7A71VhRQ1QQy3
	KBtra1iLLZ/ONRHZAE0b5KyEcnpNH4gxS2oyIYlKCu1Nu8AWH0GOCcfyV0U/zr1Bw6fDlU8u+Om
	kGYqD0GpFAA7GjB9QLpG8d9uI9Ufo2voZCRnRnKNxoY73pDV2AvoZMAsk+mNkCAxHtPiJn8rpSR
	TdHTEUq2wezayJ5fnav/K3rAEO455UlOSYC7hVBwqKDauJ5cZqdcc1af4wn3Fkiv1P9X2pfHkA2
	MggaEXFxoGmM8dj+YuaCkHLh+iHKPKrocA4Sb09lbVR4d5gfhR0nkvFT626x7FesGnCtK7tBL/R
	0aXaIvDYMtEo+HRncP2bFyKj4VKjcIIuPqyyJgF86D9XH1ziPdmAqFIIOm/iUxNkE2
X-Received: by 2002:a05:7300:2156:b0:2b8:29e2:93e9 with SMTP id 5a478bee46e88-2be4e08fccdmr5761447eec.37.1773167858414;
        Tue, 10 Mar 2026 11:37:38 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:9:5df8:fa34:6102:3b03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96f64dsm14294515eec.27.2026.03.10.11.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:37:37 -0700 (PDT)
Date: Tue, 10 Mar 2026 18:37:34 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hugo Villeneuve <hugo@hugovil.com>, robin@protonic.nl, andy@kernel.org, 
	geert@linux-m68k.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	hvilleneuve@dimonoff.com, mkorpershoek@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, lee@kernel.org, alexander.sverdlin@gmail.com, 
	marek.vasut@gmail.com, akurz@blala.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-ID: <abBkk4Ng-_MDHd6t@google.com>
References: <20260305192101.2125660-1-hugo@hugovil.com>
 <20260305192101.2125660-5-hugo@hugovil.com>
 <aari1Y1CPZSYEVj3@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aari1Y1CPZSYEVj3@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_113740_131315_70A4197B 
X-CRM114-Status: GOOD (  13.24  )
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

On Fri, Mar 06, 2026 at 04:21:09PM +0200, Andy Shevchenko wrote:
> On Thu, Mar 05, 2026 at 02:20:50PM -0500, Hugo Villeneuve wrote:
> > +static void charlieplex_keypad_poll(struct input_dev *input)
> > +{
> > +	struct charlieplex_keypad *keypad = input_get_drvdata(input);
> 
> > +	int oline;
> 
> Why signed?
> 
> > +	int code;
> > +
> > +	for (code = 0, oline = 0; oline < keypad->nlines; oline++) {
> 
> Can be like
> 
> 	code = 0;
> 	for (unsigned int oline = 0; oline < keypad->nlines; oline++) {
> 
> as iterator is not used outside the loop.
> 
> > +		DECLARE_BITMAP(values, MATRIX_MAX_ROWS);
> 
> > +		int iline;
> 
> Why signed?

Does it make any difference given practical limits on nlines?

Thanks.

-- 
Dmitry

