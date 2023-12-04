Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FB4C10DCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 04:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSIjHQyxvuiMYpm126xyxG1Zci+DFvN4cs1bYgkFaNU=; b=Zq6gk9BlpIqLGUG5XR0omjo5c8
	KCnIueyQTX+uQVmI2xK5z4NBAqPPwRrNpc/6hDW/w2KDofwpqELfzRSG/MdwXC1N3OlUP5ct0D+sT
	ZhFobqNgHC3mZFaQSpeDJVV9jekrHnY8PqAvxYxOD75yrOphrBAJJi/+COkOQuuLlMe8iZfbME6wg
	ucp/XTKKE2rG0NhZ05jKIHXzs+bp+3SZw7eME4le+H90DJ0gmqBDDSXFo6PXWpwLBtEZaHcDsFdH0
	ddueamT9YCD8cNp/a1P3DCadZ0wxNauAAD7SC+10GydnFr3RJPiB+PDG3bht9NnfjqV6X9DDXvxGh
	C7HQq1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA0K7-002x5s-3C;
	Mon, 04 Dec 2023 04:12:47 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA0K3-002x3Z-1Q
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 04:12:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40bda47c489so19339755e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 03 Dec 2023 20:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701663159; x=1702267959; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uSIjHQyxvuiMYpm126xyxG1Zci+DFvN4cs1bYgkFaNU=;
        b=lF23c3iQV6C+lswMFGEVfFZtzUYqzp+tB0k3x3iUn49IFW/3Dn/ic1MkcLzVn1Cr4y
         n1JC18fGvx7weD6FAbP2bzUbs9SN0YhY11d5cjZ3d4gVrI2zt04DdTqIRnpyX1zAdCk3
         /fwUprdnT0Z6PP51qs1Y99yaeKZ5GZXBOz0hoY5ClEOQHKXqmP028c9VCeqC1utJIeU3
         pf2pjXinzZhSrgWxv+539Ya6RX3zk7AEXShLcOh7rKzy/06rQMq0UaE7nX9iY/lgFXM2
         I7QwXOmoiyMeDEIY3nXZEdfWEgS8uM5ptGWdaRwdyG1y2NkHM0HrLRk7PfO9+c3rZeWQ
         noiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701663159; x=1702267959;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSIjHQyxvuiMYpm126xyxG1Zci+DFvN4cs1bYgkFaNU=;
        b=C1hwLvb4EjmARtxUwzkHJY+zq84TiDYEXhBpjoWz0Zgni4pF7oFmRrVmqeJPjZu0Ht
         km2v0WTBmM8oTUivdxG7ocxBAbEA41fmvABEvxglGoIEMvOzUBucmiScEQ5QBO5fUCnr
         k2G+SHJve4locDPTqbuoTLpPc3n7WbIiVvSj3tAR/rbxmID5KZJop1RcnDLlumrHbGUT
         N2IRJofSJckGhzjCtxJ9buzcYjJBnIsddtbTnhAXG+wCEDZ39S41jRGk9RUxcepy5k7U
         PiK4GAQ6oZbSmEskDk1bM9LPX/QyLE/Svz+AVXNLT3+cMXO+OEmLjBA1z5r7tiISUQlV
         0XWQ==
X-Gm-Message-State: AOJu0YzvvfrzJX+/ltifRURdjfR58wOrMB6aEPposX4Q0UBtoEXs4nwx
	eaxtwieXRcJirPINSoOZTQ94Fw==
X-Google-Smtp-Source: AGHT+IFZ3Amq/8upC2zDw7bfGR8OHocro9buNNWJ73bfkCMwsGdKd3TsSUm4vWCIpdfHvwBaPhtIBA==
X-Received: by 2002:a05:600c:3b1d:b0:40b:5e1e:cf9 with SMTP id m29-20020a05600c3b1d00b0040b5e1e0cf9mr1855181wms.52.1701663159222;
        Sun, 03 Dec 2023 20:12:39 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b19-20020a05600c4e1300b0040648217f4fsm17107376wmq.39.2023.12.03.20.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 20:12:38 -0800 (PST)
Date: Mon, 4 Dec 2023 07:12:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrey Konovalov <andreyknvl@gmail.com>,
	"Liu, Yujie" <yujie.liu@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	kernel test robot <lkp@intel.com>, Haibo Li <haibo.li@mediatek.com>,
	linux-kernel@vger.kernel.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, xiaoming.yu@mediatek.com
Subject: Re: [PATCH] fix comparison of unsigned expression < 0
Message-ID: <ecf38b22-ee64-41e5-b9b5-c32fc1cb57bc@moroto.mountain>
References: <20231128075532.110251-1-haibo.li@mediatek.com>
 <20231128172238.f80ed8dd74ab2a13eba33091@linux-foundation.org>
 <CA+fCnZcLwXn6crGF1E1cY3TknMaUN=H8-_hp0-cC+s8-wj95PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZcLwXn6crGF1E1cY3TknMaUN=H8-_hp0-cC+s8-wj95PQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_201243_481489_32E6E20F 
X-CRM114-Status: GOOD (  25.37  )
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

On Wed, Nov 29, 2023 at 04:01:47AM +0100, Andrey Konovalov wrote:
> On Wed, Nov 29, 2023 at 2:22 AM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Tue, 28 Nov 2023 15:55:32 +0800 Haibo Li <haibo.li@mediatek.com> wrote:
> >
> > > Kernel test robot reported:
> > >
> > > '''
> > > mm/kasan/report.c:637 kasan_non_canonical_hook() warn:
> > > unsigned 'addr' is never less than zero.
> > > '''
> > > The KASAN_SHADOW_OFFSET is 0 on loongarch64.
> > >
> > > To fix it,check the KASAN_SHADOW_OFFSET before do comparison.
> > >
> > > --- a/mm/kasan/report.c
> > > +++ b/mm/kasan/report.c
> > > @@ -634,10 +634,10 @@ void kasan_non_canonical_hook(unsigned long addr)
> > >  {
> > >       unsigned long orig_addr;
> > >       const char *bug_type;
> > > -
> > > +#if KASAN_SHADOW_OFFSET > 0
> > >       if (addr < KASAN_SHADOW_OFFSET)
> > >               return;
> > > -
> > > +#endif
> >
> > We'd rather not add ugly ifdefs for a simple test like this.  If we
> > replace "<" with "<=", does it fix?  I suspect that's wrong.
> 
> Changing the comparison into "<=" would be wrong.
> 

I would say that changing it to <= is seldom the correct thing.  I've
wanted to make that trigger a warning as well.

> But I actually don't think we need to fix anything here.
> 
> This issue looks quite close to a similar comparison with 0 issue
> Linus shared his opinion on here:
> 
> https://lore.kernel.org/all/Pine.LNX.4.58.0411230958260.20993@ppc970.osdl.org/
> 
> I don't know if the common consensus with the regard to issues like
> that changed since then. But if not, perhaps we can treat this kernel
> test robot report as a false positive.

I would say that the consensus has changed somewhere around 2015 or
so.  Unsigned comparisons to zero used to be one of the most common
types of bugs in new code but now almost all subsystems have turned on
the GCC warning for this.

However, this is a Smatch warning and I agree with Linus on this.  For
example, Smatch doesn't complain about the example code the Linus
mentioned.

	if (a < 0 || a > X)

And in this case, it's a one liner fix for me to add KASAN_SHADOW_OFFSET
as an allowed macro and silence the warning.

regards,
dan carpenter

