From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 2/2] usb: xhci: remove dummy extra_priv_size for size of
 xhci_hcd struct
Date: Tue, 7 Mar 2017 17:12:55 +0200
Message-ID: <58BECDF7.80003@linux.intel.com>
References: <1488857543-9384-1-git-send-email-chunfeng.yun@mediatek.com>
 <1488857543-9384-2-git-send-email-chunfeng.yun@mediatek.com>
 <20170307110238.GA31069@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170307110238.GA31069@ulmo.ba.sec>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <treding@nvidia.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 07.03.2017 13:02, Thierry Reding wrote:
> On Tue, Mar 07, 2017 at 11:32:23AM +0800, Chunfeng Yun wrote:
>> because hcd_priv_size is already size of xhci_hcd struct,
>> extra_priv_size is not needed anymore for MTK and tegra drivers.
>>
>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>> ---
>>   drivers/usb/host/xhci-mtk.c   |    1 -
>>   drivers/usb/host/xhci-tegra.c |    1 -
>>   2 files changed, 2 deletions(-)
>

Nice catch, thanks.
queued.

> For Tegra:
>
> Tested-by: Thierry Reding <treding@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
>

adding tags

-Mathias
