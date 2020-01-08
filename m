Return-Path: <SRS0=HKXf=25=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF472C00523
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 08:56:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2F0E20692
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 08:56:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y+olet0J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dt29E8cP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2F0E20692
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPop51XNQFcP5NR1tCJXeLgtSfwWMLrcNDnxLioY0vg=; b=Y+olet0JQGsPFs
	31ou37rz3DbFj9sg97lP+J/03m+AnESigTvAq6Y6gIbe/5oVVN2LfT0uu9aaL5aCAVPLLsroe5GnT
	uBbZjHpcByq1DoMG5qNa9OyAbaeYKNDzbt/qyN40CZP9/Th+TBULVkC7nIFoEGbErenJfE8ipol7K
	u0tP0LNe1QnpLheNGTdmw6RwkAV/A2UseMiNw1EKoOMfoQgmZPc/MSQE0/ZdOsQCPc7wdXaAxrjc/
	nAiCTkLDwjnM2zmNWeFUOczIR+O47eCPttY6Zq1NbGi2RmeMfFBN7Rb3jBYFkTBhnNI/SyEfmkQBk
	EP8Nq8e/u28SmWWICGVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip78v-0001wu-Ts; Wed, 08 Jan 2020 08:56:45 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip78o-0001pJ-54
 for linux-mediatek@lists.infradead.org; Wed, 08 Jan 2020 08:56:39 +0000
Received: by mail-qt1-x842.google.com with SMTP id d5so2210470qto.0
 for <linux-mediatek@lists.infradead.org>; Wed, 08 Jan 2020 00:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=23UaZlNsApqhumDDLUOyVqHmZXSwjOyNRAB7ikWfhfk=;
 b=dt29E8cPCpwAonKSxaiv3VaP8BgaW6t7bbMQkQnM0D3acz6OORwBCcouS6gD45iHNu
 GoPZetsVGj8l0OnJGPxqVSmqzq56aVUI+0uLD7j+Gg9OKKkLy6E736TS9AFewSX5PE6+
 AOSxXDvApaNRuUXWC+iSUIvKTYYK+4hSDeiCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=23UaZlNsApqhumDDLUOyVqHmZXSwjOyNRAB7ikWfhfk=;
 b=HC7fdacf1LLnXHRTxL8ozByLRHpq6IWzmLD+7j6SaiAU+bTc+LYBwN0YKUU2VhA794
 Hwem3hd4iddhB8t+KPb40n5ebE4dvPhn+i5FNXR8DRnpw511yyj7anvLqPZ939LwdOtn
 v1yV75mteHeSGixZ4uRu5xmY6PHXSHgQUvM6IkMHv+O85GmtH1UwncCgc+FtATsJgLlS
 bUeatiSCpqp3eMmUcrwy9+aOCjpQYWqlW7V69zEI7Fqv886/yViFjX80NOCzMwQ/Csxa
 LmYvMZYqhduW6m7DpMg5wW8i2PCuS3c28Ws5fukqbkxDSWyRwcn1YLKSY4zLv9BOUXtU
 DXTQ==
X-Gm-Message-State: APjAAAV/F11Xs/LtrX9azqGlvpoVGDG+yEy+qhBvgM9hfIziy5H7ioJe
 6X1n0zKkqT2m6LpjLx9rGg19lHcQCVNiR7pEhgR0Ig==
X-Google-Smtp-Source: APXvYqwLdC1bnpk+yFSSUDDZwVNj0SEXt8iwYqeuRY98reHyPr1olVJxIKDeEhuHBiSIek43xvF7qoUS3R03lEt//CI=
X-Received: by 2002:ac8:3946:: with SMTP id t6mr2632345qtb.278.1578473795857; 
 Wed, 08 Jan 2020 00:56:35 -0800 (PST)
MIME-Version: 1.0
References: <20191227141405.3396-1-yong.liang@mediatek.com>
 <20191227141405.3396-2-yong.liang@mediatek.com>
In-Reply-To: <20191227141405.3396-2-yong.liang@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 8 Jan 2020 16:56:25 +0800
Message-ID: <CANMq1KD=jAPn4Y7zQZrsg9FB7Cq6tNX0R8OF4qX21Sjy2=0Naw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] amr64: dts: modify mt8183.dtsi
To: Yong Liang <yong.liang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_005638_516961_ED7082B5 
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, linux-watchdog@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux@roeck-us.net, Matthias Brugger <matthias.bgg@gmail.com>,
 wim@linux-watchdog.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

minor nit, s/amr64/arm64/ in the commit title.

On Fri, Dec 27, 2019 at 10:15 PM Yong Liang <yong.liang@mediatek.com> wrote:
>
> From: "yong.liang" <yong.liang@mediatek.com>
>
> 1. Include mt8183-reset.h and add reset-cells in infracfg
> in dtsi file
> 2. Add watchdog device node
>
> Signed-off-by: yong.liang <yong.liang@mediatek.com>

Tested-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> [snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
