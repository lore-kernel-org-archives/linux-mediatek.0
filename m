From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 3/3] mt76: mt7615: add cwmin/cwmax initial values
Date: Sun, 21 Jul 2019 13:28:18 +0300
Message-ID: <877e8bsmv1.fsf@purkki.adurom.net>
References: <50d28c9b0f9e7d6b277d36fc93f55142d7535259.1563518381.git.ryder.lee@mediatek.com>
        <c83e14787bc86f8f8062e0aa44e03ef80c3fd38a.1563518381.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c83e14787bc86f8f8062e0aa44e03ef80c3fd38a.1563518381.git.ryder.lee@mediatek.com>
        (Ryder Lee's message of "Fri, 19 Jul 2019 14:55:36 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Roy Luo <royluo@google.com>, YF Luo <yf.luo@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Ryder Lee <ryder.lee@mediatek.com> writes:

> Add initial values in mt7615_mcu_set_wmm() to cleanup setup flow.
>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

[...]

> -#define WMM_AIFS_SET	BIT(0)
> -#define WMM_CW_MIN_SET	BIT(1)
> -#define WMM_CW_MAX_SET	BIT(2)
> -#define WMM_TXOP_SET	BIT(3)
> +#define WMM_PARAM_SET	GENMASK(3, 0)

I don't see how this is any better? IMHO you just hide what is the
meaning of each bit.

-- 
Kalle Valo
