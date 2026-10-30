Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03979606A321
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2026 17:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cOx/7wSm;
	dkim=temperror header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.a=rsa-sha256 header.s=dkim header.b=07udqYsU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5QrMtaadB01ja5QUxNpwn6WttY8QR0YjgchVxio8Pbw=; b=cOx/7wSmsYmPWk
	pbLkCIYLD9YCeCnfKxKCYU+RA5mYGMqbnaJlO8X0y2qPyCKJZTde1okanDFX4Jp7T1v4VuV+ctUXq
	PUjXgwVr8CWl6gGn7bk5E8V2O7WLr6KBrA+DVjPALvcSFlUxus5UPvt5vbMnyUN3HOrYTckyPwxqX
	Qexd2KcYnX50URoLRKL1RIOBcqvEXVJD+mNvgbBK/zA8IP1abeBBriQNNgCjoTsylGtE/GDB7YLk7
	tWKIrF+vJHYst2xV5F/Fv3Y06ohr266il0rSq6z57NC6vZ/HSp59wgRyBBOF+U5C6lAO2NpwscU2l
	XBdezuSbC2ZTuJtiy24Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqZ1-0000000CG1M-0egR;
	Fri, 30 Oct 2026 17:38:51 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqYw-0000000CG0z-1TB7
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Oct 2026 17:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:MIME-Version:
	Content-Transfer-Encoding; bh=5QrMtaadB01ja5QUxNpwn6WttY8QR0Yjgc
	hVxio8Pbw=; b=07udqYsUhf3YOzAgN/h0b630lhAlEwlcIKxcIt0demPXJRcmAE
	bjbyyugN3oKHPI3cO7ej8PcUA4eVRnKSBTjiNNuSKMdCKQlXoJZrCZJ0/TzDeCIg
	mecyihZ7vxiwKz4FRF84dmB/rK6OnvqgIfRbd+Uacnk5KxeRg+05eosqo=
Received: from localhost.localdomain (unknown [113.200.174.17])
	by hzbj-edu-front-3.icoremail.net (Coremail) with UTF8SMTPA id BbQMCkCmrgEe1uRqEyMMAQ--.11108S2;
	Sat, 31 Oct 2026 01:38:39 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>,
	Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH] wifi: mt76: usb: re-enable the rx worker when resuming fails
Date: Sat, 31 Oct 2026 01:38:30 +0800
Message-ID: <20261030.pref-12.ed3d9ff5862d42e5@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261030021247.8032-1-25031212351@stu.xidian.edu.cn>
References: <20261030021247.8032-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: BbQMCkCmrgEe1uRqEyMMAQ--.11108S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUOb7k0a2IF6F4UM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I
	6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r
	4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1lnxkEFVAIw20F6cxK64vIFxWl
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY02Avz4vE14v_GwCF04k20x
	vY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVWUtVW8ZwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
	AFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
	UjIFyTuYvjxUIJPEDUUUU
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAQUCD2rkstQVtQABsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_103846_525533_17C3DAC5 
X-CRM114-Status: UNSURE (   3.68  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sean,

Could you please review this patch?

  [PATCH] wifi: mt76: usb: re-enable the rx worker when resuming fails

It re-enables the mt76 RX worker even when RX buffer submission fails
during resume, avoiding an unbalanced kthread park.

The patch is unchanged. I am copying this address for visibility.

Original submission:
https://lore.kernel.org/r/20261030021247.8032-1-25031212351@stu.xidian.edu.cn

Thanks,
YuanZhe


