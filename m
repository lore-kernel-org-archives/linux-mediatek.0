Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 124B6C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 15:49:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB6DC64F18
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 15:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB6DC64F18
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xJZs80dbWMYGLf7NsynW1rQ+4z3s0HS9MeJUiksbRVU=; b=yjAtD8qmkN3L3kYHl/oBReSlc
	rzbO+Bzgqb125CUFFwoGzVhucOx8OJCbv34a3d4Ks1pCi+C+EVSb5lLLg4/HNeV4JxgRsvPQOdP7F
	psAbyy+sSnnGVE9CoE8QkNgEseLC2yKuUOIx7JRwib7+UctO2jA+6Gg8PO06mySCD/QDFlW1628HS
	fBmuTqVaBnqXjpIgOB1ulKWZni4AwyhCHGljl0gLZPzJzoBctXnEsB6S40AN9RKLW4yzbvxSmXrDc
	MqRINgvICvft8CCrIG4FoLsSZi/AgHLWzKk1lzOPkeYBMaVoHcRi5fKpoy1+w81dB7665VLJo5hrq
	NWmen/3mQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFIsm-0001TC-Ap; Thu, 25 Feb 2021 15:48:52 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFIsi-0001SP-R7; Thu, 25 Feb 2021 15:48:49 +0000
Received: by mail-io1-xd2a.google.com with SMTP id g27so4964885iox.2;
 Thu, 25 Feb 2021 07:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YiZfrscp4TeShL/P0jNh96lAxTY6sCZno4Gtn9oFuCs=;
 b=G98xRZBUXH/GpcJm9J6q7x+cXoI1UZ5g0UpYWuXINQe5wDhycNKDJxTTOxeDk7gnkt
 K6+ds/zOuKOwTIyV6OWNSgjFmskukuysxS0C97W82yYWFd3kIq+6dilxAZgXZFpOdLGp
 ONVOADx9i3Nj17CGUHjuPOb4gHWJkoLgWzYe4Nwm71MwZm/FBdPiRX02SbwBv2r31LdQ
 DfedI96IxdLtoQdHvSc7aXofJsFfBkNlg2bknoEh2u78oZvRyVjaxpSQ3/DOyXhp09nA
 K/CEcY6Gb2+zBkVA6l3DxX7do6y0dBuwrn1xpWYKMxzeXjqKvCTmD0yfzUg/yyeECNJH
 W95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YiZfrscp4TeShL/P0jNh96lAxTY6sCZno4Gtn9oFuCs=;
 b=bvuEfWQGAVF00zU2pmVd4kmUxYm6Wx8YY8bRy6yaug4yZvdCqxEn2COR6uxvKwGNVn
 HnI88Uo4GklFbqg2XubICsw+Z1lB6BLnEL62xnvulDxPNQU20SEtJBxBJ8Br1p2zG4Nb
 rvN9gS5k/z9pPy0g6BTtH7uMNoOFi7GRFO6R3Ev7ddxNvb+uvPrdYOrK5TWVH0bZmWqf
 HgVe2f0xSS/TvFj1N1ORWeNxwi2Yhohl33T48+IrtqNUovLOYiiS8lh/8p5t4OJKXQEg
 d/RJhkzgOVNkAyMAlQnZ5rkPa2wwHPk8c1vjH0v3HPZxsFyF116ZN+sUwnhZsHY+Lw3L
 ujTg==
X-Gm-Message-State: AOAM530m+g8X045mgZCslAF9Y8JLpU3LzTYC08ouDOMIKIDOKD4OKfHY
 0WqDxagZjbQ4xxMWiXAKnSs0tD8r37Lomoi4bFs=
X-Google-Smtp-Source: ABdhPJxxNqiwP59Zsi4jesv4rQhdFkIarNYiAZNjk+Zu4RFwNYFu+iQwu+0uD1Yfu/rsCjWfy1WkI0MGp9zKcdnqxcA=
X-Received: by 2002:a02:3846:: with SMTP id v6mr3899033jae.7.1614268125483;
 Thu, 25 Feb 2021 07:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20210224081018.24719-1-dqfext@gmail.com>
 <20210224084226.idtvqtdpl5vbstup@skbuf>
In-Reply-To: <20210224084226.idtvqtdpl5vbstup@skbuf>
From: DENG Qingfang <dqfext@gmail.com>
Date: Thu, 25 Feb 2021 23:48:36 +0800
Message-ID: <CALW65jbCtf6PMHwuEzxqaKz55SJDzQbsu75nWOs+rPX-PXwOug@mail.gmail.com>
Subject: Re: [RFC net-next] net: dsa: mt7530: support MDB and bridge flag
 operations
To: Vladimir Oltean <olteanv@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_104848_916380_DFE3F9A5 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 Frank Wunderlich <frank-w@public-files.de>, netdev <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Vladimir,

On Wed, Feb 24, 2021 at 4:42 PM Vladimir Oltean <olteanv@gmail.com> wrote:
>
> I think the comment is incorrect and this _enables_ flooding (which btw
> is ok until we get the address filtering thing sorted out).

The initial value of these FFP fields is all 1's (0xFF). Writing the
CPU port bit here will clear the other (user ports).

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
