Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECC3C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 11:33:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0776A60EBB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 11:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0776A60EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WOUz+3rTTVQdRWXVAELuz0cLP0RoIPFXqG8ClbVCpMA=; b=KwBQARPueLUQ0N
	01loYf6SsqszbKZIscc/a4ic3LCJdqmIxQnt1RBtUj93w455DWyv5T/+jTddZM53eifRaOLxbGdxl
	7Lo+bkj+3HsepePe9zgo/rv17pqek7p69h1GypcaIR1Yx+p+KHtYc76soM5Dc6g+vrBm6AakKha7a
	LTyMrTQiqZBvibGJOQDyetQH20UlTh06mJVFeRPLs+4YOXJ/8VA1oaHvfKuJMcwfSVhvFY8/gDjBl
	417VATbI2rKoGDXM+tEuUspJjUyXZUYtAEbhwlv8Ln/6ZJvCFWlL69QOlzhB9wTLpefZ+dMc6qLnk
	sQzipfMXAUqTD5Fc6/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mayz5-002rik-Vn; Thu, 14 Oct 2021 11:33:16 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mayz4-002ri3-80
 for linux-mediatek@lists.infradead.org; Thu, 14 Oct 2021 11:33:15 +0000
Received: by mail-il1-x12c.google.com with SMTP id i11so3065641ila.12
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Oct 2021 04:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oY5d/R7UW/oDRHgcTKtDThHEm8aGx2JuqS2Sj7syZ5Q=;
 b=aNxXcY5qVytN+++Hhyt6gdk23lSkpovawwdwQXeavBV9sVx00SHm0Tp8qHkCkprnPN
 N+prQI7uRbmlkonp3yTWLG3D0KBJKSgk4QoW09W1Cwu5i1W7tPY9DsxJJYBJSMlbk7Ah
 Tu0x0PGp0edxU90yGDrwjTaEKsZHfOwT3cCeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oY5d/R7UW/oDRHgcTKtDThHEm8aGx2JuqS2Sj7syZ5Q=;
 b=CeVjjRmB6mLJBl1srcQxM1JLxUn7s1xTV9d7cCbaooAS6JicY501m1kQ+z+FZQ1T5F
 FoyY6RjvrLsxikIlQuyqqMMU1vYpEAhl2GjCVWyfNooMI671FcKo6Z/gUFpPsO8xhEdU
 Dywjl5wVjAV0zxmYYi+nyaGiMhtBB3Wxb7xk1F+9o5R4Ps++0QWIvDmiPThMYFu5+gVX
 85a1b2lm1MJVSm8AVuCpV3iLftLEd+MgRT8fi9bJUhUKMsOTWkRK5CqiDBnAeIjyLMSL
 XPirQ2ZyLHwHw4XNo+ZonZGtobMoxoliZ5w0rVg8DJ4H93CzD7l9yI9hRbpS7Q0Lpn8G
 H++Q==
X-Gm-Message-State: AOAM533iN8gdOQXfeJFlaM80qAg+MZEJEEbP2W3Gpphp8h8A+tAqFUzg
 A6+TUVRKDVS00f/Iq5TbBQPM8diiOYgB0g==
X-Google-Smtp-Source: ABdhPJw81cR3D9TuCbWMGUP51zT8VWBHgWQ0/i+o6FqJBwO0uv7SUODHkkeGoT+iGjtjuhVljhm9Fg==
X-Received: by 2002:a92:c009:: with SMTP id q9mr2095915ild.131.1634211192745; 
 Thu, 14 Oct 2021 04:33:12 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id v15sm1120852ilg.87.2021.10.14.04.33.11
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 04:33:12 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id x1so3308709iof.7
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Oct 2021 04:33:11 -0700 (PDT)
X-Received: by 2002:a02:6027:: with SMTP id i39mr3396022jac.91.1634211191475; 
 Thu, 14 Oct 2021 04:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211014093112.3852491-1-fshao@chromium.org>
 <20211014093112.3852491-2-fshao@chromium.org>
 <CA+Px+wUKXJ7a9th1HyxvCgDTQXL9kHtZH+O9z9oRqCfcF8H-sg@mail.gmail.com>
In-Reply-To: <CA+Px+wUKXJ7a9th1HyxvCgDTQXL9kHtZH+O9z9oRqCfcF8H-sg@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 14 Oct 2021 19:32:35 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngFY_LMQrzGpKXUt9HOJnoBvBoL7MV9sKSUJd0xOHZtZw@mail.gmail.com>
Message-ID: <CAC=S1ngFY_LMQrzGpKXUt9HOJnoBvBoL7MV9sKSUJd0xOHZtZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mailbox: mtk-cmdq: Fix local clock ID usage
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_043314_326883_20B1F6C4 
X-CRM114-Status: UNSURE (   7.69  )
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

On Thu, Oct 14, 2021 at 6:47 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Thu, Oct 14, 2021 at 05:31:11PM +0800, Fei Shao wrote:
> > +const char *clk_name = "gce";
> > +const char *clk_names[] = { "gce0", "gce1" };
> Does letting them static make more sense?
Yes, I'll send a v2 later. Thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
