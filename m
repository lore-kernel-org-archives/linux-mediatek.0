Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D9CC636CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 17:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0qMuhWArbdGbqeRbzGWUeQkLwd0+Zp9mTMMqnSX4L4=; b=1B0nHQ047X9g90psED/aHZLxvd
	5CsY7XPmF1CZ3we+OMSlcmeM9PWqQ1hcwd8+kgQRBehMXDWGYGxQGHHO7S5c5nJpqmihBMnMCzz/f
	2MZjrFS5Nh780zdjt/xhtCXLCe+7pM+vGSoyFKi9pcdCdmVf32PDcIsf2NapEzdpP9An5H1sZZotf
	inc3IjVCeXy+/mWrFNZXM/9dcYwpmYOdeG6dsMLUQYQpIxK4VD4qrJtNQBBsoHNbfGEuIxf+4ZpCM
	l8//YdXduWaMiV5mgm8VgVNykXKjV9Wgp6WcY6cGbzFb5aeDdCNXKqPmLJw1JYtxV2SW7mt2eLl3n
	GlkoIHNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLnL-006kJG-Mb; Wed, 15 Feb 2023 17:42:15 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLnJ-006kI6-DY
	for linux-mediatek@lists.infradead.org; Wed, 15 Feb 2023 17:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=L0qMuhWArbdGbqeRbzGWUeQkLwd0+Zp9mTMMqnSX4L4=;
	t=1676482933; x=1677692533; b=VeNNehkXZKOpAqko0X758QrbQqECDtDPHWWVvOffjbzeJW3
	LiEPQ6BNzae1DrCl/uQbZHd1zXwcBBdtRc0QY6gNUxQLPmp5zC3/ObtbtanCWuxuR9arYZPoq1szD
	5CwzGSHLs2k3Nhi8nnHcLt/52BRcRt5tnG55PiRlu0EFbfLNM9O/6EmmNOH+Wh/hJtdIt1+uSdEoK
	c5e30R1t3ZXnUiwPRAfXTmNFn+BkjwfT3YYr1wBLbUO7rlmkyMbR0kpC8ngpJvbsQ4NDHybekNL+a
	DW7+/Jb9n7lYDzpMGsKIHBixsiY31AoFwfXDIzbn1WNZSatk7ffm+U9bg8Mzsg4Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pSLnC-00D9Rw-27;
	Wed, 15 Feb 2023 18:42:06 +0100
Message-ID: <26c62285825010dc9947c9a8c147f60da5db004a.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] wifi: mac80211: add EHT MU-MIMO related flags in
 ieee80211_bss_conf
From: Johannes Berg <johannes@sipsolutions.net>
To: Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org
Cc: Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	 <evelyn.tsai@mediatek.com>, linux-mediatek@lists.infradead.org
Date: Wed, 15 Feb 2023 18:42:05 +0100
In-Reply-To: <c1a6ef2f42e26a6e0473d4fb2ce1b572f8448d87.1675893838.git.ryder.lee@mediatek.com>
References: 	<c1a6ef2f42e26a6e0473d4fb2ce1b572f8448d87.1675893838.git.ryder.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_094213_475991_6A600BA2 
X-CRM114-Status: UNSURE (   6.03  )
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

On Thu, 2023-02-09 at 06:09 +0800, Ryder Lee wrote:
> Simliar to VHT/HE. This is utilized to pass MU-MIMO configurations

Typo - similar

> from user space (i.e. hostap) to driver.

^^ hostapd

> + * @eht_su_beamformer: in AP-mode, does this BSS support operation as an=
 EHT SU
> + *	beamformer
> + * @eht_su_beamformee: in AP-mode, does this BSS support operation as an=
 EHT SU
> + *	beamformee
> + * @eht_mu_beamformer: in AP-mode, does this BSS support operation as an=
 EHT MU
> + *	beamformer

Is that really about _supporting_ it rather than _using_ it? Or
_enabling_ it?

johannes


