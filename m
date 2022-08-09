Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1F6C19F2D
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Aug 2022 13:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yBpUGfZbdMabjzikGKdcUT0TODwCx9uSyAd8Z6Yn9s=; b=1SYwd2UHOcLhT+L3bVnqPf6r30
	s9uR+qpw1aGd0WDRcoMFFBnLmyFV8T2+4UKzxF/RRhIW6n/XyhZ1y6gX+uP0lNaV92Rr3wtZ9uUBK
	9L4LHNxpLSAEiUPz7iBVYKM8FoYo6DUXNUKWSkjpJ4uLhXJ6CxPOsbHxtGzFdtuh0gkR43GrUIoZ9
	lKzVr3/Lj5fXB6oUbWDIdZBf/Kf3yLKQtwB1FFy5wwjahdSHdF/yzfTKAx3PYkEAj+uq/XYhy9yAU
	8G8aLt9HLi9QOt0/r8Nbqdewt0gQ4XzWTYPByxTIXhVeORAL6JCR6TFnlFtcrKDAHwo2Bi8WJjH6M
	Lj7s5weg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLPg2-004Dz6-Mr; Tue, 09 Aug 2022 13:53:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLPfn-004DqV-0Y; Tue, 09 Aug 2022 13:53:32 +0000
Received: from notapiano (unknown [193.27.14.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 31A1C6601C45;
	Tue,  9 Aug 2022 14:53:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660053198;
	bh=R+CpuZN1Sl+R1CObLrG1wLITHiTzHmjmpta/SIREkdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SjuY2JQzbM0PFwmAXUkG2NewMPwh5uPBzPQkoYv8b+NViFKYoRaSGYgXA6YSAWYna
	 qSBCjU78IGhJ0uGfuZn1Dm3GK3sBSeTGvJn1h4XdjaUwFgk2W+FEOhGkRDDJFRzjOJ
	 h6KRVfb+d4ZURdxwDr4dcpUa4or57PdiFRkAIwdaxAEEn9Px2t9oVIl/E5wlAs04f8
	 X9cns2SgL1slzGdaZ5yS6uInTQxTVkc37bwEle4BoVpSUOeSYyFPhU4OJDaxvVrrlC
	 7CWGQFRiCPv/rrgLzG7f46/tSSyyk5QXckkaePiEdtklThsMY+ItVw04TaYHAG3H3X
	 XVOk1qLihA2aA==
Date: Tue, 9 Aug 2022 09:53:12 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>, iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v5 02/20] dt-bindings: memory: mediatek: Update condition
 for mt8195 smi node
Message-ID: <20220809135312.hadcs7ti2cgyyuez@notapiano>
References: <20220804021553.14867-1-tinghan.shen@mediatek.com>
 <20220804021553.14867-3-tinghan.shen@mediatek.com>
 <96e66425-ff2a-4640-8b96-48fa39943bf9@linaro.org>
 <6a1977971317059fcfad685869b6ccf233edcb68.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a1977971317059fcfad685869b6ccf233edcb68.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_065331_252855_6A91ED3F 
X-CRM114-Status: GOOD (  15.33  )
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

On Tue, Aug 09, 2022 at 07:01:10PM +0800, Tinghan Shen wrote:
> Hi Krzysztof,
> 
> On Thu, 2022-08-04 at 17:12 +0200, Krzysztof Kozlowski wrote:
> > On 04/08/2022 04:15, Tinghan Shen wrote:
> > > 
> > > It's because the 'mediatek,mt8195-smi-sub-common' compatible incorrectly
> > > matches the 'else' conditions for gen2 HW without gals.
> > > 
> > > Rewrite the 'else' condition to specifically identify the compatibles
> > > that utilizing gen2 HW without gals.
> > > 
> > > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > > Reviewed-by: AngeloGioacchino Del Regno
> > >  <angelogioacchino.delregno@collabora.com>
> > 
> > Unfortunately, your patches got corrupted.
> > 
> > 
> > Best regards,
> > Krzysztof
> 
> Do you mean rebase to the latest linux-next?
> I'll rebase in the next version, thanks!

Hi TingHan,

the issue is that some line wrapping happened on your patches, which broke tags
and also the diffs themselves (it's very obvious on patch 3). So you need to
sort out your setup so that no longer happens, and resend the patch.

Thanks,
Nícolas

