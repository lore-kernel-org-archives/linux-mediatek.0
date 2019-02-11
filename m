From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] mt76: change the retun type of mt76_dma_attach()
Date: Mon, 11 Feb 2019 11:38:28 +0300
Message-ID: <f65c85c2-ef47-d141-d78e-db2a138a1daf@cogentembedded.com>
References: <228fdddb9ca96e8ce861e324eb9039722cf18f49.1549850911.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <228fdddb9ca96e8ce861e324eb9039722cf18f49.1549850911.git.ryder.lee@mediatek.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Felix Fietkau <nbd@nbd.name>, Kalle Valo <kvalo@codeaurora.org>
Cc: Roy Luo <roychl666@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hello!

On 11.02.2019 5:13, Ryder Lee wrote:

> There is no need to retun 0 in mt76_dma_attach(), so switch it to void.
                           ^ r missing :-)
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
[...]

MBR, Sergei
