Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51858C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 20:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZmzq6eT6Iy2NuTQwQVLeIFWe2e1jR67TBC9l+itcU0=; b=dIZXAHocfXGy7k
	R39DbRrdUz50qPvb6jCOyVeXpXadJ8aPG/BlJEzQheKb4zcTJSus6rV586ouXGWNBSonQV3jG+Ldk
	F1AneA01EHkp5NtpdmRxpL4NUk6hiDWnSKrt00eEZMwUzfJomrnOVhzA/C3s16/og9opDqalX5Rbp
	CbTJwpVWJyDeGzmGqknhF62Uy+cFLDrw0eOUoMuGvdeTf3yNA9592ufi+5aJsLp8lh+53dDLlcVQo
	h6MHG0wBGbADUBI3zDZc4g4fGWI2D9rj2yN2mOobJ+iEQR8sGds5dmHB/CxQ/M+KNMrZAlP90mNRA
	tdPVGVLtIoQ8TgPKMmJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmLuw-00Cfl0-8a; Wed, 04 May 2022 20:48:14 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nmLut-00CfkG-Q2; Wed, 04 May 2022 20:48:11 +0000
Date: Wed, 4 May 2022 13:48:11 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-modules@vger.kernel.org, linux-mediatek@lists.infradead.org,
 yj.chiang@mediatek.com, atomlin@redhat.com
Subject: Re: [RESEND PATCH] module: show disallowed symbol name for
 inherit_taint()
Message-ID: <YnLmi26EBEFJM5aH@bombadil.infradead.org>
References: <20220427073606.29752-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220427073606.29752-1-lecopzer.chen@mediatek.com>
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

On Wed, Apr 27, 2022 at 03:36:06PM +0800, Lecopzer Chen wrote:
> The error log for inherit_taint() doesn't really help to find the
> symbol which violates GPL rules.
> 
> For example,
> if a module has 300 symbol and includes 50 disallowed symbols,
> the log only shows the content below and we have no idea what symbol is.
>     AAA: module using GPL-only symbols uses symbols from proprietary module BBB.
> 
> It's hard for user who doesn't really know how the symbol was parsing.
> 
> This patch add symbol name to tell the offending symbols explicitly.
>     AAA: module using GPL-only symbols uses symbols SSS from proprietary module BBB.
> 
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>

Thanks, pushed onto modules-testing. If there are no issues I'll
eventually push this onto modules-next.

  Luis

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
