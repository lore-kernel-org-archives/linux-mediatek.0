From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v3 2/2] mt76: mt7615: fix slow performance when enable
 encryption
Date: Fri, 7 Jun 2019 19:02:02 +0200
Message-ID: <034e7eaa-5e39-57c4-1e5b-f58d41ad451a@nbd.name>
References: <a1ff446dfc06e2443552e7ec2d754099aacce7df.1559541944.git.ryder.lee@mediatek.com>
 <429cf8c1421017b4030b8b6e4fa9e5cbea953d3c.1559541944.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <429cf8c1421017b4030b8b6e4fa9e5cbea953d3c.1559541944.git.ryder.lee@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Roy Luo <royluo@google.com>, YF Luo <yf.luo@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.Chen@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 2019-06-03 08:08, Ryder Lee wrote:
> Fix wrong WCID assignment and add RKV (RX Key of this entry is valid)
> flag to check if peer uses the same configuration with previous
> handshaking.
> 
> If the configuration is mismatch, WTBL indicates a “cipher mismatch”
> to stop SEC decryption to prevent the packet from damage.
> 
> Suggested-by: YF Luo <yf.luo@mediatek.com>
> Suggested-by: Yiwei Chung <yiwei.chung@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

Applied, thanks.

- Felix
