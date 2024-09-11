Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0DEEE4998
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 12:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNsNUIh7Z32QBJGGMFVvTAKKOX0vPwFSxf2ClIPyrEc=; b=L8xWpJ3AsPhGrzgA9Dz8yZU1x2
	3HqLICcYbdl6aAy4pKd5hs9p9v9PhV+sAFFDdu68rlwUoEVEIzBq2IdUBfI4AUEsANNxuM6MhMSBA
	324BYaZeYVhh7IGrHQc4pdLZkIJHW5yBWGe/7YZTdDO0F01GrauXTp6ytW/J8kMfpHWU/yE1+u4sb
	+NLr8Y8J0cvCWtBRmf/Qa7GIWaAjGAMggfmPcB3o5NAY1P0bSabn5/BswNutBrvjt0kq9+5WG3pwT
	obABLfwCcrkwr0j2JT4dy7YPef+WPl4hsdUAWMX3QdqKB2HS4Z4bhG8ZGQBbtYzaUUmy+P1yYiHhz
	bKlyZdMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soMJn-00000009RhD-0pCt;
	Wed, 11 Sep 2024 12:19:31 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soMCn-00000009Q6h-0K2W
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 12:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yNsNUIh7Z32QBJGGMFVvTAKKOX0vPwFSxf2ClIPyrEc=;
	b=RSAfgosvE/k6YmHb+X1z8imyHhXXTmvp/d2nKVSFt6s2STOs3JhNL8Ap+d5kPr
	WFnIWcCzb9NytNXBmRR9Ke+de5khtVWrUk2MyoGzBhhnsXChgA5Ve3tRMqyZYQI0
	HNQlAnjMCrmIZhv7sZnx3gl0Vn4qc4jIi5T2Qi70ggrF8=
Received: from localhost (unknown [120.26.85.94])
	by gzga-smtp-mta-g2-1 (Coremail) with SMTP id _____wDnj2IFieFmfO6VFQ--.4817S2;
	Wed, 11 Sep 2024 20:11:50 +0800 (CST)
Date: Wed, 11 Sep 2024 20:11:49 +0800
From: Qianqiang Liu <qianqiang.liu@163.com>
To: Mark Brown <broonie@kernel.org>
Cc: amergnat@baylibre.com, angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com, matthias.bgg@gmail.com,
	linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mt8365: Fix using uninitialized value "i2s_data"
 issue
Message-ID: <ZuGJBQA90j1UB9En@iZbp1asjb3cy8ks0srf007Z>
References: <20240911001516.47268-1-qianqiang.liu@163.com>
 <9ea8731a-7888-40a2-a183-4598884bbb27@sirena.org.uk>
 <ZuGAwQGPWdpO1-G9@iZbp1asjb3cy8ks0srf007Z>
 <eb21bcab-333d-4ab3-9222-058764ced720@sirena.org.uk>
 <ZuGG3jk6oqq7sUMw@iZbp1asjb3cy8ks0srf007Z>
 <8d921122-7271-451a-8bcb-83a1066b7b87@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d921122-7271-451a-8bcb-83a1066b7b87@sirena.org.uk>
X-CM-TRANSID: _____wDnj2IFieFmfO6VFQ--.4817S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIPl1UUUUU
X-Originating-IP: [120.26.85.94]
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiLwdXamVOGQ7YCgABs6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_051217_502805_633AC84B 
X-CRM114-Status: UNSURE (   9.15  )
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

On Wed, Sep 11, 2024 at 01:07:52PM +0100, Mark Brown wrote:
> On Wed, Sep 11, 2024 at 08:02:38PM +0800, Qianqiang Liu wrote:
> 
> > How about this new patch:
> 
> That looks good, thanks but an equivalent patch has already been sent
> and is in my queue:
> 
>     https://lore.kernel.org/r/20240911111317.4072349-1-usama.anjum@collabora.com

OK, got it, thanks!

-- 
Best,
Qianqiang Liu


