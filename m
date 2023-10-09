Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4F4CD6128
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 18:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MsTR/cGryQq7rM7HxcuS1zRjm3nltuO+eDU9+kch7k=; b=Y81cjt7NhOrLR/8UtXED9r12y8
	6sZYo7I33vU6FxSnHrTKzbupTSIRhMvQ0gEqtJEKdyhfBkzmEMqSZVqEZRwVEkuiZtRklWNkhOgd/
	lOROp8t2+ubMCg8gjaZ8wM2xpGaN3t5f0fKV8hdU5Vxau6/jHjSzPy8uv+knTPuvVk/m84D3jP0Ji
	CknXuH6xkKTCBSA9GGtsON7nugBUr/dxyhzlcVgIj6cFg3WBYnvB4dvJRQrqzNBNm0RlI9/gr4Amx
	jdkmuj+2s5cSfHaAd1FRTCqn5X3P/W5ojxY/rzuCN2Bu6VvISzDEJji9p3KP53Ibem5VqNDXBGVcM
	PJnT2wtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpvQm-00BS3K-2w;
	Mon, 09 Oct 2023 18:56:40 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpvQj-00BS2B-2i
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Oct 2023 18:56:39 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-690bd59322dso3538942b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Oct 2023 11:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696877796; x=1697482596; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3MsTR/cGryQq7rM7HxcuS1zRjm3nltuO+eDU9+kch7k=;
        b=eUS3OleqnWEgy5Sp4Rq7V56UaCfCcsgCr9LZgwgLrG6sVtdCcfrXcOsVYKC8IU9NXg
         wb/m+A0yWk+F+DAyjGr4uLeLKDeenis1JbHBqaN9Lrwb2ROBVIBZuikP6+5rcHYWAeee
         pk6DvvoeZ72Etc1L2QS7/IFKtvUvmqGp3AJrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696877796; x=1697482596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MsTR/cGryQq7rM7HxcuS1zRjm3nltuO+eDU9+kch7k=;
        b=MAZt8a8JrPhkCx8+Go0ZF5M+4use0KOOfd4IxvuI+punr3rRMrXskzJlSIxnYpqeUE
         OUH/L8FQ7/UI7ZrkI8pY+WW2ia/uHML+xqNlKQmg21+glTc4VpiAOFEX/CSkshofCqZb
         crZM7fk8Ry96CzhpaO7rJTBA2fWpCFT9teStpEoycM5Myaez3tOZGH4ncwwxxh6H0ilT
         rEFffvcSY2hsyMrGMdgdY8+8Czj/shkW8f6WB7nUXrRqNwvw7922mNIK68qGX2vOi4eu
         KEEKHM8ytL43UQBdyCfzZdCe52WZ1HDrdbxMiR9Pj8D5DItciEAmkR0HekJ4QeyvM3yg
         tEew==
X-Gm-Message-State: AOJu0YxhQow6vQHB0f3NvVfPjg331RKlBlshO2ZlHdcn/Djqi8tL9Lx7
	DpmHhI4nLa4q4hARlUcjdnQzJg==
X-Google-Smtp-Source: AGHT+IFqDuEFo+tIspVB6znFMkQC780hS1yhuBuvVg/TNH3PNioqeOxCygG+fs+D639q6fNE6/nUDA==
X-Received: by 2002:a05:6a00:2450:b0:693:4108:1eb7 with SMTP id d16-20020a056a00245000b0069341081eb7mr15271604pfj.30.1696877795997;
        Mon, 09 Oct 2023 11:56:35 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ey5-20020a056a0038c500b0068fe9c7b199sm6820919pfb.105.2023.10.09.11.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:56:35 -0700 (PDT)
Date: Mon, 9 Oct 2023 11:56:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] net: dsa: mt7530: replace deprecated strncpy with
 ethtool_sprintf
Message-ID: <202310091155.3E4328DC1B@keescook>
References: <20231009-strncpy-drivers-net-dsa-mt7530-c-v1-1-ec6677a6436a@google.com>
 <202310091131.550C9CD8@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310091131.550C9CD8@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_115637_911652_ED58BF5E 
X-CRM114-Status: GOOD (  18.53  )
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

On Mon, Oct 09, 2023 at 11:31:46AM -0700, Kees Cook wrote:
> On Mon, Oct 09, 2023 at 06:29:19PM +0000, Justin Stitt wrote:
> > `strncpy` is deprecated for use on NUL-terminated destination strings
> > [1] and as such we should prefer more robust and less ambiguous string
> > interfaces.
> > 
> > ethtool_sprintf() is designed specifically for get_strings() usage.
> > Let's replace strncpy in favor of this more robust and easier to
> > understand interface.
> > 
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> > Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> > Link: https://github.com/KSPP/linux/issues/90
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > ---
> > Note: build-tested only.
> > ---
> >  drivers/net/dsa/mt7530.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> > index 035a34b50f31..e00126af8318 100644
> > --- a/drivers/net/dsa/mt7530.c
> > +++ b/drivers/net/dsa/mt7530.c
> > @@ -836,8 +836,7 @@ mt7530_get_strings(struct dsa_switch *ds, int port, u32 stringset,
> >  		return;
> >  
> >  	for (i = 0; i < ARRAY_SIZE(mt7530_mib); i++)
> > -		strncpy(data + i * ETH_GSTRING_LEN, mt7530_mib[i].name,
> > -			ETH_GSTRING_LEN);
> > +		ethtool_sprintf(&data, "%s", mt7530_mib[i].name);
> 
> Err, wait, I spoke too soon. Shouldn't this be "data" and not "&data"?

Ugh, ignore me. I keep forgetting that ethtool_sprintf() updates the
"data" pointer. My original Reviewed-by is fine. :)

-Kees

-- 
Kees Cook

