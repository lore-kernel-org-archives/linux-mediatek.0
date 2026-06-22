Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5B9CDB46F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jun 2026 10:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeHcTS/z7AXMwiJASQFJXorWiTpaBk9eiyGNMafLTr8=; b=FPPo7hnagKPb9aB8bcWKoLFaiY
	h3j2658aa2KYjy6+Ty6FN2HbmlpZmfrjB79BcCeQA+O+b87mgdncAO8ZgNm70lKbvs0pIsqBdsZvB
	nCmDLvQwpil675pbj1Y2aeJNxiMjDS99OPA/1JggCc2JLi/Vs/N6NXxCnWgWCsCb6ptcWCZ7cmHg0
	IqGNgrDZ8z1CVqHASkQDVn/lB5BvEXCRSOx6xPoYouHiEsnBUdZczirQE7wb3HGI+KzUjMoKsiDuB
	Fbx8YQqFR6iuVnjIEXJu9tryD2NcSjyA6iGKMJZd53qvhJRmrt+BdZEcBrncgC95bhETauiKGEJTB
	pPmlPfxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbcLR-00000004ri8-0y36;
	Mon, 22 Jun 2026 10:57:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbcLP-00000004rhm-1Obg;
	Mon, 22 Jun 2026 10:57:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B12704354C;
	Mon, 22 Jun 2026 10:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA041F000E9;
	Mon, 22 Jun 2026 10:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782125854;
	bh=BeHcTS/z7AXMwiJASQFJXorWiTpaBk9eiyGNMafLTr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sn7jRwKYodQnEtNuXEzdY0BHPGq+TWV+tnYZMBNkkotfzIp8krj8T+jcHMC0ZmrhN
	 UWbHcpIXdDwpEkuf7d34w8jDD2bNkfP4xUAaoR22ZFRYtKL7qNsOHIFlWEUOezGiFw
	 +1c+SQ1y3+q6K9cLu3mhnCNzX0Dh8jP21lvACK85aEmrkqI/HbsCCWIVuKs0D4ztNl
	 OPoW3rNuNwPkLxYPfAcyvx1Wvb9E+zJb7NjVeY7GsxTSVUu8FB2z9aMbZ01uGHuGMI
	 A6JJrSfZtwDa8dm5w0o7vhMQKehDT4+sxylTg35NG0QE335rWgC5b4SsR39vxsQL3f
	 z16vM3ONKeSxw==
Date: Mon, 22 Jun 2026 12:57:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zakariya Hadrami <zkh1@proton.me>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@mediatek.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: mediatek: Add MT8127 Amazon ford
Message-ID: <20260622-holistic-scarlet-bison-23e25b@quoll>
References: <20260617-mt8127-amazon-ford-basic-v2-0-6859e29e72a8@proton.me>
 <20260617-mt8127-amazon-ford-basic-v2-2-6859e29e72a8@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260617-mt8127-amazon-ford-basic-v2-2-6859e29e72a8@proton.me>
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

On Wed, Jun 17, 2026 at 10:37:00PM +0900, Zakariya Hadrami wrote:
> Add entry for the MT8127 based Amazon ford tablet.
> 
> Signed-off-by: Zakariya Hadrami <zkh1@proton.me>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


