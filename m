Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F452109317A
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 06:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtptpMLCezFcTgKMJFKKhxHtEyF3ob1/oDWTnvlwvb4=; b=eksZPLe+ziaxXtoNzj/B+BiP77
	vf9wZ16aYy42QsKkiuQMlrpK/iPZBRZQ3ObCck1K87+Ojao7nyMmHRkm/Jd5+soy3wAl1Tn0eRWDS
	69AS5sClFjmPmbkYXwx36ukHYbTvcZbQ5DXkvWF2zhixWcLXgYX3MTK9ztyrNV7l3jrm8Qq7rd+R1
	/aWsN4MFLBMNJaqhwdH8uv0sLAXahTezbwmp9C78OmPpjM0NzO1n10D+DNXhh3u7poHYZ9CPTsSXO
	Mu3nkL5wmbZa4L28oC6nw/Z9bpj1mQr3asApAHmJYZr5TUybBrhnwqru7yz288EpQvyT5Qm6JiUDg
	3n/7wPkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3TRV-0000000CBAr-2WMf;
	Fri, 20 Mar 2026 06:34:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3TRU-0000000CBAF-2cG7
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 06:34:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F56A60053;
	Fri, 20 Mar 2026 06:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92777C4CEF7;
	Fri, 20 Mar 2026 06:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773988483;
	bh=ciBHZnV+9yK+pIZcszoVm6DXvUTdjLGIKLPHuMtuItY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hr7l1y+J0EUPPlpaW2DMMsHVzKVQ5OVSvbaNwSgYhTHQkMwKVkDsbd71TtGyDHkN3
	 1cK74opYxwtw1SavLwjkeH+Sf9NX5d3IOTuWLfCD71nUEDlaMAiTYi0CsULoeq0WqR
	 A3tY/OdzY6/Qe/wUjnHOqb27ckhJs6N/HxluZyrg=
Date: Fri, 20 Mar 2026 07:34:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lucid Duck <lucid_duck@justthetip.ca>
Cc: sean.wang@kernel.org, nbd@nbd.name, lorenzo@kernel.org,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
	morrownr@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH v4] wifi: mt76: mt7921: fix txpower reporting from rate
 power configuration
Message-ID: <2026032054-backroom-nearby-53b2@gregkh>
References: <20260319203854.30479-1-lucid_duck@justthetip.ca>
 <20260320011727.77939-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320011727.77939-1-lucid_duck@justthetip.ca>
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

On Thu, Mar 19, 2026 at 06:17:27PM -0700, Lucid Duck wrote:
> Note for stable backport: this patch uses mt76_tx_power_path_delta()
> which was introduced in commit 56e38675c5bd ("mt76: support power delta
> calculation for 5 TX paths"). That commit renamed the older
> mt76_tx_power_nss_delta() and is needed as a prerequisite for the
> backport to compile.
> 
> For stable kernels that don't have 56e3867, a trivial substitution of
> mt76_tx_power_nss_delta for mt76_tx_power_path_delta produces identical
> results for 1-4 chain devices (the lookup tables match exactly).
> 
> Reported-by: sam8641 (compile failure on 6.12.74)

This "note for stable backport" will get lost, sorry.  Can you provide
working backports to stable@vger.kernel.org when this lands in Linus's
tree?

thanks,

greg k-h

