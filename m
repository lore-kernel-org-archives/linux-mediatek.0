Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A4EC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 23:12:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B5CB21D40
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 23:12:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R2z1AV2+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6uByxTk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B5CB21D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ylesomMjAKuQ+D+DThyVbD34SFREC7jFJXSfMypBN84=; b=R2z1AV2+umR/+z/uiyg6l6VPy
	o/fnXthiz078L5PDsErrxuEOgNfu6Ec7Ifq6cXa3otnM+QKdptgDGdwJHkFKb8dRtDrPZinmvqrYN
	pzEx0TeuYbPEdLKOGdcHeZkdl3sU26jQkhIpDDdxbGZN0BBtbLXz4ih61PMzqAqb9kIDZl9m8JcOe
	Gl9J21PaLXUlf246gyRgMvCrwDPwPXVT0miIjahtwJV43L9Y96bqxvR84Gzk/uhKeYLJzBibaaTlQ
	/Y6M2ejvaV3j7dq1NLB6MtoFieiJzN06PfD4dJDjD8miXrLfvL9D3k+Ms7m3K+39sMHRu5Ndy+UFk
	ATeNdhAJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSTSj-0005qB-6t; Tue, 13 Oct 2020 23:12:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSTSf-0005p7-FM; Tue, 13 Oct 2020 23:12:06 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C166321D40;
 Tue, 13 Oct 2020 23:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602630724;
 bh=0zBPSpHevmdq1uHIA4+p1uLGrJhk+puG39JIQUADrUY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=E6uByxTkGm1IvcvRNNDMXxLnxPNWajuOd5IxZeTX3oPYVop6IH0EdSfk1GHxMq/Br
 rf4810ui9zUhVY/9HgSzwRmDpz2/pXn9csKjDtteXCYT3XjWanp9ium8O6e72aU3+t
 Zuve/TQOeQqaG74zVSEc716JxZ2yLbKaqCMoc4fU=
MIME-Version: 1.0
In-Reply-To: <20200918132303.2831815-2-fparent@baylibre.com>
References: <20200918132303.2831815-1-fparent@baylibre.com>
 <20200918132303.2831815-2-fparent@baylibre.com>
Subject: Re: [PATCH v2 2/2] clk: mediatek: Add MT8167 clock support
From: Stephen Boyd <sboyd@kernel.org>
To: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Tue, 13 Oct 2020 16:12:03 -0700
Message-ID: <160263072366.310579.8925835742463532920@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_191205_883886_3D2EFF8B 
X-CRM114-Status: UNSURE (   8.13  )
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
Cc: Fabien Parent <fparent@baylibre.com>, masahiroy@kernel.org, krzk@kernel.org,
 matthias.bgg@gmail.com, macpaul.lin@mediatek.com, ck.hu@mediatek.com,
 owen.chen@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Fabien Parent (2020-09-18 06:23:03)
> Add the following clock support for MT8167 SoC: topckgen, apmixedsys,
> infracfg, audsys, imgsys, mfgcfg, vdecsys.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
