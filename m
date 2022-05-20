Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CC9C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 22:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7eSmjyRbQIZyS4UrQ8YvAFtfQfIQzP2or66fXkJ6JI=; b=cQUxKQAI8DbDVK
	rBAXwfR/7oqc+9TX9gDsK6i4qkKB/gRU4yYfwSkvepSVLJ2Mx63OkEBvjUssoOzG07Q2YKxWE+Mip
	+JIJtGTaRDuxb2PMRFcKBiVc2V7N+AW9YYpUizjAEhnwVzyvqItCBs2yRyGJ5gsGP/SXLMo55teLK
	lqwm7fXpVFhYgFo+te4aIG44HSUkqn3MHCjbqj5RlEnUfCzq5eiDbvPOOD5L9+VltBjijC6f3amo4
	1Lt7MxVeK+TSMsvTf/01uL/JtcZci8x5h4Uxpv+UIrIEadb2latoiOdwJDgc8gZpjRik6Jl/Y7iEc
	dnND0tzxwfLygzMw79DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsB0N-00EkDa-NZ; Fri, 20 May 2022 22:21:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsB0B-00Ek9F-VP; Fri, 20 May 2022 22:21:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 79367B82E17;
 Fri, 20 May 2022 22:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA73C385A9;
 Fri, 20 May 2022 22:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653085299;
 bh=qJwASo9Th0s9B1XSYYW0kv0RCtC/qm3SNe5fIxpPzqk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ldtVo39yD8ihAPF/im536M8gIymZBYh4K7JvPCFy9MwHQ1MODy1tspqewrOnr7c0U
 RtKekES6aGdfhgfcnzAxm7wHIFFWWvoQ6N+jZ0WryofsBO0v8+P9v6UtMo0n8FEmCE
 jg6DlQ+aJqG67s7H1PiZxCNedhzVcANf9R5epbGCawA6p+4u4RuVPZMO6khfuLavHU
 7RLfyiGGkQSEjz6RWf7AzEqIe7PsvkcWuK/3FHFHWuIJNOLnVvYsOYIfY54Wzfj9qc
 UBSEyU1AuabTZujmTiUbI+N0P8u1E4Ma+v8C7DlRE2mgtHq9BehLu/bNv3zdxYAcYa
 xrl6PYvCgsv5w==
MIME-Version: 1.0
In-Reply-To: <26c2fb0c-e58a-5864-4256-f60f948ca634@gmail.com>
References: <20220429123133.28869-1-matthias.bgg@kernel.org>
 <20220429123133.28869-2-matthias.bgg@kernel.org>
 <YnGjScfQA9axBYBO@robh.at.kernel.org>
 <26c2fb0c-e58a-5864-4256-f60f948ca634@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: ARM: Mediatek: Remove msdc binding of
 MT8192 clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, allen-kh.cheng@mediatek.com, weiyi.lu@mediatek.com,
 chun-jie.chen@mediatek.com, linux-kernel@vger.kernel.org, ikjn@chromium.org,
 miles.chen@mediatek.com, linux-mediatek@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 matthias.bgg@kernel.org
Date: Fri, 20 May 2022 15:21:37 -0700
User-Agent: alot/0.10
Message-Id: <20220520222139.2EA73C385A9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_152144_203072_B0C8FB32 
X-CRM114-Status: GOOD (  12.83  )
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

Quoting Matthias Brugger (2022-05-05 09:47:30)
> 
> 
> On 03/05/2022 23:48, Rob Herring wrote:
> > On Fri, Apr 29, 2022 at 02:31:31PM +0200, matthias.bgg@kernel.org wrote:
> >> From: Matthias Brugger <matthias.bgg@gmail.com>
> >>
> >> The msdc gate is part of the MMC driver. Delete the binding description
> >> of this node.
> > 
> > An ABI break is okay because ...?
> > 
> 
> Because the code controlling the clock gate was moved to the consumer. This node 
> did never ever represent any working implementation of a peripheral. Just a 
> lonely clock gate that wasn't used.

Can you add that to the description and resend?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
