Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63648C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:38:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2952161164
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2952161164
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzdjtXadH5nCUiVKoBdr0ksjihkLFesCD+SqHXLXbAI=; b=kL5VYcjOAG4rZ9Xlw9kRqoIi2E
	XMkbJQaO6p5PfiKDP7sZavu0ZWVtrfjczUynOW5ONihoxKq1Hgxs+rtagffysI8CwGAPlVkehqZC5
	51ytDyJMuGqEWwj9myrMYPQG3AEQk/fxVCaaHH7ktBX52WQxfJEFj32JfKcwK8f/HKQ0ToA+EkbTZ
	j0zBoBW4ZTsuDTjIGPKKJ/IVY1teRSTeKRLnh9wzFe/5dEibSNIlDD0eyWCNkejcM6XQsEw1mYP1i
	KMfRSQqsChzkXY88xTcFReX8OgVqQK7jf1CIzztSZJkkoKj93Lxw5j5OHLw1Pgw2SQAXVCwpd8Awk
	1p07IIGA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5Ln-005Ylh-MY; Fri, 21 May 2021 13:38:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5Lm-005Yke-5A
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 13:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=enWZHbTX+1ralsrB94tU0j8mRNIc2ViVpX6p57Tm5zE=; b=f0Yw4fe4KjtyWmwrdNjV7EM2+d
 pf7pr6CpcUL5j7wlDpZFTylRu6w1ZKDKOvMNT39/6pvOPDn30ewZFLDg77XHv/T/RBCJf+ua+6rAd
 ncFm+IcvdelrPj20s4Fa/ePXxxQYFOGF/ffOzw8qLr2cqkkTtoAo8gj9nx3GJzcO0E+UpQb/jiUvf
 7b2LaMPtfmJEjuNWfdMY1AqYPjvFEIaYKpC33DLcQadDLVdsRHTRmjc2tHtKuLwNvs9RqYBbgCe0H
 up8Gu4HmX6FHl2uMwOZCMwjyuAf63KtgBy3sdP3SSFJ6aFO0vtCypBtq2tKxGHE0JwWwlas95fPE2
 wV5cSTpw==;
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5Lj-00H9V2-PM
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 13:38:00 +0000
Received: by mail-il1-x135.google.com with SMTP id e10so16615585ilu.11
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 06:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=enWZHbTX+1ralsrB94tU0j8mRNIc2ViVpX6p57Tm5zE=;
 b=q8LFiLJgz4erZaFk6fj4JM/AmedcsEm3aD+Osbe6jj0ySryG5lhha91+zewIWEJt3d
 UM0xdVW/ax/BEOt22B871ZJjSoA7uVKzGl+K0LYup0myRmKy0OTLtyGatHZrvhopvcYr
 x7pzJmuc5eQ2oBeQnp7JAt84/JjAYYqjGiUjzcy6SMN6bSaVxVca3VN8lSgEH/iOEp6o
 IbWODivDaA1mXl6UczSvfR2+HqwUxnkO/LXvjlSVCFJtq9pkPXLLnYMFSobb75QcAqFW
 /DGPOMj7yTGq8rlfo7gGKMaNQvAPX3IHlSl7C4qgLqf54lMlSxIveOOZHKHbrJow9wv8
 sZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=enWZHbTX+1ralsrB94tU0j8mRNIc2ViVpX6p57Tm5zE=;
 b=lDjsRk7MTCqP9B8Cmkqq3iA2iHZpBwczsLYDLabrSeloiHp1N3UAd4fRJdZkI4I4G7
 wmEOJmjlRbBSYqu6GMtiAeL5NVuN541zpMTriLVuwpwEr2eU9jmB/7ZFlrdYy2C0YH79
 ybWSacCvB6nr/WfGWrUiTDEfLbPt42qpwWSWb7eKjbRP19w46XN+vSUDTEdYq0jmMaiu
 //v8OX2Bob/zhNJ6OCocsOyLotxOvbqrPz1pMj0EdxxdoDK8umd6THWMs0FWBNiuOcSx
 /CB2ZUipqwi1oxQ8ukgA2KWqvPRQlkW1OsEh91D3JD3O1HthmGcBse3aSgFNMKPaYajH
 MXdw==
X-Gm-Message-State: AOAM531Fzcq+6FYMuWbonLR8jVbhy3+Jko+paHKIkmJiYBZM8NYY/tmP
 OotX/d04mna0temtKZe+qR1UFvsT8WYpZHn8OlVcgw==
X-Google-Smtp-Source: ABdhPJzQgYOhfJwS+6mJoi9CYzpcQz7dqQ+cPJ0vJ+ySWWNPgClzxGdsXTiVO2tXclv8vakUGfjzP783wYoVtgk2NGU=
X-Received: by 2002:a92:520e:: with SMTP id g14mr12213261ilb.218.1621604279076; 
 Fri, 21 May 2021 06:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-8-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-8-acourbot@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 21 May 2021 21:37:48 +0800
Message-ID: <CA+Px+wVj45oozC01RKcnvwLLWdSmFtoOC9rrLAbCVCmrYWKBdA@mail.gmail.com>
Subject: Re: [PATCH v5 07/14] media: mtk-vcodec: vdec: handle firmware version
 field
To: Alexandre Courbot <acourbot@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_063759_850766_6F71BE8D 
X-CRM114-Status: UNSURE (   6.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
<acourbot@chromium.org> wrote:
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
