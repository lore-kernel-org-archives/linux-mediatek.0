From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] mt76: MT76x0U requires MT76_USB
Date: Tue, 11 Sep 2018 17:37:49 +0300
Message-ID: <87worst802.fsf@codeaurora.org>
References: <1536239203-21733-1-git-send-email-martin@kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536239203-21733-1-git-send-email-martin@kaiser.cx> (Martin
        Kaiser's message of "Thu, 6 Sep 2018 15:06:43 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Kaiser <martin@kaiser.cx>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Valdis Kletnieks <valdis.kletnieks@vt.edu>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com
List-Id: linux-mediatek@lists.infradead.org

(please cc linux-wireless on wireless patches)

Martin Kaiser <martin@kaiser.cx> writes:

> If we're building MT76x0U, we must select MT76_USB. Otherwise,
> compilation fails because of undefined references.
>
> MT76x2U already does this correctly, fix it for MT76x0U as well.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

I believe there's a patch pending to fix this, but due to so many mt76
patches it might take few days before the fix is applied to
wireless-drivers-next.

-- 
Kalle Valo
