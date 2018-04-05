From: Christian =?iso-8859-1?Q?L=FCtke-Stetzkamp?= <christian@lkamp.de>
Subject: Re: [bug report] staging: mt7621-mmc: MIPS: ralink: add sdhci for
 mt7620a SoC
Date: Thu, 5 Apr 2018 18:39:47 +0200
Message-ID: <20180405163947.GA20350@demeter.lkamp.de>
References: <20180405121310.GA7782@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20180405121310.GA7782@mwanda>
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

On Thu, Apr 05, 2018 at 03:13:10PM +0300, Dan Carpenter wrote:
> [ I just decided to forward you guys all the Smatch warnings.  -dan ]
> 
> Hello John Crispin,
> 
> The patch 8b634a9c7620: "staging: mt7621-mmc: MIPS: ralink: add sdhci
> for mt7620a SoC" from Mar 15, 2018, leads to the following static
> checker warning:
>
> 	drivers/staging/mt7621-mmc/sd.c:951 msdc_command_start()
> 	warn: we tested 'opcode == 3' before and it was 'false'
>
>         drivers/staging/mt7621-mmc/sd.c:2961 msdc_drv_suspend()
>         warn: variable dereferenced before check 'mmc' (see line 2959)
>
>         drivers/staging/mt7621-mmc/sd.c:2976 msdc_drv_resume()
>         warn: variable dereferenced before check 'mmc' (see line 2972)
>
>         drivers/staging/mt7621-mmc/dbg.c:270 msdc_debug_proc_write()
>         warn: copy_to/from_user() returns a positive value
>
>         drivers/staging/mt7621-mmc/dbg.c:339 msdc_debug_proc_init()
>         warn: proc file '"msdc_debug"' is world writable
>
> 	drivers/staging/mt7621-mmc/dbg.c:341 msdc_debug_proc_init()
> 	warn: 'de' isn't an ERR_PTR

Hi Dan,

thanks for the report, I have created patches for all of these and
will send them, once my previous series got merged, because I based
them on that status.

Christian
