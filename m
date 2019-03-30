From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/4] mt76: add mac80211 driver for MT7615 PCIe-based chipsets
Date: Sat, 30 Mar 2019 08:08:32 +0200
Message-ID: <87lg0wyjvj.fsf@purkki.adurom.net>
References: <cover.1553607739.git.ryder.lee@mediatek.com>
        <2849359e0b0ede6c13ae9f142aff77a016fd0a80.1553607739.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2849359e0b0ede6c13ae9f142aff77a016fd0a80.1553607739.git.ryder.lee@mediatek.com>
        (Ryder Lee's message of "Tue, 26 Mar 2019 22:28:07 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>, Roy Luo <royluo@google.com>, Sean Wang <sean.wang@mediatek.com>, Nelson Chang <nelson.chang@mediatek.com>, YF Luo <yf.luo@mediatek.com>, Kai Lin <kai.lin@mediatek.com>, Rorscha Yang <rorscha.yang@mediatek.com>, Kyle Lee <kyle.lee@mediatek.com>, Miller Shen <miller.shen@mediatek.com>, Haipin Liang <haipin.liang@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
List-Id: linux-mediatek@lists.infradead.org

Ryder Lee <ryder.lee@mediatek.com> writes:

> This driver is for a newer generation of MediaTek MT7615 4x4 802.11ac
> PCIe-based chipsets, which support wave2 MU-MIMO up to 4 users/group
> and also support up to 160MHz bandwidth.
>
> The driver fully supports AP, station and monitor mode.
>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Roy Luo <royluo@google.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

[...]

> --- /dev/null
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/dma.c
> @@ -0,0 +1,204 @@
> +// SPDX-License-Identifier: GPL-2.0

mt76 is under ISC so why did you choose GPLv2 here? I don't think it's a
good idea to use different licenses within the same driver.

Also mt76 does not use SPDX tags yet. I would prefer that the whole
driver is converted in one go to have consistent licensing information.

-- 
Kalle Valo
