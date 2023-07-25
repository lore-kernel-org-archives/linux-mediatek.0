Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C826FEB64DD
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 02:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJ6MWJZ0PC07PoDab55truxx6wk6LB1vHJirFaivjEk=; b=FGTBO644vwnpsiwWW4JLk2SM9L
	ERjoKAuD2/0a+ritD/ERcgT1jPqc66Dw0yoBL3l80+PObW2zogMbFVBUpNfkCRkrourZ81NWrH9Kq
	/h8tTof9w3u5ocg9DB9DxmZ0H7IN/o0i/sb0AOTnYWHba0LX6aHNYRMaILnmdcxihPqQgauQSx50H
	nPzpZs8aG3mhJnmaHcxUtsXg2u3vr8tV7v34UHDCv+wKP7blM1HsZo1V143JtqnvH3eYLibmKg7x+
	FKJNzLyfhgbVsMXX3gjar/Ty/U4FOKwvj63z1sUG4Oj5vLgHcJ3C6fYAhjBKh+E0DR+2XifycZI+y
	RyDXUlpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO7xb-005x60-25;
	Tue, 25 Jul 2023 02:39:39 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO7xV-005x2o-04;
	Tue, 25 Jul 2023 02:39:37 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-63cf7cce5fbso16678926d6.0;
        Mon, 24 Jul 2023 19:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690252770; x=1690857570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJ6MWJZ0PC07PoDab55truxx6wk6LB1vHJirFaivjEk=;
        b=k1SaRf9xDpelbVpuB1CI1Ozbc0EYvC+4BU5dF8fyOwbC6a/BzeldZ/EkvTm4nnpmfb
         qUabCzAN4YhhBChgnnwMf0YQy2mFnA9N5Zp9nCTD4odeF8woCmLEzNkIbJrTGIZmpoJx
         9BW+03UVwscMoyMpMt5LW8/rDuoknO0jVY9+BtUw4/vpJv48QRcECjt0d/1KWpx3dzg2
         ChpDvCFI4cV20+a9POXDVdo8WypdtqXjJhu1JH06C9nsOj5dGNXUKT25OEfWcVYcjwSn
         6olUhTkw9ER9gXJlh3x+TSJlq1Xt8v9DIPsWRd7mnI/Eyrhttek8upHui+Q/lQplCVQr
         JYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690252770; x=1690857570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJ6MWJZ0PC07PoDab55truxx6wk6LB1vHJirFaivjEk=;
        b=Nc0pU+g5F/WkqwFD1Z+LeZRE49P1WQ5cqfnvACUY82HcpjHSqNpVcIW37pJMEh00GR
         PzICIQic4j/BSX+1x2/n+9blerFIbfpfWrHmMN3fPSe4c1V9kO/CcypIh8FzYMOdJgTq
         Hp1ekxlDa5HKeJEFXu6LzYV6SKegFwA7boBEAEfhvu+GM5bV6Rm4m+SRPvRahRbIc++J
         yrAJZ8FW1vZ8yATZ7oQklXpFxyJef+NzsS0L704oIRh2ePPQ51npdFDJ+yUdBjYBNU4i
         EI4Blvha+dYlOtIAFaS/J7WJ0Se03B7IUdXUTMxyZIqgsmMmR+TJKpDeEQIBBbhgBz6B
         csiA==
X-Gm-Message-State: ABy/qLZAuHCs3o6xptG2qCq4CQWxW5CDeJKJPKt9aor9KNbYhEkFWp4b
	alS5MR8JDHIi5NCihVd1c3CfxRDJEfMs+7l4/NE=
X-Google-Smtp-Source: APBJJlGbzCceXXZGYpzojvXa7GlTxNMmTvGIq5seI5fTYefVBMGEt+6FlhhSnc7yH3p4aMv4UA53vftYGs+9Xk+o4dg=
X-Received: by 2002:a05:620a:444c:b0:765:6584:b033 with SMTP id
 w12-20020a05620a444c00b007656584b033mr2041395qkp.50.1690252770283; Mon, 24
 Jul 2023 19:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230707092414.866760-1-zyytlz.wz@163.com> <03449762-33b9-3e86-c65f-4bb9e0e917c6@collabora.com>
In-Reply-To: <03449762-33b9-3e86-c65f-4bb9e0e917c6@collabora.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Tue, 25 Jul 2023 10:39:17 +0800
Message-ID: <CAJedcCxG+LC1M1LiQOL33DB+fsZ_2ancQP+kMXAbOd6+1o6umA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] media: mtk-jpeg: Fix use after free bug due to
 uncanceled work
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Zheng Wang <zyytlz.wz@163.com>, Kyrie.Wu@mediatek.com, bin.liu@mediatek.com, 
	mchehab@kernel.org, matthias.bgg@gmail.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Irui.Wang@mediatek.com, 
	security@kernel.org, 1395428693sheep@gmail.com, alex000young@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_193933_071177_3A3E3FD3 
X-CRM114-Status: GOOD (  12.96  )
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

Hello,

Is there any follow-up about this issue?

Thanks,
Zheng

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
=E4=BA=8E2023=E5=B9=B47=E6=9C=8820=E6=97=A5=E5=91=A8=E5=9B=9B 15:45=E5=86=
=99=E9=81=93=EF=BC=9A
>
> Il 07/07/23 11:24, Zheng Wang ha scritto:
> > In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
> > mtk_jpeg_job_timeout_work. Then mtk_jpeg_dec_device_run
> > and mtk_jpeg_enc_device_run may be called to start the
> > work.
> > If we remove the module which will call mtk_jpeg_remove
> > to make cleanup, there may be a unfinished work. The
> > possible sequence is as follows, which will cause a
> > typical UAF bug.
> >
> > Fix it by canceling the work before cleanup in the mtk_jpeg_remove
> >
> > CPU0                  CPU1
> >
> >                      |mtk_jpeg_job_timeout_work
> > mtk_jpeg_remove     |
> >    v4l2_m2m_release  |
> >      kfree(m2m_dev); |
> >                      |
> >                      | v4l2_m2m_get_curr_priv
> >                      |   m2m_dev->curr_ctx //use
> > Fixes: b2f0d2724ba4 ("[media] vcodec: mediatek: Add Mediatek JPEG Decod=
er Driver")
> > Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>
>

