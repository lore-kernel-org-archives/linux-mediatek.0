Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C763EC4828D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 06:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZp49LWrBZvAva4h4qGlP855Yooh9hLpm+qn5WZrEI8=; b=amFSZWLVsy4SEmT16pVmuv0mB/
	Pl1A3sY0EyywMACYJRibM/3TfAmLEQE0wDQdTIKEI8midHRPkpWe1IHf5UizAjvwXs+1DDs0knnaT
	+nUCejvm8csYjjXcI7YlOIcNIh//33VN8mhEG0yjsETQTsguLUwPc4Yd25o8dDjmgZXms1WbG7AEi
	ipcn0lDgByhXrj17hDH+rjT7t5Fp7egxcQmzGCC5OT0PaM+cyaxCKAtdZe3r1occqyWkrF7s1ojH6
	zjiYXpIJLE0S56uRW+zccMMpbII1yTT/RCHM3GlTkJ23fG2FVBjnh2aIdRZ0iXra3fYpqy/pvBXTP
	pT3tE5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWsmR-00000002CKl-11PH;
	Mon, 05 Feb 2024 06:48:35 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWsmO-00000002CJz-2jwI
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Feb 2024 06:48:34 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d8aadc624dso30070195ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Feb 2024 22:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707115710; x=1707720510; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fZp49LWrBZvAva4h4qGlP855Yooh9hLpm+qn5WZrEI8=;
        b=kk3B+HHGUaLSkHzKVDgcmJ4LNdhZlr4sbqRdXnBzU/Oav9Av3+yLtXyKdZab498UuA
         Dl58y42z6/vaprxlNPvJ0hc98ByUxhVSsnDSl4rJuFIueztvC5ysCuKuqo3kC0C01hkY
         dsJpxBuXug7hMbgXD5/q5aQ7jfOI5xkrfwK+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707115710; x=1707720510;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZp49LWrBZvAva4h4qGlP855Yooh9hLpm+qn5WZrEI8=;
        b=qVNI76BqDUvNUpw+eMZpTh+Fc6SvtdFLwpucvAr1e5b+FZXLaRb91OyM2pgvxFDExp
         cGfabhouTIWa+FUCGBfY3vYFoFvbmulgNbpLccpUZerWogKO57mpTGKsKim93y/MQyP+
         y5CE4RyED+v+H728ztmY8/TucPQOCOUzFmAlKEoIRQuf+473UBlXsG3IX+hdzBHql+5r
         J0uFdXRbXxaW/vHUOyx5QXqxHonVYgCQBVYgzgvQ+apOuSaoHY1N3D6lsnA5StoNYSi3
         qKLrAhkl5brH8o7R+qlDfmtpIuuHvY8TjXmqS8GM3/MBz40N3fadQhr5hoHVzGw/hDmn
         LjiQ==
X-Gm-Message-State: AOJu0YzkB53IYx2l+rS0EKG+Wf4ZuSxOPyXaHGltqAztrHMYxtEmnd76
	pUOXncVGp0v5xAbkCE5cNEo9V4XUCfcWWTT45aHJz1zS7JZhZfFQFSTrb1C6Jw==
X-Google-Smtp-Source: AGHT+IGnfOZtMxNg8h1qTb6hrvn7hMA+At3kcSMYu7DYozE4dM5cbZdvfqk/85wgP7frdmqklRop+Q==
X-Received: by 2002:a17:902:e5ce:b0:1d9:a131:47a7 with SMTP id u14-20020a170902e5ce00b001d9a13147a7mr3301516plf.63.1707115710138;
        Sun, 04 Feb 2024 22:48:30 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXOlCQz0uICl2FN0MaWHy6oIw/UgIftw47P26HRWIH3JdDUdg+UBJ+ImwJVTtxPYBr50hnx8p1o1MI1qaBg53Seg3BIkhasGQv7pIOAMyDtk9CntBZOcYZlrdQ/hwmqgrnvd5PA27v7r5TCUEEYvLCzURBwxs/OE1UYcFphCuuv2F3lrRg7cKrTOOif3Z/ujshO9eTCYhlmH6ehN5JzDt0NxiHwSOlj9qI0seQG1Bca0M5l+DV7+ST72ntbVks07+entvdxvveqEeBDAWmtJ/K59JTKQ2o17IUSmQxKaCwKItzj9dsEFi27ERwU38tmH94wLRxG8/l7OH7GY+UI5cn6GpVFVBrIb0bJzSG+nP6qzGbHpuqy+qtmlRpOVxcmzDk6cDQuge7BTrddQVauCyiEqQ==
Received: from google.com (KD124209171220.ppp-bb.dion.ne.jp. [124.209.171.220])
        by smtp.gmail.com with ESMTPSA id ja11-20020a170902efcb00b001d8921f2058sm5523180plb.205.2024.02.04.22.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 22:48:29 -0800 (PST)
Date: Mon, 5 Feb 2024 15:48:25 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Mark-PK Tsai =?utf-8?B?KOiUoeaym+WJmyk=?= <Mark-PK.Tsai@mediatek.com>
Cc: "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	"minchan@kernel.org" <minchan@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	YJ Chiang =?utf-8?B?KOaxn+iLseadsCk=?= <yj.chiang@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] zram: use copy_page for full page copy
Message-ID: <20240205064825.GD69174@google.com>
References: <20231007070554.8657-1-mark-pk.tsai@mediatek.com>
 <20231008043855.GA2738554@google.com>
 <99a493e1e906637a179a80b1f27a4b6bd2a0a671.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99a493e1e906637a179a80b1f27a4b6bd2a0a671.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_224832_751116_1C8D8DF0 
X-CRM114-Status: GOOD (  12.72  )
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

On (24/02/05 06:43), Mark-PK Tsai (蔡沛剛) wrote:
> On Sun, 2023-10-08 at 13:38 +0900, Sergey Senozhatsky wrote:
> >  	 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On (23/10/07 15:05), Mark-PK Tsai wrote:
> > > 
> > > Some architectures, such as arm, have implemented
> > > optimized copy_page for full page copying.
> > > 
> > > Replace the full page memcpy with copy_page to
> > > take advantage of the optimization.
> > > 
> > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > 
> > Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> I guess this patch may have been overlooked.
> Could someone please help to review it?

Oh, yes. Let me take care of that.

