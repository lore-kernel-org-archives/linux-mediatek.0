From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [Resend PATCH] mt76: change the return type of mt76_dma_attach()
Date: Mon, 11 Feb 2019 11:19:28 +0200
Message-ID: <87lg2m3cnz.fsf@codeaurora.org>
References: <228fdddb9ca96e8ce861e324eb9039722cf18f49.1549850911.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <228fdddb9ca96e8ce861e324eb9039722cf18f49.1549850911.git.ryder.lee@mediatek.com>
        (Ryder Lee's message of "Mon, 11 Feb 2019 16:48:29 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Felix Fietkau <nbd@nbd.name>, Roy Luo <roychl666@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Ryder Lee <ryder.lee@mediatek.com> writes:

> There is no need to return 0 in mt76_dma_attach(), so switch it to void.
>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

When you send a new version mark it as v2:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#patch_version_missing

And add a changelog:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#changelog_missing

No need to resend because of this, but please do remember this in the
future.

-- 
Kalle Valo
