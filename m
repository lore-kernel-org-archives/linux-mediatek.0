Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BABC25B76
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 13:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oktI9QFhd6aQRpg/GpKjNemXNmatyMuVKnzDSS+RAdg=; b=OiJW+norGSmNFwKhOAcc3VL3AP
	gYBtjDNG4+M1U/MwjvYMs6fTaoiaJR4D4BZ6GpeDs0pwNgkI+JCQesBAqn2RgUMPX7B7aOr60atjX
	uCf5Ws5XauiQmfXoPPNTmjKcsfDo6g9O7+AstWy+RfJO6QrPWka80LmpBlD+SnLT/RVd/NjDLIJ3w
	LhQPdogWk9jYj8IH06KAzTkVdqCSAwpyeB83OmurZWk5yRuSQQTtNuWYkdE6UCpIkJov58ocEOEpS
	LzIB/jqhJzKz85numHAJ77ND6SiL/nLyk0T8MQxbRDTwMU+7MIJOskXC13w2pB5pDX5BysJ5N3qEt
	fPex2JQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH1oD-000000092iw-0Bm9;
	Tue, 11 Jun 2024 13:45:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH1o6-000000092gB-0Vs0;
	Tue, 11 Jun 2024 13:45:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 46B5FCE1BF4;
	Tue, 11 Jun 2024 13:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E358C2BD10;
	Tue, 11 Jun 2024 13:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718113498;
	bh=+V3Oa1gsFlcJcKL3fpyUbpzxEIi5YIU50iTixRyZAtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eFlICVcjHAwyBKduydyPkxT4CpHSZ+dfBULdoCplkcSnuf+ml+ggJawCs8fek9aOt
	 aP64sr/6p+FnR3hq7lV3H0b5AWCleIQuI27OHCdnuhU/WxNufUcNc6b3ir6i5fHmr1
	 SB2qvXLzonZYkyViAz+TDmktKT9C9BpObvrhKdpHCzqkhDCbboVLOd8PHhcAiUie1E
	 fspJ4KbEhyKtC6Npd5obmLQwBvzxmQJ5O7d9iV3HnkPHSbPRLMDzKDln1LBvXhTDCv
	 TrEA49SRrIn2BTp+mchPCityLVy1yPyYPxlzwejmLi3CvF/EyrUNK5cdB4JbUnYzpf
	 d0fMLQiCoQ1/Q==
Date: Tue, 11 Jun 2024 07:44:57 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lala Lin <lala.lin@mediatek.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 1/2] dt-bindings: nvmem: mediatek: efuse: add support
 for MT7981
Message-ID: <20240611134457.GA1796783-robh@kernel.org>
References: <20240514015154.11206-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240514015154.11206-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_064502_409536_FBB2367B 
X-CRM114-Status: UNSURE (   9.95  )
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

On Tue, May 14, 2024 at 03:51:53AM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Add compatible for MT7981 SoC.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Use new compatible instead of MT7986's one
> 
>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>  1 file changed, 1 insertion(+)

Looks like this was missed, so I've applied it.

Rob

