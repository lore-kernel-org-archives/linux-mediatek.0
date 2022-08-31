Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450B7ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 11:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68GNA3hkbOfTZVlP1IW/80fFSjNDCw7nAQX9ISIjmjI=; b=xVfwq1bDdMiWiRR6PBZQk/yVh4
	ey4cwUukGhv6fV7ll5OKMNnsPChy6L2Cnt9OIzYw7VCFfGQLKrifZq8wWlT+DKH1bDja8/juER9yL
	pgOYiALdSLl1wkCzfz3TRSLB5zWtRLHexQCMIFD/uLNT1Q9I8hjG6w1YcyEfAjamyV+5yjONIWwXr
	CoHkeJzsSwr+thyz9mj0q1qGhBPQf0gfm0HaQNWmEN1gXFEkEW3yaBpyvOTQDFHKOtVECIE7tCoQt
	z1Ix8DtxAXBDqGlFjoDi4S2Kf9pRTIh0WoDbcDuVwiPaAtxdCfFScMySeCXIqKsCArR+mxhs/jncR
	hNSl0JEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTM5T-005x37-41; Wed, 31 Aug 2022 11:40:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTM5Q-005x2a-VF
	for linux-mediatek@lists.infradead.org; Wed, 31 Aug 2022 11:40:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 541CD618D2;
	Wed, 31 Aug 2022 11:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCF8C433C1;
	Wed, 31 Aug 2022 11:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661946047;
	bh=DotZ1YqFsP2lhFErXQST8bScy9jCXdAhHcJLnPpqtb4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=TdnG2BcEAk6ZmIXD+P6Ikw+tTJPz1vIUefums92ETNFtBqyZIUKWyAvBIw1GQdiE2
	 JM5PpEupl1Ub+xtOgu3TFEid/llV9CQyTAMMa5fYKvwARekcClWskY6Ca7R7gwSLCV
	 9GcEe5D2L9Yw+ha2E3oj37/jhapZoUlxnUWxayDM3f8u/PJhOo5YGoqLHHQo+TpIy1
	 861K/iHgcG4yU+IeoHlu/Lb55H1CwAUPi39DGO+Xk7PZgfQjTQ7hT2R9mkJ6Vmenjb
	 Xr+dMfSaPd1tuHoA/G+dVmDyYYcO+ZEBpReJqYi3H7eu0hSgWP6H63Tq2Eoq2PZM0P
	 VSRhimhrj/EVw==
From: Kalle Valo <kvalo@kernel.org>
To: <sean.wang@mediatek.com>
Cc: <nbd@nbd.name>,  <lorenzo.bianconi@redhat.com>,  <Soul.Huang@mediatek.com>,  <YN.Chen@mediatek.com>,  <Leon.Yen@mediatek.com>,  <Eric-SY.Chang@mediatek.com>,  <Deren.Wu@mediatek.com>,  <km.lin@mediatek.com>,  <jenhao.yang@mediatek.com>,  <robin.chiu@mediatek.com>,  <Eddie.Chen@mediatek.com>,  <ch.yeh@mediatek.com>,  <posh.sun@mediatek.com>,  <ted.huang@mediatek.com>,  <Stella.Chang@mediatek.com>,  <Tom.Chou@mediatek.com>,  <steve.lee@mediatek.com>,  <jsiuda@google.com>,  <frankgor@google.com>,  <kuabhs@google.com>,  <druth@google.com>,  <abhishekpandit@google.com>,  <shawnku@google.com>,  <linux-wireless@vger.kernel.org>,  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: mt7921: get rid of the false positive reset
References: <95b03bb77ce93cb2cade98d947309cd669721939.1660519674.git.objelf@gmail.com>
Date: Wed, 31 Aug 2022 14:40:40 +0300
In-Reply-To: <95b03bb77ce93cb2cade98d947309cd669721939.1660519674.git.objelf@gmail.com>
	(sean wang's message of "Mon, 15 Aug 2022 07:37:14 +0800")
Message-ID: <87bks0fxon.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_044049_066645_8D2A5DB1 
X-CRM114-Status: GOOD (  12.27  )
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

<sean.wang@mediatek.com> writes:

> From: Sean Wang <sean.wang@mediatek.com>
>
> False positive reset would be possibly triggered by those commands we
> applied in suspend with HZ MCU timeout, especially it happened when we
> enabled kernel log in pm core to diagnose how much time we spend in each
> driver during suspend procedure. So we enlarge the value and align the MCU
> timeout as other commands we did to reduce the false positive reset.
>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Please use the new "wifi:" prefix, so for this patch it should be:

wifi: mt76: mt7921: get rid of the false positive reset

No need to resend but please use this in all new patches.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

