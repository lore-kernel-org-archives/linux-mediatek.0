From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH V2 4/4] mfd: mediatek: add MT6323 support to MT6397 driver
Date: Mon, 25 Jan 2016 19:44:01 +0100
Message-ID: <3476571.0yU9yvPsKF@linux-gy6r.site>
References: <1453716887-38442-1-git-send-email-blogic@openwrt.org> <20160125124112.GG3368@x1> <56A64108.7020807@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56A64108.7020807@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Lee Jones <lee.jones@linaro.org>, Flora Fu <flora.fu@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, Henry Chen <henryc.chen@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Monday 25 Jan 2016 16:36:40 John Crispin wrote:
> Hi,
> 
> On 25/01/2016 13:41, Lee Jones wrote:
> > Please honour the subject format of the subsystem you are contributing
> > to.
> > 
> > `git log --oneline -- $subsystem` gives you this.
> > 
> > On Mon, 25 Jan 2016, John Crispin wrote:
> >> Signed-off-by: John Crispin <blogic@openwrt.org>
> >> ---
> 
> [...]
> 
> >> @@ -261,6 +271,15 @@ static int mt6397_probe(struct platform_device
> >> *pdev)
> >> 
> >>  	}
> >>  	
> >>  	switch (id & 0xff) {
> >> 
> >> +	case MT6323_CID_CODE:
> >> +		mt6397->int_con[0] = MT6323_INT_CON0;
> > 
> > This is confusing.  You're still using memory allocated for a mt6397
> > device.
> 
> the variable is currently defined as struct mt6397_chip *mt6397;
> shall i only change the name or also create a patch to rename the struct ?
> 

I think we should rename the struct and the file as well.

Cheers,
Matthias
