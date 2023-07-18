Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B1FEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZR7e5E+WmOjH4SVZ3PNZKQQ2pHiOOZ9mhP0U68A34Cw=; b=bWKzoZbAc0paFA6s2KhduqsGyv
	KPGD//GFCKC4xZXRDM/4oRhvcm7v0jM51HINWWSPiwF/ZUdpaFrQiafLRNkvP0rG4cvANxMnPVdZb
	D6aZZvIwDKztx5a1b3xNngBYwwyupu/xj90fOYxGzWRUJ8Ja4wiJK4pDQdFRtveSoTaUi6/694sR8
	jNew/6RbM8hkpZ3kywhMuQnuuDIlbcwly0SND0hmJDBB0BSl6074bGx4cAwlVN+L04/zUojQ9LO8X
	2wrfcYKWIj+XToByXibobpP3cSI+n2Af17hL8aFUCOm8ELgTPD6hcCTYs+0aDGaTYE9VYbnqMsnS2
	lvQpAHiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM00x-005PVs-14;
	Wed, 19 Jul 2023 05:46:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM00t-005PUW-2r;
	Wed, 19 Jul 2023 05:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZR7e5E+WmOjH4SVZ3PNZKQQ2pHiOOZ9mhP0U68A34Cw=; b=DcTscu70x/RfANiO+f614OXlUu
	0sxqAHfbkJyFB4qPYTtwBOoHnNN2BrQcOjnQs9S8ZJBpFeM6+Z1IEY00Ek6IkAkMsduZDIpZE8ZPO
	qiS6HaPbCSRVL4zAx2YVv7FkyqCZlsrdrmL8C2Xsy+BmRVPgp4XwMkrL26/jI/aQ7Zf+HAaZZK96z
	m9zpXJG8ZkmC0sNDceyyFq0izqgfZ3f1MTV1zGGm0hMkmNvGKPzXpdGSWMKJyZx03RLNU8I8392Z+
	jxUlJDtR06XE1sN5O70IpT5KnC2eKERGdUAICgp0ilmohAdk8Vv9UHjgoHizIdlAr3P3J1aJ+OvTz
	cOc3HCdg==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLb5R-009i7y-24;
	Tue, 18 Jul 2023 03:09:20 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2674d0e10c4so2753353a91.3;
        Mon, 17 Jul 2023 20:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689649632; x=1692241632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZR7e5E+WmOjH4SVZ3PNZKQQ2pHiOOZ9mhP0U68A34Cw=;
        b=HUHR94cp0/UyIKqtiyeZR237f5pSW8N8ZgQeHBP69YoNqbDBpIRRspMez7/dR1nSbA
         D5qJU15tV4LQDuoPeHx89HfUhOvGAvlGJvcEcI929f/Hf7zgzkNWNFGMJzI29PCKoWFZ
         Q+Q+KjcYKiZkXEef/XVx+m7w17eXuuo5Im6eQtys0XDz671hCNxckfAIvKtd6bREZzaX
         Vg647wlCoZixVN3W6uwFW4cQrqIaj69+VKx37sM9j6spDuWw3n53TOCC4UA9YYQJFCwe
         i3LRzJd25ksEZlUmDvDuAD5KJBQn6mWePTI/l+yd0/W8dWubcXYiqlxiqDSzu7zEnaUw
         Hk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689649632; x=1692241632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZR7e5E+WmOjH4SVZ3PNZKQQ2pHiOOZ9mhP0U68A34Cw=;
        b=TRqcySOWn6HDFYcdNDe5BFVuSB+SeUqUriMGoOlGAV83//gUlcxUSrAtH+oc7HaMo3
         8TWa9J4HXMTMc4l31fYfiOehwkerVTpV0pWKY+a2GibKcY+4tkHBWtxa4vF8Va3koJta
         wcyfs8GCYt5AISVydMy8MA7r1cnBFPf7HIYxsTKHFEhdG3EJYWfbL7k8H/YhEXZn/ivU
         InecwdeKMvAGsuMSWV1CGqvtLw44iw9xTfS4HJigY6GMsKUYjbtoIrYBmqYUFiXvj7Lm
         woT0XA5xFBKBP4GUwze/PJjPsiTL5fDo6OUVI6oQgLiEaBG2+P5PFNiV1tc6J1AkmATZ
         Ujkg==
