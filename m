Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D39EC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 18:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81+OyRyjnKMS4Lo+MYbxJx//XhJP7OKeiAEyeSQeI14=; b=LdL20oPK6vD28b3w9QO4YrKgjh
	+aYTOAEcogRgcZl/GsoydvWB8RiORu4n9lIC7N/+2c8lIvsrq8crUQZyMaq+I9+Eqvp3ct1EajSpF
	XBaw0zLux1ed4hUdP9obzDApARQ0E6/fhaJWGjtnNHZC9BF07Cg9A9hpN0lPkARwbqWHLATm9oF/p
	LKau7F9qovYaGV1n2M7ZV3yYixY5ZKZ7jM34Te8XaZz1kMu5O5CVI9n2b/RdEDWiLsP4wCpfqT4M/
	HcytXzSgOac2nuPTj7PaCw3tAL15SoLFn6IQUZIEUgvK9oXNDYs0qnB/Jxcv4o8H02GOlaWYVQKE8
	UpHoyXgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2mn-00Gwg9-0h;
	Wed, 22 Mar 2023 18:02:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2mh-00Gwee-0h;
	Wed, 22 Mar 2023 18:02:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A357562251;
	Wed, 22 Mar 2023 18:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0253DC433D2;
	Wed, 22 Mar 2023 18:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679508122;
	bh=SsBUNvNZyeRaoCWN4RaJgPixIarcjbF9yPajy6mQbKI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=J9cNF04VmhB8+3MyQHojA+QuoRh06JP9Kr1CskII7CqIkB7neoOpAtz4obF2pT7YD
	 /dcxpCqoUqcWTK1nEXQ+Kgx18cuvM2q9cJhUV2DLZovsKN9dsF2i15VHfF9pP7kU7b
	 ODN3FdIpcvjFZoQY2OdA5EihfC3pJqQG0RUfiS/hfW0MOVWArFWLA8pgalu1ueyYCr
	 nJwlufUYx2JGzg4PAFEHyMr6x0ujGeoOIrvcOlCdIz1MFgR/zscJx25pt6o5hy6f05
	 XLO0DN24p5dDJTc7CkHMmmv1V1epJY9z5oxijkP4AcgebFOAJkPkR73QXVjJ4fplag
	 adB9DegPrjY3A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: wifi: mt76: mt7921: add Netgear AXE3000 (A8000) support
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230123090555.21415-1-git@qrsnap.io>
References: <20230123090555.21415-1-git@qrsnap.io>
To: Reese Russell <git@qrsnap.io>
Cc: git@qrsnap.io, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Deren Wu <deren.wu@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, Ben Greear <greearb@candelatech.com>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167950811348.23855.15517111358348733076.kvalo@kernel.org>
Date: Wed, 22 Mar 2023 18:01:57 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_110205_635579_9052B806 
X-CRM114-Status: UNSURE (   9.48  )
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

Reese Russell <git@qrsnap.io> wrote:

> Add support for the Netgear AXE3000 (A8000) based on the Mediatek
> mt7921au chipset. A retail sample of the Netgear AXE3000 (A8000) yeilds
> the following from lsusb D 0846:9060 NetGear, Inc. Wireless_Device. This
> has been reported by other users on Github.
> 
> Signed-off-by: Reese Russell <git@qrsnap.io>

There was a conflict, please rebase over wireless and resubmit as v2:

Recorded preimage for 'drivers/net/wireless/mediatek/mt76/mt7921/usb.c'
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: wifi: mt76: mt7921: add Netgear AXE3000 (A8000) support
Using index info to reconstruct a base tree...
M	drivers/net/wireless/mediatek/mt76/mt7921/usb.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/mediatek/mt76/mt7921/usb.c
CONFLICT (content): Merge conflict in drivers/net/wireless/mediatek/mt76/mt7921/usb.c
Patch failed at 0001 wifi: mt76: mt7921: add Netgear AXE3000 (A8000) support

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230123090555.21415-1-git@qrsnap.io/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


