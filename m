From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] mt76: Use the correct hweight8() function again
Date: Sun, 17 Mar 2019 14:01:10 +0100
Message-ID: <4ad7f89b-f28f-8b41-1f0e-d76d6ae4fcc7@nbd.name>
References: <1552789948-31564-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552789948-31564-1-git-send-email-yamada.masahiro@socionext.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-wireless@vger.kernel.org
Cc: Ben Hutchings <ben@decadent.org.uk>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

On 2019-03-17 03:32, Masahiro Yamada wrote:
> Commit d0ff23c1107e ("mt76: Use the correct hweight8() function")
> fixed the wrong use of __sw_hweight8().
> 
> Just a week later, commit c8846e101502 ("mt76: add driver for MT7603E
> and MT7628/7688") was applid, introducing __sw_hweight8() again.
> 
> Fixes: c8846e101502 ("mt76: add driver for MT7603E and MT7628/7688")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
I've already sent the same patch to Kalle for 5.1 about a week ago.

- Felix
