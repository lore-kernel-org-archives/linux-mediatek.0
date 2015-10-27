From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3 1/3] clocksource: mtk_timer: add pr_fmt define
Date: Tue, 27 Oct 2015 11:21:28 +0100
Message-ID: <562F5028.90407@linaro.org>
References: <1445815284-10425-1-git-send-email-alexey.klimov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445815284-10425-1-git-send-email-alexey.klimov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Klimov <alexey.klimov@linaro.org>, matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, joe@perches.com
Cc: linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com, tglx@linutronix.de, klimov.linux@gmail.com
List-Id: linux-mediatek@lists.infradead.org

On 10/26/2015 12:21 AM, Alexey Klimov wrote:
> It's a bit unclear what subsystem/driver emits some messages
> to dmesg in function mtk_init_timer().
> Use pr_fmt to auto-prefix the messages appropriately.
>
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Patches applied for next release.

Thanks !

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