X-Gm-Message-State: ABy/qLY96AoSMX60NsYgYZmDkhBmAoFtP6dNCF3xNPgyROQPSGWxzY1A
	JCT2STwjMoz0Bkn3sZCw6Wm5xKlqAOROa59vFnc=
X-Google-Smtp-Source: APBJJlEIXk60X1gz7KXtucZl+go0i+pO9jKQGEd+WuXxiukOtcA+L0Dmx90vVupkDTpQaP2XilHviR9/o2lJNd7yl9A=
X-Received: by 2002:a17:90a:fb83:b0:263:f3ad:64af with SMTP id
 cp3-20020a17090afb8300b00263f3ad64afmr10685369pjb.45.1689649632428; Mon, 17
 Jul 2023 20:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230707092414.866760-1-zyytlz.wz@163.com> <538096d2-7b24-e1c7-706d-4d4f952d35eb@baylibre.com>
 <CAJedcCzR6DzX_aG1KBgrMHDJ1xh=RTA-FrZ+TJ_4KawWpHyYuA@mail.gmail.com>
In-Reply-To: <CAJedcCzR6DzX_aG1KBgrMHDJ1xh=RTA-FrZ+TJ_4KawWpHyYuA@mail.gmail.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Tue, 18 Jul 2023 11:07:01 +0800
Message-ID: <CAJedcCyKv-hdDhWcogDZrC-kY6qtO-H1fDYqjTXMJvCR19MxYg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] media: mtk-jpeg: Fix use after free bug due to
 uncanceled work
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Zheng Wang <zyytlz.wz@163.com>, Kyrie.Wu@mediatek.com, bin.liu@mediatek.com, 
	mchehab@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Irui.Wang@mediatek.com, 
	security@kernel.org, 1395428693sheep@gmail.com, alex000young@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_040918_213760_E8E65A4F 
X-CRM114-Status: GOOD (  15.48  )
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

Friendly ping

Zheng Hacker <hackerzheng666@gmail.com> =E4=BA=8E2023=E5=B9=B47=E6=9C=8816=
=E6=97=A5=E5=91=A8=E6=97=A5 00:08=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> This issue has not been resolved for a long time. Is there anyone who can=
 help?
>
> Best regards,
> Zheng
>
> Alexandre Mergnat <amergnat@baylibre.com> =E4=BA=8E2023=E5=B9=B47=E6=9C=
=887=E6=97=A5=E5=91=A8=E4=BA=94 22:11=E5=86=99=E9=81=93=EF=BC=9A
> >
> >
> >
> > On 07/07/2023 11:24, Zheng Wang wrote:
> > > In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
> > > mtk_jpeg_job_timeout_work. Then mtk_jpeg_dec_device_run
> > > and mtk_jpeg_enc_device_run may be called to start the
> > > work.
> > > If we remove the module which will call mtk_jpeg_remove
> > > to make cleanup, there may be a unfinished work. The
> > > possible sequence is as follows, which will cause a
> > > typical UAF bug.
> > >
> > > Fix it by canceling the work before cleanup in the mtk_jpeg_remove
> > >
> > > CPU0                  CPU1
> > >
> > >                      |mtk_jpeg_job_timeout_work
> > > mtk_jpeg_remove     |
> > >    v4l2_m2m_release  |
> > >      kfree(m2m_dev); |
> > >                      |
> > >                      | v4l2_m2m_get_curr_priv
> > >                      |   m2m_dev->curr_ctx //use
> >
> > Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> >
> > --
> > Regards,
> > Alexandre

