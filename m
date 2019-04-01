From: Stanislaw Gruszka <sgruszka@redhat.com>
Subject: Re: [PATCH 1/4] mt76: add mac80211 driver for MT7615 PCIe-based
 chipsets
Date: Mon, 1 Apr 2019 11:46:34 +0200
Message-ID: <20190401094633.GC19802@redhat.com>
References: <cover.1553607739.git.ryder.lee@mediatek.com>
 <2849359e0b0ede6c13ae9f142aff77a016fd0a80.1553607739.git.ryder.lee@mediatek.com>
 <87lg0wyjvj.fsf@purkki.adurom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87lg0wyjvj.fsf@purkki.adurom.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>, Roy Luo <royluo@google.com>, Sean Wang <sean.wang@mediatek.com>, Nelson Chang <nelson.chang@mediatek.com>, YF Luo <yf.luo@mediatek.com>, Kai Lin <kai.lin@mediatek.com>, Rorscha Yang <rorscha.yang@mediatek.com>, Kyle Lee <kyle.lee@mediatek.com>, Miller Shen <miller.shen@mediatek.com>, Haipin Liang <haipin.liang@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On Sat, Mar 30, 2019 at 08:08:32AM +0200, Kalle Valo wrote:
> Ryder Lee <ryder.lee@mediatek.com> writes:
> 
> > This driver is for a newer generation of MediaTek MT7615 4x4 802.11ac
> > PCIe-based chipsets, which support wave2 MU-MIMO up to 4 users/group
> > and also support up to 160MHz bandwidth.
> >
> > The driver fully supports AP, station and monitor mode.
> >
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> > Signed-off-by: Roy Luo <royluo@google.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]
> 
> > --- /dev/null
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7615/dma.c
> > @@ -0,0 +1,204 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> mt76 is under ISC so why did you choose GPLv2 here? I don't think it's a
> good idea to use different licenses within the same driver.

mt76x0 is GPL only as some parts of it are modified copy of either out
of tree Mediatek GPL driver or Jakub's mt7601u also realised under GPL.

Is ISC equal to "Dual BSD/GPL" what is marked by MODULE_LICENSE ?
I think this should be clarified too.

> Also mt76 does not use SPDX tags yet. I would prefer that the whole
> driver is converted in one go to have consistent licensing information.

Agree. However not sure if we can unify of all mt76 code to the same
license (and which one: GPL ?), but at least we can convert source 
files to SPDX identifier.

Stanislaw
