Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA53EE499C
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 18:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jtFqbMJEAKthhQE7/YGE0KHCIaS0GbB3CcBV42CNQg=; b=HB4EOlLs64XS4NQasdSYmQblI3
	x1Q4Qad+76ddFLddxcQGZccJxCu2UCEupKRVm/woros1qvfYuYpVhAbJ997sd3Ux5OwBvMupk/wa+
	GnyTGYhLe+XN8kngv/KV1lAeRBtmYpENoPGX0LdGpszKH7VroEq04EEdtWHtLexABvhwzG9nPGKH6
	+KbmLS0NePJJ6mM8Sm7Z0flm/txSnaSJJs7aC3brNyPsR10Nyg/85x5eYV0r0L16RFkAvuurl0lVr
	sr33dUSnfsjIEymzjhKKAkXSR0/5uDrM7WnFsFsYdYiqk9+icVQmNe+w66OzOq07STjKVmc15GwET
	BNh1lHhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soRwE-0000000Ad1T-1GcT;
	Wed, 11 Sep 2024 18:19:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soRv9-0000000Acrb-0V2g;
	Wed, 11 Sep 2024 18:18:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 94F4A5C02BE;
	Wed, 11 Sep 2024 18:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64013C4CEC0;
	Wed, 11 Sep 2024 18:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726078705;
	bh=HGCD1cOq1Br54GxXXCh+0fpSRE29y419lG6xkZ/Q9Iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VUjlAjKEQVBkMO4u2Sz5cspgQr5eOlx4fuYUSp0eRLkGPheftjp6iZInJu72BdZwh
	 p+EFdw/N1XHIJGqKMX8XAdLUjnm1Jjn7MyZXArYeYZ2GpbVx0zWfcPIbSxAeg3brrA
	 EwZ4oq4FJtpc8liMgS6fzUScNMayDinY9JdHDJV3Bb2YJrUf38nwhUHLvpiv0kX5Lg
	 P56ubB7qBbvYrIB9lcJbj+vfQyqv9jWj4CWePvNKeHN57Kc5pm5mIcnSVplsyhVWg+
	 9Uy0dIBf/RjZzH4U3Su3c+6oA5/yXW2UmtRqBzh4Qjm1+s0HNsoaWseIcTxpiGr8hZ
	 8ifl16249UY9Q==
Date: Wed, 11 Sep 2024 11:18:23 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Chunhui Li <chunhui.li@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
	Petr Pavlu <petr.pavlu@suse.com>, kernel test robot <lkp@intel.com>,
	Xion Wang <xion.wang@mediatek.com>
Subject: Re: [PATCH v4 1/1] module: abort module loading when sysfs setup
 suffer errors
Message-ID: <ZuHe7zib3MiRn8l3@bombadil.infradead.org>
References: <20240911032802.22413-1-chunhui.li@mediatek.com>
 <20240911032802.22413-2-chunhui.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911032802.22413-2-chunhui.li@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_111827_223473_C1B571D8 
X-CRM114-Status: GOOD (  12.56  )
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

On Wed, Sep 11, 2024 at 11:28:02AM +0800, Chunhui Li wrote:
> When insmod a kernel module, if fails in add_notes_attrs or
> add_sysfs_attrs such as memory allocation fail, mod_sysfs_setup
> will still return success, but we can't access user interface
> on android device.
> 
> Patch for make mod_sysfs_setup can check the error of
> add_notes_attrs and add_sysfs_attrs
> 
> Fixes: db939b519bea ("Module section offsets in /sys/module")
> Fixes: 6d76013381ed ("Add /sys/module/name/notes")
> Acked-by: Luis Chamberlain <mcgrof@kernel.org>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409010016.3XIFSmRA-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202409072018.qfEzZbO7-lkp@intel.com/
> Signed-off-by: Xion Wang <xion.wang@mediatek.com>
> Signed-off-by: Chunhui Li <chunhui.li@mediatek.com>

Applied and pushed! I modified the commit log slighlty to fix the commit
referelcen to the first issue with sections as that is part
linux history.git.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=3f7b0672086b97b2d7f322bdc289cbfa203f10ef

  Luis

