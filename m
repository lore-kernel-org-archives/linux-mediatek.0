Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF2BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 09:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9maF/VpJ6Xydh0xiGGNFo1GFirSnGKbZz12/YRCS7M0=; b=mK87Fsk/kEuvVx
	TdEvc0+pvBFIynD+KBKWnXxUqPIAnVktSYcwKSaY0+HPN8RUSurBJTGSAhZLVX+y+yZp+xiUvcIT+
	Yy69kMAeE23aadNnNG8nqeAIRGjTeHrdiH3/a4/EHjhNVS9PRQBwMn++oPpky5eltou+VTMEmVoto
	nTpy5GQgPj66s71Jp09MedLY0N+rd6uXssfd67JzbmXK6FrSnLROM5xwlGD+fDJO24rLRmBkZlRkH
	uttoNdv10qKQNvjyOtBdfrRAW+LMXK1NbCZ8fcJ6lcdcnS2fyX3I+HshlM6s+deisAOcR7BG9mK3d
	zxS4Ykv+gflOA5aip05A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk0bo-005mSZ-5Y; Thu, 28 Apr 2022 09:38:48 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk0Zl-005lX8-OY; Thu, 28 Apr 2022 09:36:43 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 37BE72FB; Thu, 28 Apr 2022 11:36:40 +0200 (CEST)
Date: Thu, 28 Apr 2022 11:36:39 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Rob Herring <robh@kernel.org>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: iommu: Drop client node in examples
Message-ID: <YmpgJwhAeDxugaYk@8bytes.org>
References: <20220422192104.2591462-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422192104.2591462-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_023642_002423_4D9CAAA8 
X-CRM114-Status: UNSURE (   8.12  )
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

On Fri, Apr 22, 2022 at 02:21:03PM -0500, Rob Herring wrote:
> There's no need to show consumer side in provider examples. The ones
> used here are undocumented or undocumented in schemas which results in
> warnings.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied, thanks Rob.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
