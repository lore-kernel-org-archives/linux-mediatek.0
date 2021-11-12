Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014A5C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 11:53:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7067B60EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 11:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7067B60EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJkRr8tD2pz0sQHz4Ej2TIuSQwiEgK4F5upR9l8phK8=; b=inAJYfnZwOWyWj
	cBL7j4/jAqa0ZVldzZBB/VD1tekTVYCtyGMAAk27wLJ1/Myp08WAsKXN5xfhB7y1OL4tSoE5FXUQi
	YZkOA8hynqMSAawTJn36oj3e6yTnFvLwK1UezZHwsBKOlstA83p7ERS0TN5/m2i12Ba/qtv8XAQ/Q
	TXw3lQj8B5WTO+AkWOfO1d3nEyvyFDBSUm6IGBFwEosFwnq/2EP7WZShVnj039GaVvh0qmhrUCAtr
	EdkIQWOJJxQ2zkIfoSr7CqYEBzIbmGM1MkZ0ZKNtLrmUiKHEiYkQeu/amSs9qPFjykP291h1YI1kR
	3BWbi7DvbqUHLvHZzzIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlV71-00ABfQ-0y; Fri, 12 Nov 2021 11:52:55 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlV6y-00ABdW-89
 for linux-mediatek@lists.infradead.org; Fri, 12 Nov 2021 11:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5Z7UVge4oAfupyRsAkMMB5dJhahHzHNxbOi2lNb0kE8=; b=pihKnAr7tXPDpRZvyNwzYzUNSa
 wDMjaCBSpt2ItB5dov95kQllx/jpLcyH8B8ZcrCFtn8oqraP5pPmfaiOAP62NP+FZPZykkOfUA/Lh
 horuRffjNOr896DnVm94RXkl1qmJ6p2mCPv4+rMxf40IKmfKPdnZtWxn97cmrfUrhz9o=;
Received: from p54ae9f3f.dip0.t-ipconnect.de ([84.174.159.63] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mlV6q-0003ZF-Ps; Fri, 12 Nov 2021 12:52:44 +0100
Message-ID: <9b087a78-fb5f-40f4-378b-77ca53de3aab@nbd.name>
Date: Fri, 12 Nov 2021 12:52:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v2] mt76: do not pass the received frame with decryption
 error
Content-Language: en-US
To: Xing Song <xing.song@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20211110025404.174080-1-xing.song@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20211110025404.174080-1-xing.song@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_035252_512597_26BC0334 
X-CRM114-Status: UNSURE (   6.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-11-10 03:54, Xing Song wrote:
> Drop the received frame if decryption failed and mac80211 can not
> handle it.
> 
> Signed-off-by: Xing Song <xing.song@mediatek.com>
What happens if decryption failed? Do we receive the encrypted packets?
If so, I think we should return -EINVAL only if we don't have any 
monitor mode interfaces. If monitor mode is active, we should probably 
just clear RX_FLAG_DECRYPTED instead.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
