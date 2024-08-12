Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E46C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 16:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymOFvrgOOD6ziq0VdD7c2aBE1giSS+9DVVT2WxCFpqI=; b=kHdomnS59wV8rHuLzjyg3AMdo7
	LD9OfJPl+1iYmu5y3w7gFWM0kefNKKcF3nexNr/GGQgzON495Sf9WLtw/GQzNfvbpj7s4p3SHULHE
	Up7Zz58qybS1iBvIXziuh9IiY6PxYy3YX4ud0P84tmbgMpjXEXyvILYtkYM7sWB/IydnNG1EmQk2a
	r6wSf54np2JcbmGsTHWO0Iyf4khUsGQfk7gX9n8P5ZWAL9JW0dr1I28pq/713ZupRHFoAyIPPv104
	8aC322WS8Y/Xp7qJxL9HhvBjVxyO/M/9+jdVRuYsTLBRJw6DtIvvUfiiIdbMVm/e8s/aQpu98phfZ
	xwp1NEEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdXz9-00000000tVR-09Vt;
	Mon, 12 Aug 2024 16:33:31 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdXyW-00000000tPg-366T;
	Mon, 12 Aug 2024 16:32:54 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-36fe10ec0d1so728058f8f.0;
        Mon, 12 Aug 2024 09:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723480371; x=1724085171; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymOFvrgOOD6ziq0VdD7c2aBE1giSS+9DVVT2WxCFpqI=;
        b=gNOO68rflPv/i8qnwmHek/Jct88TmBrnb+X5N1y+0Vsvn8r0QCvsq96h16PBzrJXoZ
         rpaIAYXaw4/dyV2ek/YT72/XAUHP3y27QxawW5Q7WE2Z3Gg8YqFZTd6nd3XKERsMkIOY
         PhRERJqW4Ad7CjLjBPUyz3RraFdwyjmvmfF3/HZEFpwVXqtOSpZBMe4jEgRj190RNjAH
         U7jCPtWoHc3LpDwI/4sHNwP52cL+KzASd57Qd224O+ujMf8TNY4vZOZ2wQrlO7mNSFx1
         ztKLrygm+KHIg6s7wdkwPPO0vZTUn6pCYeLKburlNgafWDrbVjxQf1uWPRGAK7JtZZH0
         dMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723480371; x=1724085171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymOFvrgOOD6ziq0VdD7c2aBE1giSS+9DVVT2WxCFpqI=;
        b=YR87sTAwrc4AT2dlm/efDm4GRzozXtLvBA120tY7pE1hro+Llqtol43m33COCk41X3
         mhJ1VrriqwHzkXf8+zBqWUOBBloZ0dv9Cb+NGTUqxkZOyjJWqf3mwJr2VZ1wus903oeZ
         isp9hhqHy7b5nZmrxfwADG2DU2iZGzqpZhd1w1xjabTGJTry8nGCh+gmG07PWhVEB/gq
         x27GsPRAl0lMJlrF9g7nGIwwlLEXdqVyDiYgXlvcb5rTpIdV17/fz5jbkiyVroC8BI6G
         Bbd6ZtQzY8ZMATSVI/8dY5yHGErkxxPSR5jTQidkFjIt9uZJdIZ09RtSNfDugOP+gPsK
         SynQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBeR+AVOVOf/liM3LRkA7yn8k4AF01AWEQf+GomW1hOfYrZWx945xDlnsg79POf4WxjwXeDdPT8iXIiLXmR78=@lists.infradead.org, AJvYcCXHrZjRwgR8x/4s3qnrv0tc2fItABL1hVwB5su5mJhBnZsTA8udxJkslfZgFJksmPuTjZb6HHRPW7sypgN3hBnN@lists.infradead.org
X-Gm-Message-State: AOJu0YyoXkBrsnuyFybVl9Y/VnhsYcom7I45kSVSZyawrNEP7maBBIHc
	m6KMYs3A3UZ/iRdHRCiEgLVd7DA4IAxWwQ5v7U9xZ+uhahVSsuzGrL1qNPRepS+m0eRWiGea//6
	tfk7egyV/BNkTXoJecJNaxXRHScM=
X-Google-Smtp-Source: AGHT+IGju9Iel2Z2uj3B86jeJimno2vj6Gt/AdBLAsIHf1cnvOVKmade9JDnpfNOG5dqOfP4r5mCRvmtOMZpUu13BVU=
X-Received: by 2002:adf:e003:0:b0:368:665a:4c64 with SMTP id
 ffacd0b85a97d-3716ccd8e82mr764686f8f.5.1723480370956; Mon, 12 Aug 2024
 09:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240812152126.14598-1-eladwf@gmail.com> <b3f2ac81-93e5-4143-a3fe-a5ff1159aaec@nbd.name>
In-Reply-To: <b3f2ac81-93e5-4143-a3fe-a5ff1159aaec@nbd.name>
From: Elad Yifee <eladwf@gmail.com>
Date: Mon, 12 Aug 2024 19:32:40 +0300
Message-ID: <CA+SN3spFyFx-RiRPs0apTojKpC7A0geAs_JyqEWHC4z8UVrT+A@mail.gmail.com>
Subject: Re: [PATCH net v2] net: ethernet: mtk_eth_soc: fix memory leak in LRO
 rings release
To: Felix Fietkau <nbd@nbd.name>
Cc: daniel@makrotopia.org, Sean Wang <sean.wang@mediatek.com>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen Lin <chen45464546@163.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_093252_818946_24207BD7 
X-CRM114-Status: GOOD (  16.95  )
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

On Mon, Aug 12, 2024 at 6:34=E2=80=AFPM Felix Fietkau <nbd@nbd.name> wrote:
>
> On 12.08.24 17:21, Elad Yifee wrote:
> > For LRO we allocate more than one page, yet 'skb_free_frag' is used
> > to free the buffer, which only frees a single page.
> > Fix it by using 'free_pages' instead.
> >
> > Fixes: 2f2c0d2919a1 ("net: ethernet: mtk_eth_soc: fix misuse of mem all=
oc interface netdev[napi]_alloc_frag")
> > Signed-off-by: Elad Yifee <eladwf@gmail.com>
>
> Are you sure about this change? From what I can see, the LRO buffer is
> (or at least should be) allocated as a compound page. Because of that,
> skb_free_frag should work on it. If it doesn't, wouldn't we run into the
> same issue when the network stack frees received packets?
>
> - Felix
>
Hey Felix,
I encountered this problem while testing the HWLRO operation on NETSYS3,
but it was part of a series of changes, so you=E2=80=99re right, with GFP_C=
OMP
it shouldn=E2=80=99t be a problem. I automatically assumed it was a necessa=
ry
fix.
Sorry for the mess, I'll continue testing HWLRO and resubmit this
patch if I still find it necessary.

