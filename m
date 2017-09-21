From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH RESEND 1/2] phy: phy-mtk-tphy: fix NULL point of chip bank
Date: Thu, 21 Sep 2017 16:23:50 +0530
Message-ID: <02a5e183-444a-bc75-2a4e-1337c9e7872e@ti.com>
References: <5ddda7cc6940941b645564afff5afa496d7dbb68.1505989703.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5ddda7cc6940941b645564afff5afa496d7dbb68.1505989703.git.chunfeng.yun@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org



On Thursday 21 September 2017 04:01 PM, Chunfeng Yun wrote:
> Chip bank of version-1 is initialized as NULL, but it's used
> by pcie_phy_instance_power_on/off(), so assign it a right
> address.

merged. How was this not noticed before?

Thanks
Kishon
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/phy/mediatek/phy-mtk-tphy.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
> index e3baad7..721a2a1 100644
> --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> @@ -27,6 +27,7 @@
>  /* banks shared by multiple phys */
>  #define SSUSB_SIFSLV_V1_SPLLC		0x000	/* shared by u3 phys */
>  #define SSUSB_SIFSLV_V1_U2FREQ		0x100	/* shared by u2 phys */
> +#define SSUSB_SIFSLV_V1_CHIP		0x300	/* shared by u3 phys */
>  /* u2 phy bank */
>  #define SSUSB_SIFSLV_V1_U2PHY_COM	0x000
>  /* u3/pcie/sata phy banks */
> @@ -762,7 +763,7 @@ static void phy_v1_banks_init(struct mtk_tphy *tphy,
>  	case PHY_TYPE_USB3:
>  	case PHY_TYPE_PCIE:
>  		u3_banks->spllc = tphy->sif_base + SSUSB_SIFSLV_V1_SPLLC;
> -		u3_banks->chip = NULL;
> +		u3_banks->chip = tphy->sif_base + SSUSB_SIFSLV_V1_CHIP;
>  		u3_banks->phyd = instance->port_base + SSUSB_SIFSLV_V1_U3PHYD;
>  		u3_banks->phya = instance->port_base + SSUSB_SIFSLV_V1_U3PHYA;
>  		break;
> 
