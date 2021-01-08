Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7B2C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 02:53:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4F86236F9
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 02:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4F86236F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4RRpEt7SYmVddzqOsGIqLjyTn6h3ZhuQ+ffMlw3MiD0=; b=2Utx95x1YLqYQ3YQnPNAV55Df
	qJVtGTFlznTzIxM9o/foC/jlO9HNfjP0QUhB/okfxTzFUs8/3kIo7fcm95NoX6uoB+ObO0rEGtdMB
	ym+UC8ZvW4DLptbwh28e27dqe0wgpwzJYjOAhRa+Sfh9Hd3CxNv8gtxfNN0Bgos05cQ6XgsO2T7cK
	FnsY9MIL14sK1OUj/nVOU8MFooTWVvRzOpUU8mY7YW5Ch+B1gzExpm/yOc9x1SM1ouq3bUwwpc6es
	3i+ge4pxmWEB3za0l7Sh5M/wg3t2XBFv5GcBjUKaLiC4k/AhK+c6gVGgUzVunYwTHTbyadi7DpzfX
	LoSEFHzrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxhu7-0007j8-KL; Fri, 08 Jan 2021 02:53:31 +0000
Received: from mail-il1-f180.google.com ([209.85.166.180])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxhu4-0007hj-5I; Fri, 08 Jan 2021 02:53:28 +0000
Received: by mail-il1-f180.google.com with SMTP id q5so8874584ilc.10;
 Thu, 07 Jan 2021 18:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=69Ai8HKbknhZURPxIt5QF+kZu4eC3CxPN2pRYOgxhpE=;
 b=SWBTWsu8iTOQLhR7MtZRMIGFMXGOuBiQHb3v5k3GUet0b9+Xagk3nhPBJ+ZBAThSJl
 B1iX6qLMWQ498mpCPT2BnSxtO1KL1fAv1XAuNlNEkAjMA3pjLREr343Qzx2Urb2MHfcI
 Cxi5jpAc6DDEDfr+772a50bjFgcwIzaifQIT4hKOEPbSYD2IAuM6FwWY7LKprahk4cVQ
 7tvLut/luEyzpTk4nGBT/dI4Su7zUYvl3gihay6zl0G7dqR+rvMgSQjvT9ZfHTeRGD2E
 7nhamwvoXU9VLf6tQVPkM/F0kBteFqukb6MCEluRIwEzFYsdze8t4Yb/84qoOs2gKkfF
 ZsHA==
X-Gm-Message-State: AOAM5311D3qjGYRYUGJIdwvMMxHSgYlwxZLNc3Meoi0uoUJ9PUP2JWRD
 fl9/bHvE+IcTgzSbIsx+QA==
X-Google-Smtp-Source: ABdhPJz0n8Ax1fYCmyGE1t0YnZvd+uYz6siGhRJeWz7gpuf0/CLxB7RETkZBZu7XV0Njtaia8G2Wzg==
X-Received: by 2002:a92:d8c1:: with SMTP id l1mr1893601ilo.178.1610074407262; 
 Thu, 07 Jan 2021 18:53:27 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id a4sm3110909ild.5.2021.01.07.18.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 18:53:26 -0800 (PST)
Received: (nullmailer pid 1784130 invoked by uid 1000);
 Fri, 08 Jan 2021 02:53:24 -0000
Date: Thu, 7 Jan 2021 19:53:24 -0700
From: Rob Herring <robh@kernel.org>
To: Henry Chen <henryc.chen@mediatek.com>
Subject: Re: [PATCH V6 06/13] dt-bindings: interconnect: add MT8183
 interconnect dt-bindings
Message-ID: <20210108025324.GA1784095@robh.at.kernel.org>
References: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
 <1608790134-27425-7-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608790134-27425-7-git-send-email-henryc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_215328_223686_FF58FB12 
X-CRM114-Status: GOOD (  10.55  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, James Liao <jamesjj.liao@mediatek.com>,
 Nicolas Boichat <drinkcat@google.com>, linux-pm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Fan Chen <fan.chen@mediatek.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Arvin Wang <arvin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ryan Case <ryandcase@chromium.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 24 Dec 2020 14:08:47 +0800, Henry Chen wrote:
> Add interconnect provider dt-bindings for MT8183.
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  include/dt-bindings/interconnect/mtk,mt8183-emi.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 include/dt-bindings/interconnect/mtk,mt8183-emi.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
