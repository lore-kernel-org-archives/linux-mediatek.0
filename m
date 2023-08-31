Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64658C83F10
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Aug 2023 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFkzrTl8Fp3ap4MMUuNu0PYGNFGOEtpCS+5EryEpuCA=; b=d2CkRlfUFxE/iln/GEwsnEVLZD
	Ac/j59783OYTaJ9EQKUqQ4G/Mkxiv82GgalHu91Pb+9+r6ZKETKdCZFFY8f5sT6zzAx+fPyy11fr2
	AE+pd/EeaDMnLOyMp6MP3lvAz2tpZNl6G5aqzY9Vz3Nnf+asOedj4Yw1S/uaQck8dfbLeDrEXZDO4
	h1XjBweV7Q40Yxav7ToG2L6Nb7uZo6BuEAM4TFl7O8RtL50rOfd+aBHDSsAl+Yuef6ZbBvJi70xBe
	BqzvfJlMmgfaHPqT8aYnJ2tdWlEFwVkozLExBWOJAtKDRSobbD7jD8/7aDNkLfDbY/avnLcTBNyl5
	oo7VOGYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbjaP-00FVLH-2Z;
	Thu, 31 Aug 2023 15:27:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbjaN-00FVKp-05;
	Thu, 31 Aug 2023 15:27:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A9928B82337;
	Thu, 31 Aug 2023 15:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84665C433C7;
	Thu, 31 Aug 2023 15:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693495671;
	bh=RChlf7sNnlla1bk8aQ9fJlAckK82BDukWAF14ibCRYw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=FSVeVd9TdURBaRoL2h14T2qbLnhUCZvDYvH+tCXP9QkhsjWI0LcNbW4Mb/X1rsSTX
	 OtsnwD6m/SJ2BavTtlnZDtRs+6Hr5MYPWG2rLuUPSrNw+H3TN/TF8Sre0VY+6WkfZB
	 zcDiPQMJ5eYZJhkth1x/E6TgZSe7WITkRxEel+cCzvrW9hFtwdGsOVLghmcELZjfhx
	 Rq0GC/Gta8iCVhNkxsz6lWT7lQFKdlKRbA/I74O6Vi8Vy/mFPorBGBeyGav4QYtczF
	 3l1jH+urvcVRaqAfGj2lh1yPMSdnDUuur7Uvp3TziUsA5eFTeBfdzV02WgYhKUpCZk
	 e+UDWP25AB16w==
From: Kalle Valo <kvalo@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <gregory.greenman@intel.com>,  <briannorris@chromium.org>,
  <nbd@nbd.name>,  <lorenzo@kernel.org>,  <ryder.lee@mediatek.com>,
  <shayne.chen@mediatek.com>,  <sean.wang@mediatek.com>,
  <matthias.bgg@gmail.com>,  <angelogioacchino.delregno@collabora.com>,
  <avraham.stern@intel.com>,  <johannes.berg@intel.com>,
  <emmanuel.grumbach@intel.com>,  <trix@redhat.com>,
  <dmantipov@yandex.ru>,  <christophe.jaillet@wanadoo.fr>,
  <yangyang@marvell.com>,  <linville@tuxdriver.com>,
  <rramesh@marvell.com>,  <akarwar@marvell.com>,  <nishants@marvell.com>,
  <linux-wireless@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,
  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net 0/3] wifi: Fix the NULL vs IS_ERR() bugs for
 debugfs_create_dir()
References: <20230831141347.3166988-1-ruanjinjie@huawei.com>
Date: Thu, 31 Aug 2023 18:27:44 +0300
In-Reply-To: <20230831141347.3166988-1-ruanjinjie@huawei.com> (Jinjie Ruan's
	message of "Thu, 31 Aug 2023 22:13:44 +0800")
Message-ID: <87v8cvdyfj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_082755_238557_78CD400A 
X-CRM114-Status: GOOD (  10.64  )
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

Jinjie Ruan <ruanjinjie@huawei.com> writes:

> Since debugfs_create_dir() returns ERR_PTR and never return NULL, So use
> IS_ERR() to check it instead of checking NULL.
>
> Jinjie Ruan (3):
>   wifi: iwlwifi: mei: Fix the NULL vs IS_ERR() bug for
>     debugfs_create_dir()
>   mwifiex: debugfs: Fix the NULL vs IS_ERR() bug for
>     debugfs_create_dir()
>   wifi: mt76: Fix the NULL vs IS_ERR() bug for debugfs_create_dir()
>
>  drivers/net/wireless/intel/iwlwifi/mei/main.c  | 2 +-
>  drivers/net/wireless/marvell/mwifiex/debugfs.c | 2 +-
>  drivers/net/wireless/mediatek/mt76/debugfs.c   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Wireless patches go wireless-next tree, not net tree.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

