Return-Path: <SRS0=zz1H=4H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B423C34031
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2020 03:02:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 132B922B48
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2020 03:02:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IU9wFByo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 132B922B48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N8tz0Gq7yKr0NkZdBAXEAG/hjq9ZBTud44YUrU4a2/A=; b=IU9wFByoAd/HBT
	UxvrpPYv+s2q9n46O6t8PNe68eX0W0hU80U/wUzl6pZaEeftu0U+wucKWfoj6BRnnrygg9g2em0fs
	lqHCUT5MuuAsEl60lOgItQgPYWkl2Zi4RhE+n3tTyH0vB2xi7Il4srF7sRxGYKtn007QU72AwmdD7
	vr4f4kprTlU5fY7R8fvQ1ZbfCiNMLMvBcsBRVnvwFR0LmkMzWhDA2soL9VX4rcMhS6X1ndUcK0X12
	0y19GgP3upEz1oauvawkE/16rAu+opm17RwYVbMp+gUqUSi/O1zzlLk34sNFoAxb48rku0h6K+65V
	UKz/8ZwOWFVkDcGLyhBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4Fd9-0001Vs-F6; Wed, 19 Feb 2020 03:02:31 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Fd7-0001VF-Hf; Wed, 19 Feb 2020 03:02:30 +0000
Received: by mail-ot1-f68.google.com with SMTP id w6so12531033otk.0;
 Tue, 18 Feb 2020 19:02:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wM36jiU/uEy31IzeR1mb5iKzvzrpChL40oT2SOGRUi0=;
 b=qmikZ+JAtHWuYxukuGOKvigIY05sIVHRTX6SgYrrpLKOGRH6XGm6FMpMeA3eMoXIre
 yKUTRDNcxAkHJjn+4YZBhzjs4Txh5cmH3Ppjn5EOWJcg0+HU4yQlgW3OLCnJm+BFjd4G
 ZcAzh9prPiWTTpGptqjNKBfoQ3k7wRauMMRxQz0okK5If/4VhmozdCdzWZi4G35ldbeh
 yAJo3a5TA/gykYvlzzWjAT6qISFm5XGa2LAAwmdmppHpmfaVnD7zHb5hQh1W4BC31CW2
 28LazE6VwH0fpXarDMVQcwKXoqVWgOy6NlyxmK7B7vDhnw0UsFCr5UklcaoURV904YVk
 R1iQ==
X-Gm-Message-State: APjAAAV/feZU86d/yIp2sU6Cb5TUvCAgLW6QRQRfZ0dtWRX6dhD5JUiu
 55XGKbFvZVT+HZ13fYMsDg==
X-Google-Smtp-Source: APXvYqyK+6EWyXhC3a/7xDZK0yFV9OL48vn100QsFjIeQ8ddy37zTQgKDMZU5KOrzSI/ZG374IuWig==
X-Received: by 2002:a9d:4c8e:: with SMTP id m14mr17131477otf.245.1582081348149; 
 Tue, 18 Feb 2020 19:02:28 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b15sm199703otl.60.2020.02.18.19.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 19:02:27 -0800 (PST)
Received: (nullmailer pid 14862 invoked by uid 1000);
 Wed, 19 Feb 2020 03:02:25 -0000
Date: Tue, 18 Feb 2020 21:02:25 -0600
From: Rob Herring <robh@kernel.org>
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: mmc: mediatek: Add document for mt6779
Message-ID: <20200219030225.GA14824@bogus>
References: <1581922564-24914-1-git-send-email-chun-hung.wu@mediatek.com>
 <1581922564-24914-5-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1581922564-24914-5-git-send-email-chun-hung.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_190229_585761_D8AAC919 
X-CRM114-Status: GOOD (  11.23  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, wsd_upstream@mediatek.com,
 linux-mmc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Chaotian Jing <chaotian.jing@mediatek.com>,
 kernel-team@android.com, Pan Bian <bianpan2016@163.com>,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chun-Hung Wu <chun-hung.wu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stanley Chu <stanley.chu@mediatek.com>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kuohong Wang <kuohong.wang@mediatek.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 17 Feb 2020 14:56:04 +0800, Chun-Hung Wu wrote:
> Add compatible node for mt6779 mmc
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
