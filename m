From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v3 0/4] Add support for MediaTek MT7615 wireless chipsets
Date: Thu, 25 Apr 2019 12:07:05 +0200
Message-ID: <98c68ec4-bedb-cf6a-9221-eb82a2497e6c@nbd.name>
References: <cover.1554102584.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1554102584.git.ryder.lee@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Roy Luo <royluo@google.com>, Sean Wang <sean.wang@mediatek.com>, Nelson Chang <nelson.chang@mediatek.com>, YF Luo <yf.luo@mediatek.com>, Kai Lin <kai.lin@mediatek.com>, Rorscha Yang <rorscha.yang@mediatek.com>, Kyle Lee <kyle.lee@mediatek.com>, Miller Shen <miller.shen@mediatek.com>, Haipin Liang <haipin.liang@mediatek.com>, KL Huang <kl.huang@mediatek.com>, YH chen <yh.chen@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 2019-04-01 09:16, Ryder Lee wrote:
> This adds support for MediaTek MT7615E 4x4 802.11ac PCIe-based chipsets.
> 
> The series is based on the Lorenzo's patches:
> https://patchwork.kernel.org/project/linux-wireless/list/?series=95969
> 
> In the legacy tx arch, we move and store the whole skb content to the
> on-device memory when we send packets via high speed interface. (e.g. PCIe)
> 
> However, MT7615 and the following generation use a new tx arch called
> “cut-through”, which only passes the physical address to the hardware,
> and the packet engine will fetch the packets before transmission.
> 
> It saves on-chip memory for high throughput devices, and the token mechanism
> is used to manage the release of skb under this arch.
> 
> And there might be other (existing or future) chips that use the same driver
> (e.g. mt7622/mt7663...), this is a starting point to unify MTK wireless chipsets.
> 
> Detailed hardware information for this chip could be found on 
> https://wikidevi.com/wiki/MediaTek_MT7615
> 
> Ryder Lee (4):
>   mt76: add mac80211 driver for MT7615 PCIe-based chipsets
>   mt76: add unlikely() for dma_mapping_error() check
>   mt76: use macro for sn and seq_ctrl conversion
>   MAINTAINERS : update entry for mt76 wireless driver
Applied, thanks.

- Felix
