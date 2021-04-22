Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1474C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 12:24:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F1466142F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 12:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F1466142F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BGdqxtkqa/Ngj5l3tFT91+Y7eLyVORKWzl0m02kZwH4=; b=GM4oxMwXA6P1uz9/B4Y78pqc0
	M2kfB4GOTgsO95JIqEbhxzzn5ywsnw7/ZDZtwVerV3ssgyoJ4LfD31nVnEWKvLWmOAjVyGkHA63Qw
	p0XzZ/9arz1SWXhGLKYZvQCDTQ2C6vYlkM+i/UfD1LLG6464YO57laC+rmDwPm7Fekt/BvCJyhVX4
	kuX7hWjz6zaZjaZ6wcTHuGL8Um94gLgz+ipdjiZnpgCPy7g3gIaSLwAV/MGbcmUr87juYm2Jh8W69
	tp+3BVzwYN3cnSAazfHYNr6qfNAzDS2GjpReCQbMfEx568mCfAcxiBq51kq3BRA5j3bkDkqlV6dyV
	wZGNDhE0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZYNU-00GgrR-HQ; Thu, 22 Apr 2021 12:24:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZYNG-00Ggq0-7G; Thu, 22 Apr 2021 12:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=H2xnj8dmoOpMieDIWgKHLO/kJT+4ayFvRjGqeGdMs5c=; b=JPXUYrCiXX6Jg83p9A9ucS7FPE
 vKi63zHetNGQdXch4+whiavySzgG1IKFSFb3ksV+Rq4EuBfs0IOHUfZgLBazgMhcOuRiNbkrShjE2
 mo9CbXaoQwL9n2zbo8ECGFcBpDRiYYyS33SeO39SHxtYeS7mjStbo6ylrysTK0fEuu8Cwyei38KL3
 LF8Gp7i9z6CdktWWOBEh2tnrO1Aco9K67wNW0og8TAHQ1AQH224SKezwrWg0s3UVsbxLA3nJXzuzr
 wvDNWSjepq6pXWMuI1/wDkceGuKoKu+98wWtLDjKmZfcZTABKa2nTa8I3wjLZmFt4sNYFO4SmiZb1
 Tm0YFSmQ==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZYND-00DfbO-V0; Thu, 22 Apr 2021 12:24:01 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lZYN6-000Um9-NN; Thu, 22 Apr 2021 14:23:52 +0200
Date: Thu, 22 Apr 2021 14:23:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 00/14] mtk_eth_soc: fixes and performance
 improvements
Message-ID: <YIFq2NIhdMWTDshX@lunn.ch>
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_052400_013507_CEC8965F 
X-CRM114-Status: UNSURE (   9.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Apr 21, 2021 at 09:09:00PM -0700, Ilya Lipnitskiy wrote:
> Most of these changes come from OpenWrt where they have been present and
> tested for months.
> 
> First three patches are bug fixes. The rest are performance
> improvements. The last patch is a cleanup to use the iopoll.h macro for
> busy-waiting instead of a custom loop.

Do you have any benchmark numbers you can share?

   Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
