From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] mt7601u: null check the allocation
Date: Tue,  6 Aug 2019 12:35:49 +0000 (UTC)
Message-ID: <20190806123549.EA78E6090E@smtp.codeaurora.org>
References: <20190724141736.29994-1-navid.emamdoost@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190724141736.29994-1-navid.emamdoost@gmail.com>
Sender: netdev-owner@vger.kernel.org
Cc: emamd001@umn.edu, kjlu@umn.edu, smccaman@umn.edu, secalert@redhat.com, Navid Emamdoost <navid.emamdoost@gmail.com>, Jakub Kicinski <kubakici@wp.pl>, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Navid Emamdoost <navid.emamdoost@gmail.com> wrote:

> devm_kzalloc may fail and return NULL. So the null check is needed.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> Acked-by: Jakub Kicinski <kubakici@wp.pl>

Patch applied to wireless-drivers-next.git, thanks.

b95c732234fa mt7601u: null check the allocation

-- 
https://patchwork.kernel.org/patch/11057013/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
