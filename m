From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v3 1/4] mt76: add mac80211 driver for MT7615 PCIe-based
 chipsets
Date: Sat, 13 Apr 2019 15:06:47 +0200
Message-ID: <1d8ef32e-32ef-d3f9-2b49-5dfcbc04990f@nbd.name>
References: <cover.1554102584.git.ryder.lee@mediatek.com>
 <4e974271e93b719e0463aa0269b4b970cc2b267f.1554102584.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4e974271e93b719e0463aa0269b4b970cc2b267f.1554102584.git.ryder.lee@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Roy Luo <royluo@google.com>, Sean Wang <sean.wang@mediatek.com>, Nelson Chang <nelson.chang@mediatek.com>, YF Luo <yf.luo@mediatek.com>, Kai Lin <kai.lin@mediatek.com>, Rorscha Yang <rorscha.yang@mediatek.com>, Kyle Lee <kyle.lee@mediatek.com>, Miller Shen <miller.shen@mediatek.com>, Haipin Liang <haipin.liang@mediatek.com>, KL Huang <kl.huang@mediatek.com>, YH chen <yh.chen@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On 2019-04-01 09:16, Ryder Lee wrote:
> This driver is for a newer generation of MediaTek MT7615 4x4 802.11ac
> PCIe-based chipsets, which support wave2 MU-MIMO up to 4 users/group
> and also support up to 160MHz bandwidth.
> 
> The driver fully supports AP, station and monitor mode.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Roy Luo <royluo@google.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>I'll fold in the following missing bit when I apply this patch.

- Felix

---
--- a/mt76.h
+++ b/mt76.h
@@ -69,6 +69,7 @@ enum mt76_txq_id {
 	MT_TXQ_MCU,
 	MT_TXQ_BEACON,
 	MT_TXQ_CAB,
+	MT_TXQ_FWDL,
 	__MT_TXQ_MAX
 };
