Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7677C77B78
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 14:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3xAax5UMMKBBrbDbSmOKKPeFKZ83BBHuKP/eeSu5p4=; b=ist3ITzR/nxAHjYaXlS5N6D2b5
	OKd3nbg8qSf5g1OPbxP4EzxC5LYXz685wmQBIAtTI0wWv/iYH++cJH5Oin0sKxZtih6q53GnGfYQZ
	AwctGsBVKaXckB/3Wp9SarFYHR6Q7qFaukOZbhEALraf9UJcqfjkUAwWn9QArAtDzFjh9QdZOehUF
	22GcEbM1HhZlVesdZ9yESmUzMGGGrhOkhVjagpXYxwzusaht+SJd4/6UivU9mxLNPlyqUdDZVrw+M
	hdXgpCxejydSGkO3j1RI1++UGtdxX/vMXcn30lwh9ITNL9oWSkDzts7HBEeaT+e/B8TJ+rb3iEvao
	n6zK+kog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puDlM-004rm8-0O;
	Wed, 03 May 2023 14:47:24 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puDlJ-004rlJ-3C;
	Wed, 03 May 2023 14:47:23 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4ec9c7c6986so6060954e87.0;
        Wed, 03 May 2023 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683125238; x=1685717238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3xAax5UMMKBBrbDbSmOKKPeFKZ83BBHuKP/eeSu5p4=;
        b=rkCbtRN1t07+/Mm/qp9LWT08mpQB23zqZwKxH/Jugd/NMBBtfp3x2iR88DiiT4MTau
         0hLjGt4gooDQzdKm/zMhrQOZmt3kYs5BJh/OpiH8gfeO9ZedFFpE6IQckWfdbSWH+MJf
         fa35lSUFY1CHzRfoZFZmGVxHsgF24HRkm69VfOYsOdnRxmJikPHeCfRHhZhTr+rHTGAd
         IrCrDkqqi/kFC+V4GhkpIEIMJiUr5KyQfTDoWnd4ATqB/+XK5Xf6u3dHkgW5FBnD2IDc
         FvfBa9HEGeJDQ1eu+X6q3cPFg1J0JDh1Jl85QNVwKUlnyJQl03KGvLy6eGElL8xrC0nD
         jvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683125238; x=1685717238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3xAax5UMMKBBrbDbSmOKKPeFKZ83BBHuKP/eeSu5p4=;
        b=CvlhcjsASVtQ9GEKz2fz3iFPRQ64r5FkZWMJvghnspUX9iUbol0JrvnE7JmWjvqQWC
         CW+2fj8iGGUl7g09Aht1ECGxzpN9C6JpGXKVegVAhZMa6gdbAnsJv1VLlesxPu6c0AyR
         t9hpxLQjmF7plefVUYNCX+FFyNxRLbg9TKlKqdaBkt7glSrd0uP0Ls5mTyqnkPfSJfLs
         sYDszI1MJi3X1qKHNatHXSwI3JkpUSl2m2XXJzAIqzYheJ7IO5jdT1ponAV7aRWB0hcT
         +xHwvZTQ83LGupAq3xQJf1HKSCxzS6Kk49S7OCDm5bW8m2j/1258AgOVYtW0i8i8J0It
         C2ZQ==
X-Gm-Message-State: AC+VfDwHewn4w/i2ICXnun0Hr6N5NdBPzA+d8+UILexl95IE0FaORMpY
	/INJrkaIQD++MRmZMtTCHF0RVXxta8GSx3VXsQ==
X-Google-Smtp-Source: ACHHUZ4wJk4FWZJ47z3eWowcIPsdV23tHhs0Q+a5X+3y6nD0P4oucFwMYwXky460hcvVU2vX04y8rfMGBaSfdbr64fM=
X-Received: by 2002:ac2:414a:0:b0:4ef:d41d:637 with SMTP id
 c10-20020ac2414a000000b004efd41d0637mr957607lfi.39.1683125238146; Wed, 03 May
 2023 07:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <68fce64f-4970-45f1-807e-6c0eecdfcdc2@kili.mountain>
In-Reply-To: <68fce64f-4970-45f1-807e-6c0eecdfcdc2@kili.mountain>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Wed, 3 May 2023 22:47:06 +0800
Message-ID: <CAGaU9a8eRPyMo9hUekiVL9ppZQspwsqk9RQTtmqHsTPBD7mcjA@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: ufs-mediatek: delete some dead code
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Stanley Chu <stanley.chu@mediatek.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-scsi@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_074722_054313_2567CEF0 
X-CRM114-Status: UNSURE (   8.27  )
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

Dan Carpenter <dan.carpenter@linaro.org> =E6=96=BC 2023=E5=B9=B45=E6=9C=883=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:41=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> There is already a test for "if (val =3D=3D state)" earlier so it's not
> possible here.  Delete the dead code.
>
> Fixes: 9006e3986f66 ("scsi: ufs-mediatek: Do not gate clocks if auto-hibe=
rn8 is not entered yet")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

