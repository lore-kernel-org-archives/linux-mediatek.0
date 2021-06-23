Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42609C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 03:17:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE3FE6135A
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 03:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE3FE6135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPg8wXEjG4V7QxZ8WfeV4EqHv95vZsqLAsmShqMdhVk=; b=giZy0cQ+cyuFPV
	YSBhpVVok4BHxlTmwSLnyVS/w+kViWS0BByPbkGNzBKkHqqZAd8v6E7hzZ4sJE4GIyxHKGu0zmMWJ
	cY763I53+cP10Ib7JvMDm6/sxGq1086CdldQ25Q0tnQ2SMPesTH0EqO/wCStYwE06MHp2pPOWzWFy
	TrnZ/e3gar+6UxR4xn6EAweGT8Tj5UEv3mSxws8QrsgVXFCA+S7CuEzdRxWE2+OZNGl8hpRbS5mx0
	9LLAcid6iwDaVc6DS9NX6rT2R9bw/Q3kvvCxELZ0RuBNSSPN2+Jqv7RjKO43H6jqdKtz1jLNlkNOt
	80TgvEvx1oiW/HtGCMKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvtO4-0097x1-1r; Wed, 23 Jun 2021 03:17:12 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvtNl-0097uO-Qz
 for linux-mediatek@lists.infradead.org; Wed, 23 Jun 2021 03:16:55 +0000
Received: by mail-il1-x12e.google.com with SMTP id a11so1233056ilf.2
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Jun 2021 20:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gwyk7uli6oIz3rIWuS93ZiR/95eoNtAhejgjw8V2c7g=;
 b=avVKkKEQPXbX8szL6W+xHS+ytLCq2BWNqxMK9GEjcewzrreXGygKiJm008njmzuq65
 +SWBWp0oNN2jRB6aWjUJqcfuDXId0DEEV3xib0KEeE062n2iE3HNC+mFky2wDt54VNFL
 7rAnRH+0GILJJWCzxRk+sa6IYtUe3G8/ZGBZSXTUhUnRwuUjKVyQXyK13Te4BysOSy2Y
 B/HOnLH1aitT9UMUwhF2OPwwdIHrQFvesSrnHPz3noinYhvvJfqINRTYbq9l0X8COuSl
 549txwfUsNnTU8ZusF2GaQnQjAsgVwYxLt/h9mbhikUtKQjYpOc1TewyHWX7HmaYoVCR
 SLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gwyk7uli6oIz3rIWuS93ZiR/95eoNtAhejgjw8V2c7g=;
 b=LHxYWGf92yJsBKxi/+2tlNHHyhM2CYdKb5UmU5fbbUo1FTukB/Jy7kAlwO4/ud2wue
 cOqYwD9RPVIpwstvK5g0TGXqwvQPDYJ2msX8woipQYSJbcrkeG929qfRy2PBWBp85cXb
 cBmzLdhsvqJ6YrRiFveGufFUuKiQLRX7KbqOWefR9kejyQXbfopElMn6PAzu5u0QqWYr
 J64kkhCd/GhxBcoYuEEU7EMC/c5tAbyUqQGsJtrG4J65WqpVA5oQ7iQKIJG7Cu+zc04K
 MhbZM+PvKWYyrUY35Pwn+5A87ttFbf/azSSn4SKfulP4n8dgKCzQVqIhfVtPKx0sdY3P
 d1ig==
X-Gm-Message-State: AOAM530RSOZcjQmqhSbxygAjS5novAIv8x/h3L8GvQHfFjZ86pgfx0wQ
 uQnXjsjf25iiNPpJ+UNtRoCdNqPNokqXuZgRy4s22A==
X-Google-Smtp-Source: ABdhPJwDUOZOr0sb7xGTIyDuC/tlmAEbEEUDUVcs8ySJRF91dcjveUjtvj2sMOPkvNe7zxFjvxgPTdywtnclmsqcv1Q=
X-Received: by 2002:a05:6e02:1be1:: with SMTP id
 y1mr1377528ilv.204.1624418212873; 
 Tue, 22 Jun 2021 20:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210622151734.29429-1-Christine.Zhu@mediatek.com>
In-Reply-To: <20210622151734.29429-1-Christine.Zhu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 23 Jun 2021 11:16:42 +0800
Message-ID: <CA+Px+wV7fZ_8-GfdjshKcBV+VaiFNxTq4dcKUK8EoHxzyuZVww@mail.gmail.com>
Subject: Re: [v2,0/3] watchdog: mt8195: add wdt support
To: Christine Zhu <christine.zhu@mediatek.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org, 
 matthias.bgg@gmail.com, srv_heupstream@mediatek.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, seiya.wang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_201653_939710_84E6D483 
X-CRM114-Status: UNSURE (   7.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 22, 2021 at 11:18 PM Christine Zhu
<Christine.Zhu@mediatek.com> wrote:
> christine.zhu (3):
>   dt-binding: mediatek: mt8195: update mtk-wdt document
>   dt-binding: reset: mt8195: add toprgu reset-controller head file
See [1] as a reference, "dt-bindings" is preferred.

>   watchdog: mediatek: mt8195: add wdt support
If the commit messages in the 3 patches are sentences, they should end
with a period (i.e. ".").

[1]: https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
