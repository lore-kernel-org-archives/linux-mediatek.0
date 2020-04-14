Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C99CC2BB1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 06:49:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2B7C2072D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 06:49:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NJcc3aea";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="m6FdPNnz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2B7C2072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L9RBwp4rJhumEnH2CwB8IpQbjjZ3J8W0FmrRCslQnvo=; b=NJcc3aeaNMPThm
	a7gEKDve/pb6uv7tZD2G1VndqB7R46nVaT8BvdtME1NJ7zOX3ZI8zHJ6e83kqkSkVpCM89b1nBYzI
	RJ8VaIUoNzjXi8Omx1Q0rRzx32jfR3Ywp2j1qCC41YPOXFSqykW11Hrs3pdjuMfN0tS0rkWo6z1Xt
	r9r5iM8rEgq5c0iS8G7R9Ds+1eYEjxxJPJBingfcJa9fDfoxdHbNJXVdINh5rbfUODIlJ+g7ZM+uX
	rJnMeBYTn5gULXQy65JT1IpNBZqiHt17+8nwZ6Pr6sM019DE0z868Fg99TiRiWQK+eXIjsK6XRNpg
	pKj5/0/4Ti+LpmHA65BQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOFNQ-0005V2-Un; Tue, 14 Apr 2020 06:48:56 +0000
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOFNN-0005UW-DJ
 for linux-mediatek@lists.infradead.org; Tue, 14 Apr 2020 06:48:56 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586846933; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=UHM5/YIDr5wmXBMzN36WzRu76iZETHqETU6tv8SIFjc=;
 b=m6FdPNnzc1GSBezcM7b36E+tbB0Rj0x7TMcCkbJzZ13NJaFoIxi5FOJ/GvaCY1phek1PfLxh
 KLCE+tToYLUk8iCdSnsYJt1mCXThvAh3f9gBtIU9VSGKkwHuxXsvdmo9hN9BvFqKAgn6FBoF
 ivFkzZP9AqIxXY4qf+NgmY/ZjDs=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e955cd2.7fdce3c7e5a8-smtp-out-n03;
 Tue, 14 Apr 2020 06:48:50 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A4C55C433BA; Tue, 14 Apr 2020 06:48:49 +0000 (UTC)
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 25D0EC433F2;
 Tue, 14 Apr 2020 06:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 25D0EC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH v1 00/16] Add MediaTek IEEE 802.11ax devices - MT7915E
References: <cover.1586558901.git.ryder.lee@mediatek.com>
Date: Tue, 14 Apr 2020 09:48:45 +0300
In-Reply-To: <cover.1586558901.git.ryder.lee@mediatek.com> (Ryder Lee's
 message of "Sat, 11 Apr 2020 06:51:15 +0800")
Message-ID: <87eesqlfzm.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_234853_508329_2A279F13 
X-CRM114-Status: GOOD (  14.32  )
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
Cc: Sean Wang <sean.wang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, YF Luo <yf.luo@mediatek.com>,
 Chih-Min Chen <chih-min.chen@mediatek.com>,
 Yiwei Chung <yiwei.chung@mediatek.com>, linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Ryder Lee <ryder.lee@mediatek.com> writes:

> MT7915E is the latest generation IEEE 802.11ax NIC in MediaTek, which
> currently supports AP, Station and Mesh mode.
>
> Even though some code of MT7915[1] are similar to MT7615. New generation has: 
> - Huge amounts of HE dedicated parts.
> - New designs of PHY/firmware/DMA scheme.
> - Most fields of txd/txs/rxd/rxv are rearranged or deprecated.
> - Support much more offloading stuff.
>
> Most importantly, for the sake of convenience to get family devices supported
> in the future, it was concluded to be simpler to have a clean start for this
> generation. This makes maintenance easier and avoids major changes in MT7615,
> which currently shares the codes with low power capable device MT7663. It will
> increase the risk of regressions in existing flow.
>
> MT7915 supports only basic HE for the moment, whereas other 802.11ax specific
> features, such as BSS color, TWT, SR, DCM and OFDMA are work in progress,
> and will be gradually added in upcoming days.
>
> The firmwares are available now from https://github.com/ryderlee1110/wireless-fw ,
> and will be submitted soon. At last, the developers are all listed in the series.
>
> [1] https://www.mediatek.com/blog/mediatek-mt7915-wi-fi-6-wave-1-chipset-builds-in-a-range-of-industry-firsts 
>
> Thanks,
> Ryder
>
> Changes since v1 -
> - list a missing developer.
> - drop unused codes in the hw_tx_amsdu patch.
> - add a missing bitwidth change of wcid.
> - add more TODO items in the driver.

This patchset should be marked as v2, no big deal but just a
clarification. I did have few comments on the real v1 though, please
take a look.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
