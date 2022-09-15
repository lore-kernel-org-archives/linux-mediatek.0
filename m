Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838AAECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 10:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2PVGSLYVhYVOYUgzEaxtuM8dru19YpOrdE26sSaX1w=; b=gdhuRWGB5f24MUUYW3yzCQcIUV
	FnYdjUV8tzvqSjrpZ8VKALVOdur1Qk14KuEITRcUB1SBD69IISXyRF+pU0FJ/xBZSEXmWLvT2abxb
	bD9npsncRHLO+2vOKSQtqZedsaAs55609W7SO7+38GY4eG/X+3E8z3g/mDy8a8JOGlOT0PVmykTWK
	vavU027uMB90id0Pt/6uLCJvgUCkdJlyw382Dq4iwLw6Gbt6dVri+jkrjku3NvtahBZ55IYg0Ur4k
	QbjkJNe8xR+0XabtqMPFhrIqhySlCyET7vIRmOXcNfWRuBIfMaYaadjvLzqqOtn+MgpxJULahxZcq
	6f+R1kGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYmFl-006xlE-CE; Thu, 15 Sep 2022 10:37:53 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYmFj-006xi6-5X
	for linux-mediatek@lists.infradead.org; Thu, 15 Sep 2022 10:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=W2PVGSLYVhYVOYUgzEaxtuM8dru19YpOrdE26sSaX1w=; b=A0VQiNMbNAnJmdTCXR8w1VN7XY
	qzZTz2HSFrmn/JKzmERQ1WNV0KSA26Lw/1aZWplWdux02R2SsS0h1i/pR4jgnFT2Qx8COJ24Z2zoO
	6/4t5pLBXDabt2TTTTYLLOKZIwYRjcoM3xrm98uinQbAdqhJbFFDv+n32uLZ2Uni8sTA=;
Received: from p200300daa7301d00b82a348903aff2a7.dip0.t-ipconnect.de ([2003:da:a730:1d00:b82a:3489:3af:f2a7] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1oYmFM-0058hv-1R; Thu, 15 Sep 2022 12:37:28 +0200
Message-ID: <982053de-7bc0-0d4e-9eb7-9da0be559058@nbd.name>
Date: Thu, 15 Sep 2022 12:37:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2] mt76: mt7921: fix antenna signal are way off in
 monitor mode
Content-Language: en-US
To: sean.wang@mediatek.com, lorenzo.bianconi@redhat.com
Cc: Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 jenhao.yang@mediatek.com, robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
 ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, kuabhs@google.com, druth@google.com,
 abhishekpandit@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <0f95fcdb8511ec765040c8fe85c1fa09437e8ef5.1659574985.git.objelf@gmail.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <0f95fcdb8511ec765040c8fe85c1fa09437e8ef5.1659574985.git.objelf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_033751_314621_70C86A96 
X-CRM114-Status: UNSURE (   8.76  )
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

On 04.08.22 03:07, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Group 3 in RxD is disabled in monitor mode. We should use the group 5 in
> RxD instead to fix antenna signal way off issue, e.g we would see the
> incorrect antenna signal value in wireshark. On the other hand, Group 5
> wouldn't be used in STA or AP mode, so the patch shouldn't cause any
> harm to those modes.
> 
> Fixes: cbaa0a404f8d ("mt76: mt7921: fix up the monitor mode")
> Reported-by: Adrian Granados <agranados@gmail.com>
> Co-developed-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
This patch has been line wrapped and does not apply. Please resend.

- Felix

