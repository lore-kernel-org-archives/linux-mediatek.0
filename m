From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/3] mfd: mt6397: Checking for null before
 irq_domain_remove.
Date: Mon, 11 Apr 2016 09:53:23 +0100
Message-ID: <20160411085323.GM4592@x1>
References: <1460098729-25549-1-git-send-email-henryc.chen@mediatek.com>
 <1460098729-25549-2-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460098729-25549-2-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>, tglx@linutronix.de
Cc: Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <blogic@openwrt.org>, Sascha Hauer <s.hauer@pengutronix.de>, Flora Fu <flora.fu@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

=46AO Thomas,

On Fri, 08 Apr 2016, Henry Chen wrote:
> It is possible that pmic->irq_domain will be NULL in fail_irq error h=
andling.
> Check before calling irq_domain_remove.
>=20
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  drivers/mfd/mt6397-core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index a879223..15050cb 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -312,7 +312,8 @@ static int mt6397_probe(struct platform_device *p=
dev)
> =20
>  fail_irq:
>  	if (ret) {
> -		irq_domain_remove(pmic->irq_domain);
> +		if (pmic->irq_domain)
> +			irq_domain_remove(pmic->irq_domain);

You might be better off making this change in the framework.

Just get irq_domain_remove() to harmlessly return if !irq_domain.

>  		dev_err(&pdev->dev, "failed to add child devices: %d\n", ret);
>  	}
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
