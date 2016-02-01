From: Henry Chen <henryc.chen@mediatek.com>
Subject: Re: [PATCH V4 09/11] soc: mediatek: PMIC wrap: add a slave specific
 struct
Date: Mon, 1 Feb 2016 16:38:01 +0800
Message-ID: <1454315881.2134.4.camel@mtksdaap41>
References: <1453894149-44127-1-git-send-email-blogic@openwrt.org>
	 <1453894149-44127-9-git-send-email-blogic@openwrt.org>
	 <1453948660.29651.3.camel@mtksdaap41> <56AF167C.5030501@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56AF167C.5030501@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Flora Fu <flora.fu@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2016-02-01 at 09:25 +0100, John Crispin wrote:
> 
> On 28/01/2016 03:37, Henry Chen wrote:
> > Hi John,
> > 
> > On Wed, 2016-01-27 at 12:29 +0100, John Crispin wrote:
> > 
> >> @@ -746,7 +786,7 @@ static int pwrap_init(struct pmic_wrapper *wrp)
> >>  	pwrap_writel(wrp, 1, PWRAP_DIO_EN);
> >>  
> >>  	/* Read Test */
> >> -	pwrap_read(wrp, PWRAP_DEW_READ_TEST, &rdata);
> >> +	pwrap_dew_read(wrp, PWRAP_DEW_READ_TEST, &rdata);
> >>  	if (rdata != PWRAP_DEW_READ_TEST_VAL) {
> >>  		dev_err(wrp->dev, "Read test failed after switch to DIO mode: 0x%04x != 0x%04x\n",
> >>  				PWRAP_DEW_READ_TEST_VAL, rdata);
> >> @@ -759,12 +799,13 @@ static int pwrap_init(struct pmic_wrapper *wrp)
> >>  		return ret;
> >>  
> >>  	/* Signature checking - using CRC */
> >> -	if (pwrap_write(wrp, PWRAP_DEW_CRC_EN, 0x1))
> >> +	if (pwrap_dew_write(wrp, PWRAP_DEW_CRC_EN, 0x1))
> >>  		return -EFAULT;
> >>  
> >>  	pwrap_writel(wrp, 0x1, PWRAP_CRC_EN);
> >>  	pwrap_writel(wrp, 0x0, PWRAP_SIG_MODE);
> >> -	pwrap_writel(wrp, PWRAP_DEW_CRC_VAL, PWRAP_SIG_ADR);
> >> +	pwrap_writel(wrp, wrp->slave->dew_regs[PWRAP_DEW_CRC_VAL],
> >> +		     PWRAP_SIG_ADR);
> > 
> > It should be "pwrap_dew_write(wrp, PWRAP_DEW_CRC_VAL, PWRAP_SIG_ADR);",
> > right?
> > 
> > Henry
> > 
> 
> Hi Henry,
> 
> i stumbled across this aswell. however this DEW access is direct using
> pwrap_writel() and not indirect pwrap_write(). hence this is correct.
> the DEW wrapper only exists for pwrap_write() style access. this might
> have been a bug in the original commit.
> 
> this patch however keeps the functionality as is.
> 
> 	John

Hi John,

Oh. Sorry, there is no need to change, I just mixed up the parameter
val/reg of pwrap_writel() of this line.
Please keep original code, thanks.

Henry
