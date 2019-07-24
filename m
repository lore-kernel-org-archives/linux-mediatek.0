From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] mt76_init_sband_2g: null check the allocation
Date: Wed, 24 Jul 2019 08:39:46 +0300
Message-ID: <87d0i00z4t.fsf@kamboji.qca.qualcomm.com>
References: <20190723221954.9233-1-navid.emamdoost@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723221954.9233-1-navid.emamdoost@gmail.com> (Navid
        Emamdoost's message of "Tue, 23 Jul 2019 17:19:54 -0500")
Sender: linux-kernel-owner@vger.kernel.org
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Cc: emamd001@umn.edu, kjlu@umn.edu, smccaman@umn.edu, secalert@redhat.com, Jakub Kicinski <kubakici@wp.pl>, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Navid Emamdoost <navid.emamdoost@gmail.com> writes:

> devm_kzalloc may fail and return NULL. So the null check is needed.
>
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
>  drivers/net/wireless/mediatek/mt7601u/init.c | 3 +++
>  1 file changed, 3 insertions(+)

The prefix in the title should be "mt7601u:".

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#commit_title_is_wrong

-- 
Kalle Valo
