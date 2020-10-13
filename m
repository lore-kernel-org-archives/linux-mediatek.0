Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9366DC43457
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 23:12:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D11321D40
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 23:12:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1b/xUwvb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CV8FwXu0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D11321D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q7Q1C5o2JO/oAVdVILB3x4ArBtKxK/qIQNJWpsQsoNU=; b=1b/xUwvbn8QLw9A55zFfDeAzK
	bfx3fcXBX4oBQB0JJXbYMpcOkIpxi1Kj7t7JMSKJ5TRYGA4foQB7w5VL/yiM9jiOimB+PSPIRzU9q
	oOJCLEOGI6cyS+BXConQXGCcAOpauRuOUR8E+o3+TszmALCANI0tD3SbxCzFv7QkAKP1dDZqVjkf6
	8wo8inDRHNFUY4LDvfVmCaYfmU7ap2BJ9FK80nRxnQGUYCJJZE1zUHdCxr5WOUJzAtKU9UrJS0XAC
	DFGuq1qjUaADKAqWufIBRG1HvYrikPdukCnxRZHmlHVWyDL2CM6J6f0Rre0rRNu8RAkQKJnZtYgGy
	TZRt8ks8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSTSf-0005pH-UO; Tue, 13 Oct 2020 23:12:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSTSb-0005oP-D8; Tue, 13 Oct 2020 23:12:02 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3593621D40;
 Tue, 13 Oct 2020 23:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602630719;
 bh=tfZ1Ed/HUg6H1WyBtvVkA6Cmajtx4ciBmnMP86j4nwY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=CV8FwXu0d8tIsLdT12NMXkpkxryAcidNyeOYsTT9wxpQqyYB3OX5PMJh2PpRd5Cas
 fX1ebvi5kfURYRjHXb0yDHXPgPF11KN/uzvVC/YSyTrmlguUsDmue3QbHDJVdbscuM
 QcQbLvivOrk64HJMRQO5oEH5pWN7gedqgndgluCM=
MIME-Version: 1.0
In-Reply-To: <20200918132303.2831815-1-fparent@baylibre.com>
References: <20200918132303.2831815-1-fparent@baylibre.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: add bindings for
 MT8167 clocks
From: Stephen Boyd <sboyd@kernel.org>
To: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Tue, 13 Oct 2020 16:11:58 -0700
Message-ID: <160263071802.310579.17543538800410702856@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_191201_509024_E8962060 
X-CRM114-Status: UNSURE (   8.10  )
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
Cc: Rob Herring <robh@kernel.org>, Fabien Parent <fparent@baylibre.com>,
 masahiroy@kernel.org, krzk@kernel.org, matthias.bgg@gmail.com,
 macpaul.lin@mediatek.com, ck.hu@mediatek.com, owen.chen@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Fabien Parent (2020-09-18 06:23:02)
> Add binding documentation for topckgen, apmixedsys, infracfg, audsys,
> imgsys, mfgcfg, vdecsys on MT8167 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
