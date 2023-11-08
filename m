Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C9CC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 17:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K65UPTk5QcAROcIt5XAdqRXJo6ZLSxBRHD33x6hFSEw=; b=iY55gDtAFfcPWEi8STFspqscqL
	aZ7VcRy5+u0eGqlQ3zeXwu1BVz61NQAuLlcnbD71kT0S2EDXVDLnb7JnCqK0RoHHEWmjWpxAP6xIr
	ffcxrSaXIemE/LtX8+cwfs1gXY3b5LN8N6d43X8xGuTtTWc37MACl7qoaIDWM0Vw6ARIaCTNdrl/5
	6RROjEI7vi5n8zZwdnnbDeZo95pjFcL6t4cc0FyqE6xTJFQHOyOYVOPB7wHx/BKLM5iW3VuVLxnoL
	g5MEUvIR54ZjAunI37wfxWZTHQUmvebLuF13akPEhdiw5vWcHFvo9ZQQ+ukLqdld10i8GczTp4fOo
	5LaoAl/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0mof-004Rwv-1f;
	Wed, 08 Nov 2023 17:58:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0moc-004RwW-1z
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Nov 2023 17:58:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A12B616DF;
	Wed,  8 Nov 2023 17:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0801DC433C7;
	Wed,  8 Nov 2023 17:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699466289;
	bh=pemo+h5iPUSArhokPwEEF/udpfGjRhboJyggEUsTSyI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=C6C67w4I9ce982zkp1+YNKj0bFyqb3oLU9cW39lBszA10nk+uZPZStOaHmG2s+PZQ
	 08AgQEtlStSHqLJahE9PA0a6/e5f5SUGarZPFlEhnBTBgH/en0gVzleghztvxbe7uO
	 pJ+8b2PXi4WfreoPBtA9HLLsYl1I61RxQb8sr7F3tcJfJCfVcfMFqKMbxvpQa2sUT6
	 hf4dotoSaMWZEeqP65LhL0pBkxyyZmb1FeSqjgVOSKSv5xmXB/uXEBd8aZtquPRIUM
	 NQLCNsLjGGVnO9ZGE3JfdwKYlItgq/KF2wib0iEBehrxk7RFyejSuOiIpm8YIpwUpQ
	 /0nOT1ngBxz+w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [next,v2] wifi: mt76: mt7921: fix 6GHz disabled by the missing
 default CLC config
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <5a976ddf1f636b5cb809373501d3cfdc6d8de3e4.1698648737.git.deren.wu@mediatek.com>
References: <5a976ddf1f636b5cb809373501d3cfdc6d8de3e4.1698648737.git.deren.wu@mediatek.com>
To: Deren Wu <deren.wu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
 Leon Yen <Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>,
 CH Yeh <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>,
 Stella Chang <Stella.Chang@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Ben Greear <greearb@candelatech.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Deren Wu <deren.wu@mediatek.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169946628281.2754325.4918391356587950317.kvalo@kernel.org>
Date: Wed,  8 Nov 2023 17:58:04 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_095810_743731_AB190218 
X-CRM114-Status: UNSURE (   6.99  )
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

Deren Wu <deren.wu@mediatek.com> wrote:

> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> 
> No matter CLC is enabled or disabled, the driver should initialize
> the default value 0xff for channel configuration of CLC. Otherwise,
> the zero value would disable channels.
> 
> Reported-and-tested-by: Ben Greear <greearb@candelatech.com>
> Closes: https://lore.kernel.org/all/2fb78387-d226-3193-8ca7-90040561b9ad@candelatech.com/
> Fixes: 09382d8f8641 ("wifi: mt76: mt7921: update the channel usage when the regd domain changed")
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>

Patch applied to wireless.git, thanks.

7a934b5cc3f4 wifi: mt76: mt7921: fix 6GHz disabled by the missing default CLC config

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/5a976ddf1f636b5cb809373501d3cfdc6d8de3e4.1698648737.git.deren.wu@mediatek.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


