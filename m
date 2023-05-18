Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57308C77B7D
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 06:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSWZec/J0A95SxR8LujGdt3ORI4eM1n8G0sqzEOmKqg=; b=pyt1391GtoYR/L1X19EouXc9WW
	JhsNNjgWoKgcyrbnRu9LF37brsM4QpUtvDtyiwb5b+NozSkeM4gErEIu0yzXvsy09y+eho+onYupq
	MQSv7lhlgvAr9WXB4yoz7qQ2KcEe1NDW+/GqfiChhG4mOzIYCAdvKeEzU99WrAOoZVsFGnEh3fPI3
	4WC62bR7MpVumk8ZXMBVrggOmFg++64rbO+rJR/xfLEiDGe6kolA3kxO5EjcKFtQstTfSmc+KG9Pc
	C98/bnLKGOghOE60x1EzsUQ3H/FFig9ztRT92nqCJztMlCUdQyzbukOYdd53vxFCujmXuOLCP9qpj
	wpkiXhGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzWoW-00C249-06;
	Thu, 18 May 2023 06:08:36 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzWoT-00C22Z-0i
	for linux-mediatek@lists.infradead.org;
	Thu, 18 May 2023 06:08:34 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-783f7e82ef4so476116241.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 23:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684390111; x=1686982111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aSWZec/J0A95SxR8LujGdt3ORI4eM1n8G0sqzEOmKqg=;
        b=VvJmt+2iJDjTXM5TCSHqebEa8w0nj/TQ09XLTx9AC1hDxo19cs9nvpCu0NVXOd6iEQ
         2N0zEb/cv9ZznUf5cHO7bkzs9tfI3IJEdBhUkVbwHre/96lT3/TdqSy5p2Qt1CV/2QfK
         1MRNQd+iDHqlIUSvzO6oc0muLxWQ26H1wk8mdQOmoKgTbZx0SgBCkckRBYHXThqEjJd0
         b91FlwpFFL6Y7uQSAIgrSF6Gjbb9nLJrwB9Cd8CZAsv8EoUJ2Jn2S/ch358KVd1nKTfH
         Oh3y32wtrvvPLf89kPKQphChPENIwRHyBqX/6aZqnwq5YxIr1KttsW+JHKVY7KGl5pAg
         IxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684390111; x=1686982111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSWZec/J0A95SxR8LujGdt3ORI4eM1n8G0sqzEOmKqg=;
        b=PYFIIxv3QRv4pe2FIwRgJXnyZM7mNVMOL8KoiN5m2+jdRrX8Ow6zEqMr9wWcAf6Z83
         NBpyrQGvq4kcRzYWraU+KxtfeqDmi4orJHTEZ+pof+NUJVpk4Ww1faB333mDwXmijh5T
         AGpzrv5Lguln2Nt3x7d7pHdQW0kn/ynSUV+w8sJWF2erHf/nwmN71jUpEKtp5ogiBC9i
         y5mMLSLn6MQSYyPQnmG6xn/hyMyzXGVC2CU+GzzyeQJxtx/QXxJ9Bt1kT1yvmEGJH8mW
         GFJDx7CYjNdYpjXj21QYwgI0kiRyqb5X8PmGx/q/ANhCRL098Pcbxaaon3EvBh5OOJNE
         SSFQ==
X-Gm-Message-State: AC+VfDy4ylDR4SjXTcYPHvCr4FXMae1snNhjEdT1TbSPN4osRGG06a91
	qzEVB2xcVHXZQ677TMGHyJcF3DIauxOr9g5SOSiRBQ==
X-Google-Smtp-Source: ACHHUZ7vGQz7U1QKUL4G8JAwAxA4rm9CtFFkMegAQAGOmllOFW+EzKiyuTcXNAw+DMEHAgEuXjccFvVT54t/e+su+qc=
X-Received: by 2002:a67:ebcc:0:b0:434:768c:4966 with SMTP id
 y12-20020a67ebcc000000b00434768c4966mr157942vso.8.1684390110959; Wed, 17 May
 2023 23:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230517031856.19660-1-xiaoming.ding@mediatek.com>
 <ZGSDoVKKVqCkbaCB@infradead.org> <CAFA6WYO+AvnbuAdWyBAQ8HkLaOno7PXdsPb9SubxrGNvAm4UnQ@mail.gmail.com>
 <ZGSLiiK/JzD5KMd7@infradead.org> <CAFA6WYPOMwmrA3J84AHzoD2eAtNkpMxr754qHpc-j6XRkgFFvQ@mail.gmail.com>
 <ZGSgCZrg+RjAbGO1@infradead.org> <CAFA6WYO+EpiECFxdVgmd-Ey9jq1Ybt78WupK_bW5+oDcW-soVQ@mail.gmail.com>
 <d4773626-6cf0-c929-c775-a84ac41fd719@redhat.com> <ZGWnq/dAYELyKpTy@infradead.org>
In-Reply-To: <ZGWnq/dAYELyKpTy@infradead.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 18 May 2023 11:38:20 +0530
Message-ID: <CAFA6WYPgvifYcj_MT7BBcC0BtQDWXV0u+HY8qv0M9nNyiCgkow@mail.gmail.com>
Subject: Re: FOLL_LONGTERM vs FOLL_EPHEMERAL Re: [PATCH] tee: add
 FOLL_LONGTERM for CMA case when alloc shm
To: Christoph Hellwig <hch@infradead.org>
Cc: David Hildenbrand <david@redhat.com>, Xiaoming Ding <xiaoming.ding@mediatek.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, fei.xu@mediatek.com, 
	srv_heupstream@mediatek.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_230833_418954_F5643EA4 
X-CRM114-Status: GOOD (  15.68  )
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

On Thu, 18 May 2023 at 09:51, Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, May 17, 2023 at 08:23:33PM +0200, David Hildenbrand wrote:
> > In general: if user space controls it -> possibly forever -> long-term. Even
> > if in most cases it's a short delay: there is no trusting on user space.
> >
> > For example, iouring fixed buffers keep pages pinned until user space
> > decides to unregistered the buffers -> long-term.
> >
> > Short-term is, for example, something like O_DIRECT where we pin -> DMA ->
> > unpin in essentially one operation.
>
> Btw, one thing that's been on my mind is that I think we got the
> polarity on FOLL_LONGTERM wrong.  Instead of opting into the long term
> behavior it really should be the default, with a FOLL_EPHEMERAL flag
> to opt out of it.  And every users of this flag is required to have
> a comment explaining the life time rules for the pin..

It does look like a better approach to me given the very nature of
user space pages.

-Sumit

