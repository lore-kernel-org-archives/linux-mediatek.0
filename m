Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59C4C87FCB
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Aug 2025 16:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkxIzZ1WJhUctEmEC9hbfaJYZPCzsM0oDIdvRVh7tvg=; b=jX2aOoy/OZRYGOON66ATyeX+5Z
	bS3l1L2ZA9w5OHTeTO8BMPrszmbnawch2wyNasXeKZhlfu/VDaTbibb5NkEOeFvLqxgZvQrWw+Rgv
	794RetaAcrYICLtykhvADj7PyJk2t8adzgi3y/lMfPIvTXaMrXXcdyUp7sQhPYwi5NEcMydUsDnqd
	a6R08b/1FtRL4gyQ5SkG+VJIiifFwK0EQPYsjGV8QUxG20CiXvEHywxiWhfIVId4twS+Gw4put3a5
	sD7zm32PiffVnEA2kjgeIA7MnEuCjdOBrOpLMgx+G7WwHLpea4tsr1TS+iT4pETCtDjmnLG2w4Yw1
	+Cq1alzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyKO-0000000B0nj-1c2W;
	Mon, 04 Aug 2025 16:46:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyHm-0000000Azr9-2V2v;
	Mon, 04 Aug 2025 16:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EkxIzZ1WJhUctEmEC9hbfaJYZPCzsM0oDIdvRVh7tvg=; b=T5DSSnkkG5IyA/fYWXZKneMbib
	P2t5pkr1TU2TgeY/bIpbXuCx34VMyV0unsmy1Z8YV8vZSqLagz9fBeR2dHjKsAv54svuuDvYwiRJu
	l9r5v+tb3laxqQ1Z0k+eeJ9xXQmN13fnK4o5sY8+NjFkdnu8al4jM4KAcJmuJbCLD84o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uiyHc-003jDs-Gg; Mon, 04 Aug 2025 18:43:32 +0200
Date: Mon, 4 Aug 2025 18:43:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v2] net: airoha: npu: Add missing MODULE_FIRMWARE
 macros
Message-ID: <5c4c928b-d660-4ef3-a306-eafe688286a9@lunn.ch>
References: <20250801-airoha-npu-missing-module-firmware-v2-1-e860c824d515@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-airoha-npu-missing-module-firmware-v2-1-e860c824d515@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_094342_632079_02D4F671 
X-CRM114-Status: UNSURE (   6.32  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Aug 01, 2025 at 09:12:25AM +0200, Lorenzo Bianconi wrote:
> Introduce missing MODULE_FIRMWARE definitions for firmware autoload.
> 
> Fixes: 23290c7bc190d ("net: airoha: Introduce Airoha NPU support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

