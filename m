Return-Path: <SRS0=soVQ=ON=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E58C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 21:31:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CABE361242
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 21:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CABE361242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6nBtv0BBjU9OjlLzWsmN+MUs5D2rYEs5cj83V84msI=; b=zRhtYZBaTAiCT1
	iyEGdBty1K9jYkbr+pROrx5GB2np8PWvMy77f9o7p92E959MRO9b79G/4IXYDj72AZSOJz2dEaI/0
	AjDnsVCNF6fRS94AmEt8XAX/GoNrWuiSxb1u1b6ZnKzdkiKiEwYIx1LxTEALPcKaDFUEUkYVPWDDE
	zZn0mvBk6l6j+dBSoVwadWta62DhhxmxSXRK2JBqUXL9DQuwIJPUvwme6g4PyLS5jJBqt+Aqfbhvz
	S76A8UJ+yvpynTN9UY1nwbjO3zA35ywxO0b4MfQ0FkQaMzUbm9AX3U5eKbysXyxpehAb5Dl+KQYK+
	8dW79lzphttMXuvyuO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTWJg-00CdQo-N3; Thu, 23 Sep 2021 21:31:40 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTWJd-00CdPr-UM
 for linux-mediatek@lists.infradead.org; Thu, 23 Sep 2021 21:31:39 +0000
Received: by mail-lf1-x12e.google.com with SMTP id x27so31719412lfu.5
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Sep 2021 14:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rSGexge/yTWailPe6Hp1VQxkjzvMXlLhdnN0SKm1jgk=;
 b=sHXkka97oocc/Avp1+G2WMg9/Kqe44NKcVXC8YurMm1Q5arTOo5d7SR2gd6B1r8KGQ
 u/j2JVVDjd7ly5+7pexUjhyoYw3zCMTNN52V8f/V4vvVFsLVZsvA6g/ApYzKnvyLyT3t
 wYJoedt+57XP5OjI9uDm3fzhHhOVPCXmbOZJUkYJ6fXWAOnwi+QCCYi10flo+mOzSS8S
 5DDRevo5UgdPYGZgjQyhPBVeVHY2UqrDzMR6bTYXos0netmhu+Nx4SdZZG501lTgi3QX
 ZBRqucDMnx8uDcnfDk5sLD3v7M+mWcBAuosQEmQmNGGhAzRWVFiFacjPHmn42MSpnvJJ
 zGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rSGexge/yTWailPe6Hp1VQxkjzvMXlLhdnN0SKm1jgk=;
 b=g3vbJkYlPDOHnpk/tPQohEc/9yfqmFjEAAlMglik9jTsQMYmDJ8AdQDkgJOM+LiLaz
 wxZydWAsPdo53rqOdoOVSz1ZKMLiIXVMoLNXN2+VamLgee7UkQp7kRlulWzwYsLs5rq3
 BoPQtzhRhs78CxwMSKny1MmId5Z23fyz/kkufYAXjVg0x/t27tqfU3xa+cTw0pH5YJg7
 nxecSqOLIumDruM8PYw7YUxW9oQwX8x8RxsHeeIjAqSgfAC4H3k4lfi2FTFAzL9Ew3Ab
 jIfuNGdcsM6VtGjZefBilf7k06koSYrZlxTd7ldAMze3wh95mZvtyCEnfmPemeea5gWT
 kU9w==
X-Gm-Message-State: AOAM5329TlAcmiPpcpLdoNCoM1r6xz8On8oXiWDbo/Hn09uLDhoV4jY9
 NI5G1hBG82DKYXMrLwdWcrspJt2Qk/pWGwj3CtbECA==
X-Google-Smtp-Source: ABdhPJy2mfR57uNliZEcdzZTcs5ysF9NDOwlJSo6qcE2nsS01XTmcffsKxwYrHi5ZVuTy9LqrP5bV2aG6k/zenW3gho=
X-Received: by 2002:ac2:4651:: with SMTP id s17mr6179225lfo.584.1632432696061; 
 Thu, 23 Sep 2021 14:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210922025640.11600-1-zhiyong.tao@mediatek.com>
 <CACRpkdYASy3KMm4VXPrMyvVpONK78gwRn6kthK534pjWb5mhvA@mail.gmail.com>
In-Reply-To: <CACRpkdYASy3KMm4VXPrMyvVpONK78gwRn6kthK534pjWb5mhvA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Sep 2021 23:31:25 +0200
Message-ID: <CACRpkdbM3hoAxMSaoGDzF84rxmawghHFcSdibs9wANxWn0iynQ@mail.gmail.com>
Subject: Re: [PATCH v13 0/5] Mediatek pinctrl patch on mt8195
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, hui.liu@mediatek.com, 
 Light Hsieh <light.hsieh@mediatek.com>, Biao Huang <biao.huang@mediatek.com>, 
 Hongzhou Yang <hongzhou.yang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_143138_020013_D16A5682 
X-CRM114-Status: GOOD (  13.77  )
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

On Thu, Sep 23, 2021 at 11:27 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Sep 22, 2021 at 4:56 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> > This series includes 5 patches:
> > 1.add rsel define.
> > 2.change pull up/down description
> > 3.fix coding style
> > 4.support rsel feature for common ICs
> > 5.add rsel setting on MT8195
>
> It appears we have consensus so I have applied this patch set for v5.16!

Speaking too soon! It appears there was still comments on patch 4.
I blame my gmail.

I backed the patches out for now but this is starting to look really
good, try to make sure the patches also applies on the "devel"
branch in the pinctrl tree so I don't do any mistakes when merging!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
