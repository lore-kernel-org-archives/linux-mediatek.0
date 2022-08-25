Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C955AECAA25
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 18:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XULX992igVj6Uiedt+AxlCqUAYRC3smYWUBYWhJowks=; b=ZTtz12DEo9LEsfU+sje3trxtjc
	WFRmnwowKTJsYipqoALKkU70Cq31mb+GWT7Kz8/xRoxf20aBj294pRLpBfG7qjaa6iE2N26hSqPpS
	cFJ9cIt9UkGWbLw9UXaHzoe1Mu0enVAr2NtaU9zw5fxyIJCqKd/lJQs6dHPYLYecuJcaYtW9+T670
	oAvnDB9nizFdS3oc0j5YDLZAry0OlzgRViHyW1vc/bOYGXUw7EKeDn5bYQTj59dVXzYozEQNtdbxb
	/DZxNU8DSiydDFehJHSmxcmES7s7VswomMTJGIDZN7IFarz8YQSoVXfsSg8/Xrj3MKGyUIfNY9LlM
	2QE1bVqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRHwn-001sAi-5W; Thu, 25 Aug 2022 18:51:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRHwX-001rMi-Ti; Thu, 25 Aug 2022 18:51:07 +0000
Received: from notapiano (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 942E56601EAE;
	Thu, 25 Aug 2022 19:51:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661453464;
	bh=jqjW7nQ84W8spFHzeSk+rHHJ/4I5iCIJLk6w8rmb7rc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MH5HsrRkh3wk3XSsr+HODwUgKAGKEz2nM078683pQisORGSosmuU2vvz8w2xWrmYP
	 MxqrWoLWdzzLXFUC2UKgceMIt0yW4/j51rTGu7XUgbBtM0lrmBkCjsDYRyWiEG7uIa
	 NnQNlLGdxclJmEb25DlZ3/7Kb8xPG9xB7psiNMCm8l3EC69khxFKXdyHiz6eySopIk
	 gQF+v6zbIiX7Xk5FZICrdgNonPUB5MoosO1BfDdnMcSl60IDQjR/shcL63TB2sbxtI
	 qvrHz1kLWIk15ATI0mngDAOh/NLof2Ir6ctpYoYpw6DxVd6FgXKnEs9Jm08SMobyq5
	 RBQUG/Ofj8LpA==
Date: Thu, 25 Aug 2022 14:50:59 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	roger.lu@mediatek.com, khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 6/6] soc: mediatek: mtk-svs: Use bitfield access macros
 where possible
Message-ID: <20220825185059.xbh3gigksveg4h4u@notapiano>
References: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
 <20220726141653.177948-7-angelogioacchino.delregno@collabora.com>
 <fa5f9bc8-f087-02c6-dd31-efa33244bf1b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa5f9bc8-f087-02c6-dd31-efa33244bf1b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_115106_355539_166C7C5A 
X-CRM114-Status: GOOD (  11.88  )
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

On Thu, Aug 25, 2022 at 03:29:33PM +0200, Matthias Brugger wrote:
> 
> 
> On 26/07/2022 16:16, AngeloGioacchino Del Regno wrote:
> > In order to enhance readability and safety during registers setup
> > and value retrieval, redefine a few register related macros and
> > convert all open-coded instances of bitfield setting/retrieval
> > to use the FIELD_PREP() and FIELD_GET() macros.
> > While at it, some macros were renamed to further enhance readability.
> > 
> > This commit brings no functional changes.
> > 
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Does not apply, would you mind to resend together with 1/6? Thanks!

Hi Matthias,

Patches 1 and 6 rebased and sent [1].

Thanks,
Nícolas

[1] https://lore.kernel.org/all/20220825184616.2118870-1-nfraprado@collabora.com

