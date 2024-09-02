Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B630CD13CF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 06:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Waas5O5lR0sclFrGnpd2UQO3LhYdsfBQV16Ml7nGlY4=; b=f/Jzo6+d56p5jF3KcPneFgHXNs
	YjhuDP6vOrU6nEQeD7/v4TglPnQlaE6UFfcAOnddgOYE8QZKioetOyP377ABizZvM3eJPcnAmWwcJ
	geWQvnRB+AJ+9WShADIhe/HTUx9DSC0swaxgvFcgESudihJqrAaGxDoi0/sozbyCPDfpLtA/vEPrF
	xvduJOJqJbTckMb3ds1Vb8/2OJD+ohE/W70mptZ7gxkCEaTjw69jO9weUZFTORVOlLKIf7fSdJ+pA
	acO+6W5mQ4p94WmseTtAGEja3a4EkEoeia6Yjfpy7UtVeatJBklW2UgMImDqdTxzXuLXGthPcJqzW
	2l8eqHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl07j-0000000D57J-3hJq;
	Mon, 02 Sep 2024 06:01:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl06n-0000000D4wR-39Xp;
	Mon, 02 Sep 2024 06:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A6F9AA416B5;
	Mon,  2 Sep 2024 06:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 068CFC4CEC2;
	Mon,  2 Sep 2024 06:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725256812;
	bh=fkYfWMLlfk5e2VJ1eg33dBxjDkhjDPqpeRo+qkVeL00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oIo4Qytbe/iyRXPwnfYn9skDnjW1uH6B6CMf0AAs8IycOmXcgYAcSUvYiHwbalw1H
	 AUhtuaV/nN+PkUQzRjh7p1MfLP6qgxtg1H3hhF/4euS3MgFgqgOh5EhsqK//ojDhez
	 vIaEejmsQrubCPr32jvW58gTqmg315O23VDc1lPU=
Date: Mon, 2 Sep 2024 08:00:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yenchia Chen <yenchia.chen@mediatek.com>
Cc: stable@vger.kernel.org,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 5.15 1/1] PM: sleep: Restore asynchronous device resume
 optimization
Message-ID: <2024090250-reliably-ecard-3b58@gregkh>
References: <20240902031047.9865-1-yenchia.chen@mediatek.com>
 <20240902031047.9865-2-yenchia.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902031047.9865-2-yenchia.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240901_230013_882255_508D03EB 
X-CRM114-Status: GOOD (  13.48  )
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

On Mon, Sep 02, 2024 at 11:10:45AM +0800, Yenchia Chen wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> Before commit 7839d0078e0d ("PM: sleep: Fix possible deadlocks in core
> system-wide PM code"), the resume of devices that were allowed to resume
> asynchronously was scheduled before starting the resume of the other
> devices, so the former did not have to wait for the latter unless
> functional dependencies were present.
> 
> Commit 7839d0078e0d removed that optimization in order to address a
> correctness issue, but it can be restored with the help of a new device
> power management flag, so do that now.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: yenchia.chen <yenchia.chen@mediatek.com>

Please sign off using your name, not your email alias.

Also, what git id is this?

thanks,

greg k-h

