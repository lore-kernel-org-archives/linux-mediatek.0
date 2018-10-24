From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] staging: mt7621-dma: Add braces around else branches
Date: Wed, 24 Oct 2018 14:09:33 +0300
Message-ID: <20181024110933.ys7obd7sze3a6mgk@mwanda>
References: <20181023211142.GA2661@v> <20181024045653.GA2864@v>
 <af4594cc-05c0-672c-d560-b50705ceaab3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <af4594cc-05c0-672c-d560-b50705ceaab3@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy-kernel@googlegroups.com, linux-mediatek@lists.infradead.org, Kimberly Brown <kimbrownkd@gmail.com>, NeilBrown <neil@brown.name>, Christian =?iso-8859-1?Q?L=FCtke-Stetzkamp?= <christian@lkamp.de>, linux-arm-kernel@lists.infradead.org, John Crispin <blogic@openwrt.org>
List-Id: linux-mediatek@lists.infradead.org

On Wed, Oct 24, 2018 at 12:45:44PM +0200, Matthias Brugger wrote:
> Hi Kiberly,
> 
> Thanks for adding all the emails in CC.
> I would encourage you for your next patch to distinguish between CC and TO.
> You should send your patch TO important maintainers in the get_maintainers.pl
> list (as default, to all of them). If there is someone you really want to look
> into the patch, then add him/her in TO as well.
> 

I normally just add the first person from get_maintainer.pl to the To:.
It's basically random I think.  The rest I put in the CC.  This is a
staging patch so no one is very picky.

There isn't a Fixes tag for this but if there were I add the person who
wrote the original patch to the To header.  Hopefully, they review
and Ack my patch.  I feel like that's very important.

regards,
dan carpenter
