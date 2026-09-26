Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48313C9832A
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Sep 2026 02:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:References:Message-ID:In-Reply-To:From:Subject:Cc:To:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LekUX8XsOEkUZaYG/ud+BHEQxw0g1s9GsSaIwr3EFk8=; b=ftKKuNfiaZr/dIcxtVmve+eMK7
	j+aFGlFcsEilc6eOSipLaFStlEJ3cL23xA8Pws4JyARM9+wnAg/K9t5ZY54pUNms0fRAbfzUCv68X
	Ct6X4WW/swtKmhz2VoR1B5KM5DRkTYpBQeRR7KkJuy5ouzsdAIZ8uKEsQM6NK6a4vWWIiqhzb+QiQ
	eW5oVn0LVLUOHyhfxoK4d5Pc94O4Wq+CfjQfZWaq+rYVs3FA/DPE2MHOpEKFoseIIHtAwCv0jFRfm
	vfk46s00VVqhXQ5eTbQnd6mFx86LW4zn/6rty6wwzIFCNtnJO61n1Z2R2WlhxVPYC8agBaaFLRxWV
	HRSmbE9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAIBW-0000000ErKc-3CHG;
	Sat, 26 Sep 2026 02:30:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAIBV-0000000ErJp-0NFG
	for linux-mediatek@lists.infradead.org;
	Sat, 26 Sep 2026 02:30:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E0C6260136;
	Sat, 26 Sep 2026 02:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB101F000FF;
	Sat, 26 Sep 2026 02:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790389839;
	bh=LekUX8XsOEkUZaYG/ud+BHEQxw0g1s9GsSaIwr3EFk8=;
	h=To:Cc:Subject:From:In-Reply-To:References:Date;
	b=bshKGTiajj3qyx4AOMn10qxr6nLoBNoXpPsoz1BqHWCsYP3Ss0ZO2q+ft2CP3kJiF
	 vuxb2ACtZvDl8cWyX91uJRm2oiEFW2C4bW/O6i+dnhwvu0OcfLtiPYr+6mo3D46Bms
	 YuQyaoDwhRP8++I9+mXJWf0M7Y3zi6ZNhn3H8p9bPIxFwwrcqxbXqcyRRnPFZOftCo
	 Xwc6LyASPFM0/huJ0yDF19O2xqPskTjnyN6cpVY0qNWgfZSMUdy2Wpz0jAF0ZTC9tt
	 Wcq0YQiP8miBVerbTYv1A/VMhxChWVLBt0n8mBGjUw7DZwfCvdOJDpF6QhljU6xYCm
	 AxAKF2nbUD9Lg==
To: <peter.wang@mediatek.com>
Cc: <linux-scsi@vger.kernel.org>,  <martin.petersen@oracle.com>,
  <avri.altman@sandisk.com>,  <alim.akhtar@samsung.com>,
  <bvanassche@acm.org>,  <santosh.sy@samsung.com>,
  <h.vinayak@samsung.com>,  <wsd_upstream@mediatek.com>,
  <linux-mediatek@lists.infradead.org>,  <chun-hung.wu@mediatek.com>,
  <alice.chao@mediatek.com>,  <cc.chou@mediatek.com>,
  <chaotian.jing@mediatek.com>,  <tun-yu.yu@mediatek.com>,
  <naomi.chu@mediatek.com>,  <ed.tsai@mediatek.com>
Subject: Re: [PATCH v2 0/2] ufs: fix POST_CHANGE pairing and AHIT race
 condition
From: "Martin K. Petersen (Oracle)" <mkp@kernel.org>
In-Reply-To: <20260914085148.136429-1-peter.wang@mediatek.com>
Message-ID: <yq1jyo8pwwc.fsf@mail.kernel.org>
References: <20260914085148.136429-1-peter.wang@mediatek.com>
Date: Fri, 25 Sep 2026 22:30:38 -0400
MIME-Version: 1.0
Content-Type: text/plain
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


> Patch 1 fixes a bug where POST_CHANGE was skipped on a failed gear
> switch, leaving the host in an inconsistent state if resources acquired
> in PRE_CHANGE were never released.
>
> Patch 2 fixes a race between the sysfs AHIT update path and the
> MediaTek host driver's power mode change path. A mutex and depth
> counter are introduced to serialize AHIT register access and ensure
> AHIT is correctly restored after the last disabler completes.

Applied to 7.4/scsi-staging, thanks!

-- 
Martin K. Petersen

