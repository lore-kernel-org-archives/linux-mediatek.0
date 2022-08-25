Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7CBC32774
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrIEOKFAPyFOdMHilicm02hb8cnL4B7c7MwW9nQS4Lc=; b=gKPAF5xgUHevEEgZlH3k5Vlk1g
	170be9cTauGa4P3eVkolVlFleV2P5m2XXENJv1YAPshgofFom9f2qg4FXQ8b/xXQpBsD/JPSyDA24
	dYPZtENRntvpU7E2cIbKd7TyzINmIbVgx041hKI6kgEmyWboZqxOXUwMmCC+fYLypDNs0d3XBD+p4
	p7HvVGh6mOD6zJS8Im5wlZUiwehvybcFRrE2agdkHIm6/RXOdNcWHI01hIDR8U7HURYyiQkoeaVyz
	eioMLtBiSPnMMAEA+oJ27XSVW89T7BfUgkiUA00vSsM9Fk1Ug9vxaN71FAICo//LzNfJbtlwnsZWk
	LH08w9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oREZE-00FbSB-0g; Thu, 25 Aug 2022 15:14:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oREYS-00Fb1U-QR; Thu, 25 Aug 2022 15:14:02 +0000
Received: from notapiano (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4B3396601D97;
	Thu, 25 Aug 2022 16:13:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661440435;
	bh=YozKHKtuLc9sgOOMnJ698obW3XC7fZK8JlCRNnws3Z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCrYGlxCbZXCnEAAfddALgZrTr2weESYZu+q4cSm3CLcCajqiJEFpx3AWHuuFdmdJ
	 Neci/sVHdyzWoyaMo84+/+KNMV2UmZoKbRJJK7MA9QPnuUtR7hIcszM1O02FnLXGUj
	 y/YDFaz+7VE6qGZe8ookczri5k3BXzjLTE9rXXRo/5JSP2J3W9IprZzNXziqvWy8bp
	 8h4EfBlXtn3Hhkqm29huE3Pan2lLAwRbEbTfqTaT+/TV+CeKdB42dM73IObJwS8UvB
	 SdvLL753ffZRWdejYmDlAkq5HKn2KVxdZQ6hzeahEyop5/x37dV9U03wf7BirrmllR
	 w9McTn69yNUZg==
Date: Thu, 25 Aug 2022 11:13:50 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Hui Liu <hui.liu@mediatek.com>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, wenst@google.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	jianguo.zhang@mediatek.com, zhiyong.tao@mediatek.com,
	sean.wang@mediatek.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] MediaTek pinctrl patch on mt8188
Message-ID: <20220825151350.mbovhtvcgnf6shwd@notapiano>
References: <20220818075012.20880-1-hui.liu@mediatek.com>
 <CACRpkdbGjbd9Q9Chcnnc=3nD3XALsCdk7dz9mT3BfJdZs62xjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbGjbd9Q9Chcnnc=3nD3XALsCdk7dz9mT3BfJdZs62xjA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_081401_045848_BFA97C12 
X-CRM114-Status: GOOD (  11.14  )
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

On Thu, Aug 25, 2022 at 02:54:32PM +0200, Linus Walleij wrote:
> On Thu, Aug 18, 2022 at 9:50 AM Hui Liu <hui.liu@mediatek.com> wrote:
> 
> > Changes in patch v6:
> > 1.Update driver file's coding style.
> 
> No further comments on this version so patch applied. If Sean
> has further comments they can be addressed in-tree.
> 
> Nicolas: thanks for helping out with review!

Sure! Glad to help.

