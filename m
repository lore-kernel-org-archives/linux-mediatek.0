Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539B4C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:43:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 259F46108C
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 259F46108C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQLuxtAIvaI5q51rwjQ5E78H8xwMJrZHrpmmB+BmGxg=; b=fO84HdGrCBg7vC
	AJKkdRblgvmr0t8KNlDSACo1Ac02HtGPdXh9imTXf1+XejL1mA52roYstWg+vhbK7EObF5CDqZjaf
	V8Y2Ry235reMqw752ry6DygDllaaNrcKkaY7h0hUjt0V8wn/zzcNKOab7+/uOsJagAjLBC33AbzrT
	xHHh0QZfWXSZXDhMa5NFDB+PPIjzmqlq0h5f7Xag3p5zLWKfUVgwWkxS0p5LjnQwfbnMnRo9s260N
	6vn9EQMm8zyC0oE+qtw/lwLTXrT8fjWxTrCRUxMPVO2I/xQB25wv9GRmI45amLU/P4wb3YPJ545BY
	5ttE8HYPRgnX/8qlD08w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8EwE-00DDha-3q; Tue, 27 Jul 2021 04:43:30 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8EwA-00DDeL-PV
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 04:43:28 +0000
Received: by mail-pl1-x62a.google.com with SMTP id c11so14315072plg.11
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 21:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8OgNNI/ZkkFCiDWQYC06fGQinvIGcARtCC3HkxPSNzA=;
 b=Q5D2/AyVMa1IWbGsysocOoq8QjOGrae5n6e9Q199iOQUX9WzJoez34mv9P/teNkYEt
 klKGHnai2cbH8VssVKLVQ+IhLy040E1J7bVziAzCleY+Getjb1NHun5CHSeiMYDlqzXe
 6Y8FaVfsMd70FaCepmZ0ibonK1bObtcY8uP+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8OgNNI/ZkkFCiDWQYC06fGQinvIGcARtCC3HkxPSNzA=;
 b=ZV5YCCWwDurM9CV5DfkcCHl525n5TMZpry1e8l1bOycU92QPdL4oU/5aQK5PcQbHJF
 xPJo/2QHebW9lhEMOabObJ0RjkWNNmlJMGDqXJ138Xy3C9LaCI8cJFlvbeQutbG1f1jI
 Zoav6OMqq9B/sk74dJFggaLSY7fgwo90NeXtgAOTxn6tQ+/M4ERCOqx7cjwnZ9Vdn0Vf
 L0ikKyvyLf6EbAVoEg5rKu5OzQk4K1bIEpnUr8SMU9ZdqqYwVxqR/WuT2G7TaXXDbx16
 Drz0Spm/GPUpN1zBXz9XGr8bvUd8SvJe21CXuw0ImE23IYmxtPonDvBvxq5OerUtzjyH
 eMeg==
X-Gm-Message-State: AOAM532swnTri7BIbpBtpZ4ER+1pwofRcw1nA6MP7jH0zaeOqSfETxrS
 PjNBgCRFoqw+SbOl6DI7m2AIXVvv6UBJbkgLPOAIFw==
X-Google-Smtp-Source: ABdhPJxoc5CSpPY3vQh7WBrophJ46+dx+Oemf64p8gEZ/MeteoctC+j1XOB9bhr65cib2vxfEoicD6FmTXf3GIPsuds=
X-Received: by 2002:a17:90a:8403:: with SMTP id
 j3mr2306339pjn.112.1627361005167; 
 Mon, 26 Jul 2021 21:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-15-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-15-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 27 Jul 2021 12:43:14 +0800
Message-ID: <CAATdQgBkdst+fVnQhoYzJgO8meaef+YCjcPgEMTLbECTxRC6tQ@mail.gmail.com>
Subject: Re: [v14 14/21] clk: mediatek: Add MT8192 ipesys clock support
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_214326_878358_D862121F 
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

On Mon, Jul 26, 2021 at 7:02 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 ipesys clock provider
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
