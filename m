From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [2/4] wireless: Use octal not symbolic permissions
Date: Tue, 27 Mar 2018 08:02:05 +0000 (UTC)
Message-ID: <20180327080205.CD80760C54@smtp.codeaurora.org>
References: <a368e1c4878619172f3da4849cb211b4dfad0a58.1521845237.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a368e1c4878619172f3da4849cb211b4dfad0a58.1521845237.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Jiri Slaby <jirislaby@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>, "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, Kalle Valo <kvalo@qca.qualcomm.com>, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Christian Lamparter <chunkeey@googlemail.com>, Eugene Krasnikov <k.eugene.e@gmail.com>, Stanislav Yakovlev <stas.yakovlev@gmail.com>, Stanislaw Gruszka <sgruszka@redhat.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Jakub Kicinski <kubakici@wp.pl>, Helmut Schaa <helmut.schaa@googlemail.com>, Solomon Peachy <pizza@shaftnet.org>, Matthias Brugger <matthias.bgg@gmail.com>, Arend van Spriel <arend.vanspriel@broadcom.>
List-Id: linux-mediatek@lists.infradead.org

Joe Perches <joe@perches.com> wrote:

> Prefer the direct use of octal for permissions.
> 
> Done with checkpatch -f --types=SYMBOLIC_PERMS --fix-inplace
> and some typing.
> 
> Miscellanea:
> 
> o Whitespace neatening around these conversions.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Patch applied to wireless-drivers-next.git, thanks.

2ef00c53049b wireless: Use octal not symbolic permissions

-- 
https://patchwork.kernel.org/patch/10305719/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
