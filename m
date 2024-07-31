Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E487AC3DA64
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 13:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKzhOvv4Abaz8jSctlqaD1OdNMDkG+LKvEGdcxBnLFs=; b=u0ezxoWMywJbNArUWN+kijpMFh
	agMG7yYmYuOk4AGZs0wp14FTtg2i84rGYVvMFef+/GbLt3+9THrVhbBzKcgkAbH4D37m30O3nF3mK
	z9Rp2q8PqB/qQSPJkjDia19P2NUFjMIJvV8KWQb6QFqJabLT1JNF5aspEpz5c+JGLnl/D6k0LYGSs
	Bjv1nEIznhiJOBE+HAo+Y+/iOHeG975ne6OPbju7dOFqIzJ/O+FVojDfC8P0G5RG5DEUBSDDaGD4U
	qExVeBNCgG+nYRIMyMduLZ+plIOVGvnMFJTLjGoGxNt5N+24SiJzBgGw7v3F/TotsBxxILeBLf9uZ
	BONiBsGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ9T9-00000001JbN-0YAM;
	Wed, 31 Jul 2024 13:34:19 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ9T5-00000001JZk-1PF5
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jul 2024 13:34:17 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5a1c49632deso7931941a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Jul 2024 06:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722432853; x=1723037653; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKzhOvv4Abaz8jSctlqaD1OdNMDkG+LKvEGdcxBnLFs=;
        b=Djf9zWqErdlD73g3yCfJRARR5+HhCwi40qO5PX18ji7EhXfz8T2vQ/EHxLT9+Weps4
         yuOqOah1AkpIRl9YRJ6PVaTBwfaVaSvp8ntRz5tdj7EMLuJ6uyMyrV/i9YYye3UnL8cv
         xGAFrEs7XNKcMGo6vlTPyOjB8EU1u0uydlvjrEOLJcgV4gLpmR0ey8w/FVDgpR23+qBR
         QJpRVKdk5v4mBcgFSGGQN5t5T4qgKjdDJM0TUjefG1nZRBX04KKdJLemIyM8ONBWusHU
         ZocscpBg6zEaelYSdr+/yxnj3rht5kBA5KwR6DRfh65JM1BQNNEDZk8fhgTzd2rv5qkX
         WWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722432853; x=1723037653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKzhOvv4Abaz8jSctlqaD1OdNMDkG+LKvEGdcxBnLFs=;
        b=SjQA1C6VY37BdnW9/OWCM/TLS1QihU/NdVKtZMPMIXlH7xnZl9ek9/3yuRpOfFMbTA
         maMD9FO0LqcsNxUdP2pjDb5LwMhx4PSC0q5o5wXY7XhnRJZx6m+d3bb3yujadw7+UlNu
         GuIT59h2O1Nte/cf6lkZoSouFALB0vMcIPbsiHWrwuO9W0pqjVAcucgAoAV6jcByM+98
         fbYVYjzh6G70maWgpXZX1OKaslQYfI51j1XiUoN89Uj3KS0n+emQagSctY1AGBJeystN
         lwRgRJ7MGmJQeISuKHQxCMJtgO0+PQwGmQOdToWq6vZVQls+RJNdvyBLPs1WDMwhuqg/
         WRnA==
X-Forwarded-Encrypted: i=1; AJvYcCUirAMIl4s/7IM4gPR4CQMaz+XaKHELWv3KndcfFRtTEJZotbdrXy0FmK+jd5myVC0VKLmwtZmfZBKJew1dm44u/86pul69X5nNoE5hvENA84kZ
X-Gm-Message-State: AOJu0Yytu/vFyDr8V6A1cIhAvhoZyZeSoJLJOGAGMOxKVEKDn1wQwviX
	/1XRyaLbqNZsvdCFDAUAu6oGzzKChIakxLTZ5bY/I3941EHQt5l3L2brW3bZ7E4i5MU5fI2Pb7W
	xkuTWIscA+zTzfWUBMZPrRdu4sry3fACy/EMqyw==
X-Google-Smtp-Source: AGHT+IFHvxPdbTDsZZkkxlis80B3oC61RFhzRsWcsCjpR0wdyqzatcOGn114x/eJAhMWwICdWqSTklgUbqDvFUAd6CU=
X-Received: by 2002:a17:906:c10f:b0:a7a:bae8:f292 with SMTP id
 a640c23a62f3a-a7d40101a57mr1007576866b.41.1722432852685; Wed, 31 Jul 2024
 06:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-3-c374c9e0c672@baylibre.com> <20240730132931.GM1552@pendragon.ideasonboard.com>
In-Reply-To: <20240730132931.GM1552@pendragon.ideasonboard.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 31 Jul 2024 15:33:59 +0200
Message-ID: <CAEHHSvaiwBWnV+kmjNG=RzPk3W9Y25saNQv5-KiU8EtampUbZQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andy Hsieh <andy.hsieh@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Louis Kuo <louis.kuo@mediatek.com>, Florian Sylvestre <fsylvestre@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_063415_396852_8F07138B 
X-CRM114-Status: GOOD (  12.35  )
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

Le mar. 30 juil. 2024 =C3=A0 15:29, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> a =C3=A9crit :
[...]
> > +             mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0, D=
PHY_MODE, 0 /* 4D1C*/);
>
> As this is a V4L2 driver, I'm pretty sure someone will ask for
>
>                 mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0,
>                                   DPHY_MODE, 0 /* 4D1C*/);
>
> I wouldn't care too much about going slightly over 80 characters, but
> getting close to 100 where lines could be wrapped without hindering
> readability will likely upset some people. Same in other places where
> applicable.
>

Hi Laurent,

On an early version of this series, Angelo asked me to un-wrap lines
that can fit into 100 chars...
Both are fine for me, we just need to agree on something here ....

[...]
> > +     /* Configure timestamp */
> > +     writel(SENINF_TIMESTAMP_STEP, input->base + SENINF_TG1_TM_STP);
>
> Can we have a mtk_seninf_input_write(), the same way we have
> mtk_seninf_mux_write() ? Same for writes to priv->base below, with a
> mtk_seninf_write() inline function.
>

... and here :) In an early review Angelo also  asked me to remove
these accessors.

I can add them back and reduce line chars if needed.

Cheers
Julien

