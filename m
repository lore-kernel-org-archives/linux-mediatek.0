From: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH] mt76: change the retun type of mt76_dma_attach()
Date: Mon, 11 Feb 2019 16:48:08 +0800
Message-ID: <1549874888.29377.6.camel@mtkswgap22>
References: <228fdddb9ca96e8ce861e324eb9039722cf18f49.1549850911.git.ryder.lee@mediatek.com>
         <f65c85c2-ef47-d141-d78e-db2a138a1daf@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f65c85c2-ef47-d141-d78e-db2a138a1daf@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Felix Fietkau <nbd@nbd.name>, Kalle Valo <kvalo@codeaurora.org>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, Roy Luo <roychl666@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2019-02-11 at 11:38 +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 11.02.2019 5:13, Ryder Lee wrote:
> 
> > There is no need to retun 0 in mt76_dma_attach(), so switch it to void.
>                            ^ r missing :-)
> > 
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> [...]
> 
> MBR, Sergei
> 

I will resend a new one.

Thanks
Ryder
