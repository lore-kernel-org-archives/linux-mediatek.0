Return-Path: <SRS0=zFd5=FP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26323C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 13:52:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C49C123EB2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 13:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C49C123EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ud9mOa63czymJluRfgUR0sk+SvipHUm0QYf4ktvLzyk=; b=gezrxaIWsViutbilr5/k7oU6U
	AK1wIJXGGEPfmO+kEPI2WYQIHiP/GzYtIKOglIBu49UtiD8/860oUXOaUnWmSHVi6BpzdFOwZ4vFA
	3I6LLZD5clo29PXjvNIcSIl5VbWK0Lt2zcYxbHzuq5Sl1BOOzaZjf3O/+O2uHShA2F947ACzhRUcu
	1Qx04mNznBJREEgzXkjqWs3Uvgt8Db81fE8Gdv0by7p+F2h98kh9Y5/2E2N7MLnx9f9yqmJGbdsKD
	EteELbfEilyEGeNaRI5//JDSTcoqra7IUxI+X3cW241zu7uuBlJfZLXBd0J7fde9PgzUE3Xw4G113
	ATlgCrhSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kniqC-0007bp-KI; Fri, 11 Dec 2020 13:52:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kniq8-0007as-Ld; Fri, 11 Dec 2020 13:52:09 +0000
Date: Fri, 11 Dec 2020 19:22:02 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607694727;
 bh=CkyUtDlHQfAS3/S1JQPZJrxCGgufSUyHtxYvRH4l56A=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z9UDuR0hL70mgHMe9pJ19CwgXoJkzHt/QfYhkJCCIZgBde5x1WWejER3nh9S0cLjP
 sgNKb8ywzPpbE2/bUUmq1+PJYrGCDb2sVBx4pchpQ3VEf9oOTqO40bNi3BTewBlNUu
 stJqWiAe9hZ6wMXlQbNwJbVUiirvHnsZ1bESBevMhKSPXvezX2HRLCV/flZRM2+X3P
 wMNtJqcsAFcn+hMvTPON3bm/GbTLTl7VPd1TR+tK2PiCNg6lE5qKs/2lv80wrbGDUW
 IIBqjRz6ve0Smg1SQ9ffZfxF7a9+QLRUQOj0dfO6e8x1iVpXYAgrydY9OsBP+WymFs
 j+9fBFVbq3C5w==
From: Vinod Koul <vkoul@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: dma: mtk-apdma: add bindings for
 MT8516 SOC
Message-ID: <20201211135202.GV8403@vkoul-mobl>
References: <20201209114736.70625-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209114736.70625-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_085208_795028_C6CA98A1 
X-CRM114-Status: UNSURE (   7.28  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 09-12-20, 12:47, Fabien Parent wrote:
> Add bindings to APDMA for MT8516 SoC. MT8516 is compatible with MT6577.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
