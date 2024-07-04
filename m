Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F48C3271F
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 17:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9ZGDkNDaH5zEMSc1zQxlXWMpC2ttmRI/VlhJHn6Lgk=; b=DvUvGqg2XnBqp5FrpZQp5E8S1y
	2khPxEVb9b79Mo/YMtC5SzVixKp/4IoJeUp/hd8dbLQhB0r1Tjrszdw0W0QXqONyW+lp5BuFDZAmO
	qOT0DhPhKVZyo3L36qbGQa6xTwvlB+Kj9mRhCp080eqUEBrYG65E+5iQrq+yYslbUR+0/LlmlY2pU
	xVV4esiUg3LijnJFlZ8bbXl4pEVWiXHgv9kEvFOELy9uUJZwik1qEf4nzsLhFq0cRZLhc8e1vjFB4
	W8xhe3QajgrzOEvohixhDTNCsMvJe6s6Oj0UAO/+5qosqZhnqEuVhOQ//49IoSfoXPwnb4424C9mj
	FzsLZ8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQcv-0000000E509-2cgx;
	Thu, 04 Jul 2024 17:52:13 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQcg-0000000E4wV-3ur7;
	Thu, 04 Jul 2024 17:52:00 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-6515b824117so7822367b3.3;
        Thu, 04 Jul 2024 10:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720115517; x=1720720317; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q9ZGDkNDaH5zEMSc1zQxlXWMpC2ttmRI/VlhJHn6Lgk=;
        b=XxNz7VqW6mP51Y/l3fc63ShGhjGfFt4kHd0KypdC7StF/IddIsnXIGI2kndkVAlQfv
         ZIRJ6iBgLQj/I3tW4CEctRPlS4Z4d7aSk4HHPIPpZwaht2EGLJ8p4BSRKlU3relZ6cmj
         yNbMeA7R6MVHVSy71UN9iP2WOJtE9u/OOWZbyLozpvgd7uzaNMlHbHwf7kIWzw6dL8xu
         FyzoJSTrbA10Q8jbYAYB11POHeHkCr8c40HyqHqw8iQm32thsYlnSm4nL+BN9EUlw47H
         2RPe6xdgdlFwowqXGjuWzWhKcoYWXORfdm8fg30SSS88Jru7nJNzaCW1eUMypKqAnIQp
         legw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720115517; x=1720720317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9ZGDkNDaH5zEMSc1zQxlXWMpC2ttmRI/VlhJHn6Lgk=;
        b=UiczsUt4OM0ZfVOkH2+PyLP7ko5PO+I22s06OvG3PQeV9msfmPaBQUQmNzSo045BC4
         MDfDKa+7Ffg7TqAiFtCGWy3zOGYDAfcDI3kIb5zqBLptCcJm4ynNBUadP8jCt7y3W4Fg
         PbLRhm5K1WNkeyTWMdOLuJhRVJfkcJI0QvIdwFQNniF17HPGxXTrmtbn43otwYIQVxNK
         sKk7pCnEL16K6umMpfzAr1ovhdFIbgZhgWhhqMlcCQDKfgbQ8Cebhwm4uoAK6hYV5CVG
         aCktFHUUOpoU0MxisGoq/vHLG+/D0B3dCVRx+e3XiQgW2zl6SXoWeiH5xiasZBJzTIar
         zKhw==
X-Forwarded-Encrypted: i=1; AJvYcCVV+I5zkKQzXVqG6nH/+jvy2uLmZQWFqwjqVqX/4uX/34OD+4I936fgTs9729rBWRizRAChqq1/QeR8vw4+AkQQJLqOhzS8OvCF3WZ32OI83HZmXvI+LF6wsF1gey0JCEaDad+zYI41UdOrDM3OmgiSx5iny7G2MbQ=
X-Gm-Message-State: AOJu0Ywty2AODuBOKrr8KW+2bngIEf+jjlQS7po59REGMwLnW5OdD/jH
	+7V/qc2d5Y1Qf28Rf//Th3gHNEJVWvmSN3ojgTbnVvx3pUYpQw7ICpayC28amx2aSanR5DrimcY
	/t/vm9zfLyZFzclRs1ubHnwtHJg==
X-Google-Smtp-Source: AGHT+IFIAR8Jj6Yu1jYElOsdEpuLchqpXnHbG4ciCJ1Ndo9m2ANXqdWA7wPkeW8bfWX8rdNtiNiUj8+kRAEvcRzjLr4=
X-Received: by 2002:a05:690c:4513:b0:646:53ce:b365 with SMTP id
 00721157ae682-652d8039562mr27222577b3.42.1720115517284; Thu, 04 Jul 2024
 10:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <e3ece47323444631d6cb479f32af0dfd6d145be0.1720088047.git.daniel@makrotopia.org>
In-Reply-To: <e3ece47323444631d6cb479f32af0dfd6d145be0.1720088047.git.daniel@makrotopia.org>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Thu, 4 Jul 2024 18:51:46 +0100
Message-ID: <CALjTZvYxwte8yO57V_rxZdh-=J2cvf38xHx-7NcQzE6nVG+Y-w@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: implement
 .{get,set}_pauseparam ethtool ops
To: Daniel Golle <daniel@makrotopia.org>
Cc: John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_105158_993336_C01A57F3 
X-CRM114-Status: UNSURE (   8.65  )
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

Hi, Daniel,


On Thu, 4 Jul 2024 at 11:14, Daniel Golle <daniel@makrotopia.org> wrote:
>
> Implement operations to get and set flow-control link parameters.
> Both is done by simply calling phylink_ethtool_{get,set}_pauseparam().
> Fix whitespace in mtk_ethtool_ops while at it.

[patch snipped]

Working flawlessly on my Redmi AC2100. This is thus

Tested-by: Rui Salvaterra <rsalvaterra@gmail.com>


Thanks,

Rui

