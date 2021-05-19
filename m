Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F98AC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 00:10:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 127A661364
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 00:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 127A661364
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zcf/Cl6044VAAP0ZA86C/jLbtjrZpethF+1pzpfyuCM=; b=oVFrJzFqWMyhnOdAwoxs5qCzW
	uRLfj8aGxlqUfwiMkjSs6f531YdW15ulhUOwAP14TWwCA906N4HVUWWKMEMqSrC/nLOZbZTZvwhNs
	ZFu0+aPGXhZNjxpUSWTiwny0b8Iev5dbwY74MKqh2+OzD1N4jWoQ2zU0Jf0De2P9MHKSFcRnM41HI
	W7VMLYXoSLZKP/pL5CkseyyDrF/9ZELstYPonDLgGP/0JB9cmPBSmAssF4vTSOm3Fc4w3SN+wsMvy
	nUvD2k53md5WjaOW7zz1KIQ84euPw69OrcQlU/pMiW3vok2kaZyJTkKTeopgSsKp+eqpYvT5OPeSb
	cX1x/vXhA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj9mn-002EbV-4t; Wed, 19 May 2021 00:10:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj9mj-002EaU-Q5
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 00:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OuTM33XGtLwqa8MYciwrkAYfeQ5kekKTaJ8lI00J+rs=; b=bxG0WR97t1sARHSB6rrCkQm4ZB
 nu9g3oM+8A+tcMI6maL++pE5Kpu5TsWctYGGbQNLD/U1dlPzkF1fFYVKwS6dQd13xjPWVV7aBpVWq
 9T7xmJhXoRbgmAkxHzfIJs7ml093oB8OLFO0QjcHdInynJsvbg9aEmmny3xm+zbWM+jGMECO6Rzo5
 NWll+EuRnQFeypup72dD1hUX0qWmGU1lhk5jVap03XkVUiM6N0oCbwt5KdTPbO4ZLxL76VZPozPv2
 R0pDU549WW5W7kJxMuDgw4exkXrwWVyZRQ+CeK3hVTvUhrt2QmHReLl9WZ3lFeU3XkFNxT4hG84Dz
 YM2pHzfQ==;
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj9mh-00F2OQ-1h
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 00:10:00 +0000
Received: by mail-lf1-x136.google.com with SMTP id a2so16318356lfc.9
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 17:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OuTM33XGtLwqa8MYciwrkAYfeQ5kekKTaJ8lI00J+rs=;
 b=h8O4DrZRkEIKrl/XUr78Ts7Z+5uTUkSBm2b+5q8n1o1rP5eMEsqe3JLY0RoalrthmN
 hFx904A+BhryeG5r014WnM3Ppb3ppkCbzLzH2yCCxevVIGIPrbxabKc4WEHvr1hDjdWq
 L/LVrgMDOlTc5LLNV02Y5nFswYHoZ5VQBrw1jc/Tr9If50zwJx+P5Y1yCzBki5O9QmoV
 jpsuQe/Le47+ZzAJ/OtWbMAAmrQXUAz2S+vcQfsEzEf0wfD0P5OU6toS75gEFj6v1Ew9
 9iBMry8hXEIvXdyzwh28L1Lk442e7oC4GWrHMsdBUKtvG15pRphJ+Qpmq6lB9ynjNzuZ
 ZBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OuTM33XGtLwqa8MYciwrkAYfeQ5kekKTaJ8lI00J+rs=;
 b=BymQdco05tv0CABfCCbN4N0hYUdJqE09zfeHuNG43+QYCDFYC1wI4zSspvG0Jg1Fst
 WtX2VVOztv/aBhG/1Ol7W0lm7fG0h2S5uizW0JcwCb6WZgEIqxmjfaytdnrm3Yezqwm/
 kRb0tpUAmlV52B9ULf9GEwMjfHhfmtifA2NYkM25GkDir2g33cwU8SxhWHgeZKHK6j98
 UDp10RKr0oHqd0/LUfMCD5EQ6KhkzZeLq/ZxcdbYBVJfE28Acj/SexoqkVYZxTp6HQNg
 bk/ezFC8bA/Y4JMAtLvQfOdjTOFhBl6GgZNnJzCtUEYY/ymvqVE8PvhOl8Y5mUSqBUhm
 NwkQ==
X-Gm-Message-State: AOAM5318ep28ArnFlorDrGVll9XTFvsNRQdPKmAr5h1IMLxZMJQYLAhL
 +VDwd2fMcrZ+FzUqkNF/Gr5TUDSOVngwiYGat84gpg==
X-Google-Smtp-Source: ABdhPJzXvwNyBIFBAGkgV+vqz4OfOm7bjiZHvKaE/3qxTD4SKunmkPBqDuIYym7TgM9jIoYc0T7bA2xvseQYyURg98U=
X-Received: by 2002:a19:b0b:: with SMTP id 11mr5814348lfl.291.1621382997090;
 Tue, 18 May 2021 17:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210426024533.20840-1-zhiyong.tao@mediatek.com>
 <20210426024533.20840-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20210426024533.20840-2-zhiyong.tao@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 May 2021 02:09:45 +0200
Message-ID: <CACRpkdaLhR9HgYNPZ_SQ-wi7RfpeT7iapXUfqf=bAwo05MBZqA@mail.gmail.com>
Subject: Re: [PATCH v7] pinctrl: mediatek: add rsel setting on MT8195
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 srv_heupstream@mediatek.com, hui.liu@mediatek.com, 
 huang eddie <eddie.huang@mediatek.com>, Biao Huang <biao.huang@mediatek.com>, 
 Hongzhou Yang <hongzhou.yang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_170959_211906_57E8FFB8 
X-CRM114-Status: GOOD (  10.87  )
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

On Mon, Apr 26, 2021 at 4:45 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> This patch provides rsel setting on MT8195.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

I am suspicious about this patch, sorry for taking so long to answer.

First explain what "rsel" means, because with no explanation I
suspect it means "rail select" which is what we already have the
existing generic property PIN_CONFIG_POWER_SOURCE
and power-source = <> in DT for.

Also add the custom properties to:
Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
(separate patch)

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
