Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9A6CAC59A
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Sep 2025 12:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+ZQIRONRlVBZGAKVxU4jFjIIa6og9OPGv3LHbIuefQ=; b=h1pNonzu+SO2fVYYOFxws9sg7p
	/ReQ40vmlV3YSQBYqqXOxR2JiV3tCozqX7IhaSToy5Q3T6ddnNFiRvvtoYlL+xpO5PPyXfXg91h+R
	w2bkriMCzY2yqTD+gc6KdNb0lwweODUxqazr/vJnkAT7PfEaCI3h4yqq2oLbe0dAAYxUYb9PDAQY0
	uw+YC0twOXGYfymBrOjh08aNm0SvFjAGx0Z8JvV7OSzbw/rwaZCWJHdi510kb4gosTA4mWMAUNtBa
	NG+NpObVv3Fm0bQ33bySAVjw9W/ZzWxBYDFIDtUvCosraAftRfFkGzzraI63duWCyOqr0q96ndNJ1
	B9h4Nr2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrcQ-0000000BQu9-1SbO;
	Wed, 17 Sep 2025 12:50:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrcO-0000000BQt4-2jnO
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Sep 2025 12:50:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 173FA4059B;
	Wed, 17 Sep 2025 12:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB641C4CEF0;
	Wed, 17 Sep 2025 12:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758113440;
	bh=CfzR7xf3p3JWB1YNU5e6PTj7XFWB3rwhi6giwyqJNI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FkICFful8PIWq9X6GbDOJfnHsnu1ohpy57gcgqm97HzgmWj2KUKd5Ekpx6QM3+Azr
	 /WJgBiD5/G43K51vkeeHg+WwiVvDdVVeyDOWAfZ+aDYPxBqxe24SccmuKi4e0n6sqC
	 HB6P8gPYrz+dtCOieG27+8xpDFC9XmtWziZmlQu675bnkV32yYw4ESHDgg1lP0dmCi
	 xUYqDTpD+yWIDrX8ywVBSYvoZFcx/IfBlBrKYY6DFT1geNvRcnn969Wby2aKMptiy0
	 0YLOHutBDJvXBRUgXYEBW/nuCcQoQaOO4DZ+35O2qLZLSbkBMC94N0llEiow3cZEii
	 A2xDhJ7HMRRjQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1uyrcH-000000001ch-0uRx;
	Wed, 17 Sep 2025 14:50:33 +0200
Date: Wed, 17 Sep 2025 14:50:33 +0200
From: Johan Hovold <johan@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH] cpufreq: mediatek: fix device leak on probe failure
Message-ID: <aMqumfq6w3wJGgeL@hovoldconsulting.com>
References: <20250909073819.25295-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909073819.25295-1-johan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_055040_722872_9D01FA6D 
X-CRM114-Status: UNSURE (   7.59  )
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

On Tue, Sep 09, 2025 at 09:38:19AM +0200, Johan Hovold wrote:
> Make sure to drop the reference to the cci device taken by
> of_find_device_by_node() on probe failure (e.g. probe deferral).
> 
> Fixes: 0daa47325bae ("cpufreq: mediatek: Link CCI device to CPU")
> Cc: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Can this one be picked up for 6.18?

Johan

