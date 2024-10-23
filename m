Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77E3CFA464
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2024 20:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PiwUb7NuhFOwFnszmqzS/f/hFRv7aNBbHqtjWGFOmSk=; b=soKXKjWRvsYxfKN0JajT3gmgoc
	7ugsQVm74mGnyKPxuFANHGa3bsbG8/5EE3iS3BQHbAtcfJW8ZthVczZ727oV2AecDD5KyOOEvmQYl
	MhxvwDSwWtHJlS+ia3h6bTPyQ2JNwBZ/IV6RmcxhgRBtNG5mMg+u/03NlXR7C73lSrR8V7U/zywiN
	pFl7ztgXxvz8yL4UpAx+St1qM49uUSYOEeOE2YaXyjrIxFmPUyymuYzqaImG13xs4v49rLvluFVq+
	Ha9xbQypB6m2+XfSgWXVlEE8knmbETDSxhkDQx5kZbqSVu3Q0Sp8FQ2HAZm4aw3xjot1VaVGgUls3
	8RR8Hwyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hhH-0000000FmrO-40NC;
	Wed, 23 Oct 2024 20:11:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hSe-0000000Fky1-3oMs;
	Wed, 23 Oct 2024 19:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729713361;
	bh=2eGHmJWpTtKq2UCn19+DLfNCWbbeEMvh4tEJO3QfZAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gA2paiJC92mudSnR8YyTFNbcubgzip/VTq5MZfltH90ocje1KVVd4HME7Gttk1UXh
	 N5s16qKAPZ9RHODI6CIaLeAb6E4p39arDDQDiT0bJdmxj+Jyej9lVp7pkikAli5BlQ
	 OTUoCivLOmkKHc5MhJ7t0Zid4KeFP3QAvJ7CESHate0iHwdW/QCDkg20+V2B+897Tp
	 VtqsTwBcer2k+qyrGl5UH4zAm3Z95QAMII86lxVWfuKtF8lbZzqJevUS4YB/HKspuC
	 jwBFnSVjFdf5aD/yUO8DiYrsWyM84v8HEhSZoB3KFBTI8a0NR0zntmITfRMh5UEmBE
	 9x/5laTCVAmlA==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 26AFC17E3703;
	Wed, 23 Oct 2024 21:55:58 +0200 (CEST)
Date: Wed, 23 Oct 2024 15:55:56 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jon Hunter <jonathanh@nvidia.com>, kernel-team@android.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] drm: display: Set fwnode for aux bus devices
Message-ID: <7a8dede1-ef29-4553-9412-de8e2f45b860@notapiano>
References: <20241023191339.1491282-1-saravanak@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241023191339.1491282-1-saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_125605_154373_C6CACB57 
X-CRM114-Status: GOOD (  12.66  )
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

On Wed, Oct 23, 2024 at 12:13:36PM -0700, Saravana Kannan wrote:
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
> 
> mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) with backlight-lcd0
> tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) with 1-0008
> 
> Reported-by: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
> Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@notapiano/
> Tested-by: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvidia.com/

Hi Saravana,

the issue faced by Jon needs the exact same change but in a different place,
drivers/phy/tegra/xusb.c, which I posted at:
https://lore.kernel.org/all/f979aff2-34f4-4f6d-bb9a-03a02afc4635@notapiano/

So we need two separate patches, one for each issue. Feel free to add that to
this series. (I could send it myself, but I think it makes more sense to keep
them together)

Thanks,
Nícolas

