From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [GIT PULL] ARM: mediatek fixes for v4.17
Date: Tue, 29 May 2018 15:46:02 +0200
Message-ID: <3c61a698-cc38-cb3d-78cc-62562872e8d4@gmail.com>
References: <b32962c3-2ede-b352-959d-cb0c5244307f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <b32962c3-2ede-b352-959d-cb0c5244307f@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm-soc <arm@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Sean Wang <sean.wang@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org



On 29/05/18 13:29, Matthias Brugger wrote:
> Hi Olof, hi Arnd,
> 
> We observe boot issues on mt7622 with v4.17
> The following fix addresses this. Could you please merge this so that we have
> working v4.17 on the mt7622 :)

Just FYI, I sent the very same commit via v4.17-next-defconfig pull request, but
it would be good if it could go into v4.17 already so we don't have to wait
until it is merged thorough the stable process.

Regards,
Matthias

> 
> Thanks a lot,
> Matthias
> 
> ---
> 
> The following changes since commit b04e217704b7f879c6b91222b066983a44a7a09f:
> 
>   Linux 4.17-rc7 (2018-05-27 13:01:47 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
> tags/v4.17-next-fixes
> 
> for you to fetch changes up to eac2e79a02a2c92c09600162d02167d8dfb63d66:
> 
>   arm64: defconfig: Enable CONFIG_PINCTRL_MT7622 by default (2018-05-29 13:19:49
> +0200)
> 
> ----------------------------------------------------------------
> mt7622 enable pinctrl driver in defconfig to fix boot issue
> 
> ----------------------------------------------------------------
> Sean Wang (1):
>       arm64: defconfig: Enable CONFIG_PINCTRL_MT7622 by default
> 
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
