Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C024C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 13:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4cf7P5g/ToXabxEp86uR22p/8en79X4oLYC0l/gug80=; b=MwZose8L9uopLw
	m12riURD0nD5QEE3gmETIvbqsUAz/9QKP4A2otGKHoSn1dmmo863/yAOG7xv4wdZ5Hqy5IiuhsDCk
	qDvvXbT8tPFysmXvUinxndO+ECJe87S/Pmqj35fWiSDnqpNn5yxoEkjS+DwCrrxmEuHFlbjIfLDDQ
	2lL9Js64ZuvoASiBULm7KFrMej0UYvyVffB0o4cBo553Q0CkX/guSI3bF8sg+cFOuVVG9Tu44ATiU
	9PU2D0MCu/2VDDCo4cQjrmfZ5wGYMXS048UegxzAnNuPYOO5c6Wxa5Iab/7lZSiKdPfTf/7YXvHIH
	a1N+1jsc7Hk1EzJwpxKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkQJu-00BJ2C-KU; Fri, 29 Apr 2022 13:06:02 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkQJi-00BIzL-8y; Fri, 29 Apr 2022 13:05:51 +0000
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2f7d621d1caso84170407b3.11; 
 Fri, 29 Apr 2022 06:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h+Ch5FrsaH2wGj7krM14MGWI0na4ZGCNNKlBF0nMo54=;
 b=iULbLhZoU9Pl0qb1QjcJhvwJGcVVeHrTQCEoZyv5zz3YOIvDfPv4rAbRJVo+kEOwKM
 lNwcDXkrPrJabcmN0qQZ+woNEJsU5gOYCkUE9VUW14CMZPLpoGQsrG5qJV2XfoRG0/2p
 bOM9n96H7FvFGYx1dERd4vrBvH7L1NoYQyTFOHJ1x+cPCeTT6KJ6RD36ivLFGfoKcuyr
 ER0andT2ZySXczvvaWlMWrBLqHzVOqkqLX3dnCPb+hL/Nfrlv+GnFcZ0sjuKXRDIJMZY
 gU0g1UJkfiUAxPSZGUUEqsJOjxKwhIl0ZYDQTGDe62XVZFkilPXU2mExyc170VAvGbmp
 Df7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h+Ch5FrsaH2wGj7krM14MGWI0na4ZGCNNKlBF0nMo54=;
 b=ajVF50xFk5H4lqjxI0gMgal0XuiLSS8as7RmpTr9IkS72BtAQs4zOWNZuCfo6GF49R
 vLuHdnwijlNFBu3i3YZzrr2XIfn8N8KUoZP20O8eNmhGZG9OYYy9PoBuod8aiUa/bEGW
 /yae45vAXTtn5jOSRBeKFJ2MxX80yigqylIX76sdVQZ3ceOYok6+JsyIYcfHiiwFa2S1
 L+4szKUZYsyCNCibXLeC33aXVFlOi8K5q13slxjRhDzMyrzBEES+TWlHNJIDFV75JrWB
 9OYBoWibFFOBR+PQkcszQuDJrlOA0AWkNA/HTcyv6YomuEJMLDsDeoQt29brpswbon/j
 kUWw==
X-Gm-Message-State: AOAM530n9ikvNQfJGRAxAvl1qBA0gOJUIpZQJCK6zkPxz92V7qbO6eKe
 rMjMOzhaHHl/6nmDimag9L0OQhwgwOBZDV0b6Q==
X-Google-Smtp-Source: ABdhPJwhtwpU8LT9AahrofrKtL9DhX8YkmTeR4qVA2q0IBXfsK38afZHMnxzahiHpRCcR2V8Po7rHdQfccaLpNAKoTo=
X-Received: by 2002:a0d:e64e:0:b0:2f4:ddb9:b108 with SMTP id
 p75-20020a0de64e000000b002f4ddb9b108mr36140248ywe.245.1651237548529; Fri, 29
 Apr 2022 06:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220429084225.298213-1-rsalvaterra@gmail.com>
 <91d8eb87-adf0-da62-0c7b-dbf94442f535@gmail.com>
In-Reply-To: <91d8eb87-adf0-da62-0c7b-dbf94442f535@gmail.com>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Fri, 29 Apr 2022 14:05:37 +0100
Message-ID: <CALjTZvYdvGrfjTWaP=LjX0UGJPJVxuF9RtgbneDwu7KCnSdtJg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt7622: specify the number of DMA requests
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, daniel@makrotopia.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_060550_353364_FCC797D2 
X-CRM114-Status: UNSURE (   7.31  )
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

Hi, Matthias,

On Fri, 29 Apr 2022 at 12:57, Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
> Applied, thanks!

Would this and the cache topology patch qualify as stable material?
Intuitively, I'd say yes, but I'm not really sure.

Thanks,
Rui

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
