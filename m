From: Henry Chen <henryc.chen@mediatek.com>
Subject: Re: [PATCH V4 2/2] regulator: mt6323: Add support for MT6323 regulator
Date: Thu, 28 Jan 2016 15:16:41 +0800
Message-ID: <1453965401.19407.18.camel@mtksdaap41>
References: <1453896059-44589-1-git-send-email-blogic@openwrt.org>
 <1453896059-44589-2-git-send-email-blogic@openwrt.org>
 <20160127144105.GQ6042@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160127144105.GQ6042@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, linux-arm-kernel@lists.infradead.org, John Crispin <blogic@openwrt.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Mark,

On Wed, 2016-01-27 at 14:41 +0000, Mark Brown wrote:
> On Wed, Jan 27, 2016 at 01:00:59PM +0100, John Crispin wrote:
> 
> > +		/* Constrain board-specific capabilities according to what
> > +		 * this driver and the chip itself can actually do.
> > +		 */
> > +		c = rdev->constraints;
> > +		c->valid_modes_mask |= REGULATOR_MODE_NORMAL |
> > +				       REGULATOR_MODE_STANDBY;
> > +		c->valid_ops_mask |= REGULATOR_CHANGE_MODE;
> 
> No, drivers should *never* enable things that weren't explictly enabled
> by the machine constraints.  This misses the whole point of having
> constraints.  They are there so that the system integrator can enable
> the functionality that is safe on a given board.  

Okay..the constrains should be define on device tree.
But which optional properties was suitable to fill on device tree if consumers want to call
regulator_set_mode directly ?
I have check the of_regulator.c and not found the suitable property name which can set valid_modes_mask & valid_ops_mask.

Thanks,
Henry 
> 
> The comment is also inaccurate, it claims it's imposing constraints but
> in fact it's adding additional permissions.
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
