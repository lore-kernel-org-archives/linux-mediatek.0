Return-Path: <SRS0=9UGu=ET=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B159FC4742C
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 08:13:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F7D3221EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 08:13:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g75S0B9s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IK6jsPcy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F7D3221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RMkttQ14sLh2Damb/dI7TRGkWI3yT4Kv4vFjm8jO6Ng=; b=g75S0B9smFkapXa+mmW+vnKHR
	mLJ/c4iU6cNBlF7qwZ+Ip0NG989eZkb3SxyyVikTlnDlpa3nujsprNUxQXyRvO0LOIec6AN8x8Fk2
	Xqu2v9lqWNHJo1L6zjTKNZyhl5NRfay+pqWrGDJCH2zEAZGnB3pBCJfd6tEL5s3xlokuhZ4Va+FuH
	XPiq02aaEM9ErwVknNoAYsJjG3SYlUeltUUXzM3xjyfWGievWbywDzhRKWyGgtb3XcQCiEo1r7hrr
	8Jz64OmgnBeUtzsrlWAMIfnkAWYK8t7VFK7MX9pdgEtFxpUr8e6wsxHxQyQQDwRVtwYEvYtwy4amD
	X1ZyuvVVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdUCj-0001aU-Qa; Fri, 13 Nov 2020 08:13:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdUCf-0001ZW-1p; Fri, 13 Nov 2020 08:13:05 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 27387217A0;
 Fri, 13 Nov 2020 08:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605255184;
 bh=uzHAiLbo+aC1ss3zjuPDQuBqsIryl2lKizi9018PHyk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=IK6jsPcyOcr4aMCNj5/GPq39a3wDr8cQj5QvPLSw/FOy45seu0O0TNCvzTScIG0mu
 AzP38sj/boocBTzJxqp/h20mnZkNKdMOY1mD9zRlcJuEnHNuhbKXCOezo9gcaz0FBV
 LMIXMg1o+ibBnZvR5VwD+/LKsHSBbeZqoneVt984=
MIME-Version: 1.0
In-Reply-To: <1605062036-12735-1-git-send-email-weiyi.lu@mediatek.com>
References: <1605062036-12735-1-git-send-email-weiyi.lu@mediatek.com>
Subject: Re: [PATCH v2] clk: mediatek: fix mtk_clk_register_mux() as static
 function
From: Stephen Boyd <sboyd@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Date: Fri, 13 Nov 2020 00:13:02 -0800
Message-ID: <160525518273.60232.13374675894733235790@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_031305_202905_B8DB6FC1 
X-CRM114-Status: UNSURE (   8.70  )
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
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Owen Chen <owen.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

"Fix" is a little strong. Maybe the subject should just be "Make
mtk_clk_register_mux() a static function".

Quoting Weiyi Lu (2020-11-10 18:33:56)
> mtk_clk_register_mux() should be a static function
> 
> Fixes: a3ae549917f16 ("clk: mediatek: Add new clkmux register API")

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
