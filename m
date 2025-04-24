Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C07C369AB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 09:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OFUtc6E14wdV65P9yIfONJCg9qWhxxWMsqL7KKETGU=; b=djAhiwSCWfX+o4sbJ2/Sk415Jv
	l6wqHtferjlT3q5+1DIfuyrqINYDslg5b5HZWOjKn09lBCbELb7SC5iz3opa95hTOVWkhAspA7B82
	vfVDTvMaFMmQWvnxZB9KGweTzVbgBuNtS8D/SAIQai5l6QlQ8LLTb9YMXwFbcaLq8vhhqznWiZyH4
	PfbN02Cy1SFYupbK4BRpfN1m7aQOIqvmhV1J9EeY63OLlR14fL+jk4mDUV195cHGZmTEv3x7IjqmC
	4GGJ2DhbMgWM5NnFFbN9VjTvN9gZOPY3pmdMAJWCjyqtvv+FrnwG6jwoKnqEoUwfzk0HbCVhaxxs9
	eTsplrSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tLr-0000000Daql-0XQD;
	Thu, 24 Apr 2025 09:58:39 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7svE-0000000DVdP-2Ceo
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Apr 2025 09:31:09 +0000
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so929560e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Apr 2025 02:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745487066; x=1746091866; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OFUtc6E14wdV65P9yIfONJCg9qWhxxWMsqL7KKETGU=;
        b=kiIH2qsMlG8xSc2iNitn1BeukaB+zvtluXA8a+omX9INtLwMKo0HaaDeYP0xdLwH3i
         MwjKAkAZI/eD85ptI1Uv5qUfi80zJHgkkMHLybjvLaWEfG8LPHtIbj3w9axFaIKYyAky
         NY6OOFytmt7qE1qZa4wFpBqY1/H6+VGwt3xPbXizChmQtbFjI56qtEx1hqnFeTPVYFk/
         8HBAgHZ1lcH1wNqhXqEeoFaJEQUMoyABuhZ5LE99cG3j5b9l/z5E28Msx5yz1iiZY3n+
         3iw5H1tXr5ONCqdrDnxKtcktlY/RwLoSgBY8SGLN+1jmu5KSAMojyaMYiZ5VLB9u1fGy
         ESCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487066; x=1746091866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OFUtc6E14wdV65P9yIfONJCg9qWhxxWMsqL7KKETGU=;
        b=voIf7ReAf5me62FPP3zYGlAs3AqGtsqot18DnWK2UE6ARA5LeNtW5R3kxDvXtnBGx+
         Hz9aI+lL6W9UDgq+AVSGH0stZAOsc+yXw3K88gcHK4HrUJtzMbOfI5YuVMs/r2rgomQc
         c2Ol8OyP+OoGy9GdoqFR/V9jUQPZbilyD4d5y77ggeocyrWOeGvqpRAjSOpro8XXo1Y1
         IrTFGw0IP1Oma6FCEHXGwrTnL7zha7wfRWHBMeye6T5bFVfnyW1i+8WHykVViCkc9L5P
         3pXPg495cbllsC+wi7EuYtRjR7ARj5HeoFwJvn2Yuk+IJhlLHGhmCwpXGFMnrVqN97Lq
         VFnw==
X-Forwarded-Encrypted: i=1; AJvYcCX+aEjRwcC0N49Frvy0y9qjzZg/FAzr+pmfHhhnNr4OQ64fSyl3RASFM50VxP8b5mkdADc3hb4YpvOUi4wtMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZhjdtHAODp1tK/ULHYbwgW+OvlAIaUj4QTh5Bt/08rmyYHeRl
	AJCW+bXM4DcWyP3ljfvugWbiMN6jbrQhRMU4PzZVBD5CspyE0rInJ8nmBhNANE/wxY1JvtJxLR4
	h+hXZ1gluWLCcFqvM2+8J3DcPFCKyuasHOKZ96A==
X-Gm-Gg: ASbGncumTX+9kQUPnmlfM4bPvNf93MSbHcnDhu63nqxZPU+eIrM1TArgNrheU1110V6
	8oBCOhkJY9+caiabuRY/k+si2h2wCEpaLSxBxjxklNamHSBb8+dzFRVnKeisJqe8z8aQq7bcEpc
	Xg1k4mtQwblJOQUdC6uQ0bQFktcqELLUmyXDlppHORHbfeL/2NxP6LDw==
X-Google-Smtp-Source: AGHT+IHsrcwDupy17KAeauM93eCNYxhglhW02BiNTpc5bBXPbxtFIaFqSommlAPszsE+qNtEV18lQUWNZqxLQ8RBYlo=
X-Received: by 2002:a05:6512:2249:b0:545:2953:1667 with SMTP id
 2adb3069b0e04-54e7c3f2750mr606356e87.13.1745487066171; Thu, 24 Apr 2025
 02:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-0-f3fde2e529d8@collabora.com>
 <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-1-f3fde2e529d8@collabora.com>
In-Reply-To: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-1-f3fde2e529d8@collabora.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 11:30:54 +0200
X-Gm-Features: ATxdqUEmwhcixS5po8qzLJ1UaZ3b5-0QLF1L8tULREqHXKqmqmDdo2m_9ncmEOo
Message-ID: <CAMRc=MfgfZnQ4SarQGqNXF_f+rOQgiS49AHFKAKCtHTmStxZrw@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] net: ethernet: mtk-star-emac: fix spinlock
 recursion issues on rx/tx poll
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Biao Huang <biao.huang@mediatek.com>, Yinghua Pan <ot_yinghua.pan@mediatek.com>, 
	kernel@collabora.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_023108_562945_01BA9331 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
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

On Thu, Apr 24, 2025 at 10:40=E2=80=AFAM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> Use spin_lock_irqsave and spin_unlock_irqrestore instead of spin_lock
> and spin_unlock in mtk_star_emac driver to avoid spinlock recursion
> occurrence that can happen when enabling the DMA interrupts again in
> rx/tx poll.
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

