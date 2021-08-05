Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F05C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 23:50:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F5B760EB2
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 23:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F5B760EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSsKBNncao4wkF0sHn+Q6BfX9Cd12lWaZNS7jSkDeok=; b=ltTpnU0p+fridy
	lbI/kS//Ha6iDZyf4BVl5D1DINkIR5XUdsewFveO+G9PRpG823px/QgBQeJnMhyHIqZy3+DNSVJFd
	hT6feWCWVFwjDxPJ8K2k++qU9nDe5SfQ/JkegUEDZ2xh4DyorOS2CBpiBEq9TFCvobX+c1EGUZa2G
	8s7He4SzsVeKb/MBXODAyctPopOPHg+yXaASE5nICtf6/WsLFttQgcoVWkFDNOy2FV73DNIEGGtxj
	T5gAjS2LHBGE7xKJepT5YA8N2Be3/ZSBDFzS+C03cohL53GPPmwNBv5jUKcBTcKLdrckHU9cMJ0k9
	M/mCJC0nWfFYr8Mzsyjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBn7p-00B47a-Qr; Thu, 05 Aug 2021 23:50:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBn7a-00B45E-JS; Thu, 05 Aug 2021 23:49:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82566610FF;
 Thu,  5 Aug 2021 23:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628207393;
 bh=V2m0cMUtBRpLdmQUhz7CRPUwiosgV5Nj4ymrvGsBhTE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=jHXxfBk9h03LTPzOt+gDHoTsNWmvz1aBsb0LedGizcWznENUUMWuONDNpkXGEGHib
 VgJ2UK4XOSWOOmw50st5WaXvzsy4p28oDR77VYegqv9/p5eS9d5771sE57LLA30Q8r
 tu8M1XK5wxNiiBWOI53PViPccgqlCTqRBz8ISdl+kEWqqeDcMAEZBesEQS3EWS5Epp
 wewFc5IMoup6Na6qPEp5EZlVdO/li7/FWQmvKuoTTCgJhdsRA83HHatgXniSQHKKSr
 vbNnIR9sCpU1ZmNU/fsCKPaxlsBfVyiCASrGzd/6/ChfgrVNj6IyQsO/XTlKoANyCc
 KJk1poxYwvXhQ==
MIME-Version: 1.0
In-Reply-To: <b98aeeee-c544-3025-cc06-ec04be7ab638@gmail.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-3-chun-jie.chen@mediatek.com>
 <162740843452.2368309.13157283201271440368@swboyd.mtv.corp.google.com>
 <b98aeeee-c544-3025-cc06-ec04be7ab638@gmail.com>
Subject: Re: [v14 02/21] dt-bindings: ARM: Mediatek: Add mmsys document
 binding for MT8192
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 05 Aug 2021 16:49:52 -0700
Message-ID: <162820739221.19113.17602385426851379006@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_164954_699062_9A4E0EBA 
X-CRM114-Status: GOOD (  10.30  )
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

Quoting Matthias Brugger (2021-08-05 08:35:09)
> 
> 
> On 27/07/2021 19:53, Stephen Boyd wrote:
> > Quoting Chun-Jie Chen (2021-07-26 03:57:00)
> >> This patch adds the mmsys document binding for MT8192 SoC.
> >>
> >> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> >> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> >> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> >> Acked-by: Rob Herring <robh@kernel.org>
> >> ---
> > 
> > Applied to clk-next
> > 
> 
> Please drop this patch. The mmsys binding will change to yaml in this merge
> window and this will create a merge conflict.
> 

It is particularly difficult to resolve? linux-next maintainers seem to
have resolved it so I'm not very concerned.

https://lore.kernel.org/r/20210728124304.1199-1-broonie@kernel.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
