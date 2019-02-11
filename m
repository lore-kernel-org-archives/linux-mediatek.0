From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] mt76: change the retun type of mt76_dma_attach()
Date: Mon, 11 Feb 2019 20:00:10 +0100
Message-ID: <39241b1d-3743-a837-8600-5ed824dc4fe9@nbd.name>
References: <228fdddb9ca96e8ce861e324eb9039722cf18f49.1549850911.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <228fdddb9ca96e8ce861e324eb9039722cf18f49.1549850911.git.ryder.lee@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: Roy Luo <roychl666@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 2019-02-11 03:13, Ryder Lee wrote:
> There is no need to retun 0 in mt76_dma_attach(), so switch it to void.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Applied, thanks.

- Felix
