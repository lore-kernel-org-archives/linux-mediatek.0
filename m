Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B7BC982FD
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2026 02:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y766ru1pP38bk6e7RtGWTvz6LPHY8UDSub3CPfviG84=; b=ANlcE2cKxFcCOWKsamTtmlgxAH
	3wNYEEaLoHHiuTmPgOHPfVD/vrbyrn7OwUTe3lzj0d6V2jzFRzYnqfcJpNpxKkKzoAwlgylFeulSN
	sth1EFf0v8FmgfkFR1hkwx4Eg8kFYvfY4Ok9Db2JzGKggrhb6JdniYg+z04e1Nm2DqzxFk58oYvTg
	cfT7Fuj2kOh4ilOpNjKlbWvGsPy34laOjx1AvaOnh5cu3MRtayfEow8GEjk2m0lPteRHNgUZdQACa
	UYilBkCWj6UYnOC1xUXXFxAVLhg5ceO48ye8eWMzYaJU8hIGKm/iKmXUPtD1ti4arQmt/Kb44AppV
	tK6fLqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qRz-000000040sB-0btR;
	Tue, 22 Sep 2026 02:41:43 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qRw-000000040rK-0KTC
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Sep 2026 02:41:42 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d46e4cdcdso30516957b3.2
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 19:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790044899; cv=none;
        d=google.com; s=arc-20260327;
        b=bROIC0VL4i6s6XYKpQ/i2vuytrEZ3b8YxB143RgvEL1drLJSDV6N/we4wVK/2yIqbx
         XMGf47U6z5Yv3of9eruAQynu5Y4OOB7sCRKNWNmWANOVnbRD0hd1c6S+47oD0MAg59G7
         12rLlHXLa1O4nHX+nIG1e/2pMRMt6zprvf+vaqKbB+HxwGDb4aUmfq71BQgCkP3MqKjQ
         AHnqrq7Z71kHq3FoHUnjuyGrIKNJq6MGfOidoUoKD5rsYktEmsI1dDhd0bCxRZdJM9H+
         EEwZXgYsV1jt+S/VNmnT4yD4S66WaScrnyUvbndT8Ng03pFurGDXsl4CNf0+a1qF5con
         YwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y766ru1pP38bk6e7RtGWTvz6LPHY8UDSub3CPfviG84=;
        fh=UGUWv9V1W9ktp5VKxf3D93bMgQvh09aarTWeZHH0MlA=;
        b=YSVVexSdlxS8Iwt+uy1nCC8jMiaYbdCBnmwt1BmWaBtDqg+sVpE+C30+G9ROkzjrit
         0lwC1wwTPwIbhroHm5wWoE4jDW2Hv23v99fsV8Oz2jBhFeMVhHdcPbKdm/dsJMjVpcrU
         C2YNFJPPwxLp7vAEIq0nHhJkrvxtQjujs8XTBmIEy8UbqSsmb+Z92yN/xHuPpWChS1Mj
         CpW2g/VZL4SdKkAMyjWfOa2rnTr699TeAgRwmeep4TONDnJbljhY3NWzvmjwW0JYHiQ6
         u+NP3ldbkuZF82lGcCIR9EpBJMldtn0b4LN4HA1mRDLbPfzy/QN/Wn2SSNZYofzpfk+U
         +RFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790044899; x=1790649699; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y766ru1pP38bk6e7RtGWTvz6LPHY8UDSub3CPfviG84=;
        b=R6jAQ2jiddKdWJ0LkuDUSJydCSY1aWCoOsVgF1BQJ2x/ciNdmc4A/FC53KzmvXlhzS
         Vn2Oyp+X+vHCuhNwbOnWPZWhckCqZffYRRWJRl31fuQxwgVYkkjebOEaqg/cIpAo89Xu
         KwEl69TF810XKz9SOVvx1jCjRxMgj2AlIBnPE4G4tGuzcUxw9nptG7s7AelYtsAbLW1a
         sKuKiOJi6GzRBU3Uys7r180St1gffwyyzcRUFxtki7qmkHHeVL/tRFf8V/IbpZyn7NOq
         oa+nKnh4DQo+EAohIr9J5HqYIqO7px0gg4FMa9X7xhHssPOP2fsdkhrqszRwmu9g0r1e
         Fsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044899; x=1790649699;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y766ru1pP38bk6e7RtGWTvz6LPHY8UDSub3CPfviG84=;
        b=hkC3900KkVcwW5R10muJyCmZxCT/2EpUMHy3FkwDp3PM/8Yy7f/O8O7JnWRoU/A+SM
         U4Ln6u4Auv9yl2rl3qQszEvk9g5jod2lcdCeljZLFqFZ1Db5j6ieMKzOf3LlHEWv3Z1R
         FFiu/IT9eISAg3eoa5AKNKW0iHcwBrD6LtcXxa+9GwDW2RjVeR4b9pBiR0PK7zjF7MmN
         HqDeDWrVVyb5m8Z5vvOl1fJKaUt+HTCCV00vW8pLEkdA/AfPtqbl54NbFHhTm3tnhx1A
         fXE1GZD4hxeZsE0ciZGnO+AnVO58HzNiwj922s/8MgZtQCrKY1NUdh74LIBprey2L+zS
         a2mA==
