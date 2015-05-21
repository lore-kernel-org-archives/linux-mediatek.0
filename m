From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] irqchip: irq-mtk-sysirq: Make mtk_sysirq_of_init return
 error if ioremap fails
Date: Thu, 21 May 2015 17:36:36 +0200
Message-ID: <CABuKBeJi+Gdq4a+-aQuZ19FOs-S2K+WP8-AKm78A-ekNu+kiGA@mail.gmail.com>
References: <1432220254.29544.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432220254.29544.1.camel@ingics.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Yingjoe Chen <yingjoe.chen@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

2015-05-21 16:57 GMT+02:00 Axel Lin <axel.lin@ingics.com>:
> PTR_ERR(NULL) returns 0 so current code returns 0 if ioremap fails, fix it.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
