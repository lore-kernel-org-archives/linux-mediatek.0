Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8CEC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 10:48:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FBF060E54
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 10:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FBF060E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUPwsIS3dTt/ihUXmgXicoWg+RlWmG0N63SZMUfa7CY=; b=R2ctxixBe29v7H
	1Zj2TbjTBAE15WCJkOH/2ZGtRRdW57PJ+NA7HTBwU+YZb2UxS96hKs3aLt8uhmgvll0NMAx0Bm1Uf
	Gcw3hKwix0Yfmk6JECiIvhbV4XczkD15IK7lfvYj9+AtEdMqlx8C/Yh7YHzT+200C/Nx8pA7XUyYt
	8nArvvLJZ7fqO/lOPwPfA9o89gdzZc2jvYPfKp9/4bKR2ZuMoPLaSvUfRqoc9h4dTC0VxzboSVTtk
	oihJ4/Wl9E4flqa9Lnce5MTU82Icj8ZKebzvPnI8NfOlFh1Kb0mmOLlMoGnAfI1R6FyWxGWxYyrmn
	uV5HPbr8HXEei7XX/aiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mayHk-002g0I-Kg; Thu, 14 Oct 2021 10:48:28 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mayGp-002fb6-6a
 for linux-mediatek@lists.infradead.org; Thu, 14 Oct 2021 10:47:32 +0000
Received: by mail-pf1-x431.google.com with SMTP id c29so5126449pfp.2
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Oct 2021 03:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bo5VQ//3tqrnPktse6M9enS5exQT9a929Q+6pOvyezg=;
 b=qckgPGDzOiDMdPYjj7VihdXg+SypVSMzKyRh0i8VyoYbdQK7zHYwg6WWpI1xbAbUym
 CShHABDahGp5aiQ8u85i5AZTkOsGkF0uDlzmh8HdLrpJLC5C02YFQN2bJAGFnk+Zlxu9
 2ACVTFFx+Bdk4OJFPoeW/qxMbq6y9E76qvS0avPgVpBsJvHQ/k2tmFw+unky1iyEYfYz
 vUPV541kyFSu6oz5rM9WoXI6n3l5I1+STH7kWoP9ll/IJLCgpGx/qWRedvHpCLhhWbyF
 /jORo46Bv0f6LEKgJx2BhgT7ql3arbNoVhhSQwaDFYuKjLnEjfjYWCMZyoTO48B4HUs2
 zXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bo5VQ//3tqrnPktse6M9enS5exQT9a929Q+6pOvyezg=;
 b=j8xBXpGA+9n/kOpQg/FJqSMPF2rt6v0YIB0luzqxKLWrCazRb/rsttpxKRrPw/Ligg
 57wzhWJnU9c/UQ4IWQEenskNARwhmyHTtRUqqyD5Y5Hfvd3p4LVbqkQUa4npA75uJyHY
 FpbCI7fI/ntFz2d3PPsmtmT/oQyyNG/gpE/k7nswz3G5Z5jXSQaLrPhRfzETQ4ezPvgL
 Oaje/Qkg7cH9VPaqUHBGPW5WkBoEVMKSiD/bFrcPkHsUVF1RyZsI40ZeUMdqIF40A9gY
 pnWL0IYxyNioY2sAt9mlaNu0fB46h0bwcK2zWrNFh2cnlCrjyauvRv3jFNYGSA1lqf2W
 g2qg==
X-Gm-Message-State: AOAM530+QauBP4a6y3uWFZIVXquPOWKx6kFCr+ZXb40BVoysK3oPZKZ9
 nhioF8w/htvfA95AlgMJKuEDxX1YaY25TEhFGGAMVA==
X-Google-Smtp-Source: ABdhPJyn+5cDPpdGQJ4rBXK1JXXu+EDq8jOWBZVl0gH4sY1jyHea3nxm+bx6JXYsxcUpoVEOqgS4XdC+aw4OG+O7K+Q=
X-Received: by 2002:a05:6a00:d63:b0:44d:186d:c4c0 with SMTP id
 n35-20020a056a000d6300b0044d186dc4c0mr4622573pfv.47.1634208450140; Thu, 14
 Oct 2021 03:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211014093112.3852491-1-fshao@chromium.org>
 <20211014093112.3852491-2-fshao@chromium.org>
In-Reply-To: <20211014093112.3852491-2-fshao@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 14 Oct 2021 18:47:19 +0800
Message-ID: <CA+Px+wUKXJ7a9th1HyxvCgDTQXL9kHtZH+O9z9oRqCfcF8H-sg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mailbox: mtk-cmdq: Fix local clock ID usage
To: Fei Shao <fshao@chromium.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_034731_276223_12083D46 
X-CRM114-Status: UNSURE (   5.89  )
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

On Thu, Oct 14, 2021 at 05:31:11PM +0800, Fei Shao wrote:
> +const char *clk_name = "gce";
> +const char *clk_names[] = { "gce0", "gce1" };
Does letting them static make more sense?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
