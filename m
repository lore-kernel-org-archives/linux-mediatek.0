Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19900C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 07:45:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1776613E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 07:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1776613E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x+5NqyhGsEphIpDmhB+pYzQT9HAzSA21mHxIiOd5LbA=; b=IBBaKoFGWdGvdQeee65HN1KiP
	LhZzOF1RJpNSrZdufcaSqPKAX04uEjzbZzLpbiXS2coPK/98QPa8LI1IMC4FxNh4DfKj95L8X0f71
	E0vYlxhK5EiCPV3cP8EXdLcLNvTHjTaNpMmtPRtsg/QZ6k4yOHx+XyqoHLeO7t2rWuI6+YkElLlro
	tQ980X2FYQyjJugDRrQS19viN2dE7c9wVDWTNoYpG/dSQo5zpLGkAQwNK9YsjlZGN7SunoK5+jhJA
	Rdo+sEHONiVU/sYGV23T+FzSSrxJhOv+5zq7wfOFv3zTy5lQvqzcJOtPPlKbrd0Ygfaop3dVvCxmk
	BlrRVs3tg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh621-0051ho-Ak; Thu, 13 May 2021 07:45:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh61z-0051hY-CU
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 07:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=lNEUtw5bU1JO7VvgHu3zGuBvfkdBpiuaW5V2tZWQnM4=; b=cGJ9lCodb+cF+kGPzPqJrSCG5P
 j7EHBEl9gfB/vYUMVelxDNGwTDDPkE3RpP4jiFj+ep2w8mK1b39XWfSWafk0a83BCKm2FYnY8i4UK
 ldkq+S1EOq2BzCJcUKROQ0FWTxceee9kOi21lziun4ORVfVP8kV9dsA/OdRmwtl/mKCigc6XAYCAc
 OZV/skHaqJTMH+WS87x3t31avrd3V/g9j0nCVr0PpFGW4/JgtQpVqm3pGxMwWFJCoN9U9Pc6OGmWH
 ngexcl915rnQ7pxAohYPoZyEl5jReXQktkcv+3W0UGgD8rgMrzlGtQQMzEeL3EyI5tBEXuEEHnYzA
 1WAjigKA==;
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh61w-00B5Ub-Qq
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 07:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lNEUtw5bU1JO7VvgHu3zGuBvfkdBpiuaW5V2tZWQnM4=; b=FRV1RT5lwxRiKLOfL07frigQn4
 1dHKTUg/T6SUEBPKs0N84Nu+Y0qS9CdLniZv9hDruuCpjbDKYtXh5VZdDUrfFWDPWmflOqVcuZgwC
 DKh9HNeMSC9ESKpDVcFeqN/WfzByauOGvMSyOYbbVudNFjm/pRYfU9WsuxsTcURK8XmA=;
Received: from p54ae9ff2.dip0.t-ipconnect.de ([84.174.159.242] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1lh61r-00055r-61; Thu, 13 May 2021 09:45:07 +0200
Subject: Re: [PATCH 9/9] mt76: mt7921: add back connection monitor support
To: sean.wang@mediatek.com, lorenzo.bianconi@redhat.com
Cc: Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 Eric.Liang@mediatek.com, Stella.Chang@mediatek.com, jemele@google.com,
 yenlinlai@google.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <1620659697-12048-1-git-send-email-sean.wang@mediatek.com>
 <1620659697-12048-9-git-send-email-sean.wang@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <79633d77-a326-fb46-6356-65dddea9da44@nbd.name>
Date: Thu, 13 May 2021 09:45:05 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1620659697-12048-9-git-send-email-sean.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_004513_057909_C3E032F5 
X-CRM114-Status: UNSURE (   9.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 2021-05-10 17:14, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Hw beacon cmd to the mt7921 firmware doesn't only filter out the beacon,
> but also performs its own connection monitoring, including periodic
> keep-alives to the AP and probing the AP on beacon loss. Will indicate
> the host with the event when the firmware detects the connection is lost.
> 
> Fixes: 1d8efc741df8 ("mt76: mt7921: introduce Runtime PM support")
> Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: YN Chen <yn.chen@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
What happened to Patch 8?
I don't see it on the list or patchwork.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
