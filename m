Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12573C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:37:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB2E36109F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB2E36109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzdjtXadH5nCUiVKoBdr0ksjihkLFesCD+SqHXLXbAI=; b=l4TYh0s6XwLd1XnMjBtCrFiwzS
	o2p9r2/2URd75I6X4ZsEOh7Dd58+jywVrqXAF+O/Uzgg7nV5fhXJtaFCMFHmxY11v+aaF+L7o28me
	BhJv7gm9j/vnZD3smJHCNt5DHQyueqvxKlAh2plIHEausvbBzOxAFxVGgOFwCcPzFcntjiYO0R7he
	QpSgosFs+sAc4jhl0SDLwNus+EM2SQQy49PJM1m4d/kGHZ4yyjIqlntC9UAp1ugCKOwsbNZsqm6gq
	XNTKyzwTtNHhHZ/JMTn/iLJAjlDB5ddf2K5zbIPX2kBgh71skYBA+694b0qhFLHVhowh/jhZXHJn+
	nfI/KAJw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5LJ-005YZF-Ar; Fri, 21 May 2021 13:37:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5LF-005YYF-4y
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 13:37:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=enWZHbTX+1ralsrB94tU0j8mRNIc2ViVpX6p57Tm5zE=; b=IRs5RCFUcxZZWPOizrTGQ9lYbd
 l9tAo5WGUvKXUrBrUM0I8c4ldLVU2tGJbuWLavqwZrMQVoj4h2Pm+rBpNDGd11Js8uiCEWj89rjTm
 kYd/7lorbvT4ixuHkuAhiZpgEYfFV7483b9qODljfMVNtEpcw2eVgPjW9aAN9sYb1c3z9Zbrw0HJ7
 NDWbWUY1SjQeLdOd9uxWg2awB8QNRUdnIeOOleXGBWxAXJUUKWR0DT4Ue3j/50PUvBFtf9bULfO8v
 abHUtt+3VXWC7Z6AhLbFcS39PhoQ0VFnCqh15iPmWOopWvmyX4aLuJpSSpwtvJl++lfV1mco8NqkA
 F4ghbhxQ==;
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5LC-00H9Rw-Km
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 13:37:27 +0000
Received: by mail-io1-xd2e.google.com with SMTP id r4so19416666iol.6
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 06:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=enWZHbTX+1ralsrB94tU0j8mRNIc2ViVpX6p57Tm5zE=;
 b=NaZTtxcuBTlfaQI35LwHalM5DvO/FZwwhLZjRS7/FQdrOAtExKGt13R/NExTU//cQO
 3mcxfG1eN1ewoWzCRO/DxANKbfA8EnOqjsglH18Lj6wiS48ArQq6uLO8CAf8sRJgnkwm
 br20HeMG4mjA5VdvTfBOhrU4n9n07WGTKAOoHr54h/MLvlw/O7oR9DUPT11D1f4Ptj4s
 +yP0SJhcgYgVvs1c2UsG+idQzTnwZYfkxiQPlAg7Btf7EVYIMzQ7SlknsvAhZWdK4ZCg
 r1fbv9Qmq+oT5Ikvdjs7uyVrzLYW5lmrN8TXVv7SWNqUr4vaBYz7a941jQkeffMLbZ9J
 PRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=enWZHbTX+1ralsrB94tU0j8mRNIc2ViVpX6p57Tm5zE=;
 b=NonLsez4i1cYSe4PBbn1VijGS5ky/ImhpCBNSomL8at13UiXrqsIRibzZalGhjLo3A
 WFgaHhDWyZ/GzPvEDn8W80Uhy3sqCjd7CPKWlcKv1yYMZqXQhdVQCzTRVn/DXvK+4PAk
 bV+Chv73nhWXHY/z+hYmXLCFDwIrL57SC6PVO0zBT+zDxYmvqx1djQ6PRL4jZKmBph/O
 CZnD/UrQ/t4Vr0bK25dAso7EWlBuVT0Ps9/d5qFzu7VA95Fu9JzvbqgF8VmmpV8YC6Qt
 dPzCuIhlajRBjqmr0Tv1HX82zxdIfUZDniMFlqPyVtW07mJvuqr6uBYSBAUZsr0PwXSX
 6xyA==
X-Gm-Message-State: AOAM531zsFyBS3c/QrVA4QSK3rDxgcB2rflj9m/Br7kxXHXtJc99ovLg
 JxQeyrQhucAe3qNg4jdzO1yST0Z/WSwml6nvTSQKgA==
X-Google-Smtp-Source: ABdhPJy9RIIy/dIbfHJJ+7svOf8eeI6VuDWRGhsHg+X4dKcXZPvG6VAJrWtvnvLALF0dNjytfTjlmvzM7zYFfkhhM2c=
X-Received: by 2002:a05:6638:3010:: with SMTP id
 r16mr4595070jak.126.1621604245913; 
 Fri, 21 May 2021 06:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-5-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-5-acourbot@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 21 May 2021 21:37:15 +0800
Message-ID: <CA+Px+wXuyWv53Hwk8zo_3R4mRJzm-ShZQ_qiJ8jupSfzLWaZgA@mail.gmail.com>
Subject: Re: [PATCH v5 04/14] media: mtk-vcodec: make flush buffer reusable by
 encoder
To: Alexandre Courbot <acourbot@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_063726_697743_C6F0F03A 
X-CRM114-Status: UNSURE (   6.78  )
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

On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
<acourbot@chromium.org> wrote:
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
