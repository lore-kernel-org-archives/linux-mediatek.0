Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04393C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 18:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arJIISCh5YoV/Wx1L/wyXFgny61ye1Apfts2p9I3KMU=; b=BjWQAWd8c7krLT
	czV1kCfM6kqp6SdAxpZlH495P+XkBISXiqpkLzyyupK4+pncgl4L73FWPO1fckrsLfpKGq/gC/jjr
	SnnQaaMfFElQL98WkYUjaysNNiKlulYU+6qNJz405C6lkqzAnOnSjtPUR20scmWfihx+sjzR5AD9I
	+N8s7t3EeJZxbkXM/tBAEIOW9+7lWE7FjRyPjyhJHgfmrCnv4Ymv9wS5BurChGvtfo7GfZRGah2Ja
	iBzqlnVMxKHjZ/NDIjlAKFA93xEa3T+CkUE42E4dVRNkhHRumuRJNFtix4PJoH/U7d+mYaimbd7yH
	hLI+EShB4j8X8uQhb6mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzjaO-009Ol9-0t; Fri, 10 Jun 2022 18:42:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzjaC-009OiB-Ap; Fri, 10 Jun 2022 18:42:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 00D1CB836FA;
	Fri, 10 Jun 2022 18:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B840C34114;
	Fri, 10 Jun 2022 18:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654886525;
	bh=NENNkFJr9jYYklV27x0XlIpa/LcG4dbeezdHX97GwK4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fUta4A84kEUtsm7ddSAblIqlL87cgvTZ4a8HrNwr4C23BrM0Hey1illCxSLfYX7jy
	 U8IIID6gR1v4OuRxOPj+ryIcsZeFWKV0yaZnx8hhJpoPrCox5uZxQm0fa74igHG5BU
	 1ayTYILzpVZ0P+wsvrjqBCS+ivrcFhM/ko1a7voHMYVpcK7yyRSJSAxs1prG7lVtYi
	 Rsi9RCe4VlGpUvcV4fR/5fTLzj3rtZzcEe7iB3alYjKW8UroIisOyKa03tNwCWjWnK
	 0CTT71TyzZdEk1vCuSzLUchCUIfXhCVchPtP7GP44NNkGP4vSgRM9iwnDMQ0fL5pva
	 PmygosvWNjeag==
MIME-Version: 1.0
In-Reply-To: <20220523102339.21927-2-matthias.bgg@kernel.org>
References: <20220523102339.21927-1-matthias.bgg@kernel.org> <20220523102339.21927-2-matthias.bgg@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: ARM: Mediatek: Remove msdc binding of MT8192 clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: allen-kh.cheng@mediatek.com, weiyi.lu@mediatek.com, chun-jie.chen@mediatek.com, linux-kernel@vger.kernel.org, ikjn@chromium.org, miles.chen@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
To: matthias.bgg@kernel.org, mturquette@baylibre.com
Date: Fri, 10 Jun 2022 11:42:03 -0700
User-Agent: alot/0.10
Message-Id: <20220610184205.9B840C34114@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_114208_561179_3036FF87 
X-CRM114-Status: UNSURE (   9.43  )
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

Quoting matthias.bgg@kernel.org (2022-05-23 03:23:38)
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> The code controlling msdc clock gate was moved inthe the consumer, the MMC
> driver. This node did never represent a working implementation of any
> peripheral. It was just a lonely clock gate that wasn't used. Delete the
> binding description of this node.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> 
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
