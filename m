From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH 2/5] phy: core: add PHY_MODE_ETHERNET
Date: Thu, 8 Nov 2018 12:12:15 -0600
Message-ID: <fbb63ce7-4a5f-738a-c398-4c28abd3cb60@ti.com>
References: <20181108003617.10334-1-grygorii.strashko@ti.com>
 <20181108003617.10334-3-grygorii.strashko@ti.com>
 <20181108004200.GW30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181108004200.GW30658@n2100.armlinux.org.uk>
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
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Quentin Schulz <quentin.schulz@bootlin.com>, Tony Lindgren <tony@atomide.com>, netdev@vger.kernel.org, Antoine Tenart <antoine.tenart@free-electrons.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Manu Gautam <mgautam@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-amlogic@lists.infradead.org, Carlo Caione <carlo@caione.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

hi Russell,

On 11/7/18 6:42 PM, Russell King - ARM Linux wrote:
> On Wed, Nov 07, 2018 at 06:36:14PM -0600, Grygorii Strashko wrote:
>> Add new PHY's mode to be used by Ethernet PHY interface drivers or
>> multipurpose PHYs like serdes. It will be reused in further changes.
>>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> ---
>>   include/linux/phy/phy.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
>> index b17e770..02c9ef0 100644
>> --- a/include/linux/phy/phy.h
>> +++ b/include/linux/phy/phy.h
>> @@ -42,6 +42,7 @@ enum phy_mode {
>>   	PHY_MODE_UFS_HS_A,
>>   	PHY_MODE_UFS_HS_B,
>>   	PHY_MODE_PCIE,
>> +	PHY_MODE_ETHERNET,
> 
> Are you sure about this - we already have a bunch of "ethernet" modes
> that are more specific, like PHY_MODE_SGMII, PHY_MODE_2500SGMII and
> PHY_MODE_10GKR which require PHYs to be configured differently.  Having
> a very generic "ethernet" mode brings up questions about when it should
> be used vs the more specific modes.

yes. the idea of this series is to split PHY mode on - PHY mode (generic)
and PHY submode (subsystem specific), so multi-functional PHY like serdes will do
(for example):

  phy_set_mode_ext(port->comphy, PHY_MODE_ETHERNET, PHY_INTERFACE_MODE_SGMII);
  where PHY_INTERFACE_MODE_SGMII is defined by phy_interface_t enum.

instead of

  phy_set_mode(port->comphy, PHY_MODE_SGMII);

In patches 3-5 I've converted users of existing PHY "ethernet" modes to use
this approach and, finally, in patch 5 removed
    PHY_MODE_SGMII/2500SGMII/QSGMII/10GKR

> 
> (I've already mentioned that the SGMII modes are mis-named, since
> they also apply to 1000base-X and 2500base-X - the only difference
> is how one 16-bit word in the data stream is used which has no effect
> on the PHY.)
> 

-- 
regards,
-grygorii
