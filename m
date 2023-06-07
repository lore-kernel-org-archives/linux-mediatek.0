Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F59EC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 10:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WnwcMBCzqkTVNzKGHjoxn35nzFWBrFOxHg0gfxp444=; b=H4GCRSoTGf+PTfUwfADIwBSfFu
	mfDVkHVWfIjhdm/wT+bpeYTAvplE2CwFUz2AE9J3wGU0P9Q3uFg9r1FEMhlUiv+fbd9ioXTPjpq6I
	L17ZbUEuWlvxY6riTMkFA+1wyRl3jpqZfUqxtpIrNYZ1JpJzz01r6pNQ0uXKKVi/L95aQf7OsFsY6
	rcSyAwCV26ijScT29cOdfyzBRXAUcq82o+ptrIVvb2iXAh+eI0/BnjoEm44ktvwFQZo/Bx8surt8J
	5zabR+YzJEoV93oERHcxoQAtuSNVGbCO85GkeuuAHHHvd7X5mYP0hLFWgI6h9Ymvl04hEtv41OWjx
	kEbswmHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6qiP-005YDQ-1Z;
	Wed, 07 Jun 2023 10:48:33 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6qiM-005YBl-1f
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jun 2023 10:48:32 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30ad458f085so362570f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jun 2023 03:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686134905; x=1688726905;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5WnwcMBCzqkTVNzKGHjoxn35nzFWBrFOxHg0gfxp444=;
        b=jqPUXaZQTinGdOZHeZxGkOYpbigj6OXsRHKd7XkfsY1tBwB6IzcgfyGQRj+rsh3zCj
         XzzwOyIaek0ZGCBxXF/aJ+GQA9BXjMMVsq3uoYZc4ywMZQBbdQjUWTpNNNG606Xn7Ltl
         /IhqNZPiBawT2D5CS2vlz9p9JxZowy+4Wq5GwnwNll1xJiTqUXduLEsQ5twg9HMzBEQU
         jD+AmO6QvNniSv+ifKh/AG9oZpHNo5+AWvgf+Ds3jzGWCUocVXXFXqsIgn8uDtJIcvNc
         a9SxM3MtSpX+pbk/9Q8wQiKBYIuEIM10hDwFyZzCyivMMkfz0Or3gQXQdCia5HgWK5C7
         T54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686134905; x=1688726905;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WnwcMBCzqkTVNzKGHjoxn35nzFWBrFOxHg0gfxp444=;
        b=elOJZTcZufkFJOWdhAlKxBh+EBjUJ+ZXqQvUdD7WuMDAL9awvHe4bJPAOp/t1e/bRK
         1FrkI6KsBvkBtmwAWMfurUd6/qq47nASXvNkfje8gfNFVhFjqCJcjdG/M+3DdpLcFLfi
         aiNwv1vaHYWcltvzjCmoIlh56loB473QZCoKHld+bk1JgBMECEcKld57Xd/TtenbyWj8
         zI/wt9I1ZoyoT8j8FG5z+5hQi7xCjq9OL4zvftW3FfgyNNtoPHrNjU+CO4Y57JdOsJQ7
         USvEZJyRdHVyP1JguiKukks1uNBq2jgu+k/Dv0VTybRxSeQcc58K8L8Yo107BRSUHVV7
         aQGQ==
X-Gm-Message-State: AC+VfDwVLYaU0/78ZnRjQ6ExU8t2+i3FnXAB0a12X+oJV88PJ4nTZk99
	rFnrnJdCOq8UOWg1cmvQp+oEjIZEa/U/ReSwK/o=
X-Google-Smtp-Source: ACHHUZ6CMGSciI0Kpmcx3vVL2gO7RAJ6dvY+IatyoKt8MAEdLxsahTyA1fWKNuhWdn9mN/PELwNlRQ==
X-Received: by 2002:adf:f141:0:b0:307:cf71:ed8c with SMTP id y1-20020adff141000000b00307cf71ed8cmr9229756wro.35.1686134905648;
        Wed, 07 Jun 2023 03:48:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bce06000000b003f7e717c770sm1720326wmc.23.2023.06.07.03.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 03:48:23 -0700 (PDT)
Date: Wed, 7 Jun 2023 13:48:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Trevor Wu =?utf-8?B?KOWQs+aWh+iJryk=?= <Trevor.Wu@mediatek.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"amergnat@baylibre.com" <amergnat@baylibre.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Fix error code in
 codec_init
Message-ID: <37fcdf74-d67b-4235-bb76-66df461cdc8a@kadam.mountain>
References: <f1d2f4c5-895d-4ad3-ab0f-b7ea4a74b69b@moroto.mountain>
 <6506d2d9deb95d4340261ace299eb8d735a50ddb.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6506d2d9deb95d4340261ace299eb8d735a50ddb.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_034830_585211_CCA0CC2B 
X-CRM114-Status: GOOD (  13.18  )
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

On Wed, Jun 07, 2023 at 10:30:05AM +0000, Trevor Wu (吳文良) wrote:
> On Wed, 2023-06-07 at 12:41 +0300, Dan Carpenter wrote:
> >  Return -EINVAL on this error path instead of returning success.
> 
> Hi Dan,
> 
> I intended for the function to be reusable by both 2 and 4 amps, which
> is why I added a condition in the middle.
> This shouldn't be considered an error case, so there is no need to
> return -EINVAL here.
> Please kindly inform me if there are any errors in my understanding.

Oh, it looked like an error path.  Let me change it to "return 0;".

regards,
dan carpenter


