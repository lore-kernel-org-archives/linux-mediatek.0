From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] arm: mediatek: dts changes for v4.11
Date: Sun, 29 Jan 2017 17:20:16 -0800
Message-ID: <20170130012016.GB3133@localhost>
References: <82e017a8-ade7-b16f-740c-6c106f2f8049@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <82e017a8-ade7-b16f-740c-6c106f2f8049@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: James Liao <jamesjj.liao@mediatek.com>, Leilk Liu <leilk.liu@mediatek.com>, zhiyong.tao@mediatek.com, John Crispin <john@phrozen.org>, Dawei Chien <dawei.chien@mediatek.com>, arm@kernel.org, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, honghui.zhang@mediatek.com, xiaolei li <xiaolei.li@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Wed, Jan 25, 2017 at 02:46:56PM +0100, Matthias Brugger wrote:
> Hi Arnd, hi Olof,
> 
> Please merge the following changes for 32-bit dts files.
> 
> Thanks,
> Matthias
> 
> ---
> 
> The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:
> 
>   Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)
> 
> are available in the git repository at:
> 
>   https://github.com/mbgg/linux-mediatek.git tags/v4.10-next-dts32
> 
> for you to fetch changes up to e348dc74f798c2df31c685bf0c814396f4f3b735:
> 
>   arm: dts: mt2701: Add thermal device node. (2017-01-24 11:24:35 +0100)
> 
> ----------------------------------------------------------------
> Lots of updates for mt2701:
> Rearrange the dt nodes and fix unit address for pincontroler
> Add nodes for:
> - clock controller subsystems
> - scpsys controller
> - iommu and smi
> - spi
> - nand
> - auxadc
> - thermal controller and zones
> 
> Email address updated for mt7623 devicetree files.

Merged, thanks!


-Olof
