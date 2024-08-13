Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3499C52D7B
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Aug 2024 15:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nC9j0rwXAV42mfe1JGwEatxbihzY0JrdD7+bccVpsE=; b=YTYaOGQcW9uA/FHuyW43IKCLnr
	nUBx90bQhOQaSlOomOpkrgj/JI7JCaOAs3q+sVFcklQT9ukM/pxzOCp2vhTs2qcagaAw7pmYZ7tZy
	o9GKFVlcSrq7dypBtnYamXdx6ivwVWZUq5JKTPFTc2HzwPOXstlB6G2c1Ej2kcX1d12cxv4u0yfJh
	C/7HvEnX1qBMq/0L1Juv2J9Ugpr4C0VCsVdOZQxTRna5PB24jMgBdW7N2+U4yJv3vm2U90ny+d8go
	MFGExxPwS9A7+iZwDHhC4z2DiMNd06ksmqSUPby1ddewKs+fuvdBeojJjhl8a8+1L9CCgs0oIj+Wa
	oEdALGsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdtCR-00000004AF9-1og4;
	Tue, 13 Aug 2024 15:12:39 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdtBW-00000004A6X-49dm;
	Tue, 13 Aug 2024 15:11:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so38987155e9.2;
        Tue, 13 Aug 2024 08:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723561901; x=1724166701; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nC9j0rwXAV42mfe1JGwEatxbihzY0JrdD7+bccVpsE=;
        b=YmLAJ0w3SFJPHclxzWOF2s6Dhly/c5mO+eSUasbD73OQ1WCz13fgUX0PrRaXDKBg3D
         TS+IOo3NPdFqCELRSlgjsNvuTD74wkw+qvePYsrylCbjvPtC/VjBJTDEzlGKFylXBZg+
         NufBjrmNdc+Aq3cHthdxjGu3RhdsC9IqxwtxLAOf0zc2zyl7iBU3dEV/DG/V0xhFtrZa
         itSd4pw5UnDBZuwMxoPtXuQhd0EmS4WTn/YhVpkL5k2g9/NbvNQ2ddkFdejhiwFA9EqP
         NOKlxuU6y+0x9epROSQAqS7xBaLe25FgZmnqaq8CGKwQ4jAdK+4jQW+89fcB2iBqzyhz
         Gxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723561901; x=1724166701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nC9j0rwXAV42mfe1JGwEatxbihzY0JrdD7+bccVpsE=;
        b=W+JGno1htP/KuvrlNqz++2ndte3M+89a+ghTu0IpHDvRJ/uQsZIevCa6gkCCEJAWJC
         DngkwhMsoU1K4BeU8K+nVlvmVEnr7sfDx0v8TQ8s4FkJuoEGNbdTVZHY5ysJec2EYnM3
         6497YIF0FurSDmqPlTo1jSO00/90/VrgHq+tKVq2fvYYkCoFA8H9YT98EnBmcAaU8xrI
         fhJt9susL+0SPgU88ENFnxEJTqEjDi+aUOiC9HQGFySctVcE1beCN6q3b3VFn/lgdwXs
         cX6kate5ZvsgYbjIMRJbZ/zAoRGuUgdvtqHU3pZ3fdq/oDsEEMc9KUUExYq57qAjD0WI
         F8xw==
X-Forwarded-Encrypted: i=1; AJvYcCXQAlSL8WX8Ab86Iz+6wKDjF3con8IqtlyAbsJ8C/Si6On2UW3Jj4GGTXXWX7qV0mLHeTDtkTOAuW+0ve/LoPxTYNVZCiH2cYZg2jHP9oRRk4PTeHe/ysSW+2Uv4JcqXpMbdwyGuqTlQo1yN6MNvmtnTHsHtEqJ3us=
X-Gm-Message-State: AOJu0Yx6YNEiznmaiXGbqP/c24iojgswFilrBsw9RAHLPIw4LwzNP3Dt
	Cl+Ap0xkWmLsMQ2FvI/Kl28jzcwPBNvwEt6PBat6okax3uSCWgG6GeFVVz8Hv6H8G59mDNME/vf
	j7eI4LGhreY8hu3w/VypeMfh6sfI=
X-Google-Smtp-Source: AGHT+IEiRdefQPqd/dPcUdZDhMBU+XuPSqJx3UZGGW6A7Tj9UdJ3g2ZF6n39rYUPDVgFQ3fwnLBKaSyoF92wFN4g+fE=
X-Received: by 2002:a5d:47c2:0:b0:368:303b:8fe7 with SMTP id
 ffacd0b85a97d-3716ccd8341mr2763330f8f.7.1723561900405; Tue, 13 Aug 2024
 08:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240808123714.462740-1-linyunsheng@huawei.com> <4aba9fae-563d-4a4e-8336-44e24551d9f9@huawei.com>
In-Reply-To: <4aba9fae-563d-4a4e-8336-44e24551d9f9@huawei.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Tue, 13 Aug 2024 08:11:03 -0700
Message-ID: <CAKgT0UezjgRX9QUWkee_p8KVQQa1va12k2CaGJeOYrr5LGg4YQ@mail.gmail.com>
Subject: Re: [PATCH net-next v13 00/14] Replace page_frag with page_frag_cache
 for sk_page_frag()
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_081143_051733_7DD6D543 
X-CRM114-Status: GOOD (  27.61  )
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

On Tue, Aug 13, 2024 at 4:30=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.co=
m> wrote:
>
> On 2024/8/8 20:37, Yunsheng Lin wrote:
>
> ...
>
> >
> > CC: Alexander Duyck <alexander.duyck@gmail.com>
> >
> > 1. https://lore.kernel.org/all/20240228093013.8263-1-linyunsheng@huawei=
.com/
> >
> > Change log:
> > V13:
> >    1. Move page_frag_test from mm/ to tools/testing/selftest/mm
> >    2. Use ptr_ring to replace ptr_pool for page_frag_test.c
> >    3. Retest based on the new testing ko, which shows a big different
> >       result than using ptr_pool.
>
> Hi, Davem & Jakub & Paolo
>     It seems the state of this patchset is changed to 'Deferred' in the
> patchwork, as the info regarding the state in 'Documentation/process/
> maintainer-netdev.rst':
>
> Deferred           patch needs to be reposted later, usually due to depen=
dency
>                    or because it was posted for a closed tree
>
> Obviously it was not the a closed tree reason here, I guess it was the de=
pendency
> reason casuing the 'Deferred' here? I am not sure if I understand what so=
rt of
> dependency this patchset is running into? It would be good to mention wha=
t need
> to be done avoid the kind of dependency too.
>
>
> Hi, Alexander
>     The v13 mainly address your comments about the page_fage_test module.
> It seems the your main comment about this patchset is about the new API
> naming now, and it seems there was no feedback in previous version for
> about a week:
>
> https://lore.kernel.org/all/ca6be29e-ab53-4673-9624-90d41616a154@huawei.c=
om/
>
> If there is still disagreement about the new API naming or other things, =
it
> would be good to continue the discussion, so that we can have better
> understanding of each other's main concern and better idea might come up =
too,
> like the discussion about new layout for 'struct page_frag_cache' and the
> new refactoring in patch 8.

Sorry for not getting to this sooner. I have been travelling for the
last week and a half. I just got home on Sunday and I am suffering
from a pretty bad bout of jet lag as I am overcoming a 12.5 hour time
change. The earliest I can probably get to this for review would be
tomorrow morning (8/14 in the AM PDT) as my calendar has me fully
booked with meetings most of today.

Thanks,

- Alex

