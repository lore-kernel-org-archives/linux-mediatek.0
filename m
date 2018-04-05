From: Christian =?iso-8859-1?Q?L=FCtke-Stetzkamp?= <christian@lkamp.de>
Subject: Re: [bug report] staging: mt7621-mmc: MIPS: ralink: add sdhci for
 mt7620a SoC
Date: Thu, 5 Apr 2018 18:46:22 +0200
Message-ID: <20180405164622.GB20350@demeter.lkamp.de>
References: <20180405115654.GA6324@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20180405115654.GA6324@mwanda>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, NeilBrown <neil@brown.name>, linux-mediatek@lists.infradead.org, blogic@openwrt.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Apr 05, 2018 at 02:56:54PM +0300, Dan Carpenter wrote:
> Hello John Crispin,
> 
> The patch 8b634a9c7620: "staging: mt7621-mmc: MIPS: ralink: add sdhci
> for mt7620a SoC" from Mar 15, 2018, leads to the following static
> checker warning:
> 
> 	drivers/staging/mt7621-mmc/sd.c:2790 msdc_drv_probe()
> 	warn: curly braces intended?

Hi Dan,

in my understanding of the code around that place, these lines are
only indented by accident. The card detect low/high selection and the
activation of software poll should happen even when the SDIO(_EXT)
interrupt is not enabled, because they are not related.

The indentation will be fixed, once the patch series I sent yesterday
in version 2 gets merged.

Hopefully this answer is helpful,
Christian
