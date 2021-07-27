Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F1DC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 17:55:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 325DA60F91
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 17:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 325DA60F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3QPJ0/Rk/ZaJIiOYPiXifM7T+v4mLhUg19b5a2uj1wo=; b=uft3WTwNWUEdPz
	0tgL0DWLu9G9Y5jyUsCrmX/uLHCyvYuQVKMhRswc9KBHrsyIbZQL/TvuuBWC3xl27CxW6AnmrANTu
	YHHAw8SsB4qkysyr4JUummQLi/G95bDLtGYPSrm0IDhl2WDtnsfO2oMMVn4oBFK3NpIHx1MpSP9eA
	6K+jUSkVwQMYJy06OJ8oEBTZWX+0L7ZJILRK2DqjayjxUDD0wEraXBUt+vAHsyzHuoTejqmpHFVut
	RapeVHsuYi0cXe8/qP70kxCcmaqBxyclUl/CUCDI0e/NsWy7gXQ+WuUoO/brgX7Rv/zA6Ng6lOyQ7
	e/ekJm7aHKRcjUawNGCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RIM-00Fd3W-Cx; Tue, 27 Jul 2021 17:55:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RHX-00FcfJ-Kn; Tue, 27 Jul 2021 17:54:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44C0A60F4F;
 Tue, 27 Jul 2021 17:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408459;
 bh=OzNU4k2gXkSYVCCyhRi+vZhZWuaJom9zUNNx43JBdgY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=JOIIuubBJ9sxNkIBsZaQrmb3Qf25XLfwSUZwcP0H83jyV8JsIE2zbrAnWUG1ru/Ea
 S8GkL/RsXcJBJ6Ovw6DNtZYCHXtdqYJIy88arFHUpEOkAG3mayPcPYQiGsttXRxnNJ
 xVZ7p3kb6vb5BpjMQofBWEQoG9QbVPWEq/j0axEvh8g9WK5xcRTKqPeD67rfwY8b+L
 vfEwy7qh2AYnL4fkP1RruyDLndm372wzxCTeGkhgx7f17GY3QmWJ9tOhsfHk1IkrrJ
 XMkhl986s7w3AHVkx3IGICg4neLgi7FjUdSOC74bheikAZlnsjAhNlt5MB6Ewi5IFE
 fo1cbHQ0VcaeA==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-5-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-5-chun-jie.chen@mediatek.com>
Subject: Re: [v14 04/21] clk: mediatek: Add dt-bindings of MT8192 clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:54:17 -0700
Message-ID: <162740845714.2368309.16206704563987773970@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105419_776635_FBE2E2F0 
X-CRM114-Status: UNSURE (   4.85  )
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

Quoting Chun-Jie Chen (2021-07-26 03:57:02)
> Add MT8192 clock dt-bindings, include topckgen, apmixedsys,
> infracfg, pericfg and subsystem clocks.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
