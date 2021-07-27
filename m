Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F6BC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:44:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 052B361078
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 052B361078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kH+mghyvrsuuvq3+l+6SfGs/it0ZRJpvHFP7xMbD+hU=; b=5FpptT8Q1aweV9
	livBs7jzcZSK+gmKVNN5juUKtX7CeymjxTk7qngL5g6XX7CNRWqJ7Fp3VzC2F1+O6qpG8dy1jWNnp
	uy2JiMaEjVYFo9UMbEPBPs+0/sptaoR2fIkLSrp6EcUv1VibZVSpv0WJ/pnDr5DKihQHL2giZDdMN
	hkNanCfeLd7LVvMKh6/eSygwXqZ+vjIbWXP5Rby4BQlut6vWrLiv+0EeHOKxeGvYbKuL7Ed6pRz2B
	FE7yCtv1Q6KV4M9htgzIyg3azyPhZQABHuV6R7hhVC4Ny/RSD3K0EPVRPt+zPDn0R4tvO1p6qLFJX
	r0/6cVON1h0fk0/zPklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8ExL-00DEDT-7G; Tue, 27 Jul 2021 04:44:39 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Ewj-00DDw1-4a
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 04:44:02 +0000
Received: by mail-pl1-x632.google.com with SMTP id e5so12417557pld.6
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 21:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cDWjDEqi47ElGh7C2oNgk2vsctUysNVRiZueqRzrN1E=;
 b=UHaoDeiHmVbqUuuK2tOuOy6bmjyToLI85HN61nQb2tVZNkd2tjyZnAE0C8ix1OEXHE
 XstQvUClJfmO+QPimqaKYZmvSDcqvIA67u/9Gaj1qIRPHBetk6es9VJuqhZKINhHKAK5
 sctWUmJu06jbfbPNf6YIOTKfznU19MKvKjqiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cDWjDEqi47ElGh7C2oNgk2vsctUysNVRiZueqRzrN1E=;
 b=mF5j5mp6AU+ymYYtZjyrubXWvJlQvUXGhjTOJQQ9ESrIy7Dx9poRLx7JnDoxMf+Ozn
 FrRcjwL3RijcSjPvTUDDjy4LjIpihd7FRlINETLpuhhdeBrF6CFifRR2hLbKkoEZhaHV
 REa1W9NsxajekdHQq+dj05GC1hL4aCxtpBsIN5GDViQrHXMlADH9ETDMu2/uuGPZBvXW
 hXGnpnqCi0xO/CHdVgytfIexSpiUzfiRGJzwnJKKYa3Z2fGM2whorMmZ2Mhj+ciszubW
 M4j5vg4yW2qN8V9/9t3MeFm0pbYzmmjZ0bKWh+GEsobGU60Zjrkjnjh5zqE0yDQgQ0oM
 7z1w==
X-Gm-Message-State: AOAM533QZ8VOlSIcqdVDSavuczbSs+XV94ddGgj+Bu9zWBA+Px+faSfl
 IOq8Mj1/z7JoSQoQzBVFcGu/3mHk4Pp7dqIIh/H0eA==
X-Google-Smtp-Source: ABdhPJzE5fzikckD6W8BCnYoANGcUYqKRBGEc0+o7U0HuCkBAe7GdNeibY0DL5CaQN96ISl+gJhLzrJ2WX9YBmoTOiU=
X-Received: by 2002:a63:3601:: with SMTP id d1mr21373016pga.299.1627361040343; 
 Mon, 26 Jul 2021 21:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-16-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-16-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 27 Jul 2021 12:43:49 +0800
Message-ID: <CAATdQgDzh6yME2pDsLuHHMuKA8bfjwHMD5z9yd-VGcdDtBZEPQ@mail.gmail.com>
Subject: Re: [v14 15/21] clk: mediatek: Add MT8192 mdpsys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_214401_206142_32D28BA1 
X-CRM114-Status: UNSURE (   6.96  )
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

On Mon, Jul 26, 2021 at 7:11 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 mdpsys clock provider
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
