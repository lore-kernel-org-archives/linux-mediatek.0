Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BACC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Nov 2023 14:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gisn127HjRfCqlCw+GGWcrZ4rm16EE8igW2fuBilOVI=; b=b4ffgfHzRFbY4e7AdPS7okqHDj
	+EiSjJ8FQMSqVsVH+/2zjHmY7h2KqDLC8xh5zWL4GB7Aeb4tuUmA1Chc6T0W7nVXLfRzORuabsfJ/
	dhD1TioXSGuQEHwjRPf4xozo2ZPdHVcCMNKw7YafICmbT18sMcuz4EOsmJ6Kv6lXpX8AVA8foncUo
	KeNOYBjybFYMCisObe2a5rEwdGDjEH5v9RLG1sidqn9SBRjo49NT2e5ruLRoNyXfcjopsTieN7dyV
	7IML87bE1uPAI5Zzpppw0YevIQZvtizAKvVJGaMA5OJNcvgv0mHGeAURCb/ThdVfohoV99q16M2c0
	VYqFTbxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyBop-007cWL-02;
	Wed, 01 Nov 2023 14:03:39 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyBol-007cUI-0B;
	Wed, 01 Nov 2023 14:03:36 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso1050000966b.1;
        Wed, 01 Nov 2023 07:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698847412; x=1699452212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gisn127HjRfCqlCw+GGWcrZ4rm16EE8igW2fuBilOVI=;
        b=elXwt4S45zXEoP1o5lf7tWxY/zEP1StLzKMEBR4y3JvCB99mrXLH37WCgMJy2gAXF7
         /FXN2SFkzDzS+fIKVV0wd//Ux+try6BjKrkYp3LSc2q02vxxt+EZSktvp2AgxCTRux6h
         9zBjvMs0AdEO2m1YuDZNwcjNuOWQhRmWR5sfAsUeS5R2XPGb9hzRz3LIf/BO45meV8b7
         muFbL3fM2ahpeqfiHRWE0U19L1yOutAeLJt6BAH8S7yEYiz6seYoWivbx6ceznRQAYqR
         8LYcZ24sqxds5HIqq5yBbXmbV60fZ2jx9Ms3HWlnPvXPJDrJuIzTgSc1hGoCiyZNZ63J
         hwVw==
X-Gm-Message-State: AOJu0YyV1YCjCFr91hP156v9PuVNMf9/ZEoNxGBEnlt4ye7+OczIRqp6
	blUJUEYiDBEByR0PwU2eEk8PZKuKqYt6iA==
X-Google-Smtp-Source: AGHT+IF1QekBYYqf+y3ZlDA54W0gvXVK0841pNrGigyw+/OgYsezb06vOevf5cG2IcfoW21bN5i0uA==
X-Received: by 2002:a17:907:78b:b0:9d3:8d1e:cf0 with SMTP id xd11-20020a170907078b00b009d38d1e0cf0mr1756318ejb.54.1698847411552;
        Wed, 01 Nov 2023 07:03:31 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id l19-20020a170906a41300b009ad81554c1bsm2421511ejz.55.2023.11.01.07.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 07:03:31 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9936b3d0286so1050975966b.0;
        Wed, 01 Nov 2023 07:03:31 -0700 (PDT)
X-Received: by 2002:a17:907:764c:b0:9b8:b683:5837 with SMTP id
 kj12-20020a170907764c00b009b8b6835837mr1531634ejc.46.1698847411026; Wed, 01
 Nov 2023 07:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231101095533.45258-1-tom@baremetal.dev> <87o7gdbog8.fsf@kernel.org>
In-Reply-To: <87o7gdbog8.fsf@kernel.org>
From: Tom Waldron <tom@baremetal.dev>
Date: Wed, 1 Nov 2023 14:03:19 +0000
X-Gmail-Original-Message-ID: <CANjHDnCFMVayX7fHBYJc8GwdNS8wrnrJYMx-0ZrB++9kP2ojUQ@mail.gmail.com>
Message-ID: <CANjHDnCFMVayX7fHBYJc8GwdNS8wrnrJYMx-0ZrB++9kP2ojUQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] wifi: mt76: mt7921: Add a new VID/PID 0b48/7922 for MT7922
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_070335_097734_F6F56880 
X-CRM114-Status: GOOD (  10.67  )
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

Yes, it seems I missed some of the output from get_maintainer.pl and
only caught the last few lines. I've CC's some of the others including
Felix & Lorenzo.

Thank you for spotting this, Kalle.


On Wed, 1 Nov 2023 at 13:19, Kalle Valo <kvalo@kernel.org> wrote:
>
> Tom Waldron <tom@baremetal.dev> writes:
>
> > Add VID/PID 0b48/7922 for MediaTek MT7922 wifi chip.
> > Change tested on Redmi Book Pro 15 2023 (Fedora 38).
> >
> > Signed-off-by: Tom Waldron <tom@baremetal.dev>
>
> Should I take this to wireless? Felix&Lorenzo, ack?
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

