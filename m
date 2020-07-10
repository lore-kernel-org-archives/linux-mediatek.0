Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9C9C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 06:39:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 797A22072E
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 06:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oe2M5gmR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkHb+YcX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 797A22072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o93THscb6XULlKENLWJp6SW2sIWbGohX7L1l5/oiggc=; b=oe2M5gmR5P4KjsPm30n3wkUQM
	JElJXuNaDGQldChbY6LsQeTRzTBE7fHd2h+qsRbGkyGo8xKM/Cky5L/jiSY4Q4ph+sHcm+AmLjLo5
	1Qk8W1zLLDo/75G2NJTJ2m8USRgJh6EHjkrCvBgF8UGB1BR6wdP9jlrAmpc6vW9myN2ygnwr4h3lg
	SKfGHjAq+1C0hhUDFxNj+z/ijTwO6sBj6jFupP5X9wa1qRZeTtfBpZCIu2mVsKt+iQ9YLFb1XOzE8
	qeNjEG7Jh/2byPfU6UeTCJt8cfoj94dj3orZspk0tjM6ZleR1aEcOzJw+GlEbII+JLMLtIWxVBMvN
	fh2w8ghdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtmgy-00056f-Ne; Fri, 10 Jul 2020 06:39:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtmgu-00055q-TL; Fri, 10 Jul 2020 06:39:25 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E495206E2;
 Fri, 10 Jul 2020 06:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594363162;
 bh=VeAdv2zvjhR50/sWd80CD/5NF8lrpjnxOIgtTU/9GAA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SkHb+YcX/0UMMaT6iUIFDac/JmeSVmB7ir9SP0EtL3TT4MbPNLNmurGCPZByWQvPj
 N3PdfLM4VZr6zzy8jLuVt+hVV/nBcE2dC1wrOABWZ1PaiWA7Rph2FdEGugJ3sYo8f3
 HwINk5xa+ZMHgU8RicKoNWA2R/X0HZL58gYDtlR0=
Date: Thu, 9 Jul 2020 23:39:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [RFC PATCH v2] scsi: ufs-mediatek: add inline encryption support
Message-ID: <20200710063920.GD2805@sol.localdomain>
References: <20200304022101.14165-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200304022101.14165-1-stanley.chu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_023925_023524_BEBFFC65 
X-CRM114-Status: GOOD (  13.07  )
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

Hi Stanley,

On Wed, Mar 04, 2020 at 10:21:02AM +0800, Stanley Chu wrote:
> Add inline encryption support to ufs-mediatek.
> 
> The standards-compliant parts, such as querying the crypto capabilities
> and enabling crypto for individual UFS requests, are already handled by
> ufshcd-crypto.c, which itself is wired into the blk-crypto framework.
> 
> However MediaTek UFS host requires a vendor-specific hce_enable operation
> to allow crypto-related registers being accessed normally in kernel.
> After this step, MediaTek UFS host can work as standard-compliant host
> for inline-encryption related functions.
> 
> This patch is rebased to below repo and tag:
> 	Repo: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
> 	Tag: inline-encryption-v7
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufs-mediatek.c | 27 ++++++++++++++++++++++++++-
>  drivers/scsi/ufs/ufs-mediatek.h |  1 +
>  2 files changed, 27 insertions(+), 1 deletion(-)

Now that the ufshcd-crypto patches this depends on are in 5.9/scsi-queue, could
you retest and resend this patch?  It would be nice to have 5.9 support some
real hardware already.  (I'm going to resend my patchset for ufs-qcom too.)

- Eric

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
