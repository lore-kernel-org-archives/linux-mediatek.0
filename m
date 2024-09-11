Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22614EE0211
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 06:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oW66k3+QWZlMy+jN8zb3h81JKhTcgu/ndVePWG3x0Nk=; b=FdxXg/UA1FpbEjERDZhEeuo1U1
	Zn4uzCYv8XvOpz6LQJ/yDXZxxrTqUm//s8ndhEFvV6bajhHbkAGnutxEvJ5xDtfNSPGpv/KJr/JAn
	xA6QDIEXJuIqck9iHTyQhBTkPaysFMsNxOo2R6v6DGpSbI82tqzkx1tVM/D8dy7onR4tJy96C74wm
	/jXy2TpSvXyf0jHNqw0cBQksuNJhhZ0F6l3WLNefi8SAw5dL074R+oH8YDkUBxmEqTCPdyYO9/qzS
	oKPmU0EkOCgJ8OfYwMM/C8igPqsV0QQRWOjcfmKmE++mW8ul1DhZawvloejK+U4ijhb1JwH4ppbR0
	M3vzzgYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soGrK-00000008HMh-2ngN;
	Wed, 11 Sep 2024 06:29:46 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soGrH-00000008HLp-3eF6
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 06:29:45 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-846d74770a4so1405199241.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Sep 2024 23:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726036182; x=1726640982; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oW66k3+QWZlMy+jN8zb3h81JKhTcgu/ndVePWG3x0Nk=;
        b=KXb2B447EXtqkRbq1mEKRK8+1nafc7URqRG3hjySeZUzcup3yb1cj7a/PQHkFAQiKK
         tx3u0C6YpfSNF32/6O2ubey/ONHAKxRe8Y1sqF5pAjT0g6A2LbO0Tl74GaiguzAgXxai
         8LoBuAI5T8dIpAHV9eezTFpCv2t2GgJA9AngQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726036182; x=1726640982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oW66k3+QWZlMy+jN8zb3h81JKhTcgu/ndVePWG3x0Nk=;
        b=vpb/No5vuOjJOC07fez2P1yajMQfK+yAt8W2wVriBR+tvapZAQPxv+J4krPLpzRWKW
         tYKG5bo9WBcMPytZo8nyjGbCIJoMawglkcLEVRnvHU40vTJwEIjCYdaPLus6DdDz3Jx4
         pllWz3ASK3xVAh5HqCHvIaDqQY3xQ7Drvp+9BpaerR+njIwzo0cffhX4sorTNYHGHmtK
         GUweGLP5Xse8VU1qVyMibrVqPp8VXn2bfjW5/l6JPFO8cI1OA8IYvFvhTc5DcQguhG3r
         acmu6K53Telqxx1SvAXipjoFEJUaZ9ZPIduJ2nwl46KT6w4cDcCXiA03UNWaPfiUKctR
         ahxw==
X-Forwarded-Encrypted: i=1; AJvYcCXfolnlSCXwF0CC8EZ9Ic6fGipNDooRVuIM+NgcOXv9M61m6fw7cR4PjE6AW7st6zvxi/3D+igkkZSd8qtC7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAXNYVdKVA7+xTc+sYyCzxdjgYjbKrNoCYCzLRPWsXaAUps19t
	VFRVt5SeKOJxhKiKfmpOgWDzpczMcmmr8RYOYiUkd3vaKM2cD2ksy5kGy2BWAgWsxDGSvjsJ7Sw
	=
X-Google-Smtp-Source: AGHT+IHoNzXnka6n7HrHDhZUnrSX/6nm8bq4TaFvzaqqdKNAVQgKObC+vzMkM6hEarXHDmsMQjmrMw==
X-Received: by 2002:a05:6122:2a12:b0:4eb:499a:2453 with SMTP id 71dfb90a1353d-502143ca0bamr12799417e0c.8.1726036181594;
        Tue, 10 Sep 2024 23:29:41 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-502f9ac0caasm392912e0c.33.2024.09.10.23.29.40
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 23:29:40 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-502b408a381so1171578e0c.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Sep 2024 23:29:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUARnrg1DgT+0Vz4QaqDwhQQnHOLpQD4hIN2R23BqGBcJG1wJ9T8Qx/QCvVwSmjYiH/fnkrDqZPFb22uOEqjQ==@lists.infradead.org
X-Received: by 2002:a05:6122:90b:b0:4f5:202b:6220 with SMTP id
 71dfb90a1353d-501e7798358mr12652144e0c.0.1726036180309; Tue, 10 Sep 2024
 23:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240521095536.3869399-1-fshao@chromium.org> <9f73dffc48394e6304263ac2293a2b18864ae3dd.camel@collabora.com>
 <CAC=S1njnqrdrQqJZYQ7mffgmAUUxtoO7utZumED0dmX=Fa9+Qw@mail.gmail.com> <20240822142403.qz3ia26at3rxob2v@basti-XPS-13-9310>
In-Reply-To: <20240822142403.qz3ia26at3rxob2v@basti-XPS-13-9310>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 11 Sep 2024 14:29:02 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngw0h9=i_sH8BvUqi8hTt1JgyvO6Epq9jA2D_WmqRLQeg@mail.gmail.com>
Message-ID: <CAC=S1ngw0h9=i_sH8BvUqi8hTt1JgyvO6Epq9jA2D_WmqRLQeg@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Reduce msg queue trans buffer size
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_232943_944455_202C6CB3 
X-CRM114-Status: UNSURE (   8.83  )
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

Hi Sebastian,

On Thu, Aug 22, 2024 at 10:24=E2=80=AFPM Sebastian Fricke
<sebastian.fricke@collabora.com> wrote:
> So are you going to send a new version for this?

Sorry for the delayed response.

Not likely in a short period. I haven't had a more detailed discussion
with MediaTek about their buffer requirements on this.
I'll resend a new version after I have a better picture of a more
dynamic implementation based on the resolution size.
Feel free to archive or ignore this patch as needed.

Thanks,
Fei

