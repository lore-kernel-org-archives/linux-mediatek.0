Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39915CD98CF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 17:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXHehhzB4/pCnHpMmxg30pmzTBOAo5i3f5cizkPGk2k=; b=kI8JOGNYJX1vSUEJButtx+PHPX
	jofXd4e7JDeZxpicV/3eks15SNjTTs3lRVwC133y60IedK6Hzkq1SELXsKM3rbeKzKiaCHOIxty86
	rEByH/jPZpA1XPDwQ9cEcM47PFAR7ZGGxuRn9yWrZH1JRMk1JPeqqO4UC8PmJ/zJxCk7h4ERRp/AS
	gJQs0i+xlvojJr2A0STGb7g1G04hbaMDWlyj632ivZTm0bg91rsPJNdS/C7d1CGGHoKAOgi4vYaa6
	Dk6pPC9fKIDFwnB/ZSSVH/Xxmz8fcMWTzc3t6K3zJ2G1y/hu4qw0+ufQFnQWo3pcFGudUQH/iXhJh
	TNDlRnWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY5NQ-0000000BKSx-3vDx;
	Fri, 12 Jun 2026 17:09:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY5NQ-0000000BKSk-0okS;
	Fri, 12 Jun 2026 17:09:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF8FE402FE;
	Fri, 12 Jun 2026 17:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA65B1F000E9;
	Fri, 12 Jun 2026 17:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781284143;
	bh=mXHehhzB4/pCnHpMmxg30pmzTBOAo5i3f5cizkPGk2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SxqB5cRLYHsqodxhM9r7MVPqGGUkg8EdMYMdy0jHQD4jV+AghgDrxcTTdSVwQ224r
	 tMS4MA/AWJGsoCyBKQzKMmbFCphPn5fjtKCtDltoxEvHkiYhUQRmLJD5ytS1RdPGM3
	 pir0p7p4yJNBq4navfhhaVRBzN/albmg9vUDMwSo+E++g9pnetCjyhZDTcdUlXrlSl
	 tUjV0Z8p126g/HpkqZGVd0ZOvnQqtwykxsuWt31xqJXqLmYAFuInOVKsIbF/GCOuu8
	 ry1cSeQlscHRaaI08xZcK3vTJymSJpNmAhc4pB+GtepcZyjstIqDLeIPeQldU+tIxb
	 Gls0cCBKkryzQ==
Date: Fri, 12 Jun 2026 18:08:59 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH net-next] net: airoha: better handle MIBs for GDM ports
 with multiple devs attached
Message-ID: <20260612170859.GJ671640@horms.kernel.org>
References: <20260611-airoha-eth-multi-serdes-stats-v1-1-42442ae42064@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-airoha-eth-multi-serdes-stats-v1-1-42442ae42064@kernel.org>
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

On Thu, Jun 11, 2026 at 12:43:00PM +0200, Lorenzo Bianconi wrote:
> In the context of a GDM port that can have multiple net_devices attached
> (GDM3 and GDM4), the HW counters (MIBs) are global for the GDM port.
> This cause duplicated stats reported to the kernel for the related
> net_device.
> The SoC supports a split MIB feature where each counter is tracked based
> on the relevant HW channel (NBQ) to account for this scenario and
> provide a way to select the related counter on accessing the MIB
> registers.
> Enable this feature for GDM3 and GDM4 and configure the relevant HW
> channel before updating the HW stats to report correct HW counter to the
> kernel for the related interface.
> Move the stats struct from port to dev since HW counter are now specific
> to the network device instead of the GDM port. Refactor
> airoha_update_hw_stats() to take airoha_eth and airoha_gdm_port
> parameters since the function operates on the entire port.
> 
> Co-developed-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


