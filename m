From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH V5 08/11] soc: mediatek: PMIC wrap: remove
 pwrap_is_mt8135() and pwrap_is_mt8173()
Date: Thu, 11 Feb 2016 13:01:36 +0100
Message-ID: <56BC7820.6040203@gmail.com>
References: <1454841778-35529-1-git-send-email-blogic@openwrt.org>
 <1454841778-35529-9-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454841778-35529-9-git-send-email-blogic@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Henry Chen <henryc.chen@mediatek.com>, Thierry Reding <treding@nvidia.com>, Flora Fu <flora.fu@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org



On 07/02/16 11:42, John Crispin wrote:
> With more SoCs being added the list of helper functions like these would
> grow. While at it also add a new flag "has_bridge" and use that instead of
> pwrap_is_mt8173() where appropriate.
>
> Signed-off-by: John Crispin <blogic@openwrt.org>
> ---

Same here, please explain better what the code does.

Thanks.
Matthias
