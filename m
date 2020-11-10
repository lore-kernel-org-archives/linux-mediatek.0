Return-Path: <SRS0=XLXJ=EQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D40C388F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 16:03:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BB832076E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 16:03:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fwe2Q9gv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6KVxoRV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BB832076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CHELvtQROygR5hdlWMULyUQEQv9arQTder1/jCmVGAQ=; b=Fwe2Q9gvqwNxZ0W5FTes6N8+2
	zEYFdK5fzRbpH2uFo6oXtx4dr7oAtbTo7WitFJelG0SMGJGoh+EnxZXEBWg0Z/oNlqUZnMB/Ule05
	NBHiAKzH08JTKSARuHkoHU2NfuiXaTYtKWGCc06u5MnOvsyeylvIlsTMkBaxgRz0YscTAzYdsGBU4
	J+HZt3gQxmc63jLWe5o3vLp3u3vC24xJE+/JwDptiV8V6KUtjuSM4sBnGddz2p6cer7ujbXItbfx2
	43/lN6rvVg8UWzgaSAQWR0KjkBpwDIi6sNByGX3+apH0kn6Y5eDT44XbZixpl7NBO0AG+G9VwCry9
	1LTewU9OA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcW7M-00027h-5Y; Tue, 10 Nov 2020 16:03:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcW7D-00023q-3b; Tue, 10 Nov 2020 16:03:28 +0000
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DF0420829;
 Tue, 10 Nov 2020 16:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605024206;
 bh=Q4tizdLmjkzMbfpePr+avvWWNz2g0MJUKN8eJ2xoJc8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=A6KVxoRVUh7MGpM78oa3naUGFo1EcjhPmNuJoaAofEbM4A1BSeiqKQPmq7g7OEDvo
 /7P91TM9kqQ1O2kq4xIYur9mfdDywNu6VkjsrLrpX12sVUWDACrjbTm3U+JGiGfz29
 h/Y6nTdFSFQhx/+ikQUBprsBbdi1sI/l/h6O1vRo=
Received: by mail-oi1-f181.google.com with SMTP id o25so14042067oie.5;
 Tue, 10 Nov 2020 08:03:26 -0800 (PST)
X-Gm-Message-State: AOAM530BEvA623YPWeHYY7S9PLFd1INcJaL/Mwag6bNbCrshkIBxi3Tu
 y6uysbdakuqJDxXiYkBTJDzQ7srn3//G0SDbmw==
X-Google-Smtp-Source: ABdhPJxffCMld8zxb9GQXqc30p3WWWPLcHwsDvjVqY4ZjnX3Xq/4kK3Jyc+SH7Uma8dDisNt6kO4m/SmAfDDh4PMeBw=
X-Received: by 2002:aca:fdd4:: with SMTP id b203mr3276663oii.152.1605024205264; 
 Tue, 10 Nov 2020 08:03:25 -0800 (PST)
MIME-Version: 1.0
References: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
 <1604887429-29445-7-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1604887429-29445-7-git-send-email-weiyi.lu@mediatek.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Nov 2020 10:03:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKj3Mr6fT_R8JLCK4Ciyt-NyEbUbXXrxnbCBzo2TsLFZg@mail.gmail.com>
Message-ID: <CAL_JsqKj3Mr6fT_R8JLCK4Ciyt-NyEbUbXXrxnbCBzo2TsLFZg@mail.gmail.com>
Subject: Re: [PATCH v5 06/24] clk: mediatek: Add dt-bindings of MT8192 clocks
To: Weiyi Lu <weiyi.lu@mediatek.com>, Stephen Boyd <sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_110327_269844_4CD926BC 
X-CRM114-Status: GOOD (  12.51  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Nov 8, 2020 at 8:03 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> Add MT8192 clock dt-bindings, include topckgen, apmixedsys,
> infracfg, pericfg and subsystem clocks.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  include/dt-bindings/clock/mt8192-clk.h | 592 +++++++++++++++++++++++++++++++++
>  1 file changed, 592 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt8192-clk.h

linux-next binding checks are broken until this is applied.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
