Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7132606A32A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XNXf9pBl;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vYUacr79
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UEWw9Ig9iKja9WE8XqeuTcxNBCAVmVPXINNvj1arHKY=; b=XNXf9pBlcrwTdK
	hZs8aNAANJKmb1u6l+miwcvarscHiogU9LKV2RKVaKAzf5HLs/b3hcZbOWgasVOdj/vzwWwvLFO9l
	bZ+8Z2ne/KnjdZlqtA/ge9f/QRnZ2iH8qnzMOVpsSRyW+xPmpIKsGVh8aKtnE7RslGfMX+2k2Tn6y
	fzlDY0zttm/TNY+lemqdh/Ufv/0yeTNMJ4nD0xjqeDWnc/A5LGyH2YYv77WO0ksLFQNuOqC70PiPt
	BkPT9lcBgKqWJNeTNgE5mK8nqb0GwKdMaUgPpXn3+C3ULZtwVFIGnAjIupSQiRkuc2jwz/FunU+Lo
	w+BwYOqzqvJkRg8HQ/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwVX-0000000B42L-221R;
	Thu, 19 Nov 2026 07:24:35 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwVD-0000000B3kk-3wwf
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 07:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=vYUacr79KMejsDRT7Jb+P2Ue+cjwAi7BFFey73gG6Hj5N2VfSV3qcX5lU7jBbkIKKo7Xgoph9PhCB
	 2kThkW5LRhnwv6KS1koHBr0IWzYkw9CNdCv0GiducappH0CBMZ1jV+OQkgnEJxLl+Nlv0dA+AdCpbT
	 zPI6ADT238cAy+bU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36afea415398-e72d9;
	Thu, 19 Nov 2026 15:24:05 +0800 (CST)
X-RM-TRANSID: 2ee36afea415398-e72d9
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36afea413214-0d3d4;
	Thu, 19 Nov 2026 15:24:05 +0800 (CST)
X-RM-TRANSID: 2ee36afea413214-0d3d4
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Peter Wang <peter.wang@mediatek.com>
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	chaotian.jing@mediatek.com,
	chu.stanley@gmail.com,
	alim.akhtar@samsung.com,
	bvanassche@acm.org,
	stanley.chu@mediatek.com,
	sashiko-bot@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] scsi: ufs-mediatek: keep mphy state in sync when va09 disable fails
Date: Thu, 19 Nov 2026 15:24:03 +0800
Message-ID: <20261119072404.101-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <359c3c1f4b30aa837011788a847d5c2c1cb3880e.camel@mediatek.com>
References: <359c3c1f4b30aa837011788a847d5c2c1cb3880e.camel@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_232416_711084_2CA0F2F3 
X-CRM114-Status: GOOD (  11.16  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Peter,

thanks for looking at both patches, and for the Reviewed-by on 1/2.

For the record, this replies to "[PATCH v2 2/2] scsi: ufs-mediatek:
keep mphy state in sync when va09 disable fails":

https://lore.kernel.org/all/20261118032015.974-3-laixiangwu@cmss.chinamobile.com/

On Thu, 19 Nov 2026 13:33:01 +0800, Peter Wang wrote:
> If the VA09 regulator_disable fails, could we just restore
> the PHY power state?

Yes, agreed, that is the better fix.  Forcing the state to false
(v2's approach) keeps the enable count of the va09 regulator stuck at
1 - the regulator core drops the consumer count only after a
successful disable - so the next power-on would raise it to 2 and it
never returns to zero: va09 would then never be physically disabled
and the devm-acquired regulator of patch 1/2 would hit
WARN_ON(enable_count) again on release.

Restoring the M-PHY also keeps the suspend error path safe: when the
power-off fails inside ufs_mtk_suspend(), the link is set off and
-EAGAIN is returned, and __ufshcd_wl_suspend() then runs
ufshcd_host_reset_and_restore() without powering the M-PHY back on -
with the state forced to false, that host reset would run against an
unpowered M-PHY.  (The Sashiko AI review of v2 raised both points:
https://lore.kernel.org/all/sashiko-outbox-220026@kernel.org/.)

So v3 drops the forced state clear and restores the power state
instead:

 	} else {
 		phy_power_off(mphy);
 		if (ufs_mtk_is_va09_supported(hba)) {
 			ufs_mtk_va09_pwr_ctrl(res, 0);
 			ret = regulator_disable(host->reg_va09);
 			if (ret) {
 				/*
 				 * The va09 regulator stays enabled, so
 				 * bring the M-PHY back up to keep the
 				 * software state in sync with the
 				 * hardware.
 				 */
 				ufs_mtk_va09_pwr_ctrl(res, 1);
 				phy_power_on(mphy);
 			}
 		}
 	}

mphy_powered_on is then left set, and the next power-off attempt
retries the full sequence, so the enable count stays balanced in the
end.

v3 is out as a new thread, with this change in 2/2 and your
Reviewed-by kept on the unchanged 1/2:

https://lore.kernel.org/all/20261119071611.117-1-laixiangwu@cmss.chinamobile.com/

Best regards,
Xiangwu Lai



