Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344BCCF6497
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Sep 2024 19:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZJbpVSx0mMG1zR8DkFBR/ky8MfiIq4krp/rxfSlOTc=; b=JDGveEOdmijHmem8as6pzcw6kL
	vvNwY0e/rdgKl/IfEK3TMptoahWF/Siplt7mMUjHuR6vxwrgi1YAYUlSR+QjAyxR5+OYQiBBZxN1A
	n0YbyLg3w7vTX2HmcEnbBtORmk4zeH2Ln7dc1MV6z8paCvoLoGOl9LDsBuLTxSWtg/NeJ3Qpas8BJ
	THGimBr+HT+e3Xa8hg83B2teCu0rVipI8zJSe0jVikNHPKys37TJSJP8Dk5xO7WopgniIKWugrglF
	tx/ccNqWYPGJs2zz7J9Qc3AjqpL/cr1QaHa13ANHjHfC92kmyu24kdy3bhbC7HAkrQH9tszHD4xU+
	qoLbGZuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suzqe-0000000FGCb-1Twu;
	Sun, 29 Sep 2024 19:44:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suzpS-0000000FG7b-0HR8;
	Sun, 29 Sep 2024 19:43:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0270B5C0536;
	Sun, 29 Sep 2024 19:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED143C4CEC5;
	Sun, 29 Sep 2024 19:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727639016;
	bh=JZJbpVSx0mMG1zR8DkFBR/ky8MfiIq4krp/rxfSlOTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tjhVpAHq9/GQYbbyOHYhJJXwbmYYlaZ594gzA6aEndCVRvFOF/qxSAO1C2hP3vXyb
	 ls9eabDUzE4lEldEQpSiwsFrhlpPldo1FXg4o/6GsZOSrqzsjRwWp/hQNOvwyHp38R
	 CtKRmSvAOCoXU1qyr4DB/XgCpBknpdJJAgC7iLqBb0gyIs6TRmUlVzYww4eklEqFMX
	 WssP7qRUmz8Jf6qBByxJHnASC8BPeYIVacxk45nb76xkTYqUyFOS0hd1evST8t2loy
	 z9UhQZPX9Q6yNGh4PkA644cie6uBOJMcfSKu5wpO0Wp1z+wUZJkhHZzLxdzpgXKsdO
	 p894pmbDU1i6g==
Date: Sun, 29 Sep 2024 21:43:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy-ld Lu <andy-ld.lu@mediatek.com>
Cc: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, wenbin.mei@mediatek.com, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/2] dt-bindings: mmc: mtk-sd: Add support for MT8196
Message-ID: <wuhrl54ojj4sjbk3qbm5jjgeupznbs4uhfedogmucjhvnbjbeh@vwvpeuiwgwli>
References: <20240929074558.2076-1-andy-ld.lu@mediatek.com>
 <20240929074558.2076-3-andy-ld.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240929074558.2076-3-andy-ld.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_124338_166890_65AAC786 
X-CRM114-Status: UNSURE (   7.46  )
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

On Sun, Sep 29, 2024 at 03:44:06PM +0800, Andy-ld Lu wrote:
> Extend the devicetree bindings to include the MT8196 mmc controller
> by adding the compatible string 'mediatek,mt8196-mmc'.

Your entire two-line sentence, says the same as commit msg and is pretty
obvious from the diff. Say something useful instead, like describe the
hardware differences.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