X-Forwarded-Encrypted: i=1; AKwUvBwKX/L75Ti3U1J2KEmPKm7uyIXML9NXgbAiHdM1rbtPQBYPfp2SJMPmQ08lHCNHA39TBJhy2u/wilXvlL3cdQ==@lists.infradead.org
X-Gm-Message-State: AFuF++k29gYb4SqKGCgJaU4g0xg7h8u0r41oRexSUQGDClGOLvszuoWJ
	TQNRCm6LWVoe1y0sfqJcyjtniVnYJTNQbQqXWFQ84KVGTdrqf6MrFWnAk+Bneb1jLOhxegoqi18
	NHOIwoYv/kGa6I0vaMX03PAl0dflpOeE=
X-Gm-Gg: AYBFou3Mb+XhMkeMRY79ZKdj95ghCkogP0u9nsGDhoYVD4Fp9ItUIu0SjbA/KZtiLf8
	bHJbmksFAlfuY2ruzE3ZbSB6hwP5FAYB693pM/+cwaFVV1sxgwbnkSsGt6SN4oh58K/erpoijYm
	h/uRTO7E42iEiYl5p1dsRFjWR+cGHRsTyhcqMPR2IPyMWq7zpLCY83XyXE4MDLpN5ZAeyjJoBnu
	W9BHq1CpC51+PeMWV0N/XIdPLZ6SAnT1zp3aBA+MORTvoreoW2JNPDjpk0Bx4FXjl9rZdHF9oBj
	Z/YCwmkqXQXFmrZJ7fsfNi7+5giIGpLKL/q3mf2sGlsZeYjqxS5hU9FI4/7dngNG1vRU
X-Received: by 2002:a05:690e:418c:b0:671:6e1b:3579 with SMTP id
 956f58d0204a3-6717fce3850mr3483604d50.31.1790044898781; Mon, 21 Sep 2026
 19:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260921085119.308981-1-lgs201920130244@gmail.com> <arFHWJb9igZQPkeZ@quoll>
In-Reply-To: <arFHWJb9igZQPkeZ@quoll>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:41:25 +0800
X-Gm-Features: AcwNN1V-Ux3fREqDv-l9JklLsk_41fzba7T8a5w0aNSBvvhTkqxYTyKq2Y8-7tQ
Message-ID: <CANUHTR-FtO3EAxgTmXeS0YeT+2CPB=4iA_T-2qFZO3QT7veYYw@mail.gmail.com>
Subject: Re: [PATCH] usb: musb: mediatek: fix child device leak
To: krzk@kernel.org
Cc: Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org, 
	Yonglong Wu <yonglong.wu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	Min Guo <min.guo@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_194141_777818_6D5DA1CC 
X-CRM114-Status: GOOD (  32.40  )
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

Hi Krzysztof,

Thank you for your feedback.

On Mon, 21 Sept 2026 at 23:03, <krzk@kernel.org> wrote:
>
>
> On Mon, 21 Sep 2026 16:51:19 +0800, Guangshuo Li wrote:
> > mtk_musb_probe() populates child platform devices using
> > of_platform_populate(), but neither the probe error paths nor the
> > driver remove path depopulate them.
> >
> > If any initialization step after of_platform_populate() fails, the
> > probe returns without unregistering the populated child devices.
> > Likewise, the children remain registered when the driver is later
> > unbound.
> >
> > Use devm_of_platform_populate() so the populated child devices are
> > automatically depopulated when probe fails or the driver is unbound.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: 0990366bab3c ("usb: musb: Add support for MediaTek musb controller")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/usb/musb/mediatek.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
>
>
> You sent multiple independent patches, to multiple independent
> subsystems. The amount of these patches clearly suggest this was
> AI generated and most likely not tested.
>
> More importantly, you sent all this work without properly organizing
> relevant patches into patchsets. This makes reviewing difficult
> and might cause multiple reviewers to address the same issue.
> Replying to the entire set is impossible and requires handling each
> patch independently, instead of applying or discarding the set.
> Maintainers also won't see the bigger picture of your work. Quite
> worrying.
>
> This is on the verge of hostile patch: bomb us with so many
> contributions, we won't be able to handle them in efficient manner,
> like responding ONCE to ask you to slow down.  Considering all this
> is untested and LLM generated, I have even more doubts whether this
> should be considered for review.
>
> Please read kernel documentation BEFORE posting more work. It will
> explain you how to identify subsystems, how to organize your work per
> subsystem, how to document usage of LLM and how what you should not
> do if this was posted in a good faith.
>
> Best regards,
> Krzysztof
>
>
>

I would like to clarify that these patches were manually reviewed and
audited by us; they were not simply generated and submitted by an LLM.
However, I understand why the recent submission pattern may have given
that impression. We sent too many patches in a short period of time,
and we also failed to respond to some discussions in a timely manner,
which made the situation look worse.

Many of the recent patches, especially the v2 revisions, are
corrections and improvements based on previous review feedback rather
than completely new untested changes. That said, we recognize that the
way we submitted them increased the burden on maintainers and
reviewers.

We apologize for the pressure this caused to the community. We will be
more careful about organizing patches by subsystem, preparing proper
patchsets, and following the kernel contribution guidelines before
sending future work.

Thank you again for pointing this out.

Best regards,
Guangshuo

