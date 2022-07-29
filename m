Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45303C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 08:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUbcVpXFRmvX5p9zp4+xAqDyyy/CcmY8UU4t3mbQMmU=; b=CbGMEE3JWTat7NHQGPS3yKYosK
	ZnRGBFyHn+TrxXpzPZqUQEB861nmhKP1RISRvQooDQcWT+CQHl/m/Ld+ZhGhPlpAL4um/p+kasAg3
	bfl8tXssm3pDADABg3ldfbeSxo/9TxrrF9TQySqk1h2iBqKI7O4l2vA9i8hmc3xdZJ8yehP0/tqog
	2/5DEeezgYM9SKSMXqqLGm8v6yYv+efFers0YMfTcJq9ot46CV7HhKnEGgQBDm0bkbYiTnIulqcTM
	Df57QtZmreW/adP7An9fEqq/dd6JX2U3uW1RAt2V/RaKTcWFckbqkqyGmGwmiGgZ29lkkMBtVMHj4
	EQ4vC+Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLOj-003HX6-3f; Fri, 29 Jul 2022 08:31:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHL4g-002yz1-77; Fri, 29 Jul 2022 08:10:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4891861BE9;
	Fri, 29 Jul 2022 08:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D448C433C1;
	Fri, 29 Jul 2022 08:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1659082220;
	bh=BvKlDnh9cU0HZ+oSmGTqHqFzpwVEA0UVMnTKLAsW1t4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IsKYdOICG+u2L1NeckIDTea4vZR/7c4ENTer6g0wHVHVt/tnxkZwyNhHCAWDDD1Le
	 qQ8GfZZiaiIeSxYGwaJfWqQz2BHFrOuVk5+8zAknV9s5mz7Vy7+ZXIWO76lrNUGMfU
	 jFQKhw/GO+kCHUZ2Hle2jPVSK7/+XbZKaJWWiPUo=
Date: Fri, 29 Jul 2022 10:10:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniil Lunev <dlunev@chromium.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andy Gross <agross@kernel.org>, Avri Altman <avri.altman@wdc.com>,
	Bean Huo <beanhuo@micron.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Daejun Park <daejun7.park@samsung.com>,
	Eric Biggers <ebiggers@google.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Stanley Chu <stanley.chu@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH v3 1/2] ufs: add function to check CRYPTO capability
Message-ID: <YuOV6l/7KoVO4yZp@kroah.com>
References: <20220729020508.4147751-1-dlunev@chromium.org>
 <20220729120216.v3.1.I6b7934b96fff0d5ea22531e57c0a11f0ccd1acd8@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729120216.v3.1.I6b7934b96fff0d5ea22531e57c0a11f0ccd1acd8@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_011022_353137_AD884AB3 
X-CRM114-Status: GOOD (  13.04  )
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

On Fri, Jul 29, 2022 at 12:05:07PM +1000, Daniil Lunev wrote:
> To align with other capability check functions.

This is not a valid changelog text, sorry.  Please read the
documentation for how to write a valid one.

> Signed-off-by: Daniil Lunev <dlunev@chromium.org>
> 
>  drivers/ufs/core/ufshcd-crypto.c | 8 ++++----
>  drivers/ufs/host/ufs-mediatek.c  | 2 +-
>  drivers/ufs/host/ufs-qcom-ice.c  | 4 ++--
>  drivers/ufs/host/ufshcd-pci.c    | 2 +-
>  include/ufs/ufshcd.h             | 5 +++++
>  5 files changed, 13 insertions(+), 8 deletions(-)

Something went wrong with your patch, there is no --- line, so git will
apply it with the diffstat, right?

Did you hand-edit this?

thanks,

greg k-h

