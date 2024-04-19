Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D0DC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 19:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyMz+5agVBSVEi4Ga+1h11jGQlr5IOfzTQGb7A2+i6c=; b=KKPt3zoL9H1akF2q2AyvEb8UNG
	jeBya4Vr/dvsBWdO34uavEdjHhHsjR39U4qX2jY9bP7/xw3XAuRhPRyEpICixqXNF42Szx2GlKdyK
	7PS/so1XUx4jl/yDJV+gycXtEaqpn/kIjlB/2DwWtjE1R7NYd7OGepUpSmhCXwRsTDKsvTh3zoll2
	s6WBm0vd0r4EZxtIQ/GuWqFb4k9BHyKf/oRhMY0mf97PNNQJsFemFkunXbGInwg5WBHvewbfe1VYJ
	v1dhWB4bApVsJooYKe8c3l6uM+dfr5YvrMdqMeDw82hO/gA/DPzciaRy0EGxcWH72pwl1tkIWRJ70
	3GYZNewg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxu7m-00000006oRF-3nqp;
	Fri, 19 Apr 2024 19:42:18 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxu7j-00000006oQX-3wGm
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 19:42:17 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2db17e8767cso33765061fa.3
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 12:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713555732; x=1714160532; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyMz+5agVBSVEi4Ga+1h11jGQlr5IOfzTQGb7A2+i6c=;
        b=SbPE7XZPQQRIHj20znvs4xcWh/hNTN4hFvhcuNbanL7dZCWNZUs83YMphh3aH9ZkFV
         9WfTg7/h8MBD0MXJmnrBYLT915dJ26+jkIXW22KdGxLsvo3IwHl4ANHTRNyFi/+EXO8l
         0IizxUUrDhmnyUla+5a/MffPI5zog8cUFE0ZF705OUObdBUSXitkgpIN6eqRmoZoynSj
         sYm+xqgMLri6Q9eGrFOKmSEOSiuR7hw7r1d9EzSceHcjk7n/MBUU9M5G1l2Pd6v1SQGP
         Sdcxw8bTVYZApBbYsLKY0PJkod1fripEsUWY2q9C6HP2t7jeRUbmAVpBkX7EvKQVECYt
         tTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713555732; x=1714160532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyMz+5agVBSVEi4Ga+1h11jGQlr5IOfzTQGb7A2+i6c=;
        b=nZhzOEfM48zYvfTLtB624P8bGtOIkZr3x6xhujYj2KS/ZhM9NaxWRV1/99Q8hwIfTJ
         R/5kqLBfebuXg16UHGxZgHaMWT5ZqfRZpjmC0y725e07URyMUVp4jMqOv8azDTg2dlOb
         hCL/+oy/zZ6yQWk3Z9aGorLOdDbEgytc/KHaju+eP/9+cdUvFK8JvYb+rrXMkFoVP1jM
         1lvSr/RLIwNAP/v5JFsUJwOFbfxJRT8QmF3CvnxvjSjlXHZjK0gx86CAY2pZVUwyoZ2q
         5WhDdKuhhsf70fDwu2GrjBErgjlUrGzExkmxcRF28kcKvYTTab8JBosbW8FzlofSf9qV
         vimQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsNQRNaFFjECuU9GHbst2RTjfAygGXlg8Zcrueae8yr51xlj/W8B1JHjxPY6ZyVm91hcWaCk7f/0yMSNV8t6Pj0mn5qc78/rey3UaOcQZXusr8
X-Gm-Message-State: AOJu0Yyga7C4AoQ1kg22UMbgQy93mBqi4r8wlFtcA5yGpmvNu/GPB3ek
	PVZqRNgVEtSVqlmhezzNq5t1vZ/lTmHQ8AR2CNzoP+pMKn8UVeaHt5wTq7me0S2yiXQE9FxM/LG
	flQBGzhHxSPy53rwhRFkBfKXQ084=
X-Google-Smtp-Source: AGHT+IHLNy/Po1edLygtZJom4CsUlR5CbZo3KM1lH6iARm4i+Imm8HaxPbs6daWiXd49JGyav9kIvcytqWm3A2N6lPs=
X-Received: by 2002:a2e:bc19:0:b0:2da:6b4:8b16 with SMTP id
 b25-20020a2ebc19000000b002da06b48b16mr2152099ljf.29.1713555732487; Fri, 19
 Apr 2024 12:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <da0859c4b24d314d9ff38179c26a58ee7e3f16d6.1713395895.git.sean.wang@kernel.org>
 <cb593f2a-7dbe-44aa-b9ff-7fc57a4bd70a@web.de>
In-Reply-To: <cb593f2a-7dbe-44aa-b9ff-7fc57a4bd70a@web.de>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 19 Apr 2024 15:42:00 -0400
Message-ID: <CABBYNZL1=RyzuXcDpAwcXyOe_8Bh4gJtDzKdS55-3ZF4rZRj7A@mail.gmail.com>
Subject: Re: [PATCH RESEND] Bluetooth: btusb: medaitek: fix double free of skb
 in coredump
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org, 
	Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, 
	LKML <linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Chris Lu <chris.lu@mediatek.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Deren Wu <deren.wu@mediatek.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Manish Mandlik <mmandlik@google.com>, 
	Miao-chen Chou <mcchou@chromium.org>, Michael Sun <michaelfsun@google.com>, shawnku@google.com, 
	frankgor@google.com, jsiuda@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_124216_019833_9BED8CA0 
X-CRM114-Status: GOOD (  10.22  )
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

Hi Markus,

On Thu, Apr 18, 2024 at 5:40=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> > hci_devcd_append() would free the skb on error so the caller don't
> > have to free it again otherwise it would cause the double free of skb.
>
> I hope that a typo will be avoided in the subsystem specification
> for the final commit.

Are you talking about medaitek or is there another typo?


> Regards,
> Markus



--=20
Luiz Augusto von Dentz

