From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH V4 2/2] regulator: mt6323: Add support for MT6323 regulator
Date: Thu, 28 Jan 2016 19:13:48 +0100
Message-ID: <56AA5A5C.9080402@openwrt.org>
References: <1453896059-44589-1-git-send-email-blogic@openwrt.org>
 <1453896059-44589-2-git-send-email-blogic@openwrt.org>
 <20160127144105.GQ6042@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160127144105.GQ6042-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?SGVucnlDIENoZW4gKOmZs+W7uuixqik=?= <HenryC.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen Zhong <chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org



On 27/01/2016 15:41, Mark Brown wrote:
> On Wed, Jan 27, 2016 at 01:00:59PM +0100, John Crispin wrote:
> 
>> +		/* Constrain board-specific capabilities according to what
>> +		 * this driver and the chip itself can actually do.
>> +		 */
>> +		c = rdev->constraints;
>> +		c->valid_modes_mask |= REGULATOR_MODE_NORMAL |
>> +				       REGULATOR_MODE_STANDBY;
>> +		c->valid_ops_mask |= REGULATOR_CHANGE_MODE;
> 
> No, drivers should *never* enable things that weren't explictly enabled
> by the machine constraints.  This misses the whole point of having
> constraints.  They are there so that the system integrator can enable
> the functionality that is safe on a given board.  
> 
> The comment is also inaccurate, it claims it's imposing constraints but
> in fact it's adding additional permissions.
> 

Hi Mark

would the following two bindings be ok ? I would create patches to add them.

* regulator-allow-mode; or regulator-allow-change-mode;
* regulator-modes = <REGULATOR_MODE_NORMAL REGULATOR_MODE_STANDBY>;

	John
