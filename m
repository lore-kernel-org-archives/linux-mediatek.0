Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D1BC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 03:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlyRKcLPmQI/GuMlXIqsUsFwwg15w/4JZugy36RWLbA=; b=qqmpUVEvE1TmJ5E7uUVmqAoodR
	3INNAF8NBzijVdaxI/PAzjeL1W+2uzKCYtAbjuYIi6GOlmFgxe3yFBB1kPhFnXDI1R26uSrfJNI2Q
	N3IseJsMpF4L1Tcn24CKVbCk/y2kKoQmLA+3m+Vx8xOssWw4AtRc6GrNAXgaJCwVKRuZFuOhPEfH3
	mSFWRNymfjmda6nLaLgwRInMf2g9LmnNDyU8UKJOGflFNcebL5F0ov4MLb1Zo83ddMIWchr721Fbc
	NA/3/Xap0klAw+q+0dhbpCRoRbuFKtNjrUiBp9L92iDBc0yaXCfQWLKJS/jpH09iIFQnXcqo5fFZM
	tcbwd0Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZMtG-00000003cyl-1yjC;
	Thu, 01 Aug 2024 03:54:10 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZMsi-00000003ckg-1u45;
	Thu, 01 Aug 2024 03:53:38 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-36868fcb919so3175135f8f.2;
        Wed, 31 Jul 2024 20:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722484414; x=1723089214; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlyRKcLPmQI/GuMlXIqsUsFwwg15w/4JZugy36RWLbA=;
        b=fX32qxNwOTHG4woAmaoBUkH8qwGes81Zem6/fIdQUpzY9EMM5hqC7UdEVAxGd0rVnm
         CWZTmzoUpvxP74mtX7Nd8ssJsUU5Ny3GrqEX4JelGoqjzkepOL3mi6gldpZHQAnfVc/k
         OqTdtabi4oAl9PT5chj0TFuW3THcoq8Y1ytihdAPo8eYizpB2aa7qYaoj0s6UvAkWVJt
         VsBeWHR0xu1geByKElk71lIFkWHr+BY92KocZumrL8L4EkpWIjyCONZ8RubyL/lyZtjJ
         cmtvJWTDX05eRldUqxq7nJ/PMp2UDvkbGMCrVnQ9QcUGcIByyrXNN65czuEYlEeHb89Q
         W+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722484414; x=1723089214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlyRKcLPmQI/GuMlXIqsUsFwwg15w/4JZugy36RWLbA=;
        b=d2jSiwHMzhZ/kHTsIL59GaP4JQ/OszuAnjkju9QFrd4UM6gIjICxXT+rcqb/aaoBnQ
         O5zvTmWZyplqfYjYaSfNTWYxmczfSaLFyCtAqCqwgrvtNS2ToUWuN9IM2UzTslxs2Mzt
         nziFUD0I5yzzwquP6D2Ez+vreD/HtaGfF8QhtcLccZKd4W+pAxs8TOKo7QYsEkiWM4gs
         Q0iUo6GgHTlt91ZEShL1NLvbndavbyegvnZrwuvcw/iZBVFJsQSjUbRshQy3/E4DekHS
         Ypo7MwdgZ8JiQ4T6+SPaYZVIyyxLBPpVUD28kB2UDwaXQ+jx+G0062jyXQSDJQw0jQG6
         peaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw62zL2SqfhM8Pj0t2yMlzSZWjWQWPJ6lwl5ZqQ21Zf727SJxwfFNV0UPb4v01s3BRXH3vMC03POjlv6cXv/NpOB8kowX+wyr7WseWmQG1BfIAcka5/mvY5HbVCVGakUiKVuLt1CKIIT6wKchrGqpgSHpfQFUiAX8=
X-Gm-Message-State: AOJu0Yz55j71CMxXAFkty3Fqn4T9fMYe1B4WQfq1PVu+QhJz/NG76wcF
	04pQ5fR4Y04afw3fgr2hQbyMARcZ61tFYYpqupytcKO4OS17Jel0S+Wdllcr/8evEbey2GZRfQB
	TLDpMDj1VItgLMhwmmKwNl4j3rPk=
X-Google-Smtp-Source: AGHT+IEs0THMbA0sF4obneu0+dmcKI40YGhrl7j05k/acZ3+a8Pia7WokWkm4hxOH6DCTgtLunHntz23diVKez52CcY=
X-Received: by 2002:a05:6000:cca:b0:367:89fd:1e06 with SMTP id
 ffacd0b85a97d-36baaddd1admr769970f8f.36.1722484413831; Wed, 31 Jul 2024
 20:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240729183038.1959-1-eladwf@gmail.com> <ZqfpGVhBe3zt0x-K@lore-desk>
 <CA+SN3soFwyPs2YhvY+x33B6WsHHahu6hbKM-0TpdkquJwzD7Gw@mail.gmail.com> <20240731183718.1278048e@kernel.org>
In-Reply-To: <20240731183718.1278048e@kernel.org>
From: Elad Yifee <eladwf@gmail.com>
Date: Thu, 1 Aug 2024 06:53:22 +0300
Message-ID: <CA+SN3srMPLcmQ4h_iNst71OkQPFcCYxBRL0Q9hR=7LjJ86TFFA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/2] net: ethernet: mtk_eth_soc: improve RX performance
To: Jakub Kicinski <kuba@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, 
	Joe Damato <jdamato@fastly.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_205336_621195_A19E0739 
X-CRM114-Status: GOOD (  13.72  )
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

On Thu, Aug 1, 2024 at 4:37=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Tue, 30 Jul 2024 08:29:58 +0300 Elad Yifee wrote:
> > Since it's probably the reason for the performance hit,
> > allocating full pages every time, I think your suggestion would improve=
 the
> > performance and probably match it with the napi_alloc_frag path.
> > I'll give it a try when I have time.
>
> This is a better direction than disabling PP.
> Feel free to repost patch 1 separately.
> --
> pw-bot: cr
In this driver, the existence of PP is the condition to execute all
XDP-related operations which aren't necessary
on this hot path, so we anyway wouldn't want that. on XDP program
setup the rings are reallocated and the PP
would be created.
Other than that, for HWLRO we need contiguous pages of different order
than the PP, so the creation of PP
basically prevents the use of HWLRO.
So we solve this LRO problem and get a performance boost with this
simple change.

Lorenzo's suggestion would probably improve the performance of the XDP
path and we should try that nonetheless.

