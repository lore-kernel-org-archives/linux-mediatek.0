Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C847C3DA61
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jul 2024 04:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SMS38zUOUNomnen6ehG7RFuWOUpAx5NwFyAORI70Iys=; b=w0L4LlFZEjyRyE3lUVF1Um10Pe
	cYbgdJX5ptMJUGnT+vfYJkWO98elbOAPECb+wSSqIKJQ58F4LSXpFmSC/FZoAGO2jdBCTF85pE/re
	Gk0tn6XsYipn/Jp2HS7WaWlqnnKjiMKx0MZq8lgHcMWAROXbhiphvN30170q6XuflDYlwnSMNF/jO
	VF8CMIEKjWdOXQmyZd5Qer4s+s/7kpi4W0qB9v2TwfItNkEYbOqpcb2jyCJkbBNBZUOsOnFl9u11C
	LGEmorF9wJ9WTgyBz/0mPML6QOjl1uhdnu95qTE8bk2yKjYte8rjYRuBxBNeorzt9PQbNDRs7QOdC
	Yq41jeGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXZVN-000000065Cu-0eyr;
	Sat, 27 Jul 2024 04:58:05 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXZUv-0000000658p-0rsV;
	Sat, 27 Jul 2024 04:57:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 15188CE17EF;
	Sat, 27 Jul 2024 04:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC9CC32781;
	Sat, 27 Jul 2024 04:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722056252;
	bh=0C4P/1dWeeUrRZ1L5tcWLfqzwHqb9jvhV2GQ3DVrl6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HS642L71DJj1yjwJ7W030t6PNInH4W5nJpy0ZYihmAeHVp5rCKK9L8ikI3MU/ihLx
	 hi60ByXJ9+2nAZAa4KdlI5l1neiRg7qrpzk4owzvlTyvmojWGpuv5iCKTh6d7XnD31
	 ush9BsjTcdg4lJG1olnZ1sejDOl2+cBxT/PcqOKk=
Date: Sat, 27 Jul 2024 06:57:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	John Crispin <john@phrozen.org>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: mt7988 usb broken on 6.10
Message-ID: <2024072712-paralyze-overthrow-ea04@gregkh>
References: <trinity-c8e0af34-2704-476a-9454-bf5001256eb9-1722013999541@3c-app-gmx-bap12>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-c8e0af34-2704-476a-9454-bf5001256eb9-1722013999541@3c-app-gmx-bap12>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_215737_471917_D3218FBA 
X-CRM114-Status: UNSURE (   8.93  )
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

On Fri, Jul 26, 2024 at 07:13:19PM +0200, Frank Wunderlich wrote:
> Hi,
> 
> i've noticed that usb on mt7988 is broken in 6.10, was working on 6.9 (with some additional patches like
> for pinctrl and dts as this chipset is not completely supported by mainline yet).

Any chance you can use 'git bisect' to track down the offending commit?

thanks,

greg k-h

