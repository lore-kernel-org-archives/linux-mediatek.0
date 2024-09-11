Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DBFEE4998
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuOHph7C0cmfKRGlQa8YH44Sz/5FhEpWHdlFSJkUp78=; b=xdpqatplxKSRHHCnGBu/KJmkxY
	US6UP5jXddG0VPQU+Qae/Vglaqio4Fv7i6G9DJKBzMwJX90JurdtJeX2g9Ha235OjZUAeo5Eqx5x2
	jKATm8VBIskp37tC7Gan03mrUrGNDgGWSWjd17cS9M/O5k86YF1vplHoDmDO8uPGeKtXVvAV2l8CY
	2hcbG2toH3KSZSyu50dUS3byWTndi2cIxgtkfS2FFY0s3DDMtqzYEDgb3Jq3p4SidZQA0Jk2XxJJb
	WtkeMY1EUw8m+xypUFQ6dYT50/1rVBt5yOWTHdJwnUJ5/n46I02hSbHJFE3dozvYaPmVW1SBX9fgV
	ThgW4D8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLel-00000009JtC-3zZF;
	Wed, 11 Sep 2024 11:37:07 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLei-00000009Jr1-2zLU
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 11:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=EuOHph7C0cmfKRGlQa8YH44Sz/5FhEpWHdlFSJkUp78=;
	b=fNhJXhPrwwfzGOT3V0zYq91zOqYugXl++GmOk20RCgQF1+5KMCmDPcIU7haxL0
	osw9ldjnPaE2YNTRksIKmbaDCE93IEAZw2jA7XEju+PzQ0XJ09ehvtJrvB1vvZQc
	ns3wYoiqpJvnuoOLC6zi0mlQxeVMyUhX4FF3Eg6RwNtLU=
Received: from localhost (unknown [120.26.85.94])
	by gzsmtp3 (Coremail) with SMTP id sigvCgAn1wbBgOFm3jcXAA--.2464S2;
	Wed, 11 Sep 2024 19:36:34 +0800 (CST)
Date: Wed, 11 Sep 2024 19:36:33 +0800
From: Qianqiang Liu <qianqiang.liu@163.com>
To: Mark Brown <broonie@kernel.org>
Cc: amergnat@baylibre.com, angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com, matthias.bgg@gmail.com,
	linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mt8365: Fix using uninitialized value "i2s_data"
 issue
Message-ID: <ZuGAwQGPWdpO1-G9@iZbp1asjb3cy8ks0srf007Z>
References: <20240911001516.47268-1-qianqiang.liu@163.com>
 <9ea8731a-7888-40a2-a183-4598884bbb27@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ea8731a-7888-40a2-a183-4598884bbb27@sirena.org.uk>
X-CM-TRANSID: sigvCgAn1wbBgOFm3jcXAA--.2464S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIJPEUUUUU
X-Originating-IP: [120.26.85.94]
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiRQJXamXAo2LUZAAAsu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_043705_187207_20895425 
X-CRM114-Status: UNSURE (   9.33  )
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

On Wed, Sep 11, 2024 at 11:52:58AM +0100, Mark Brown wrote:
> On Wed, Sep 11, 2024 at 08:15:17AM +0800, Qianqiang Liu wrote:
> 
> >  
> >  	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
> >  
> > +	if (!i2s_data) {
> > +		spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
> > +		return;
> > +	}
> > +
> 
> Why would we look up i2s_data without the lock, take the lock, then
> check if we actually found it?  That doesn't seem right.

Just check the "i2s_data" is NULL or not.

-- 
Best,
Qianqiang Liu


