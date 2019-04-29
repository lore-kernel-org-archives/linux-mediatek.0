From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 2/6] net: stmmac: fix csr_clk can't be zero issue
Date: Mon, 29 Apr 2019 10:26:52 +0200
Message-ID: <738b37cd-4719-9257-18fc-aab1dc7424f4@st.com>
References: <1556433009-25759-1-git-send-email-biao.huang@mediatek.com>
 <1556433009-25759-3-git-send-email-biao.huang@mediatek.com>
 <24f4b268-aa7f-e1f7-59fc-2bc163eb8277@st.com>
 <1556525353.24897.30.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1556525353.24897.30.camel@mhfsdcap03>
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
To: biao huang <biao.huang@mediatek.com>
Cc: jianguo.zhang@mediatek.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, yt.shen@mediatek.com, Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org



On 4/29/19 10:09 AM, biao huang wrote:
> Hi,
> 
> On Mon, 2019-04-29 at 09:18 +0200, Alexandre Torgue wrote:
>> Hi
>>
>> On 4/28/19 8:30 AM, Biao Huang wrote:
>>> The specific clk_csr value can be zero, and
>>> stmmac_clk is necessary for MDC clock which can be set dynamically.
>>> So, change the condition from plat->clk_csr to plat->stmmac_clk to
>>> fix clk_csr can't be zero issue.
>>>
>>> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
>>> ---
>>>    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |    2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> index 818ad88..9e89b94 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> @@ -4376,7 +4376,7 @@ int stmmac_dvr_probe(struct device *device,
>>>    	 * set the MDC clock dynamically according to the csr actual
>>>    	 * clock input.
>>>    	 */
>>> -	if (!priv->plat->clk_csr)
>>> +	if (priv->plat->stmmac_clk)
>>>    		stmmac_clk_csr_set(priv);
>>>    	else
>>>    		priv->clk_csr = priv->plat->clk_csr;
>>>
>>
>> So, as soon as stmmac_clk will be declared, it is no longer possible to
>> fix a CSR through the device tree ?
> 
> let's focus on the condition:
> 1. clk_csr may be zero, it should not be the condition. or the clk_csr =
> 0 will jump to the wrong block.
> 2. Since stmmac_clk_csr_set will get_clk_rate from stmmac_clk,
> the plat->stmmac_clk is a more proper condition.
> 

Ok, but here you remove one possibility: stmmac_clk and clk_csr defined. 
no ?

Other way could be the following code + initialize priv->plat->clk_csr 
with a non null value before read it in device tree (in stmmac_platform).

if (priv->plat->clk_csr >= 0)
	priv->clk_csr = priv->plat->clk_csr;
else
	stmmac_clk_csr_set(priv);



> In some case, it's impossible to get the clk rate of stmmac_clk,
> so it's better to remain the clk_csr flow.
> 
> 
> 
