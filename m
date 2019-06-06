From: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH v3 1/2] mt76: mt7615: enable support for mesh
Date: Thu, 6 Jun 2019 23:18:22 +0800
Message-ID: <1559834302.3339.1.camel@mtkswgap22>
References: <a1ff446dfc06e2443552e7ec2d754099aacce7df.1559541944.git.ryder.lee@mediatek.com>
         <a0a6f631-2eb1-87cc-5653-338c6126690c@newmedia-net.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a0a6f631-2eb1-87cc-5653-338c6126690c@newmedia-net.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Roy Luo <royluo@google.com>, YF Luo <yf.luo@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.Chen@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, 2019-06-06 at 12:14 +0200, Sebastian Gottschall wrote:
> in addition you should take care about this problem which is raised up 
> if SAE is used. since AES-CMAC required tid to be non zero
> 
> WARNING: CPU: 2 PID: 15324 at 
> /home/seg/DEV/mt7621/src/router/private/compat-wireless-2017-09-03/net/mac80211/key.c:1096 
> mt76_wcid_key_setup+0x58/0x9c [mt76]
> Modules linked in: shortcut_fe gcm ghash_generic ctr gf128mul mt7615e 
> mt76 mac80211 compat
> CPU: 2 PID: 15324 Comm: wpa_supplicant Tainted: G        W 4.14.123 #106
> Stack : 00000000 87c2d000 00000000 8007d8b4 80480000 80482b9c 80610000 
> 805a4390
>          8057e2b4 854fb99c 87ed045c 805e4767 80578288 00000001 854fb940 
> 805e9f78
>          00000000 00000000 80640000 00000000 81147bb8 00000584 00000007 
> 00000000
>          00000000 80650000 80650000 20202020 80000000 00000000 80610000 
> 872b9fe0
>          872a2b14 00000448 00000000 87c2d000 00000010 8022d660 00000008 
> 80640008
>          ...
> Call Trace:
> [<800153e0>] show_stack+0x58/0x100
> [<8042e83c>] dump_stack+0x9c/0xe0
> [<800349f0>] __warn+0xe4/0x144
> [<8003468c>] warn_slowpath_null+0x1c/0x30
> [<872b9fe0>] mt76_wcid_key_setup+0x58/0x9c [mt76]
> [<87611690>] mt7615_eeprom_init+0x7b4/0xe9c [mt7615e]
> ---[ end trace e24aeb4b542e0dea ]---

This is fixed by Lorenzo's patch -
https://patchwork.kernel.org/patch/10976191/

Thanks.
Ryder
