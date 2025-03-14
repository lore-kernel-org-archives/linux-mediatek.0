Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17828C282EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Mar 2025 12:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArFMc2FpdwStSCJ3m03cTYRxVOydbfBSAqNyXM8k2cA=; b=SbKVTcsll3dUk7fsfC9SlbKBQV
	qoNNqtk9OdMqgeQ8lvUNMgm6XdXbIwijhgpeMhFcZ/TmNLR1mN6BLo/xFEqelrNkGbdqrZgb/RZyI
	yfFRGhw17Atwx9iYYfGtX9IVTuzdeGGf5IFbX4XIQZDSF4zZxvXvyzD5BFCet1OwlymMBRFj5KtMM
	8CUOBljTApfspNgFskt8g9GQqg/G1/4wtEhSLBBwDsZTlvVXJnq3/iYsU9M4dby3XKU1eW6CSAYnU
	+EdMfQ2rewEAWHJOtfrChSttaYmgSJS/AZoj8ciRmMOkmikP+fGlc3TeTlBLPsXt4kOH0C9inMCJT
	YFeG+Biw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt46D-0000000E9fN-19B2;
	Fri, 14 Mar 2025 12:25:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt46A-0000000E9ex-3gVc
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Mar 2025 12:25:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EF1ECA46610;
	Fri, 14 Mar 2025 12:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9EB9C4CEE3;
	Fri, 14 Mar 2025 12:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741955109;
	bh=4yUZqv+zFjEOVzZ9rsSZ/h7wicQke9kUl8I46PLezqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EiKCos/4tHDXUiRfeyR0qM2hBEHcVz3wg9uXgKSHfp//H2HWbc+BqkxwLXZ4kJnrS
	 qOoIo8FfYcsIznW7aUHXFask3aihjh9AyiYGi9BCnA77R4Zh33CXNUDuP/w/4oQrnn
	 bcGSlNDCsyuPklMFszYH7L0d0ymgWn+Va4v2MGMI=
Date: Fri, 14 Mar 2025 13:25:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, deren.wu@mediatek.com,
	Sean.Wang@mediatek.com, Leon.Yen@mediatek.com,
	Michael.Lo@mediatek.com, allan.wang@mediatek.com,
	Eric-SY.Chang@mediatek.com, km.lin@mediatek.com,
	Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com,
	Shayne.Chen@mediatek.com, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] wifi: mt76: mt7925: fix the incomplete revert of
 [tx,rx]_ba for MLO
Message-ID: <2025031447-attribute-sequel-f77b@gregkh>
References: <20250314090655.2856153-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314090655.2856153-1-mingyen.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_052511_022050_174E2B97 
X-CRM114-Status: UNSURE (   6.64  )
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

On Fri, Mar 14, 2025 at 05:06:54PM +0800, Mingyen Hsieh wrote:
> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> 
> Since the `Revert "wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_ba for MLO"`
> was not completely clean, submit this patch to fully clean it up.
> 
> Cc: stable@vger.kernel.org
> Fixes: 73915469c55a ("Revert "wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_ba for MLO"")
> Change-Id: I2d851e6b79905baae35f691578bf50d56ad0adbf

Please always run scripts/checkpatch.pl before submitting changes :(

thanks,

greg k-h

