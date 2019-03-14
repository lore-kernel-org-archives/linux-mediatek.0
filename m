From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] spi: mediatek: Attempt to address style issues in
 spi-mt7621.c
Date: Thu, 14 Mar 2019 14:27:32 +0300
Message-ID: <20190314112732.GJ2227@kadam>
References: <20190313122403.248873-1-armax@google.com>
 <20190313123454.GB2202@kadam> <20190314111313.GB8034@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20190314111313.GB8034@google.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Armando Miraglia <arma2ff0@gmail.com>, Jean Delvare <jdelvare@suse.de>
Cc: devel@driverdev.osuosl.org, sankalpnegi2310@gmail.com, linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, gregkh@linuxfoundation.org, neil@brown.name, sr@denx.de, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Mar 14, 2019 at 12:13:15PM +0100, Armando Miraglia wrote:
> My answers are in-line below. BTW bare with me as this is my attempt to get my
> feet wet in how to contribute to the linux kernel for my own pleasure and
> interest :)
> 

No problem at all.

> Is there an explicit intent to deprecate Lindent in favor of checkpatch.pl
> --fix? If one would like to contribute to fixing the tooling for linting which
> of the two would be the right target for such an effort?
> 

I've added Jean to the CC list because he worked on Lindent a few
years ago.  I really think we should just delete Lindent.  I haven't
used the checkpatch.pl --fix option but Joe Perches has good style.

> > >  static inline struct mt7621_spi *spidev_to_mt7621_spi(struct spi_device *spi)
> > > @@ -303,7 +303,7 @@ static int mt7621_spi_setup(struct spi_device *spi)
> > >  	struct mt7621_spi *rs = spidev_to_mt7621_spi(spi);
> > >  
> > >  	if ((spi->max_speed_hz == 0) ||
> > > -		(spi->max_speed_hz > (rs->sys_freq / 2)))
> > > +	    (spi->max_speed_hz > (rs->sys_freq / 2)))
> > 
> > Yeah.  Lindent is correct here.
> 
> Funny enough, this is something I adjusted manually :)
> 

:)  Good.

> I have a process question here: to post a change for the only accepted change I
> have in this patch should I send out a new patch?
> 

Yeah.  If you want.  Google for how to send a v2 patch.

regards,
dan carpenter
