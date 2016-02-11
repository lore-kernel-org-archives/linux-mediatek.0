From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH V5 06/11] soc: mediatek: PMIC wrap: SPI_WRITE needs a
 different bitmask for MT2701/7623
Date: Thu, 11 Feb 2016 12:59:03 +0100
Message-ID: <56BC7787.8070308@gmail.com>
References: <1454841778-35529-1-git-send-email-blogic@openwrt.org>
 <1454841778-35529-7-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454841778-35529-7-git-send-email-blogic@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Henry Chen <henryc.chen@mediatek.com>, Thierry Reding <treding@nvidia.com>, Flora Fu <flora.fu@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org



On 07/02/16 11:42, John Crispin wrote:
> MT2701 and MT7623 use a different bitmask for the SPI_WRITE command.
>

Something like:
Different SoCs will use different bitmask for the SPI_WRITE command. 
This patch defines the bitmask in the pmic_wrapper_type to allow an easy 
addition.

Well you are the native speaker, so maybe it's not the best to just use 
my version ;)

Regards,
Matthias
