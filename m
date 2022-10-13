Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B704C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 09:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwZSH4nn1egbB1RgsXP5DNZrGEQk3jlvN8OxlgtAH9A=; b=aRu51UaOAHzlOf7CEo4kDSLH6I
	hUoCRghI9GQGdKvCO/4AprpZ1RHBQDhhGXV1gRp/92V9vj2I6Cq1QIiRd/3oIT7wj2pEuQ5++DReV
	xjFa1+lCdG8r16IHtAYZ5Ek9hd3AvWX2kmrWprtQrYO0x2QRatJLqi0DOWbjp6tWk5tm1RXOFVECN
	WM5aZlM03anGQBrAgNtwS5lg7Ne2UfIHvU4gT/EBngep3ubIkPt3AmmJjsWO3LObyZyds8eZp+8MV
	tfXN0pKSez/dMHDAkouIICAso2eFR1MP0QQ9OSdumd1G9cisWz8/S8mHj39TgNyFGsyhymvWNuEI9
	hNSr1s5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiu8c-00BCfp-LC; Thu, 13 Oct 2022 09:04:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiu8a-00BCdD-46
	for linux-mediatek@lists.infradead.org; Thu, 13 Oct 2022 09:04:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A62161724;
	Thu, 13 Oct 2022 09:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92020C433D6;
	Thu, 13 Oct 2022 09:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665651856;
	bh=/mPI/uw75aDViFfpPoodmj+vuy+4nn0QsyLu+/OLL2g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Dh6CX5VmT+/b6+CLVueMSqizJAEr7+8k9xZJn+8RRvCOEN2hb0bARtLR6XIs73Dxn
	 REzyRE/1K0PSoYZqV3HrP7avAmh4WTDNCGZNbZ1rynUfuiyEFy1dRDErAD9P25x2QE
	 LFHVIY6+d39DCmQDz/mlRpVFfZSiFnC/JIGVuH+ib8/Po5f6p7j+cBAybe5M4VL/yp
	 jSg2+++3V4JoBB84lRguVNM4Ez4vNnexKMXn/X8E4uLOXDqQqGYjoBTg1tpAXlqzh5
	 rdms+3dGKLUl22sM+0zhTljlQeL0bwzQZHKYrUias/NCRTSKKp4HiE/X4kcrr1kS/5
	 fV62E5URYIm2g==
From: Kalle Valo <kvalo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,  lorenzo.bianconi@redhat.com,  Bo.Jiao@mediatek.com,  sujuan.chen@mediatek.com,  ryder.Lee@mediatek.com,  evelyn.tsai@mediatek.com,  daniel@makrotopia.org,  linux-wireless@vger.kernel.org,  linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] wifi: mt76: introduce WED TX support for mt7986 SoC
References: <cover.1664356281.git.lorenzo@kernel.org>
	<87r0zd4mxw.fsf@kernel.org> <Y0aH8T8pTARNWcPE@lore-desk>
	<87zge0memc.fsf@kernel.org> <Y0fQ0f3uy5p9f2mP@lore-desk>
	<3b029dc7-054b-3510-f159-de6622d8ce01@nbd.name>
Date: Thu, 13 Oct 2022 12:04:10 +0300
In-Reply-To: <3b029dc7-054b-3510-f159-de6622d8ce01@nbd.name> (Felix Fietkau's
	message of "Thu, 13 Oct 2022 10:50:49 +0200")
Message-ID: <87v8oom6wl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_020420_225404_3B52382B 
X-CRM114-Status: GOOD (  18.10  )
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

Felix Fietkau <nbd@nbd.name> writes:

> On 13.10.22 10:48, Lorenzo Bianconi wrote:
>>> Lorenzo Bianconi <lorenzo@kernel.org> writes:
>>>
>>> >> Lorenzo Bianconi <lorenzo@kernel.org> writes:
>>> >> >> > Enable WED TX support for mt7915 and mt7986-wmac drivers
>>> running on MT7986 SoC.
>>> >> >> What's WED TX?
>>> >
>>> > It is the same as we did for MT7622. It is the capability to offload traffic
>>> > from lan/wan to wlan. I specified "TX" since MT7986 supports even RX
>>> > offloading (I am working on it at the moment).
>>>
>>> It would be nice to mention in the commit log that the feature is about
>>> offloading traffic from lan/wan to wlan. That way it's stored to to git
>>> history and people like me have some clue what the patch is about,
>>> otherwise we are totally in dark.
>>
>> I think Felix has already applied them.
>> @Felix: are you taking care of it or do I need to repost?
>
> No need to repost - just send me the description that you want to put
> in there, and I'll update the commit.

Thanks. And if it's too much work to change it feel free to keep it as
is. Just try to keep this mind in the future when using exotic acronyms :)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

