Return-Path: <SRS0=2SCH=AX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C368C433E2
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2020 00:35:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A6C9207DF
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2020 00:35:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s8nqceCv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Pb5wRf5u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A6C9207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=64Xb6kN4akunxOL7tFUbz3r5Ivit4eRPIw3rcFSMcwE=; b=s8nqceCvoM3jtYt6ogqzc3xnj
	UGVInh09T2e8eIHzlJi3t85I3G+tySL0Um2FhbZTb70xQ2WgZ5nWVUNMToGUhpypzDr9eiUHsL3LB
	vtZRH2U1mRpznVD97GN07RLlkzfoY380m6diNvhan1OwmErL3mNuaGfBwdMAojuRW4tktaeKhbOGj
	KPPx47Y6GF61aowSaMo68aiTFHHjwXPiyAWeAuxiSG9Pa4iE/gi3IpYLcsFQ4aX4RsJ6+rRdlekq9
	mSdkEWOtn0ZK12YST3I6EzYQSjfTiC61Q3HBpkn4P+iZCBG2hwPSf3XbfPsw67qM1xOBQ5EQ/lFOp
	1ZabzENxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juPxI-0002QG-FA; Sun, 12 Jul 2020 00:34:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juPxG-0002PW-K1; Sun, 12 Jul 2020 00:34:55 +0000
X-UUID: 2d660340cea94bbb906effd503af7bf2-20200711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=n3sNpYiLmKaGsJfthLW62RYEg3Nma2G80CSDm3G+WZw=; 
 b=Pb5wRf5unXe45znaK4ZQ6rfHSOGfIBLTX9dHlBxdIvoNW2goUiqXWXNIWABMGRzAfENMGMy/F7Q/3IYKtqMFrYF+E8GfAB6r/n/mE48oOi9yqBhVAbmsfuUFSj5IaXji6KYhDsZNuwOH/oHC4zrZbqu+ibtZ0oUIFQm6UPTD3uE=;
X-UUID: 2d660340cea94bbb906effd503af7bf2-20200711
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1572290177; Sat, 11 Jul 2020 16:34:48 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jul 2020 17:34:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jul 2020 08:34:45 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 12 Jul 2020 08:34:45 +0800
Message-ID: <1594514085.10600.5.camel@mtkswgap22>
Subject: Re: [RFC PATCH v2] scsi: ufs-mediatek: add inline encryption support
From: Stanley Chu <stanley.chu@mediatek.com>
To: Eric Biggers <ebiggers@kernel.org>
Date: Sun, 12 Jul 2020 08:34:45 +0800
In-Reply-To: <20200710063920.GD2805@sol.localdomain>
References: <20200304022101.14165-1-stanley.chu@mediatek.com>
 <20200710063920.GD2805@sol.localdomain>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DBA37B226ABF5071E1BA737E04B4A839B2BD8511C427FF6EECB7C92A7EC944282000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200711_203454_851063_2CA42DC1 
X-CRM114-Status: GOOD (  18.29  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 light.hsieh@mediatek.com, satyat@google.com, avri.altman@wdc.com,
 linux-fscrypt@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Eric,

On Thu, 2020-07-09 at 23:39 -0700, Eric Biggers wrote:
> Hi Stanley,
> 
> On Wed, Mar 04, 2020 at 10:21:02AM +0800, Stanley Chu wrote:
> > Add inline encryption support to ufs-mediatek.
> > 
> > The standards-compliant parts, such as querying the crypto capabilities
> > and enabling crypto for individual UFS requests, are already handled by
> > ufshcd-crypto.c, which itself is wired into the blk-crypto framework.
> > 
> > However MediaTek UFS host requires a vendor-specific hce_enable operation
> > to allow crypto-related registers being accessed normally in kernel.
> > After this step, MediaTek UFS host can work as standard-compliant host
> > for inline-encryption related functions.
> > 
> > This patch is rebased to below repo and tag:
> > 	Repo: https://urldefense.com/v3/__https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git__;!!CTRNKA9wMg0ARbw!x8Kltcu8AQhdtlIDXASWjd_ANrBtcYzidIXMsu-fQloEqgvrDDBU9yD9GumtKLIcd_c$ 
> > 	Tag: inline-encryption-v7
> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > ---
> >  drivers/scsi/ufs/ufs-mediatek.c | 27 ++++++++++++++++++++++++++-
> >  drivers/scsi/ufs/ufs-mediatek.h |  1 +
> >  2 files changed, 27 insertions(+), 1 deletion(-)
> 
> Now that the ufshcd-crypto patches this depends on are in 5.9/scsi-queue, could
> you retest and resend this patch?  It would be nice to have 5.9 support some
> real hardware already.  (I'm going to resend my patchset for ufs-qcom too.)

Sure. Now this patch is resent as v3, please see
https://patchwork.kernel.org/patch/11657987/

Thanks,
Stanley Chu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
