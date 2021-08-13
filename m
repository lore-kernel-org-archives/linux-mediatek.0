Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24314C4320A
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 10:33:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C91C36109D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 10:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C91C36109D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rkvUqgGk4VlnA2yqmMKYKT2gk4vR5gtvt8cdQGSW2+E=; b=mHSX58aQOe1ZLOJ3o9vvsN4+5C
	YJVe59sWNJswxp1qUMm33YRDKudvn+XSu0nITyZgevtmSHE0ZDtLHrYPVYQEOIkzIcYcq0ZSeXxsY
	QwTp6TTD5RqC5zR5ZzKvb7I+fioUBKFa9dE3zwipE1l13489z7XLt+TdxV2Z58sNylcNuRRv1RPdP
	rNItJGDg7m3FdrSCZtppF2Wg+abao1zpyHZCkmNImN27gtj0YuywE35vIrZcbEFER9496L1yzcNmh
	ECv3TdB/ZM2NOUdB8aCRypaqkyi17gv0YPewKz+QKcA5UPh+JAYVd5ox2FTl6lvri50w2Jy41PHbW
	slo80yvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEUVO-00CSUR-Ao; Fri, 13 Aug 2021 10:33:38 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEUVI-00CSTa-PH
 for linux-mediatek@lists.infradead.org; Fri, 13 Aug 2021 10:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JFELaOrc4/QFqYmVPpsvH4IhzGuMZEqR40eN7dP8G1s=; b=pWhozETI3zBxWz582CC/MN3/aR
 Z8JrxkI7Ai9gYgxVNsmRI6KZu8O3/UktQLU+Jv3Pl0ZCpD4rvtc+BxLbxlQvBzwxFHAXn+P+qiuJg
 YLrL4GHuvJkSmjSf4OyG43tMH3Q+l44CyeTPCERAyvI7Dn6kBp750myKk0ibrCLlOkJc=;
Received: from p4ff13206.dip0.t-ipconnect.de ([79.241.50.6] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mEUVF-0007Cd-35; Fri, 13 Aug 2021 12:33:29 +0200
Subject: Re: [PATCH] mt76: fix determining multicast frame in sta mode
To: sean.wang@mediatek.com, lorenzo.bianconi@redhat.com
Cc: Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 Eric.Liang@mediatek.com, Stella.Chang@mediatek.com, jemele@google.com,
 yenlinlai@google.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <fbc5d3da47b6a5e99ae255560279268f580e7b22.1628543190.git.objelf@gmail.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <6c6ba2fd-3952-3c44-6c6d-51f77eb66828@nbd.name>
Date: Fri, 13 Aug 2021 12:33:27 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fbc5d3da47b6a5e99ae255560279268f580e7b22.1628543190.git.objelf@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_033333_037928_EA5EFCAC 
X-CRM114-Status: GOOD (  10.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 2021-08-09 23:13, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> We should use hdr->addr3 as the destination address to determine the frame
> is multicast frame or not when the device is running in sta mode.
> 
> We can simply use ieee80211_get_DA for ap mode and sta mode both cases.
That does not make any sense to me. When a sta sends a packet with DA
set to a multicast address, it will be sent as unicast to the AP. Why
should it be treated as multicast by the driver?

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
