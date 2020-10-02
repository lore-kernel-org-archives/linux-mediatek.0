Return-Path: <SRS0=DbAw=DJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60269C4363C
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 16:30:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13781206FA
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 16:30:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oLE0WYUX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13781206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dowOegxYZKOhGs4jGqoSkiL3RHzCjNiIL8yG5c9NoUM=; b=oLE0WYUXJvIq711g/hYw2FDlz
	xD8HdV3BLosmw0vGCTLRHHOTW8wLdL9aF6bKU8srz8DzyjlCwCvVjFGzSDm8qSqHpdSeWXE5UZ7wi
	6ayZwm9/xN6AtNaoMBwYWSS2Y+e1+2N/2KL+rlOV18hFX1SD9JbGPSyeH7rc5FzE0UK07jMtQKOfB
	VyVX4tchupxmcgmbq9JF3o8urj8K6cdv9pjqvOlHRMcv3HEYjsOI7aIATApRjpJZy0y97wQGluWCv
	npwI4kBK5yXocBrpZrjiei31EIdyonmf5x0LMzwp/wU4+2DDxuGnFIKgC6rDjWBHXq2s9R569TDyd
	dH1E/a9JA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kONwe-00056t-4V; Fri, 02 Oct 2020 16:30:08 +0000
Received: from mail-ej1-f68.google.com ([209.85.218.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kONwa-00055I-EX; Fri, 02 Oct 2020 16:30:05 +0000
Received: by mail-ej1-f68.google.com with SMTP id i26so2794860ejb.12;
 Fri, 02 Oct 2020 09:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NmuASYfCVRDr2iLzydnzYtbC57t7PWn5hJ24ngFnw+A=;
 b=GtPajbqjspCUZB6/N+xysz4+FeS8MxIRhCysL/9ArHph2k1oPXG9uMjWp1MAip98/c
 rN6khR00raKWkbJUC5OsvA2NceFL5MhJ8fTHkGJUBpWGCJ2QElErzIjtenyd4vs510CO
 HZmjmSjwKMV4iquDDsYydQDeszyU0iL7tAMoZnEsgDMeDxCe4omPSi85xXQvotpKoKGX
 mN4C5U2RyXi7mlJ/xVx5qesl4DqgfOpq5OR7Vxs5vN/nzHj1i2FkOeWyI6iti24SVOfQ
 MdbIyNvk6DTzXfGAxz6AbsiG41okuDeFvG1fgt/1v6rH1na1EYG2EndEGCARgA2Sjluv
 nLOw==
X-Gm-Message-State: AOAM533UClmhL9Tae54yCQ/8TnFhMk075+6aBGWSyhmmC8i5A+fadUVQ
 XThs4VnuoGcUrN8xzTvrPVg=
X-Google-Smtp-Source: ABdhPJy5JKo4/ZsU95nYWl9XHoS2d/DXY0H7Q4UDI/GGeGNd2h4paMPaz2+a7Ir0z3yOHzLYkDBj8Q==
X-Received: by 2002:a17:906:4dc7:: with SMTP id
 f7mr3173601ejw.261.1601656203038; 
 Fri, 02 Oct 2020 09:30:03 -0700 (PDT)
Received: from kozik-lap ([194.230.155.194])
 by smtp.googlemail.com with ESMTPSA id t4sm1444928ejj.6.2020.10.02.09.30.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 02 Oct 2020 09:30:02 -0700 (PDT)
Date: Fri, 2 Oct 2020 18:30:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>, HS Liao <hs.liao@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] mailbox: mediatek: Fix handling of platform_get_irq()
 error
Message-ID: <20201002163000.GA6464@kozik-lap>
References: <20200827182507.4938-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200827182507.4938-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_123004_494212_6BA74E1C 
X-CRM114-Status: GOOD (  13.17  )
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
Cc: Frank Wunderlich <frank-w@public-files.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2020 at 08:25:07PM +0200, Krzysztof Kozlowski wrote:
> platform_get_irq() returns -ERRNO on error.  In such case casting to u32
> and comparing to 0 would pass the check.
> 
> Fixes: 623a6143a845 ("mailbox: mediatek: Add Mediatek CMDQ driver")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Fix subject.
> 
> Changes since v1:
> 1. Correct u32->int,
> 2. Fix left-over '!'.
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Any comments here? This is a bugfix.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
