Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4AC5C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 13:10:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4865522E03
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 13:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4865522E03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M2Hm/ce2R5cfeBETyqCO5i6yJjEM0NidhPX8k7tdeP8=; b=RpkD630F6mgWi0ozPN4EBw38X
	nx0quk8Q3tB2Gv0DwzFEd68YavaaB/no0OgrHgy3FKzBnRAVe7kod7IlWuAaq0IVv8kTLpiQc+env
	rRqpLAeUlLd14taNxJaW0jbfn/Fp+egJqaz6ZJy+9KsL7Kt2oorjbbo1rzgxr12qU3vOP4K7Je3qX
	heyK0Jj4oUNpkP5+WwUgODGVsMfwJCcuyrHt8aXrpvm4gAzNj97cQCdUidmA0yD31ihMutV7DIY1e
	yRZvL0H+DwofT+TvJWlln66zBMPuJjUz32TaiT2FUlRWiwY/apWOukl1yMV9aEmSWbXxeCdhUB9Ub
	xzT91Oj4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l41cv-0004ZV-St; Mon, 25 Jan 2021 13:09:53 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l41cu-0004Yn-2E
 for linux-mediatek@lists.infradead.org; Mon, 25 Jan 2021 13:09:53 +0000
Received: by mail-lf1-x12f.google.com with SMTP id h7so17638210lfc.6
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Jan 2021 05:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YeRHqNmrouDWJP/xkxDkX2LI+peKn9k+q09qI8S2TU8=;
 b=dRVZmgfvGhNAzk/IwBG53sc+pQ/aIk70Exr8NAd5htfE7TJ870KtfGQJ+l+P6uCCE4
 /+B0cXnGctt84l20uGzfNPBJctSj8oXCYK+wGlTIm0yzims6GZ1aOY7iNP8cXqxVn5Bt
 jXJt0MLcwgi7Ydvx8am7ngO0e0b9WElQkR3hWotojQqRyoejRV6WtXULC3bAAdJwve1A
 bqiBs7ugsUPTjkQVNzh8sz7+33Nou6rMmH1/l7u8jRQJyKighLL3qfSN9b7yPSnzmrwH
 n+vgIoKr4txjpEO3dmQA3FAz3acdb2P/vnz+sIwaKxlc4YoW5iRw+/n4iO6+KnF5+i0b
 LXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YeRHqNmrouDWJP/xkxDkX2LI+peKn9k+q09qI8S2TU8=;
 b=d7L3y6kNBdcNb5N18CN1jxhK0ua36Sm3LV4RPK9E4/ZW5b9XkRDr/ZJRQfDGD1wzfP
 xuaEzQMpBlJmuf928ndiZp/x1jrh0q/fqHjaPh2kh8MsbnI8aezy1ahzGAcvNuItX1Kq
 dpbZFzK55lZ8aQq5AUjXT8gccRCnwMhjWV1PJduITcDaAL1jcP38wKb2HqwNBV2ojA8E
 H1r6qYtqBaTUW8Q5aWmyFsrU7duZQqKRWp678Y54FgPI7zwbbZ4duYP0pb8eq6ImNr78
 YzZ6DVTI5DRQaREn70PFe4QqMsGkQpqwWgWOvkptu/5Sr+5gnuxZggHxZvFaOoD9VnWa
 YbLg==
X-Gm-Message-State: AOAM5302XnrfWKHXPnU2Xqq1l7CdEwYmgd2cQXeVEpzkVSC0lV1BESpF
 rr8W7O5PBTY9kZhGG1lKWDTeeTEj+HrnA2yxESp0Mw==
X-Google-Smtp-Source: ABdhPJzro6MMf5skyu/xHZKuqomtw3z3XDeraz1uFn6qnVK7gkFAUnggvPcpKtvVQmySxqcXpRINt7L7FwdHXrWZ3HA=
X-Received: by 2002:a19:b8e:: with SMTP id 136mr249156lfl.29.1611580188141;
 Mon, 25 Jan 2021 05:09:48 -0800 (PST)
MIME-Version: 1.0
References: <20210125031946.1882-1-hailong.fan@mediatek.com>
In-Reply-To: <20210125031946.1882-1-hailong.fan@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Jan 2021 14:09:37 +0100
Message-ID: <CACRpkdZV0dgqsCn1Ke+fy8W4eA0Eg9ksW-NJLp2AbLv8_j37qg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: Fix trigger type setting follow for
 unexpected interrupt
To: Hailong Fan <hailong.fan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_080952_197600_D661F4A3 
X-CRM114-Status: UNSURE (   7.61  )
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
Cc: youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, chentsung@chromium.org,
 Sean Wang <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 yong.wu@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Hanks Chen <hanks.chen@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, gtk_pangao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 25, 2021 at 4:19 AM Hailong Fan <hailong.fan@mediatek.com> wrote:

> When flipping the polarity will be generated interrupt under certain
> circumstances, but GPIO external signal has not changed.
> Then, mask the interrupt before polarity setting, and clear the
> unexpected interrupt after trigger type setting completed.
>
> Signed-off-by: Hailong Fan <hailong.fan@mediatek.com>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

Patch applied for fixes.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
