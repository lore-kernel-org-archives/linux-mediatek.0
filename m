Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89954C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 05:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/7aU9sDpYwQXeoJM1CArP5cEatPpjsDcOLesviOAhg=; b=jjUmXR8Tzc2Dy9tpz5TI3Kuz2N
	+S4GcFh+KW4Vco2zYjMttkQB3bHiXZXCABlglYxwkvHMZwqUSFKgni8pjqby5mZGNrS7FkfjET37w
	9zsFhp6SFvf4mxP34d8vgIepom/p3lNgzsVCR7n5hHBAGUOY7nP0wYpvepk0EBa6/9sDM7yjtRTST
	JYtw9W5GgOeH31AzO4DhDIYTuueilEXSCOmunIvLgm83noJOv/facn42fa+ldgDD43KXI0sy1OW9u
	YkhPE0JwQiytbrZaBUQmBwtOupXrHCXkiRrEVQolBtPMglrDbLeFyCyKfxGc767KZ3hhKM+5yADzy
	SJAoJkGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYfRW-0000000DiqX-2oHg;
	Tue, 30 Jul 2024 05:30:38 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYfR4-0000000Dika-0xej;
	Tue, 30 Jul 2024 05:30:12 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-36887ca3da2so1800285f8f.2;
        Mon, 29 Jul 2024 22:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722317408; x=1722922208; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/7aU9sDpYwQXeoJM1CArP5cEatPpjsDcOLesviOAhg=;
        b=EYH05WJEl8D4V8gI6v9OJdp+jY9Yrtf8KZFVg8NXGlo2cetIqunHeCFUwEBuUTaaR2
         Sq4zDa5jrzPtLdIPX41FT2J9jdx9szICdtLvy8d9a2n4XHc+Djbi+DFXpZ65fqcyJGht
         K+yeBjjdRv1dfkamsE1RuZUPxBqfZ/TlLPVu85wKnxThOukUKP0FkZcSjlHbaNtmD3h2
         j4slNBJA/I98ZR4duDqrPPEW+4njmQIJD5dSWKn1mMWP9bPREhVx2McVp1OjuynVxQdT
         dRBH+Kky9yWzTkIjVxeaSb/cOUwgB7KP6t+Si7H6SPf1Y69mffP3yLyC2mc3IJlYZSqg
         LxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722317408; x=1722922208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/7aU9sDpYwQXeoJM1CArP5cEatPpjsDcOLesviOAhg=;
        b=ThL/7ilbL1EzS8RUePulKFV3yZs7nng5gNHDmjM/u/OBq1f6ARJSDcAOeSvwqb06i+
         xCG8yZ4Ipm3mj+rJOcVbfUeuqvjo7FBjzdJW/Pa5qHiOIZLbxyZYia1w3blVYvb/K5VY
         VFQl3F6X0robsf0FW++BeMyG2pXHB/2945yfOrBQhVknmgS6nItrpIaFPDV80pkDY7NJ
         rhY+Km82jRY3mP00K9QsMUYIocUom/L3m2i7EhTzFr/mDOXx/IzQVqGkw4Q5+9yv3pqp
         tLUqtcjaGobQ/H88I8syLsfpA1eMupY2n7mFmY5i48KOL4EdF/JHAsvpJI1uDOIOX2jJ
         D5Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXJbJTf3g1yWSgzgiAgVx64Yx6RW4KOYA8xFfFdVPOl80M1p5C/C34trWAmXD5yYW3MxSbL1xKSmkTkI8WfvMS+2luRauPFlwPHo+VuyYQLcMxlyqgJgHmkjnbzV050+sIPwEpWu/MkrnH9HBUF7T9cADvfCNr0KtY=
X-Gm-Message-State: AOJu0YwjlK4w9cyd2dO7u8kmF1PQyt7osXu0JIIBLEK4+PsQBULj+o9y
	rZb/mJBOBcdHSNV7zaG3Fss5Raof566PqtkyOmyrKXdg82fSZZsqCFPrOSrkcqd0hzsKIceUFII
	ja2QuMlD0GNiyaROuKyMc6oM3qm4=
X-Google-Smtp-Source: AGHT+IHFHRVcyzkdry4aJQCeC/O2MYafFRyK4dAEMqxvOWlqfqEifF0pIrhi4TgeD3Hldw/g6fzElAg6Io6qXofmcmY=
X-Received: by 2002:adf:e585:0:b0:368:3f6a:1de8 with SMTP id
 ffacd0b85a97d-36b5cee4ce8mr6504099f8f.11.1722317408110; Mon, 29 Jul 2024
 22:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240729183038.1959-1-eladwf@gmail.com> <ZqfpGVhBe3zt0x-K@lore-desk>
In-Reply-To: <ZqfpGVhBe3zt0x-K@lore-desk>
From: Elad Yifee <eladwf@gmail.com>
Date: Tue, 30 Jul 2024 08:29:58 +0300
Message-ID: <CA+SN3soFwyPs2YhvY+x33B6WsHHahu6hbKM-0TpdkquJwzD7Gw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/2] net: ethernet: mtk_eth_soc: improve RX performance
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, 
	Joe Damato <jdamato@fastly.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_223010_295080_300089A2 
X-CRM114-Status: GOOD (  15.21  )
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

On Mon, Jul 29, 2024 at 10:10=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.o=
rg> wrote:
>
> > This small series includes two short and simple patches to improve RX p=
erformance
> > on this driver.
>
> Hi Elad,
>
> What is the chip revision you are running?
> If you are using a device that does not support HW-LRO (e.g. MT7986 or
> MT7988), I guess we can try to use page_pool_dev_alloc_frag() APIs and
> request a 2048B buffer. Doing so, we can use use a single page for two
> rx buffers improving recycling with page_pool. What do you think?
>
> Regards,
> Lorenzo
>
Hey Lorenzo,
It's Rev0. why, do you have any info on the revisions?
Since it's probably the reason for the performance hit,
allocating full pages every time, I think your suggestion would improve the
performance and probably match it with the napi_alloc_frag path.
I'll give it a try when I have time.
You also mentioned HW-LRO, which makes me think we also need the second pat=
ch
if we want to allow HW-LRO to co-exists with XDP on NETSYS2/3 devices.

