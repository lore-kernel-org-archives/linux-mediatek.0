Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6491CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 09:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDf9EkwnvIGwWzQo81i7z7g73c304kBtfKtXhbNpgRo=; b=Ka9t6a0EQEa2Mw
	aTZ6RQPrIKIVOnBvHSHaLexR8YlKQUY4zllOiUFyn56Jt23jVGMXDC6uWdDkLe/Hdr0RyVLJkRt/O
	OlNWGMInyNKovrAZfNbGlKc/tTZd4A940Skp5dxWaj6HBOsIQtoHA27EEoNwNrpdEIjc8CDG623r7
	ER3hdoI+HsZ1kXKbDsCKWA5jDSOSWca+kWIKpMnIleQOrG2tKOE9HcZegttgMOXOta+aVhRVvcCb8
	/YhJTBiwn1MRg3LhLyzlUFS1bQP2tRm5STU6SXWdGHBDefezNPngD2/yeYVGOK+qmFehoX9QhGJMQ
	07ltNO5O7MkNrnR1QTlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNWTi-0042xW-Hs; Fri, 25 Feb 2022 09:01:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNWTT-0042sd-Sn; Fri, 25 Feb 2022 09:01:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 85812B82A97;
 Fri, 25 Feb 2022 09:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4543C340F1;
 Fri, 25 Feb 2022 09:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645779673;
 bh=GCmgH9QxIie0Lmk0KfGGmFnY6Rs9w8GpqnAT9TcjK5o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PY2HzAPBzy7DU+rIcW20j8VXOXmHbdyIeVKtnUI+sS0uLFAUJvKj2NpybLrwxLVuJ
 Q6BSeqLv0P4EWaWpQjq6Jx6eKkAJ3SBYoryAWx7BvV/gUYCpfi+YThAiyn5S3+ewq+
 7ht8EFSOCpJTntniHuh1wrn3QFkQdn9FAqPoiC76uxf2EHL9/EorChGusD/C07PQFr
 QNKvTetMr4vHTGGN+5KYyy5c+dhDSKetW+YkXmM/Mbbkq/SlM9NXvfHn5EHOBDWEvS
 5iRSjwWTbIFTehM90Me8fDHU8ZD17iVbYlMrfcRtML/wnaTZq/ZkparoDEQL+cDo5G
 FZpKhZq/2Fnug==
Date: Fri, 25 Feb 2022 14:31:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Min Guo <Min.Guo@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/1] dt-bindings: phy: mediatek,tphy: Add compatible
 for MT8192
Message-ID: <Yhia1QX2j8mXwEqB@matsya>
References: <20220224130822.11292-1-allen-kh.cheng@mediatek.com>
 <20220224130822.11292-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220224130822.11292-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_010116_097477_E4FF1100 
X-CRM114-Status: UNSURE (   8.65  )
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

On 24-02-22, 21:08, Allen-KH Cheng wrote:
> Add MT8192 compatible to the Mediatek T-PHY dt-binding.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
