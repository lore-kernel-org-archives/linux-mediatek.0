From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [2/4] wireless: Use octal not symbolic permissions
Date: Tue, 27 Mar 2018 08:02:04 +0000 (UTC)
Message-ID: <20180327080205.07AD26030F@smtp.codeaurora.org>
References: <a368e1c4878619172f3da4849cb211b4dfad0a58.1521845237.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a368e1c4878619172f3da4849cb211b4dfad0a58.1521845237.git.joe@perches.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joe Perches <joe@perches.com>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Stanislaw Gruszka <sgruszka@redhat.com>, Jiri Slaby <jirislaby@gmail.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Helmut Schaa <helmut.schaa@googlemail.com>, Kalle Valo <kvalo@qca.qualcomm.com>, Luca Coelho <luciano.coelho@intel.com>, Solomon Peachy <pizza@shaftnet.org>, Christian Lamparter <chunkeey@googlemail.com>, wcn36xx@lists.infradead.org, brcm80211-dev-list@cypress.com, Jakub Kicinski <kubakici@wp.pl>, Nick Kossifidis <mickflemm@gmail.com>, Stanislav Yakovlev <stas.yakovlev@gmail.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, Johannes Berg <johannes.berg@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Hante Meuleman <hante.meuleman@broadcom.com>, linux-mediatek@lists.infradead.org, Wright Feng <wright.feng@cypress.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradea
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
