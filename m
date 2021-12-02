Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC10C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 10:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kmlD8G0ygU8k+873S8DnAqkAVrkatSpXlup4wWgQryI=; b=X5rk88d/TqmXna
	f4fA0uXJJi0FoSpKsp8s+pfu41iAoRD+HB8Nc4VhnbgD3gsxbhZG2sdcWX2IUGyqOjgNNv0mUkAqJ
	51+Yy04HIxAGCWfbo/ZcePaJzNRpdxxf/7UvDt/sZ1LMYT80zcoewVgszG2Cjb7QC+/t7VeFQAl2a
	5oe3ToZk0GEF910XnMDMCOA80Dwi+wFSbkZF55mcdvPSrtNyXVX541N9bf41a1PWDlZUSgYN6qVKg
	IX3iW02nsX2/L8K35EGKkUcPomLnU2WLRt2KCbisE1c5jc7NYQA4pFVvy8VxeMzXzDMSiIoEJmr61
	KDMZWbH3thZQCBoScuIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msj1h-00Blct-M1; Thu, 02 Dec 2021 10:09:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msj1J-00BlTn-1M; Thu, 02 Dec 2021 10:08:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 46F65CE21E2;
 Thu,  2 Dec 2021 10:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A519C00446;
 Thu,  2 Dec 2021 10:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638439729;
 bh=IuWGJaDCjFa8PsnRrVCp3/5cjpCR1EyGvz9DJWIbWqU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S0wH0S0l7ePBKqSRRXZYnzIU+QWkTR9Sc7v9ZOpc3jikhFQSh1v4hfyizQ8Sfpy+5
 t+XrxeShiwuuLS36AlXDGygFjm8upLguYEqKXYB5+7wk1FeMCgJDj9eLiBW9TRy7N4
 ac7yBVO0MrwliQw1bn6VmDaILGNfrZsx3E4N9IiOYmdBZb2BbkGBc6YXgmnq4tacdm
 UXdKT5ojyNRSl/Z7/Lczsbq1bGqxo/2CwlKzDelFFHVWJfsF5Op4UwwPrIQPfn7r5g
 aAzuXN6AKXuRnesVPhTBcTXWIeduGDHnaU+Ozh01KUrSAuntdPi+1lOowBl04IaV8D
 p4tF7OsBQ5QHQ==
Date: Thu, 2 Dec 2021 10:08:44 +0000
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 chinwen.chang@mediatek.com, nicholas.tang@mediatek.com,
 james.hsu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] arm64: update PAC description for kernel
Message-ID: <20211202100843.GB26450@willie-the-truck>
References: <20211201034014.20048-1-Kuan-Ying.Lee@mediatek.com>
 <Yaiat4ee0igTZDB5@FVFF77S0Q05N>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yaiat4ee0igTZDB5@FVFF77S0Q05N>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_020853_306725_E810FB60 
X-CRM114-Status: GOOD (  15.32  )
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

On Thu, Dec 02, 2021 at 10:06:47AM +0000, Mark Rutland wrote:
> On Wed, Dec 01, 2021 at 11:40:10AM +0800, Kuan-Ying Lee wrote:
> > Remove the paragraph which has nothing to do with the kernel and
> > add PAC description related to kernel.
> > 
> > Suggested-by: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> 
> This looks good to me.
> 
> Catalin/Will, did you want to pick this, or do you want Jonathan to do so?

I can grab it.

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
