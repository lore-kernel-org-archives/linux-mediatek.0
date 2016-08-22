From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [RESEND PATCH] soc: mediatek: PMIC wrap: Extend the waiting time
 to 10ms.
Date: Mon, 22 Aug 2016 19:31:53 +0200
Message-ID: <83d5b8ac-3b6d-ae31-9dba-6146c1d3664a@gmail.com>
References: <1468380868-16683-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468380868-16683-1-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org



On 13/07/16 05:34, Henry Chen wrote:
> Read data fails sometimes because of a timeout that PMIC cannot transfer data
> to PMIC wrap on time, extend the waiting time to 10ms to reduce the failed
> rate.
>
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---

Applied, thanks
